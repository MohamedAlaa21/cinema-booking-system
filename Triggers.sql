USE CinemaDB;

-- Triggers

-- 1
-- Problem: Booking total_price was manually set → can mismatch sum of tickets
-- Solution: Trigger updates total_price automatically whenever a ticket is inserted
DELIMITER //
CREATE TRIGGER trg_after_ticket_insert
AFTER INSERT ON Tickets
FOR EACH ROW
BEGIN
    UPDATE Bookings
    SET total_price = (
        SELECT SUM(price)
        FROM Tickets
        WHERE booking_id = NEW.booking_id
    )
    WHERE booking_id = NEW.booking_id;
END//
DELIMITER ;

-- Test Case 1
-- Setup: Create a booking first
INSERT INTO Bookings(user_id, status, total_price)
VALUES (1, 'Pending', 0);

SET @booking_id = LAST_INSERT_ID();

-- Step 1: Insert a ticket
INSERT INTO Tickets(booking_id, show_id, seat_id, price)
VALUES(@booking_id, 1, 10, 100.00);

-- Step 2: Check total_price updated automatically
SELECT total_price FROM Bookings WHERE booking_id = @booking_id;
-- Bookings.total_price = 100.00

-- Insert another ticket
INSERT INTO Tickets(booking_id, show_id, seat_id, price)
VALUES(@booking_id, 1, 2, 120.00);

SELECT total_price FROM Bookings WHERE booking_id = @booking_id;
-- Bookings.total_price = 220.00



-- 2
-- Also, trigger for ticket deletion to update total_price
DELIMITER //
CREATE TRIGGER trg_after_ticket_delete
AFTER DELETE ON Tickets
FOR EACH ROW
BEGIN
    UPDATE Bookings
    SET total_price = IFNULL((
        SELECT SUM(price)
        FROM Tickets
        WHERE booking_id = OLD.booking_id
    ),0)
    WHERE booking_id = OLD.booking_id;
END//
DELIMITER ;

-- Test Case 2
START TRANSACTION;
-- Setup: Use previous booking with 2 tickets
SELECT total_price FROM Bookings WHERE booking_id = @booking_id;
-- Step 1: Delete one ticket
DELETE FROM Tickets WHERE booking_id = @booking_id AND seat_id = 1;
-- Step 2: Check total_price
SELECT total_price FROM Bookings WHERE booking_id = @booking_id;
-- Bookings.total_price = 120.00

-- Delete last ticket
DELETE FROM Tickets WHERE booking_id = @booking_id;

SELECT total_price FROM Bookings WHERE booking_id = @booking_id;
-- Bookings.total_price = 0
ROLLBACK;



-- 3
-- Problem: Payment status change should reflect booking status
-- Without this, booking can remain 'Pending' even after payment completed
-- Solution: Trigger updates booking status automatically
DELIMITER //
CREATE TRIGGER trg_after_payment_update
AFTER UPDATE ON Payments
FOR EACH ROW
BEGIN
    -- If payment is completed → booking confirmed
    IF NEW.status = 'Completed' THEN
        UPDATE Bookings
        SET status = 'Confirmed'
        WHERE booking_id = NEW.booking_id;
    END IF;

    -- If payment refunded → booking cancelled
    IF NEW.status = 'Refunded' THEN
        UPDATE Bookings
        SET status = 'Cancelled'
        WHERE booking_id = NEW.booking_id;
    END IF;
END//
DELIMITER ;

-- Test Case 3
START TRANSACTION;
-- Setup: Insert a payment
INSERT INTO Payments(booking_id, amount, payment_method, status)
VALUES(@booking_id, 120.00, 'Credit Card', 'Processing');

-- Step 1: Complete payment
UPDATE Payments
SET status = 'Completed'
WHERE booking_id = @booking_id;

-- Step 2: Check booking status
SELECT status FROM Bookings WHERE booking_id = @booking_id;
-- Bookings.status = 'Confirmed'

UPDATE Payments
SET status = 'Refunded'
WHERE booking_id = @booking_id;

SELECT status FROM Bookings WHERE booking_id = @booking_id;
-- Bookings.status = 'Cancelled'
ROLLBACK;


-- 4
-- Problem: Someone could add a ticket to a cancelled booking
-- Solution: BEFORE INSERT trigger stops it
DELIMITER //
CREATE TRIGGER trg_before_ticket_insert
BEFORE INSERT ON Tickets
FOR EACH ROW
BEGIN
    DECLARE booking_status VARCHAR(20);

    SELECT status INTO booking_status
    FROM Bookings
    WHERE booking_id = NEW.booking_id;

    IF booking_status = 'Cancelled' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot add ticket to cancelled booking';
    END IF;
END//
DELIMITER ;

-- Test Case 4
START TRANSACTION;
-- Setup: Booking is cancelled
UPDATE Bookings
SET status = 'Cancelled'
WHERE booking_id = @booking_id;

-- Step 1: Attempt to insert a ticket
INSERT INTO Tickets(booking_id, show_id, seat_id, price)
VALUES(@booking_id, 1, 3, 100.00);
-- Error: 'Cannot add ticket to cancelled booking'
ROLLBACK;

