USE CinemaDB;

-- Real Production Deployment Upgrade

-- Problem: Currently, you can have duplicate seats in the same hall (e.g., A1 twice)
-- This can break ticket assignment and cause double-booking confusion
-- Solution: Add UNIQUE constraint to ensure no duplicates per hall
ALTER TABLE Seats
ADD CONSTRAINT unique_seat_per_hall
UNIQUE (hall_id, row_label, seat_number);


-- Problem: Nothing prevents end_time <= start_time
-- This could allow shows to have negative or zero duration
-- Solution: Add a CHECK constraint to enforce end_time > start_time
ALTER TABLE Showtimes
ADD CONSTRAINT chk_time_valid
CHECK (end_time > start_time);


-- Problem: total_price was manually inserted, which can lead to wrong totals
-- Solution: Set default 0, and later we'll automate with triggers
ALTER TABLE Bookings
MODIFY total_price DECIMAL(8,2) NOT NULL DEFAULT 0;


