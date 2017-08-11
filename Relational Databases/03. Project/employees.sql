CREATE TABLE employees (
  employees_id INTEGER NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(25) NOT NULL,
  email VARCHAR(25) NOT NULL,
  phone_number VARCHAR(20),
  hire_date DATE,
  jobs_id VARCHAR(10) NOT NULL,
  salary NUMERIC(8, 2),
  commission_pct NUMERIC(2, 2),
  manager_id INTEGER,
  departments_id INTEGER,
  PRIMARY KEY (employees_id),
  FOREIGN KEY (jobs_id) REFERENCES jobs (jobs_id),
  FOREIGN KEY (departments_id) REFERENCES departments (departments_id),
  FOREIGN KEY (manager_id) REFERENCES employees (employees_id),
  UNIQUE (email),
  CHECK (salary > 0)
);
INSERT INTO employees VALUES (
  100,
  'James',
  'Smith',
  'jsmith@example.com',
  '419-510-0000',
  '91-03-27',
  'AD_PRES',
  35000,
  .25,
  NULL,
  10
);
INSERT INTO employees VALUES (
  200,
  'Mike',
  'Robin',
  'mrobin@example.com',
  '910-444-4444',
  '81-03-27',
  'AD_PRES',
  10000,
  .10,
  100,
  20
);
SELECT * FROM employees;

