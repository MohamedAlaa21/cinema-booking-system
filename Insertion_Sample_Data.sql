USE CinemaDB;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Payments;
TRUNCATE TABLE Tickets;
TRUNCATE TABLE Bookings;
TRUNCATE TABLE Showtimes;
TRUNCATE TABLE Seats;
TRUNCATE TABLE Halls;
TRUNCATE TABLE Movies;
TRUNCATE TABLE Users;
SET FOREIGN_KEY_CHECKS = 1;

-- =============================================
-- 1. USERS: 20 Unique Records
-- =============================================
INSERT INTO Users (name, email, password, phone) VALUES
('Mohamed Alaa', 'mohamed.alaa@gmail.com', 'pass123', '01006628996'),
('Sara Ahmed', 'sara.ahmed@gmail.com', 'pass123', '01012345678'),
('Ali Hassan', 'ali.hassan@gmail.com', 'pass123', '01023456789'),
('Laila Nabil', 'laila.nabil@gmail.com', 'pass123', '01034567890'),
('Omar Fathy', 'omar.fathy@gmail.com', 'pass123', '01045678901'),
('Mona Farid', 'mona.farid@gmail.com', 'pass123', '01056789012'),
('Khaled Sami', 'khaled.sami@gmail.com', 'pass123', '01067890123'),
('Dina Mostafa', 'dina.mostafa@gmail.com', 'pass123', '01078901234'),
('Youssef Magdy', 'youssef.magdy@gmail.com', 'pass123', '01089012345'),
('Fatma Adel', 'fatma.adel@gmail.com', 'pass123', '01090123456'),
('Amira Salah', 'amira.salah@gmail.com', 'pass123', '01101234567'),
('Hussein Tamer', 'hussein.tamer@gmail.com', 'pass123', '01112345678'),
('Nada Fathy', 'nada.fathy@gmail.com', 'pass123', '01123456789'),
('Mahmoud Reda', 'mahmoud.reda@gmail.com', 'pass123', '01134567890'),
('Salma Ahmed', 'salma.ahmed@gmail.com', 'pass123', '01145678901'),
('Kareem Adel', 'kareem.adel@gmail.com', 'pass123', '01156789012'),
('Rania Sami', 'rania.sami@gmail.com', 'pass123', '01167890123'),
('Mostafa Hany', 'mostafa.hany@gmail.com', 'pass123', '01178901234'),
('Reem Farid', 'reem.farid@gmail.com', 'pass123', '01189012345'),
('Yara Khaled', 'yara.khaled@gmail.com', 'pass123', '01190123456');

-- =============================================
-- 2. MOVIES: 10 Records
-- =============================================
INSERT INTO Movies (title, description, duration, genre, release_date) VALUES
('Avengers: Endgame', 'Superhero epic', 181, 'Action', '2019-04-26'),
('The Batman', 'Detective thriller', 175, 'Action', '2022-03-04'),
('Joker', 'Psychological thriller', 122, 'Drama', '2019-10-04'),
('Frozen II', 'Animated musical', 103, 'Animation', '2019-11-22'),
('Inception', 'Mind-bending sci-fi', 148, 'Sci-Fi', '2010-07-16'),
('Interstellar', 'Space exploration', 169, 'Sci-Fi', '2014-11-07'),
('Titanic', 'Romantic drama', 195, 'Romance', '1997-12-19'),
('The Lion King', 'Animated adventure', 118, 'Animation', '2019-07-19'),
('Spider-Man: No Way Home', 'Superhero action', 148, 'Action', '2021-12-17'),
('Avatar: The Way of Water', 'Sci-Fi fantasy', 192, 'Sci-Fi', '2022-12-16');

-- =============================================
-- 3. HALLS: 5 Records
-- =============================================
INSERT INTO Halls (name, total_capacity, screen_type) VALUES
('Hall 1', 50, '2D'),
('Hall 2', 60, '3D'),
('Hall 3', 70, 'IMAX'),
('Hall 4', 40, '2D'),
('Hall 5', 80, '3D');

-- =============================================
-- 4. SEATS: Full 350 Seat Mapping
-- =============================================
-- HALL 1 (50 Seats)
INSERT INTO Seats (hall_id, row_label, seat_number, seat_type) VALUES
(1,'A',1,'Regular'),(1,'A',2,'Regular'),(1,'A',3,'Regular'),(1,'A',4,'Regular'),(1,'A',5,'Regular'),
(1,'B',1,'Regular'),(1,'B',2,'Regular'),(1,'B',3,'Regular'),(1,'B',4,'Regular'),(1,'B',5,'Regular'),
(1,'C',1,'Regular'),(1,'C',2,'Regular'),(1,'C',3,'Regular'),(1,'C',4,'Regular'),(1,'C',5,'Regular'),
(1,'D',1,'Regular'),(1,'D',2,'Regular'),(1,'D',3,'Regular'),(1,'D',4,'Regular'),(1,'D',5,'Regular'),
(1,'E',1,'Regular'),(1,'E',2,'Regular'),(1,'E',3,'Regular'),(1,'E',4,'Regular'),(1,'E',5,'Regular'),
(1,'F',1,'VIP'),(1,'F',2,'VIP'),(1,'F',3,'VIP'),(1,'F',4,'VIP'),(1,'F',5,'VIP'),
(1,'G',1,'VIP'),(1,'G',2,'VIP'),(1,'G',3,'VIP'),(1,'G',4,'VIP'),(1,'G',5,'VIP'),
(1,'H',1,'VIP'),(1,'H',2,'VIP'),(1,'H',3,'VIP'),(1,'H',4,'VIP'),(1,'H',5,'VIP'),
(1,'I',1,'Couple'),(1,'I',2,'Couple'),(1,'I',3,'Couple'),(1,'I',4,'Couple'),(1,'I',5,'Couple'),
(1,'J',1,'Couple'),(1,'J',2,'Couple'),(1,'J',3,'Couple'),(1,'J',4,'Couple'),(1,'J',5,'Couple');

-- HALL 2 (60 Seats)
INSERT INTO Seats (hall_id, row_label, seat_number, seat_type) VALUES
(2,'A',1,'Regular'),(2,'A',2,'Regular'),(2,'A',3,'Regular'),(2,'A',4,'Regular'),(2,'A',5,'Regular'),(2,'A',6,'Regular'),
(2,'B',1,'Regular'),(2,'B',2,'Regular'),(2,'B',3,'Regular'),(2,'B',4,'Regular'),(2,'B',5,'Regular'),(2,'B',6,'Regular'),
(2,'C',1,'Regular'),(2,'C',2,'Regular'),(2,'C',3,'Regular'),(2,'C',4,'Regular'),(2,'C',5,'Regular'),(2,'C',6,'Regular'),
(2,'D',1,'Regular'),(2,'D',2,'Regular'),(2,'D',3,'Regular'),(2,'D',4,'Regular'),(2,'D',5,'Regular'),(2,'D',6,'Regular'),
(2,'E',1,'Regular'),(2,'E',2,'Regular'),(2,'E',3,'Regular'),(2,'E',4,'Regular'),(2,'E',5,'Regular'),(2,'E',6,'Regular'),
(2,'F',1,'VIP'),(2,'F',2,'VIP'),(2,'F',3,'VIP'),(2,'F',4,'VIP'),(2,'F',5,'VIP'),(2,'F',6,'VIP'),
(2,'G',1,'VIP'),(2,'G',2,'VIP'),(2,'G',3,'VIP'),(2,'G',4,'VIP'),(2,'G',5,'VIP'),(2,'G',6,'VIP'),
(2,'H',1,'VIP'),(2,'H',2,'VIP'),(2,'H',3,'VIP'),(2,'H',4,'VIP'),(2,'H',5,'VIP'),(2,'H',6,'VIP'),
(2,'I',1,'Couple'),(2,'I',2,'Couple'),(2,'I',3,'Couple'),(2,'I',4,'Couple'),(2,'I',5,'Couple'),(2,'I',6,'Couple'),
(2,'J',1,'Couple'),(2,'J',2,'Couple'),(2,'J',3,'Couple'),(2,'J',4,'Couple'),(2,'J',5,'Couple'),(2,'J',6,'Couple');

-- HALL 3 (70 Seats)
INSERT INTO Seats (hall_id, row_label, seat_number, seat_type) VALUES
(3,'A',1,'Regular'),(3,'A',2,'Regular'),(3,'A',3,'Regular'),(3,'A',4,'Regular'),(3,'A',5,'Regular'),(3,'A',6,'Regular'),(3,'A',7,'Regular'),
(3,'B',1,'Regular'),(3,'B',2,'Regular'),(3,'B',3,'Regular'),(3,'B',4,'Regular'),(3,'B',5,'Regular'),(3,'B',6,'Regular'),(3,'B',7,'Regular'),
(3,'C',1,'Regular'),(3,'C',2,'Regular'),(3,'C',3,'Regular'),(3,'C',4,'Regular'),(3,'C',5,'Regular'),(3,'C',6,'Regular'),(3,'C',7,'Regular'),
(3,'D',1,'Regular'),(3,'D',2,'Regular'),(3,'D',3,'Regular'),(3,'D',4,'Regular'),(3,'D',5,'Regular'),(3,'D',6,'Regular'),(3,'D',7,'Regular'),
(3,'E',1,'Regular'),(3,'E',2,'Regular'),(3,'E',3,'Regular'),(3,'E',4,'Regular'),(3,'E',5,'Regular'),(3,'E',6,'Regular'),(3,'E',7,'Regular'),
(3,'F',1,'VIP'),(3,'F',2,'VIP'),(3,'F',3,'VIP'),(3,'F',4,'VIP'),(3,'F',5,'VIP'),(3,'F',6,'VIP'),(3,'F',7,'VIP'),
(3,'G',1,'VIP'),(3,'G',2,'VIP'),(3,'G',3,'VIP'),(3,'G',4,'VIP'),(3,'G',5,'VIP'),(3,'G',6,'VIP'),(3,'G',7,'VIP'),
(3,'H',1,'VIP'),(3,'H',2,'VIP'),(3,'H',3,'VIP'),(3,'H',4,'VIP'),(3,'H',5,'VIP'),(3,'H',6,'VIP'),(3,'H',7,'VIP'),
(3,'I',1,'Couple'),(3,'I',2,'Couple'),(3,'I',3,'Couple'),(3,'I',4,'Couple'),(3,'I',5,'Couple'),(3,'I',6,'Couple'),(3,'I',7,'Couple'),
(3,'J',1,'Couple'),(3,'J',2,'Couple'),(3,'J',3,'Couple'),(3,'J',4,'Couple'),(3,'J',5,'Couple'),(3,'J',6,'Couple'),(3,'J',7,'Couple');

-- HALL 4 (40 Seats)
INSERT INTO Seats (hall_id, row_label, seat_number, seat_type) VALUES
(4,'A',1,'Regular'),(4,'A',2,'Regular'),(4,'A',3,'Regular'),(4,'A',4,'Regular'),
(4,'B',1,'Regular'),(4,'B',2,'Regular'),(4,'B',3,'Regular'),(4,'B',4,'Regular'),
(4,'C',1,'Regular'),(4,'C',2,'Regular'),(4,'C',3,'Regular'),(4,'C',4,'Regular'),
(4,'D',1,'Regular'),(4,'D',2,'Regular'),(4,'D',3,'Regular'),(4,'D',4,'Regular'),
(4,'E',1,'Regular'),(4,'E',2,'Regular'),(4,'E',3,'Regular'),(4,'E',4,'Regular'),
(4,'F',1,'VIP'),(4,'F',2,'VIP'),(4,'F',3,'VIP'),(4,'F',4,'VIP'),
(4,'G',1,'VIP'),(4,'G',2,'VIP'),(4,'G',3,'VIP'),(4,'G',4,'VIP'),
(4,'H',1,'VIP'),(4,'H',2,'VIP'),(4,'H',3,'VIP'),(4,'H',4,'VIP'),
(4,'I',1,'Couple'),(4,'I',2,'Couple'),(4,'I',3,'Couple'),(4,'I',4,'Couple'),
(4,'J',1,'Couple'),(4,'J',2,'Couple'),(4,'J',3,'Couple'),(4,'J',4,'Couple');

-- HALL 5 (80 Seats)
INSERT INTO Seats (hall_id, row_label, seat_number, seat_type) VALUES
(5,'A',1,'Regular'),(5,'A',2,'Regular'),(5,'A',3,'Regular'),(5,'A',4,'Regular'),(5,'A',5,'Regular'),(5,'A',6,'Regular'),(5,'A',7,'Regular'),(5,'A',8,'Regular'),
(5,'B',1,'Regular'),(5,'B',2,'Regular'),(5,'B',3,'Regular'),(5,'B',4,'Regular'),(5,'B',5,'Regular'),(5,'B',6,'Regular'),(5,'B',7,'Regular'),(5,'B',8,'Regular'),
(5,'C',1,'Regular'),(5,'C',2,'Regular'),(5,'C',3,'Regular'),(5,'C',4,'Regular'),(5,'C',5,'Regular'),(5,'C',6,'Regular'),(5,'C',7,'Regular'),(5,'C',8,'Regular'),
(5,'D',1,'Regular'),(5,'D',2,'Regular'),(5,'D',3,'Regular'),(5,'D',4,'Regular'),(5,'D',5,'Regular'),(5,'D',6,'Regular'),(5,'D',7,'Regular'),(5,'D',8,'Regular'),
(5,'E',1,'Regular'),(5,'E',2,'Regular'),(5,'E',3,'Regular'),(5,'E',4,'Regular'),(5,'E',5,'Regular'),(5,'E',6,'Regular'),(5,'E',7,'Regular'),(5,'E',8,'Regular'),
(5,'F',1,'VIP'),(5,'F',2,'VIP'),(5,'F',3,'VIP'),(5,'F',4,'VIP'),(5,'F',5,'VIP'),(5,'F',6,'VIP'),(5,'F',7,'VIP'),(5,'F',8,'VIP'),
(5,'G',1,'VIP'),(5,'G',2,'VIP'),(5,'G',3,'VIP'),(5,'G',4,'VIP'),(5,'G',5,'VIP'),(5,'G',6,'VIP'),(5,'G',7,'VIP'),(5,'G',8,'VIP'),
(5,'H',1,'VIP'),(5,'H',2,'VIP'),(5,'H',3,'VIP'),(5,'H',4,'VIP'),(5,'H',5,'VIP'),(5,'H',6,'VIP'),(5,'H',7,'VIP'),(5,'H',8,'VIP'),
(5,'I',1,'Couple'),(5,'I',2,'Couple'),(5,'I',3,'Couple'),(5,'I',4,'Couple'),(5,'I',5,'Couple'),(5,'I',6,'Couple'),(5,'I',7,'Couple'),(5,'I',8,'Couple'),
(5,'J',1,'Couple'),(5,'J',2,'Couple'),(5,'J',3,'Couple'),(5,'J',4,'Couple'),(5,'J',5,'Couple'),(5,'J',6,'Couple'),(5,'J',7,'Couple'),(5,'J',8,'Couple');

-- =============================================
-- 5. SHOWTIMES: 20 Slots
-- =============================================
INSERT INTO Showtimes (movie_id, hall_id, show_date, start_time, end_time, base_price) VALUES
(1, 1, '2026-02-25', '12:00:00', '15:01:00', 120.00),
(2, 2, '2026-02-25', '13:00:00', '15:55:00', 150.00),
(3, 3, '2026-02-25', '16:00:00', '18:02:00', 100.00),
(4, 4, '2026-02-26', '11:00:00', '12:43:00', 80.00),
(5, 5, '2026-02-26', '14:00:00', '16:28:00', 130.00),
(6, 1, '2026-02-26', '17:00:00', '19:49:00', 140.00),
(7, 2, '2026-02-27', '12:30:00', '15:45:00', 110.00),
(8, 3, '2026-02-27', '13:00:00', '15:49:00', 125.00),
(9, 4, '2026-02-27', '14:00:00', '16:12:00', 90.00),
(10, 5, '2026-02-27', '15:00:00', '17:45:00', 135.00),
(1, 1, '2026-02-28', '10:00:00', '13:01:00', 120.00),
(2, 2, '2026-02-28', '11:30:00', '14:25:00', 150.00),
(3, 3, '2026-02-28', '14:00:00', '16:02:00', 100.00),
(4, 4, '2026-02-28', '15:00:00', '16:43:00', 80.00),
(5, 5, '2026-02-28', '16:00:00', '18:28:00', 130.00),
(6, 1, '2026-02-28', '17:30:00', '20:19:00', 140.00),
(7, 2, '2026-03-01', '12:00:00', '15:15:00', 110.00),
(8, 3, '2026-03-01', '13:30:00', '16:19:00', 125.00),
(9, 4, '2026-03-01', '14:30:00', '16:42:00', 90.00),
(10, 5, '2026-03-01', '15:30:00', '18:15:00', 135.00);

-- =============================================
-- 6. BOOKINGS: 40 Records
-- =============================================
INSERT INTO Bookings (user_id, booking_time, total_price, status) VALUES
(1, '2026-02-25 10:00:00', 360, 'Confirmed'),
(2, '2026-02-25 11:15:00', 600, 'Confirmed'),
(3, '2026-02-25 12:30:00', 200, 'Confirmed'),
(4, '2026-02-25 13:00:00', 400, 'Confirmed'),
(5, '2026-02-25 14:10:00', 130, 'Confirmed'),
(6, '2026-02-26 10:20:00', 420, 'Confirmed'),
(7, '2026-02-26 11:45:00', 220, 'Confirmed'),
(8, '2026-02-26 12:50:00', 625, 'Confirmed'),
(9, '2026-02-26 13:15:00', 360, 'Confirmed'),
(10, '2026-02-26 14:30:00', 405, 'Confirmed'),
(11, '2026-02-27 09:30:00', 240, 'Confirmed'),
(12, '2026-02-27 10:45:00', 600, 'Confirmed'),
(13, '2026-02-27 11:15:00', 100, 'Confirmed'),
(14, '2026-02-27 12:50:00', 240, 'Confirmed'),
(15, '2026-02-27 13:20:00', 650, 'Confirmed'),
(16, '2026-02-27 14:00:00', 280, 'Confirmed'),
(17, '2026-02-28 09:00:00', 330, 'Confirmed'),
(18, '2026-02-28 09:45:00', 500, 'Confirmed'),
(19, '2026-02-28 10:30:00', 90, 'Confirmed'),
(20, '2026-02-28 11:00:00', 270, 'Confirmed'),
(1, '2026-02-28 12:15:00', 240, 'Confirmed'),
(2, '2026-02-28 12:50:00', 450, 'Confirmed'),
(3, '2026-02-28 13:30:00', 200, 'Confirmed'),
(4, '2026-02-28 14:00:00', 160, 'Confirmed'),
(5, '2026-02-28 14:45:00', 390, 'Confirmed'),
(6, '2026-03-01 09:15:00', 280, 'Confirmed'),
(7, '2026-03-01 10:00:00', 220, 'Confirmed'),
(8, '2026-03-01 10:45:00', 375, 'Confirmed'),
(9, '2026-03-01 11:30:00', 180, 'Confirmed'),
(10, '2026-03-01 12:15:00', 405, 'Confirmed'),
(11, '2026-03-01 13:00:00', 120, 'Confirmed'),
(12, '2026-03-01 13:45:00', 300, 'Confirmed'),
(13, '2026-03-01 14:30:00', 300, 'Confirmed'),
(14, '2026-03-01 15:15:00', 240, 'Confirmed'),
(15, '2026-03-02 09:15:00', 520, 'Confirmed'),
(16, '2026-03-02 10:00:00', 280, 'Confirmed'),
(17, '2026-03-02 10:45:00', 330, 'Confirmed'),
(18, '2026-03-02 11:30:00', 375, 'Confirmed'),
(19, '2026-03-02 12:15:00', 180, 'Confirmed'),
(20, '2026-03-02 13:00:00', 270, 'Confirmed');

-- =============================================
-- 7. TICKETS: 40 Entries Linking Seats to Shows
-- =============================================
INSERT INTO Tickets (booking_id, show_id, seat_id, price) VALUES
(1,1,1,120),(1,1,2,120),(1,1,3,120),(2,2,51,150),(2,2,52,150),(2,2,53,150),(2,2,54,150),
(3,3,111,100),(3,3,112,100),(4,4,181,80),(4,4,182,80),(4,4,183,80),(4,4,184,80),(4,4,185,80),
(5,5,221,130),(6,6,4,140),(6,6,5,140),(6,6,6,140),(7,7,55,110),(7,7,56,110),(8,8,113,125),
(8,8,114,125),(8,8,115,125),(8,8,116,125),(8,8,117,125),(9,9,186,90),(9,9,187,90),(9,9,188,90),
(9,9,189,90),(10,10,222,135),(10,10,223,135),(10,10,224,135),(11,11,7,120),(11,11,8,120),
(12,12,57,150),(12,12,58,150),(12,12,59,150),(12,12,60,150),(13,13,118,100),(14,14,190,80),
(14,14,191,80),(14,14,192,80),(15,15,225,130),(15,15,226,130),(15,15,227,130),(15,15,228,130),
(15,15,229,130),(16,16,9,140),(16,16,10,140),(17,17,61,110),(17,17,62,110),(17,17,63,110),
(18,18,119,125),(18,18,120,125),(18,18,121,125),(18,18,122,125),(19,19,193,90),(20,20,230,135),
(20,20,231,135),(21,1,11,120),(21,1,12,120),(22,2,64,150),(22,2,65,150),(22,2,66,150),(23,3,123,100),
(23,3,124,100),(24,4,194,80),(24,4,195,80),(25,5,232,130),(25,5,233,130),(25,5,234,130),(26,6,13,140),
(26,6,14,140),(27,7,67,110),(27,7,68,110),(28,8,125,125),(28,8,126,125),(28,8,127,125),(29,9,196,90),
(29,9,197,90),(30,10,235,135),(30,10,236,135),(30,10,237,135),(31,11,15,120),(32,12,69,150),
(32,12,70,150),(33,13,128,100),(33,13,129,100),(33,13,130,100),(34,14,198,80),(34,14,199,80),
(34,14,200,80),(35,15,238,130),(35,15,239,130),(35,15,240,130),(35,15,241,130),(36,16,16,140),
(36,16,17,140),(37,17,71,110),(37,17,72,110),(37,17,73,110),(38,18,131,125),(38,18,132,125),
(38,18,133,125),(39,19,201,90),(39,19,202,90),(40,20,242,135),(40,20,243,135);

-- =============================================
-- 8. PAYMENTS: 40 Records
-- =============================================
INSERT INTO Payments (booking_id, amount, payment_method, status) VALUES 
(1, 360, 'Credit Card', 'Completed'),
(2, 600, 'Cash', 'Completed'),
(3, 200, 'Credit Card', 'Completed'),
(4, 400, 'Wallet', 'Completed'),
(5, 130, 'Credit Card', 'Completed'),
(6, 420, 'Cash', 'Completed'),
(7, 220, 'Wallet', 'Completed'),
(8, 625, 'Credit Card', 'Completed'),
(9, 360, 'Cash', 'Completed'),
(10, 405, 'Credit Card', 'Completed'),
(11, 240, 'Cash', 'Completed'),
(12, 600, 'Wallet', 'Completed'),
(13, 100, 'Credit Card', 'Completed'),
(14, 240, 'Cash', 'Completed'),
(15, 650, 'Credit Card', 'Completed'),
(16, 280, 'Wallet', 'Completed'),
(17, 330, 'Cash', 'Completed'),
(18, 500, 'Credit Card', 'Completed'),
(19, 90, 'Cash', 'Completed'),
(20, 270, 'Wallet', 'Completed'),
(21, 240, 'Credit Card', 'Completed'),
(22, 450, 'Cash', 'Completed'),
(23, 200, 'Wallet', 'Completed'),
(24, 160, 'Credit Card', 'Completed'),
(25, 390, 'Cash', 'Completed'),
(26, 280, 'Wallet', 'Completed'),
(27, 220, 'Credit Card', 'Completed'),
(28, 375, 'Cash', 'Completed'),
(29, 180, 'Wallet', 'Completed'),
(30, 405, 'Credit Card', 'Completed'),
(31, 120, 'Cash', 'Completed'),
(32, 300, 'Wallet', 'Completed'),
(33, 300, 'Credit Card', 'Completed'),
(34, 240, 'Cash', 'Completed'),
(35, 520, 'Wallet', 'Completed'),
(36, 280, 'Credit Card', 'Completed'),
(37, 330, 'Cash', 'Completed'),
(38, 375, 'Wallet', 'Completed'),
(39, 180, 'Credit Card', 'Completed'),
(40, 270, 'Cash', 'Completed');