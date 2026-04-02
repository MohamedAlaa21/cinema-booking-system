<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=28&pause=1000&color=1565C0&center=true&vCenter=true&width=600&lines=🎬+Cinema+Booking+System;MySQL+Database+Project;Full-Stack+SQL+Implementation" alt="Typing SVG" />

<br/>

![MySQL](https://img.shields.io/badge/MySQL-8.0+-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Advanced-orange?style=for-the-badge&logo=databricks&logoColor=white)
![Status](https://img.shields.io/badge/Status-Complete-2E7D32?style=for-the-badge&logo=checkmarx&logoColor=white)
![Tables](https://img.shields.io/badge/Tables-8-1565C0?style=for-the-badge)
![Triggers](https://img.shields.io/badge/Triggers-4-7B1FA2?style=for-the-badge)
![Views](https://img.shields.io/badge/Views-3-00838F?style=for-the-badge)

<br/>

> **A production-quality relational database project** that simulates a complete cinema ticket reservation platform — from user registration and showtime scheduling to seat selection, payment processing, and automated booking confirmation.

<br/>

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Database Schema](#-database-schema)
- [Features](#-features)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [SQL Objects Reference](#-sql-objects-reference)
  - [Views](#-views)
  - [Functions](#-functions)
  - [Stored Procedure](#-stored-procedure)
  - [Triggers](#-triggers)
  - [Indexes](#-indexes)
- [Sample Queries](#-sample-queries)
- [Data Model](#-data-model)
- [Challenges & Solutions](#-challenges--solutions)
- [Future Enhancements](#-future-enhancements)

---

## 🎯 Overview

The **Cinema Booking System (CinemaDB)** is a fully normalized MySQL database built to enforce real-world business rules at the database level — not the application level. Every constraint, trigger, and transaction guarantees data integrity regardless of how the database is accessed.

### 📊 Project Stats

| Metric | Value |
|--------|-------|
| 🗄️ Tables | 8 normalized tables |
| 🪑 Seats | 350 seats across 5 halls |
| 🎬 Movies | 10 movies · 20 showtimes |
| 🎫 Bookings | 40 bookings · 100+ tickets |
| 👥 Users | 20 registered users |
| ⚡ Triggers | 4 automated triggers |
| 🔧 Procedures | 1 transactional stored procedure |
| 👁️ Views | 3 analytical views |
| ⚙️ Functions | 2 reusable functions |
| 📈 Indexes | 4 performance indexes |

---

## 🗂️ Database Schema

```
Users ──────────────── Bookings ──────────── Tickets ──────── Seats
                           │                     │
                           │                     └──────────── Showtimes ── Movies
                           │                                        │
                       Payments                                   Halls
```

### Entity Relationships

```
Users      1 ──── ∞   Bookings
Bookings   1 ──── ∞   Tickets
Bookings   1 ──── ∞   Payments
Showtimes  1 ──── ∞   Tickets
Seats      1 ──── ∞   Tickets
Halls      1 ──── ∞   Seats
Halls      1 ──── ∞   Showtimes
Movies     1 ──── ∞   Showtimes
```

---

## ✨ Features

### 🔒 Data Integrity
- **No double-booking** — `UNIQUE(show_id, seat_id)` on Tickets prevents two bookings for the same seat
- **No duplicate seats** — `UNIQUE(hall_id, row_label, seat_number)` prevents duplicate seat definitions
- **No invalid schedules** — `CHECK(end_time > start_time)` enforces valid show time ranges
- **Cascading deletes** — Foreign keys with `ON DELETE CASCADE` maintain referential integrity

### ⚡ Automation via Triggers
- `total_price` auto-recalculates whenever a ticket is inserted or deleted
- Booking status auto-updates when payment status changes
- Tickets blocked from insertion into cancelled bookings

### 🔧 Transactional Safety
- `sp_create_booking` wraps the entire booking process in a single `START TRANSACTION / COMMIT`
- Full `ROLLBACK` on any failure — no partial writes ever reach the database

### 📊 Reporting Views
- Real-time seat availability per show
- Full booking details with user, movie, hall, and pricing
- Revenue aggregated per movie

---

## 📁 Project Structure

```
CinemaDB/
│
├── 📄 Creation_Database.sql          # CREATE DATABASE statement
├── 📄 Creation_Tables.sql            # All 8 table definitions with constraints
├── 📄 Insertion_Sample_Data.sql      # Full dataset: 20 users, 350 seats, 40 bookings
│
├── 📄 Views.sql                      # 3 analytical views
├── 📄 Functions.sql                  # 2 scalar functions
├── 📄 Stored_Procedures.sql          # sp_create_booking transaction procedure
├── 📄 Triggers.sql                   # 4 automated triggers with test cases
├── 📄 Index.sql                      # 4 performance indexes
│
├── 📄 Real_Production_Deployment_Upgrade.sql  # ALTER TABLE production migrations
│
├── 🖼️ Cinema_Booking_System_ERD.png   # Entity Relationship Diagram
├── 🖼️ cinema_schema_diagram.jpg       # MySQL Workbench schema view
├── 🖼️ Function_MindMap.png            # Stored procedure flow diagram
└── 📄 README.md
```

---

## 🚀 Getting Started

### Prerequisites

- [MySQL 8.0+](https://dev.mysql.com/downloads/) or [MySQL Workbench](https://www.mysql.com/products/workbench/)
- MySQL client or any compatible IDE

### Installation

**1. Clone the repository**
```bash
git clone https://github.com/YOUR_USERNAME/cinema-booking-system.git
cd cinema-booking-system
```

**2. Create the database**
```sql
SOURCE Creation_Database.sql;
```

**3. Create all tables**
```sql
SOURCE Creation_Tables.sql;
```

**4. Apply production upgrades (constraints)**
```sql
SOURCE Real_Production_Deployment_Upgrade.sql;
```

**5. Create SQL objects (in order)**
```sql
SOURCE Functions.sql;
SOURCE Views.sql;
SOURCE Triggers.sql;
SOURCE Stored_Procedures.sql;
SOURCE Index.sql;
```

**6. Load sample data**
```sql
SOURCE Insertion_Sample_Data.sql;
```

**7. Verify everything works**
```sql
USE CinemaDB;
SELECT * FROM vw_booking_details LIMIT 5;
SELECT * FROM vw_available_seats WHERE show_id = 1;
SELECT * FROM vw_revenue_per_movie ORDER BY total_revenue DESC;
```

---

## 📚 SQL Objects Reference

### 👁️ Views

| View | Purpose |
|------|---------|
| `vw_booking_details` | Full booking summary — user, movie, hall, date, time, price, status |
| `vw_available_seats` | Real-time list of unbooked seats per showtime |
| `vw_revenue_per_movie` | Total ticket revenue aggregated per movie |

```sql
-- Example: See all available seats for show #1
SELECT * FROM vw_available_seats WHERE show_id = 1;

-- Example: Revenue ranking
SELECT * FROM vw_revenue_per_movie ORDER BY total_revenue DESC;
```

---

### ⚙️ Functions

| Function | Returns | Description |
|----------|---------|-------------|
| `fn_booking_total(booking_id)` | `DECIMAL(8,2)` | Sum of all ticket prices for a booking |
| `fn_is_seat_available(show_id, seat_id)` | `BOOLEAN` | Returns `1` if seat is free, `0` if booked |

```sql
-- Check if seat 10 is available for show 1
SELECT fn_is_seat_available(1, 10);   -- 1 = available

-- Get total price for booking #3
SELECT fn_booking_total(3);           -- e.g. 200.00
```

---

### 🔧 Stored Procedure

#### `sp_create_booking`

Handles the complete booking lifecycle in **one atomic transaction**.

```sql
CALL sp_create_booking(
    p_user_id       INT,      -- User placing the booking
    p_show_id       INT,      -- Target showtime
    seat_ids        TEXT,     -- Comma-separated seat IDs: '1,2,3'
    p_payment_method VARCHAR  -- 'Credit Card' | 'Debit Card' | 'Wallet' | 'Cash'
);
```

**Example:**
```sql
-- Book seats 1 and 2 for show #1, user #1, paying by Credit Card
CALL sp_create_booking(1, 1, '1,2', 'Credit Card');
```

**What it does internally:**
1. ✅ Validates payment method — raises error if invalid
2. 📋 Parses seat IDs into a temporary table
3. 🔐 Begins a transaction (`START TRANSACTION`)
4. 📝 Inserts a new `Booking` record (status: Pending)
5. 🔄 Loops over each seat using a cursor
6. 🔍 Checks availability via `fn_is_seat_available()`
7. ❌ If any seat is taken → `ROLLBACK` + error
8. ✅ Inserts a `Ticket` per available seat
9. ⚡ Trigger auto-updates `total_price`
10. 💳 Inserts a `Payment` record (status: Processing)
11. 💾 `COMMIT` — all changes saved atomically

---

### ⚡ Triggers

| Trigger | Event | Action |
|---------|-------|--------|
| `trg_after_ticket_insert` | `AFTER INSERT` on Tickets | Recalculates `Bookings.total_price` |
| `trg_after_ticket_delete` | `AFTER DELETE` on Tickets | Recalculates `total_price` (0 if no tickets remain) |
| `trg_after_payment_update` | `AFTER UPDATE` on Payments | `Completed` → Booking `Confirmed` · `Refunded` → Booking `Cancelled` |
| `trg_before_ticket_insert` | `BEFORE INSERT` on Tickets | Blocks insert if booking is already `Cancelled` |

**Test the trigger chain:**
```sql
-- Insert a ticket → watch total_price update automatically
INSERT INTO Tickets(booking_id, show_id, seat_id, price)
VALUES (1, 1, 5, 120.00);

SELECT total_price FROM Bookings WHERE booking_id = 1;
-- Result: 120.00 ← updated automatically by trigger
```

---

### 📈 Indexes

| Index | Column | Optimizes |
|-------|--------|-----------|
| `idx_show_movie` | `Showtimes.movie_id` | Filtering shows by movie |
| `idx_booking_user` | `Bookings.user_id` | User booking history lookups |
| `idx_ticket_booking` | `Tickets.booking_id` | Ticket joins to booking |
| `idx_payment_booking` | `Payments.booking_id` | Payment lookups per booking |

---

## 💡 Sample Queries

### Most Popular Movies
```sql
SELECT m.title,
       COUNT(t.ticket_id) AS tickets_sold,
       SUM(t.price)       AS revenue
FROM   Movies    m
JOIN   Showtimes s ON s.movie_id = m.movie_id
JOIN   Tickets   t ON t.show_id  = s.show_id
GROUP  BY m.movie_id
ORDER  BY tickets_sold DESC;
```

### Top Spending Customers
```sql
SELECT u.name,
       COUNT(b.booking_id) AS bookings,
       SUM(b.total_price)  AS total_spent
FROM   Users    u
JOIN   Bookings b ON b.user_id = u.user_id
WHERE  b.status = 'Confirmed'
GROUP  BY u.user_id
ORDER  BY total_spent DESC;
```

### Occupancy Rate per Hall
```sql
SELECT h.name                               AS hall,
       h.total_capacity,
       COUNT(t.ticket_id)                   AS seats_sold,
       ROUND(COUNT(t.ticket_id) * 100.0
             / h.total_capacity, 1)         AS occupancy_pct
FROM   Halls     h
JOIN   Showtimes s ON s.hall_id  = h.hall_id
JOIN   Tickets   t ON t.show_id  = s.show_id
GROUP  BY h.hall_id
ORDER  BY occupancy_pct DESC;
```

---

## 🏗️ Data Model

### Tables Quick Reference

<details>
<summary><b>Users</b></summary>

| Column | Type | Constraint |
|--------|------|-----------|
| user_id | INT | PK, AUTO_INCREMENT |
| name | VARCHAR(100) | NOT NULL |
| email | VARCHAR(150) | UNIQUE, NOT NULL |
| password | VARCHAR(255) | NOT NULL |
| phone | VARCHAR(20) | NULL |
| created_at | TIMESTAMP | DEFAULT NOW() |

</details>

<details>
<summary><b>Showtimes</b></summary>

| Column | Type | Constraint |
|--------|------|-----------|
| show_id | INT | PK, AUTO_INCREMENT |
| movie_id | INT | FK → Movies, CASCADE |
| hall_id | INT | FK → Halls, CASCADE |
| show_date | DATE | NOT NULL |
| start_time | TIME | NOT NULL |
| end_time | TIME | CHECK > start_time |
| base_price | DECIMAL(6,2) | NOT NULL |

</details>

<details>
<summary><b>Tickets (Bridge Table)</b></summary>

| Column | Type | Constraint |
|--------|------|-----------|
| ticket_id | INT | PK, AUTO_INCREMENT |
| booking_id | INT | FK → Bookings, CASCADE |
| show_id | INT | FK → Showtimes, CASCADE |
| seat_id | INT | FK → Seats, CASCADE |
| price | DECIMAL(6,2) | NOT NULL |
| (show_id, seat_id) | — | UNIQUE |

</details>

---

## 🛠️ Challenges & Solutions

| # | Challenge | Solution |
|---|-----------|----------|
| 1 | Cursor declaration order failing in stored procedure | All `DECLARE` statements must come before any logic in MySQL — re-ordered strictly |
| 2 | Parsing comma-separated seat IDs in SQL | Used dynamic SQL (`PREPARE` / `EXECUTE`) to convert `'1,2,3'` into rows in a temp table |
| 3 | `total_price` drifting out of sync | `AFTER INSERT` + `AFTER DELETE` triggers auto-recalculate on every ticket change |
| 4 | Booking status not reflecting payment state | `AFTER UPDATE` trigger on Payments propagates status back to parent Booking |
| 5 | `vw_booking_details` failing under `ONLY_FULL_GROUP_BY` | Wrapped non-aggregated columns in `ANY_VALUE()` |
| 6 | Tickets insertable into cancelled bookings | `BEFORE INSERT` trigger reads booking status and raises `SIGNAL SQLSTATE '45000'` |
| 7 | Duplicate seat definitions per hall | Added `UNIQUE(hall_id, row_label, seat_number)` via `ALTER TABLE` production upgrade |

---

## 🚀 Future Enhancements

- [ ] **Dynamic seat pricing** — VIP (1.5×) and Couple (2×) multipliers at booking time
- [ ] **Promotions table** — percentage or fixed discount codes applied during booking
- [ ] **`sp_cancel_booking`** — cancellation procedure that releases seats and triggers refunds
- [ ] **Audit log table** — track all data changes for compliance
- [ ] **Concurrency locking** — `SELECT ... FOR UPDATE` to prevent race conditions
- [ ] **REST API layer** — Node.js / Python Flask API to expose database to a frontend
- [ ] **BI Dashboard** — connect views to Metabase or Power BI
- [ ] **Full-text search** — `FULLTEXT` index on `Movies(title, description)`

---

<div align="center">

### 🌟 If you found this project helpful, please give it a star!

![GitHub stars](https://img.shields.io/github/stars/YOUR_USERNAME/cinema-booking-system?style=social)
![GitHub forks](https://img.shields.io/github/forks/YOUR_USERNAME/cinema-booking-system?style=social)

**Built with ❤️ and lots of SQL**

`MySQL` · `Database Design` · `SQL Programming` · `Stored Procedures` · `Triggers` · `Views`

</div>
