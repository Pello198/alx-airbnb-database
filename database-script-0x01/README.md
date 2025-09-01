# AirBnB Database Schema

This project defines the database schema for an AirBnB-style application. The schema is normalized up to **3NF** to ensure data integrity and avoid redundancy.

---

## 📌 Entities and Relationships

### 1. **Users**
- Stores information about all users (hosts and guests).
- Attributes: `user_id`, `first_name`, `last_name`, `email`, `password_hash`.
- Constraints:
  - `user_id` is the **primary key**.
  - `email` must be **unique**.
- Index on `email` for fast lookups.

### 2. **Listings**
- Represents properties listed by hosts.
- Attributes: `listing_id`, `user_id`, `title`, `description`, `price`, `location`, `created_at`.
- Constraints:
  - `listing_id` is the **primary key**.
  - `user_id` is a **foreign key** → `users(user_id)`.
- Indexes on `user_id` (for host queries) and `location` (for search).

### 3. **Bookings**
- Tracks reservations made by guests.
- Attributes: `booking_id`, `user_id`, `listing_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`.
- Constraints:
  - `booking_id` is the **primary key**.
  - `user_id` is a **foreign key** → `users(user_id)`.
  - `listing_id` is a **foreign key** → `listings(listing_id)`.
  - `start_date < end_date`.
- Indexes on `user_id`, `listing_id`, and `(start_date, end_date)`.

### 4. **Reviews**
- Stores guest reviews for listings.
- Attributes: `review_id`, `user_id`, `listing_id`, `rating`, `comment`, `created_at`.
- Constraints:
  - `review_id` is the **primary key**.
  - `user_id` is a **foreign key** → `users(user_id)`.
  - `listing_id` is a **foreign key** → `listings(listing_id)`.
  - `rating` must be **between 1 and 5**.
- Indexes on `listing_id` and `user_id`.

---

## ⚙️ Schema Highlights
- **UUIDs (`CHAR(36)` or `UUID`)** used as primary keys for uniqueness.
- **Normalization to 3NF** avoids data duplication.
- **Foreign keys with `ON DELETE CASCADE`** ensure referential integrity.
- **Indexes** on frequently searched fields for performance.

---

## 📂 Files in This Repo
- `schema.sql` → Contains the SQL `CREATE TABLE` statements.
- `README.md` → This file, explaining the schema.

---

## ▶️ How to Use
1. Run the SQL file in your database:
   ```bash
   psql -U <username> -d <database> -f schema.sql   # PostgreSQL
