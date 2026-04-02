USE CinemaDB;

-- Views

-- 1️ View: All bookings with user, show, and total price
CREATE OR REPLACE VIEW vw_booking_details AS
SELECT b.booking_id,
       ANY_VALUE(u.name) AS user_name,
       ANY_VALUE(m.title) AS movie_title,
       ANY_VALUE(h.name) AS hall_name,
       ANY_VALUE(s.show_date) AS show_date,
       ANY_VALUE(s.start_time) AS start_time,
       ANY_VALUE(s.end_time) AS end_time,
       b.total_price,
       b.status
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Tickets t ON t.booking_id = b.booking_id
JOIN Showtimes s ON t.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
JOIN Halls h ON s.hall_id = h.hall_id
GROUP BY b.booking_id;

-- Test View: vw_booking_details
SELECT * FROM vw_booking_details;


-- 2️ View: Available seats per show
CREATE OR REPLACE VIEW vw_available_seats AS
SELECT s.show_id, se.seat_id, se.row_label, se.seat_number, se.seat_type
FROM Showtimes s
JOIN Seats se ON se.hall_id = s.hall_id
LEFT JOIN Tickets t ON t.show_id = s.show_id AND t.seat_id = se.seat_id
WHERE t.ticket_id IS NULL;

-- Test View: vw_available_seats
SELECT * FROM vw_available_seats;



-- 3️ View: Revenue per movie
CREATE OR REPLACE VIEW vw_revenue_per_movie AS
SELECT m.movie_id, m.title,
       SUM(t.price) AS total_revenue
FROM Movies m
JOIN Showtimes s ON s.movie_id = m.movie_id
JOIN Tickets t ON t.show_id = s.show_id
GROUP BY m.movie_id;

-- Test View: vw_revenue_per_movie
SELECT * FROM vw_revenue_per_movie;