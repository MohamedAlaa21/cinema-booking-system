USE CinemaDB;

-- Index

-- Add indexes on foreign key columns to improve query performance
CREATE INDEX idx_show_movie ON Showtimes(movie_id);
CREATE INDEX idx_booking_user ON Bookings(user_id);
CREATE INDEX idx_ticket_booking ON Tickets(booking_id);
CREATE INDEX idx_payment_booking ON Payments(booking_id);