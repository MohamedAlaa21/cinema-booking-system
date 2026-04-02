USE CinemaDB;

-- Functions

-- 1️ Function: Get total tickets price for a booking
DELIMITER //
CREATE FUNCTION fn_booking_total(b_id INT)
RETURNS DECIMAL(8,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(8,2);

    SELECT IFNULL(SUM(price),0)
    INTO total
    FROM Tickets
    WHERE booking_id = b_id;

    RETURN total;
END//
DELIMITER ;



-- 2️ Function: Check if seat is available for a show
DELIMITER //
CREATE FUNCTION fn_is_seat_available(p_show_id INT, p_seat_id INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE cnt INT;

    SELECT COUNT(*) INTO cnt
    FROM Tickets
    WHERE show_id = p_show_id AND seat_id = p_seat_id;

    RETURN cnt = 0;
END//
DELIMITER ;