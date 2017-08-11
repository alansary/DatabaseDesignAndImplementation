CREATE TABLE locations (
  locations_id INTEGER NOT NULL,
  street_address VARCHAR(255) NOT NULL,
  postal_code VARCHAR(6) NOT NULL,
  city VARCHAR(50) NOT NULL,
  province VARCHAR(50) NOT NULL,
  countries_id CHAR(2) NOT NULL,
  PRIMARY KEY (locations_id),
  FOREIGN KEY (countries_id) REFERENCES countries (countries_id)
);
INSERT INTO locations VALUES 
  (1400, '540 Jerry st.', '54004', 'Houston', 'Texas', 'US');
INSERT INTO locations VALUES
  (700, '45 st.', '22621', 'Sidi-bishr', 'Alexandria', 'EG');
SELECT * FROM locations;

