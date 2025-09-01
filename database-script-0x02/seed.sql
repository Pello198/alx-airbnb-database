-- ========================
-- SAMPLE DATA: USERS
-- ========================
INSERT INTO users (user_id, first_name, last_name, email, password_hash)
VALUES
('u1-1111-aaaa-bbbb-0001', 'Alice', 'Johnson', 'alice@example.com', 'hash_pw1'),
('u2-2222-bbbb-cccc-0002', 'Bob', 'Smith', 'bob@example.com', 'hash_pw2'),
('u3-3333-cccc-dddd-0003', 'Charlie', 'Brown', 'charlie@example.com', 'hash_pw3'),
('u4-4444-dddd-eeee-0004', 'Diana', 'Lopez', 'diana@example.com', 'hash_pw4');


-- ========================
-- SAMPLE DATA: LISTINGS
-- ========================
INSERT INTO listings (listing_id, user_id, title, description, price, location, created_at)
VALUES
('l1-aaaa-1111-xxxx-0001', 'u1-1111-aaaa-bbbb-0001', 'Cozy Apartment in Nairobi',
 '2-bedroom apartment close to the city center', 45.00, 'Nairobi, Kenya', NOW()),
('l2-bbbb-2222-yyyy-0002', 'u2-2222-bbbb-cccc-0002', 'Beach House in Mombasa',
 'Beautiful beach house with ocean views', 120.00, 'Mombasa, Kenya', NOW()),
('l3-cccc-3333-zzzz-0003', 'u4-4444-dddd-eeee-0004', 'Mountain Cabin in Naivasha',
 'Rustic cabin with fireplace and lake view', 75.00, 'Naivasha, Kenya', NOW());


-- ========================
-- SAMPLE DATA: BOOKINGS
-- ========================
INSERT INTO bookings (booking_id, user_id, listing_id, start_date, end_date, total_price, status, created_at)
VALUES
('b1-1111-aaaa-xxxx-1001', 'u3-3333-cccc-dddd-0003', 'l1-aaaa-1111-xxxx-0001',
 '2025-09-10', '2025-09-15', 225.00, 'confirmed', NOW()),
('b2-2222-bbbb-yyyy-1002', 'u4-4444-dddd-eeee-0004', 'l2-bbbb-2222-yyyy-0002',
 '2025-09-20', '2025-09-25', 600.00, 'pending', NOW()),
('b3-3333-cccc-zzzz-1003', 'u1-1111-aaaa-bbbb-0001', 'l3-cccc-3333-zzzz-0003',
 '2025-10-01', '2025-10-05', 300.00, 'confirmed', NOW());


-- ========================
-- SAMPLE DATA: REVIEWS
-- ========================
INSERT INTO reviews (review_id, user_id, listing_id, rating, comment, created_at)
VALUES
('r1-aaaa-1111-0001', 'u3-3333-cccc-dddd-0003', 'l1-aaaa-1111-xxxx-0001', 5,
 'Amazing stay! Super clean and close to everything.', NOW()),
('r2-bbbb-2222-0002', 'u4-4444-dddd-eeee-0004', 'l2-bbbb-2222-yyyy-0002', 4,
 'Loved the view, but WiFi was a bit slow.', NOW()),
('r3-cccc-3333-0003', 'u1-1111-aaaa-bbbb-0001', 'l3-cccc-3333-zzzz-0003', 5,
 'Perfect getaway in nature, highly recommended!', NOW());
