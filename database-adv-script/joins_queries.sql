SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name,
    u.email
FROM Bookings b
INNER JOIN Users u 
    ON b.user_id = u.user_id;
SELECT 
    p.property_id,
    p.title,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM Properties p
LEFT JOIN Reviews r 
    ON p.property_id = r.property_id;
SELECT 
    u.user_id,
    u.name,
    b.booking_id,
    b.booking_date,
    b.property_id
FROM Users u
LEFT JOIN Bookings b 
    ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.name,
    b.booking_id,
    b.booking_date,
    b.property_id
FROM Users u
RIGHT JOIN Bookings b 
    ON u.user_id = b.user_id;
