CREATE TABLE departments (
  departments_id INTEGER NOT NULL,
  departments_name VARCHAR(30) NOT NULL,
  locations_id INTEGER NOT NULL,
  PRIMARY KEY (departments_id),
  FOREIGN KEY (locations_id) REFERENCES locations (locations_id)
);
INSERT INTO departments VALUES (10, 'Administration', 700);
INSERT INTO departments VALUES (20, 'Marketing', 1400);
SELECT * FROM departments;

