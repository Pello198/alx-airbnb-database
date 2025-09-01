# Database Normalization (3NF) - Airbnb Database

This document explains how the Airbnb database schema was normalized up to the Third Normal Form (3NF).

---

## Step 1: First Normal Form (1NF)

**Definition:**  
- Each table must have atomic (indivisible) values.  
- No repeating groups or arrays.  

**Application:**  
- In the `User` table, attributes like `first_name` and `last_name` are stored separately.  
- No multi-valued fields exist (e.g., phone numbers are stored in a single column, not as a list).  

✅ Result: All tables meet 1NF.

---

## Step 2: Second Normal Form (2NF)

**Definition:**  
- The database must already satisfy 1NF.  
- All non-key attributes must depend on the *whole* primary key (not part of it).  

**Application:**  
- In the `Reservation` table, all attributes (`guest_id`, `listing_id`, `check_in_date`, `check_out_date`, `total_price`) depend fully on the primary key `reservation_id`.  
- No partial dependency exists because we avoided composite keys.  

✅ Result: All tables meet 2NF.

---

## Step 3: Third Normal Form (3NF)

**Definition:**  
- The database must already satisfy 2NF.  
- There should be no transitive dependencies (non-key attributes must depend only on the primary key).  

**Issue Found:**  
- In the `Listing` table, the fields `city` and `country` can cause redundancy.  
  - Example: Many listings in the same city/country repeat the same values.  
  - This violates 3NF because `city` and `country` do not directly depend on the primary key `listing_id`.  

**Solution:**  
- Extract `city` and `country` into a separate `Location` table.  
- Replace them in the `Listing` table with a foreign key `location_id`.  

✅ Result: Database design now meets 3NF.

---

## Final Normalized Tables

### **User**
- user_id (PK)  
- first_name  
- last_name  
- email  
- password_hash  
- phone_number  
- role  

### **Location**
- location_id (PK)  
- city  
- country  

### **Listing**
- listing_id (PK)  
- host_id (FK → User.user_id)  
- location_id (FK → Location.location_id)  
- address  
- price_per_night  

### **Reservation**
- reservation_id (PK)  
- guest_id (FK → User.user_id)  
- listing_id (FK → Listing.listing_id)  
- check_in_date  
- check_out_date  
- total_price  

### **Review**
- review_id (PK)  
- reservation_id (FK → Reservation.reservation_id)  
- rating  
- comment  

### **Payment**
- payment_id (PK)  
- reservation_id (FK → Reservation.reservation_id)  
- amount  
- payment_method  
- status  

---

## ✅ Conclusion
By applying normalization up to 3NF:
- We eliminated redundant data.  
- Ensured data integrity.  
- Improved maintainability of the Airbnb database schema.  
