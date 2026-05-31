-- Schema creation for E-commerce Orders
-- This schema defines the structure for the SQLite database.
-- The raw Excel data will be loaded into this table after initial pandas cleaning.

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id TEXT PRIMARY KEY,
    order_date DATE,
    customer_id TEXT,
    product TEXT,
    quantity INTEGER,
    unit_price REAL,
    shipping_address TEXT,
    payment_method TEXT,
    order_status TEXT,
    tracking_number TEXT,
    items_in_cart INTEGER,
    coupon_code TEXT,
    referral_source TEXT,
    total_price REAL
);
