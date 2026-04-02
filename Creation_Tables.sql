USE CinemaDB;

-- Users Table: Stores all registered users
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary key for unique identification
    name VARCHAR(100) NOT NULL,            -- User's full name
    email VARCHAR(150) NOT NULL UNIQUE,    -- Email must be unique
    password VARCHAR(255) NOT NULL,        -- Store hashed passwords
    phone VARCHAR(20),                     -- Optional phone number
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Automatic record creation time
);

-- Movies Table: Stores movies information
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary key
    title VARCHAR(150) NOT NULL,            -- Movie title
    description TEXT,                        -- Optional detailed description
    duration INT NOT NULL,                   -- Duration in minutes
    genre VARCHAR(50),                       -- Genre (Action, Drama, etc.)
    release_date DATE                        -- Movie release date
);

-- Halls Table: Cinema halls information
CREATE TABLE Halls (
    hall_id INT AUTO_INCREMENT PRIMARY KEY,   -- Primary key
    name VARCHAR(50) NOT NULL,               -- Hall name or number
    total_capacity INT NOT NULL,             -- Total number of seats
    screen_type ENUM('2D','3D','IMAX') DEFAULT '2D' -- Hall screen type
);

-- Seats Table: Seats in each hall
CREATE TABLE Seats (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,   -- Primary key
    hall_id INT NOT NULL,                     -- Foreign key linking to Halls
    row_label CHAR(2) NOT NULL,             -- Row letter, e.g., 'A', 'B' / renamed from row_number
    seat_number INT NOT NULL,                 -- Seat number in the row
    seat_type ENUM('Regular','VIP','Couple') DEFAULT 'Regular', -- Seat type
    FOREIGN KEY (hall_id) REFERENCES Halls(hall_id) ON DELETE CASCADE -- Delete seats if hall deleted
);

--  Showtimes Table: Schedule of movie screenings
CREATE TABLE Showtimes (
    show_id INT AUTO_INCREMENT PRIMARY KEY,   -- Primary key
    movie_id INT NOT NULL,                    -- Movie foreign key
    hall_id INT NOT NULL,                     -- Hall foreign key
    show_date DATE NOT NULL,                  -- Date of the show
    start_time TIME NOT NULL,                 -- Show start time
    end_time TIME NOT NULL,                   -- Show end time
    base_price DECIMAL(6,2) NOT NULL,        -- Base ticket price
    UNIQUE(hall_id, show_date, start_time),  -- Prevent double-booking hall at same time
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (hall_id) REFERENCES Halls(hall_id) ON DELETE CASCADE
);

-- Bookings Table: Customer bookings
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary key
    user_id INT NOT NULL,                      -- Foreign key to Users
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Booking creation timestamp
    total_price DECIMAL(8,2) NOT NULL,        -- Total price of the booking
    status ENUM('Pending','Confirmed','Cancelled') DEFAULT 'Pending', -- Booking status
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Tickets Table: M:N bridge between Bookings, Showtimes, and Seats
CREATE TABLE Tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,  -- Primary key
    booking_id INT NOT NULL,                   -- Foreign key to Booking
    show_id INT NOT NULL,                      -- Foreign key to Showtimes
    seat_id INT NOT NULL,                      -- Foreign key to Seat
    price DECIMAL(6,2) NOT NULL,              -- Ticket price
    UNIQUE(show_id, seat_id),                  -- Prevent double-booking the same seat for the show
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (show_id) REFERENCES Showtimes(show_id) ON DELETE CASCADE,
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id) ON DELETE CASCADE
);

-- Payments Table: Tracks payments for bookings
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary key
    booking_id INT NOT NULL,                   -- Foreign key to Booking
    amount DECIMAL(8,2) NOT NULL,             -- Payment amount
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Payment timestamp
    payment_method ENUM('Credit Card','Debit Card','Wallet','Cash') DEFAULT 'Credit Card', -- Method
    status ENUM('Processing','Completed','Failed','Refunded') DEFAULT 'Processing', -- Payment status
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE CASCADE
);
