🔎 Query Results
1. INNER JOIN (Users ↔ Bookings)
SELECT b.booking_id, b.booking_date, u.user_id, u.name, u.email
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id;


Result:

booking_id	booking_date	user_id	name	email
101	2025-09-01	1	Alice	alice@mail.com

102	2025-09-02	2	Bob	bob@mail.com

👉 Booking 103 is excluded because user_id = 5 doesn’t exist.

2. LEFT JOIN (Properties ↔ Reviews)
SELECT p.property_id, p.title, r.review_id, r.rating, r.comment
FROM Properties p
LEFT JOIN Reviews r ON p.property_id = r.property_id;


Result:

property_id	title	review_id	rating	comment
201	Beach House	301	5	Excellent!
202	Mountain Cabin	302	4	Nice place
203	City Apartment	NULL	NULL	NULL
204	Desert Villa	NULL	NULL	NULL

👉 Properties 203 and 204 show up with NULL values since they have no reviews.

3. FULL OUTER JOIN (Users ↔ Bookings)
SELECT u.user_id, u.name, b.booking_id, b.booking_date, b.property_id
FROM Users u
FULL OUTER JOIN Bookings b ON u.user_id = b.user_id;


Result:

user_id	name	booking_id	booking_date	property_id
1	Alice	101	2025-09-01	201
2	Bob	102	2025-09-02	202
3	Charlie	NULL	NULL	NULL
NULL	NULL	103	2025-09-03	203

👉 Includes:

Users with bookings (Alice, Bob)

Users with no bookings (Charlie)

Bookings without valid users (booking_id 103 with user_id=5)

Would you like me to also package this into a ready-to-run SQL script (CREATE TABLE + INSERT + SELECT queries), so you can paste it directly into your database and test?

You said:
write a readme file with it
ChatGPT said:

Got it ✅ Here’s a README.md file you can include alongside your SQL script. It explains the objective, tables, sample data, and the join queries with results.

SQL Joins Practice
📌 Objective

The objective of this project is to master SQL joins by writing complex queries using different types of joins. The examples use a simple booking system with Users, Bookings, Properties, and Reviews.

📊 Database Schema

Users: Stores user details (user_id, name, email)

Bookings: Stores booking records (booking_id, user_id, property_id, booking_date)

Properties: Stores property details (property_id, title, location)

Reviews: Stores property reviews (review_id, property_id, user_id, rating, comment)

📝 Sample Data
Users
user_id	name	email
1	Alice	alice@mail.com

2	Bob	bob@mail.com

3	Charlie	charlie@mail.com
Bookings
booking_id	user_id	property_id	booking_date
101	1	201	2025-09-01
102	2	202	2025-09-02
103	5	203	2025-09-03
Properties
property_id	title	location
201	Beach House	Mombasa
202	Mountain Cabin	Naivasha
203	City Apartment	Nairobi
204	Desert Villa	Turkana
Reviews
review_id	property_id	user_id	rating	comment
301	201	1	5	Excellent!
302	202	2	4	Nice place
🔎 Queries and Results
1. INNER JOIN – Bookings with their Users
SELECT b.booking_id, b.booking_date, u.user_id, u.name, u.email
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id;


Result:

booking_id	booking_date	user_id	name	email
101	2025-09-01	1	Alice	alice@mail.com

102	2025-09-02	2	Bob	bob@mail.com
2. LEFT JOIN – Properties with Reviews
SELECT p.property_id, p.title, r.review_id, r.rating, r.comment
FROM Properties p
LEFT JOIN Reviews r ON p.property_id = r.property_id;


Result:

property_id	title	review_id	rating	comment
201	Beach House	301	5	Excellent!
202	Mountain Cabin	302	4	Nice place
203	City Apartment	NULL	NULL	NULL
204	Desert Villa	NULL	NULL	NULL
3. FULL OUTER JOIN – Users and Bookings
SELECT u.user_id, u.name, b.booking_id, b.booking_date, b.property_id
FROM Users u
FULL OUTER JOIN Bookings b ON u.user_id = b.user_id;


Result:

user_id	name	booking_id	booking_date	property_id
1	Alice	101	2025-09-01	201
2	Bob	102	2025-09-02	202
3	Charlie	NULL	NULL	NULL
NULL	NULL	103	2025-09-03	203

⚠️ If you’re using MySQL, FULL OUTER JOIN is not supported. Use a combination of LEFT JOIN + RIGHT JOIN with UNION.

🚀 How to Run

Create the tables in your SQL database.

Insert the sample data.

Run each query to test how joins work.

Observe the differences between INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.
