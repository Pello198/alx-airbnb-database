-- ========================
-- USERS TABLE
-- ========================
CREATE TABLE users (
    user_id CHAR(36) PRIMARY KEY,       -- UUID as string
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
);

CREATE INDEX idx_users_email ON users(email);


-- ========================
-- LISTINGS TABLE
-- ========================
CREATE TABLE listings (
    listing_id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) NOT NULL,          -- Host (FK to users)
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    location VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_listings_user FOREIGN KEY (user_id)
        REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_listings_user ON listings(user_id);
CREATE INDEX idx_listings_location ON listings(location);


-- ========================
-- BOOKINGS TABLE
-- ========================
CREATE TABLE bookings (
    booking_id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) NOT NULL,          -- Guest (FK to users)
    listing_id CHAR(36) NOT NULL,       -- FK to listings
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_bookings_user FOREIGN KEY (user_id)
        REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_bookings_listing FOREIGN KEY (listing_id)
        REFERENCES listings(listing_id) ON DELETE CASCADE,
    CONSTRAINT chk_booking_dates CHECK (start_date < end_date)
);

CREATE INDEX idx_bookings_user ON bookings(user_id);
CREATE INDEX idx_bookings_listing ON bookings(listing_id);
CREATE INDEX idx_bookings_dates ON bookings(start_date, end_date);


-- ========================
-- REVIEWS TABLE
-- ========================
CREATE TABLE reviews (
    review_id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) NOT NULL,          -- Guest (FK to users)
    listing_id CHAR(36) NOT NULL,       -- FK to listings
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_reviews_user FOREIGN KEY (user_id)
        REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_reviews_listing FOREIGN KEY (listing_id)
        REFERENCES listings(listing_id) ON DELETE CASCADE
);

CREATE INDEX idx_reviews_listing ON reviews(listing_id);
CREATE INDEX idx_reviews_user ON reviews(user_id);
