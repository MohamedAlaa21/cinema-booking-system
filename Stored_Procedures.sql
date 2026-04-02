USE CinemaDB;

-- Stored Procedures

-- 1 Procedure: Create booking + tickets + payment in one transaction
DELIMITER //

CREATE PROCEDURE sp_create_booking(
    IN p_user_id INT,
    IN p_show_id INT,
    IN seat_ids TEXT,           -- Comma-separated seat IDs: '1,2,3'
    IN p_payment_method VARCHAR(20)
)
BEGIN
    -- 1. ALL DECLARATIONS MUST COME FIRST
    DECLARE total_price DECIMAL(8,2) DEFAULT 0;
    DECLARE done INT DEFAULT 0;
    DECLARE current_seat INT;
    
    -- Cursor declaration (must be after variables)
    DECLARE cur_seats CURSOR FOR SELECT id FROM temp_seats;
    
    -- Handler declaration (must be last among declarations)
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- 2. VALIDATION LOGIC
    IF p_payment_method NOT IN ('Credit Card','Debit Card','Wallet','Cash') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid payment method';
    END IF;

    -- 3. TEMPORARY TABLE SETUP
    DROP TEMPORARY TABLE IF EXISTS temp_seats;
    CREATE TEMPORARY TABLE temp_seats (id INT);

    -- Split comma-separated string into table
    SET @sql = CONCAT('INSERT INTO temp_seats (id) VALUES (', REPLACE(seat_ids, ',', '),('), ')');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- 4. TRANSACTIONAL LOGIC
    START TRANSACTION;

    INSERT INTO Bookings(user_id, status, total_price)
    VALUES (p_user_id, 'Pending', 0);

    SET @booking_id = LAST_INSERT_ID();

    OPEN cur_seats;

    seat_loop: LOOP
        FETCH cur_seats INTO current_seat;
        IF done THEN
            LEAVE seat_loop;
        END IF;

        -- Check seat availability
        IF fn_is_seat_available(p_show_id, current_seat) THEN
            INSERT INTO Tickets(booking_id, show_id, seat_id, price)
            SELECT @booking_id, p_show_id, current_seat, base_price
            FROM Showtimes
            WHERE show_id = p_show_id;

            -- Add to total price
            SET total_price = total_price + (SELECT base_price FROM Showtimes WHERE show_id = p_show_id LIMIT 1);
        ELSE
            -- Cleanup and Exit
            CLOSE cur_seats;
            ROLLBACK;
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'One or more seats are already booked';
        END IF;
    END LOOP;

    CLOSE cur_seats;

    -- Update total price and insert payment
    UPDATE Bookings SET total_price = total_price WHERE booking_id = @booking_id;

    INSERT INTO Payments(booking_id, amount, payment_method, status)
    VALUES(@booking_id, total_price, p_payment_method, 'Processing');

    COMMIT;

    -- Cleanup
    DROP TEMPORARY TABLE temp_seats;
END //

DELIMITER ;