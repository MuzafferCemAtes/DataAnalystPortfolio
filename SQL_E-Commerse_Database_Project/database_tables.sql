CREATE TABLE "Customer" (
  customer_id SERIAL PRIMARY KEY,
  c_first_name VARCHAR(100),
  c_last_name VARCHAR(100),
  c_city VARCHAR(100),
  c_street VARCHAR(100),
  c_zipcode VARCHAR(100),
  c_phone_number VARCHAR(15) NOT NULL,
  c_email VARCHAR(100),

  CONSTRAINT customer_phone_number_length 
  	CHECK (char_length(c_phone_number) BETWEEN 5 AND 15),
  
  CONSTRAINT valid_customer_first_name 
  	CHECK (char_length(c_first_name) >= 2)
);

CREATE TABLE "Geolocation" (
  g_id SERIAL PRIMARY KEY,
  g_timezone VARCHAR(50) NOT NULL,
  g_region VARCHAR(100) NOT NULL,
  g_city VARCHAR(100) NOT NULL,
  g_zip_code VARCHAR(20) NOT NULL,
  g_country VARCHAR(100) NOT NULL,
  g_lat NUMERIC(8,6),  
  g_lng NUMERIC(9,6),

  CONSTRAINT timezone_format
  	CHECK (g_timezone ~ '^[A-Za-z]+/[A-Za-z_]+$')
);

CREATE TABLE "Seller" (
  seller_id SERIAL PRIMARY KEY,
  s_name VARCHAR(100),
  s_city VARCHAR(100),
  s_zip_code VARCHAR(20),
  s_email VARCHAR(100),
  s_phone VARCHAR(15) NOT NULL,
  seller_type VARCHAR(20) NOT NULL CHECK (seller_type IN ('Physical', 'Online')),
  g_id INTEGER,  -- Nullable; only used if seller_type is "Physical"

  CONSTRAINT valid_phone_number_length 
  	CHECK (char_length(s_phone) BETWEEN 5 AND 15),

  CONSTRAINT fKeyGeolocation 
  	FOREIGN KEY (g_id) REFERENCES "Geolocation" (g_id) ON DELETE SET NULL
);

CREATE TABLE "Geolocation_Seller" (
  store_id SERIAL PRIMARY KEY,
  g_id integer NOT NULL,
  seller_id integer NOT NULL,
  
  CONSTRAINT fKeyGeolocationMM
  	FOREIGN KEY (g_id) REFERENCES "Geolocation" (g_id),

  CONSTRAINT fKeySellerMM
  	FOREIGN KEY (seller_id) REFERENCES "Seller" (seller_id)
);

CREATE TABLE "Order" (
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  store_id integer,
  order_date timestamp,
  order_approved_date timestamp,
  order_courier_date timestamp,
  order_customer_expected timestamp,
  order_customer_delivered timestamp,
  order_status varchar(20),
  order_total NUMERIC(10, 2),
  quantity integer,
  shipping_cost NUMERIC(10, 2),

  CONSTRAINT fKeyCustomer
  FOREIGN KEY (customer_id) REFERENCES "Customer" (customer_id),

  CONSTRAINT fKeyStoreOrder 
  	FOREIGN KEY (store_id) REFERENCES "Geolocation_Seller" (store_id),

  CONSTRAINT valid_order_dates 
    CHECK (order_approved_date >= order_date 
           AND order_courier_date >= order_approved_date 
           AND order_customer_delivered >= order_courier_date)
);

CREATE TABLE "Ratings" (
	rating_id SERIAL PRIMARY KEY,
	seller_id integer NOT NULL,
	store_id integer,
	rating integer NOT NULL,
	rating_date timestamp,

	CONSTRAINT rating_check
	  CHECK (rating >= 0 AND rating <= 5),

	CONSTRAINT fKeySeller
	  FOREIGN KEY (seller_id) REFERENCES "Seller" (seller_id),

	CONSTRAINT fKeyStoreRating 
	  FOREIGN KEY (store_id) REFERENCES "Geolocation_Seller" (store_id)
);

CREATE TABLE "Product" (
  product_id SERIAL PRIMARY KEY,
  seller_id INTEGER NOT NULL,
  store_id integer,
  p_category VARCHAR(255) NOT NULL,
  p_name VARCHAR(255) NOT NULL,
  price NUMERIC(10, 2) NOT NULL,
  stock_quantity integer NOT NULL,
  description VARCHAR(255),

  CONSTRAINT fKeySeller
  	FOREIGN KEY (seller_id) REFERENCES "Seller" (seller_id),

  CONSTRAINT fKeyStoreProduct 
  	FOREIGN KEY (store_id) REFERENCES "Geolocation_Seller" (store_id),

  CONSTRAINT valid_price_stock
  	CHECK (price > 0
	  		AND stock_quantity >= 0)
);

CREATE TABLE "Order_Product" (
  order_id integer NOT NULL,
  product_id integer NOT NULL,
  PRIMARY KEY (order_id, product_id),

  CONSTRAINT fKeyOrderMM
  	FOREIGN KEY (order_id) REFERENCES "Order" (order_id),

  CONSTRAINT fKeyProductMM
    FOREIGN KEY (product_id) REFERENCES "Product" (product_id)
);

CREATE TABLE "Payment" (
  payment_id SERIAL PRIMARY KEY,
  order_id integer NOT NULL,
  p_type VARCHAR(20) NOT NULL,
  p_installments_number integer,
  amount NUMERIC(10, 2) NOT NULL,
  
  CONSTRAINT fKeyOrderPayment 
  	FOREIGN KEY (order_id) REFERENCES "Order" (order_id),

  CONSTRAINT valid_amount
  	CHECK (amount >= 0),

  CONSTRAINT valid_amount_installments 
    CHECK (amount >= 0 AND (p_installments_number >= 1 OR p_installments_number IS NULL))
);

CREATE TABLE "Order_Review" (
  review_id SERIAL PRIMARY KEY,
  order_id integer NOT NULL,
  customer_id integer NOT NULL,
  r_score integer NOT NULL,
  r_comment_title VARCHAR(20) NOT NULL,
  r_type VARCHAR(50) NOT NULL, --Product Quality, Shipping Experience, etc.
  r_comment_message VARCHAR(140) NOT NULL,
  r_comment_date timestamp,
  r_answer_date timestamp,
  r_answer_message VARCHAR(140),

  CONSTRAINT fKeyOrderReviewOrder
  	FOREIGN KEY (order_id) REFERENCES "Order" (order_id),

  CONSTRAINT fKeyOrderReviewCustomer
  	FOREIGN KEY (customer_id) REFERENCES "Customer" (customer_id),

  CONSTRAINT valid_score
  	CHECK (r_score >= 0 AND r_score <= 5),

  CONSTRAINT unique_customer_order_review --each customer_id and order_id combination will only allow one review
    UNIQUE (customer_id, order_id)
);



