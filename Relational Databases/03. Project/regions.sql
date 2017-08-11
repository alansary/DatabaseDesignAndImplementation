CREATE DATABASE HRSchema;
CREATE TABLE regions (
  regions_id INTEGER NOT NULL,
  regions_name VARCHAR(25) NOT NULL,
  PRIMARY KEY (regions_id)
);
INSERT INTO regions (regions_id, regions_name) VALUES (1, 'Asia');
INSERT INTO regions (regions_id, regions_name) VALUES (2, 'Europ');
INSERT INTO regions (regions_id, regions_name) VALUES (3, 'Americas');
INSERT INTO regions VALUES (4, 'Africa');
SELECT * FROM regions;

