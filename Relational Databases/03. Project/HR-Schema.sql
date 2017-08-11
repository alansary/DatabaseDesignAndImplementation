CREATE DATABASE HR;
USE HR;
DROP TABLE IF EXISTS regions;
CREATE TABLE regions (
    regions_id INTEGER NOT NULL,
    regions_name VARCHAR(25) NOT NULL,
    PRIMARY KEY (regions_id)
);
DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
    countries_id CHAR(2) NOT NULL,
    countries_name VARCHAR(50) NOT NULL,
    regions_id INTEGER NOT NULL,
    PRIMARY KEY (countries_id),
    FOREIGN KEY (regions_id) REFERENCES regions (regions_id)
);
DROP TABLE IF EXISTS locations;
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
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
    departments_id INTEGER NOT NULL,
    departments_name VARCHAR(30) NOT NULL,
    locations_id INTEGER NOT NULL,
    PRIMARY KEY (departments_id),
    FOREIGN KEY (locations_id) REFERENCES locations (locations_id)
);
DROP TABLE IF EXISTS jobs;
CREATE TABLE jobs (
    jobs_id VARCHAR(10) NOT NULL,
    jobs_title VARCHAR(35) NOT NULL,
    min_salary NUMERIC(6) DEFAULT NULL,
    max_salary NUMERIC(6) DEFAULT NULL,
    PRIMARY KEY (jobs_id)
);
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
   employees_id INTEGER NOT NULL,
   first_name VARCHAR(20) NOT NULL, 
   last_name VARCHAR(25) NOT NULL,
   email VARCHAR(25) NOT NULL,
   phone_number VARCHAR(20) DEFAULT NULL,
   hire_date DATE DEFAULT NULL,
   salary NUMERIC(8, 2) DEFAULT NULL,
   commission_pct NUMERIC(2, 2) DEFAULT NULL,
   jobs_id VARCHAR(10) NOT NULL,
   manager_id INTEGER DEFAULT NULL,
   departments_id INTEGER DEFAULT NULL,
   PRIMARY KEY (employees_id),
   FOREIGN KEY (jobs_id) REFERENCES jobs (jobs_id),
   FOREIGN KEY (manager_id) REFERENCES employees (employees_id),
   FOREIGN KEY (departments_id) REFERENCES departments (departments_id),
   UNIQUE (email),
   CHECK (salary > 0)
);
DROP TABLE IF EXISTS job_history;
CREATE TABLE job_history (
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    departments_id INTEGER NOT NULL,
    employees_id INTEGER NOT NULL,
    jobs_id VARCHAR(10) NOT NULL,
    PRIMARY KEY (start_date, employees_id),
    FOREIGN KEY (departments_id) REFERENCES departments (departments_id),
    FOREIGN KEY (employees_id) REFERENCES employees (employees_id),
    FOREIGN KEY (jobs_id) REFERENCES jobs (jobs_id),
    CHECK (end_date > start_date)
);
DROP TABLE IF EXISTS job_grades;
CREATE TABLE job_grades (
    grade CHAR(1) NOT NULL,
    lowest_sal NUMERIC(10) DEFAULT NULL,
    highest_sal NUMERIC(10) DEFAULT NULL,
    PRIMARY KEY (grade)
);
DROP TABLE IF EXISTS archive1;
CREATE TABLE archive1 (
   employees_id INTEGER NOT NULL,
   first_name VARCHAR(20) NOT NULL,
   last_name VARCHAR(25) NOT NULL,
   email VARCHAR(25) NOT NULL,
   phone_number VARCHAR(20) DEFAULT NULL,
   hire_date DATE DEFAULT NULL,
   salary NUMERIC(8, 2) DEFAULT NULL,
   commission_pct NUMERIC(2, 2) DEFAULT NULL,
   jobs_id VARCHAR(10) NOT NULL,
   manager_id INTEGER DEFAULT NULL,
   departments_id INTEGER DEFAULT NULL,
   PRIMARY KEY (employees_id),
   FOREIGN KEY (jobs_id) REFERENCES jobs (jobs_id),
   FOREIGN KEY (manager_id) REFERENCES employees (employees_id),
   FOREIGN KEY (departments_id) REFERENCES departments (departments_id),
   UNIQUE (email),
   CHECK (salary > 0)
);
DROP TABLE IF EXISTS archive2;
CREATE TABLE archive2 (
   employees_id INTEGER NOT NULL,
   first_name VARCHAR(20) NOT NULL,
   last_name VARCHAR(25) NOT NULL,
   email VARCHAR(25) NOT NULL,
   phone_number VARCHAR(20) DEFAULT NULL,
   hire_date DATE DEFAULT NULL,
   salary NUMERIC(8, 2) DEFAULT NULL,
   commission_pct NUMERIC(2, 2) DEFAULT NULL,
   jobs_id VARCHAR(10) NOT NULL,
   manager_id INTEGER DEFAULT NULL,
   departments_id INTEGER DEFAULT NULL,
   PRIMARY KEY (employees_id),
   FOREIGN KEY (jobs_id) REFERENCES jobs (jobs_id),
   FOREIGN KEY (manager_id) REFERENCES employees (employees_id),
   FOREIGN KEY (departments_id) REFERENCES departments (departments_id),
   UNIQUE (email),
   CHECK (salary > 0)
);
DROP TABLE IF EXISTS archive3;
CREATE TABLE archive3 (
   employees_id INTEGER NOT NULL,
   first_name VARCHAR(20) NOT NULL,
   last_name VARCHAR(25) NOT NULL,
   email VARCHAR(25) NOT NULL,
   phone_number VARCHAR(20) DEFAULT NULL,
   hire_date DATE DEFAULT NULL,
   salary NUMERIC(8, 2) DEFAULT NULL,
   commission_pct NUMERIC(2, 2) DEFAULT NULL,
   jobs_id VARCHAR(10) NOT NULL,
   manager_id INTEGER DEFAULT NULL,
   departments_id INTEGER DEFAULT NULL,
   PRIMARY KEY (employees_id),
   FOREIGN KEY (jobs_id) REFERENCES jobs (jobs_id),
   FOREIGN KEY (manager_id) REFERENCES employees (employees_id),
   FOREIGN KEY (departments_id) REFERENCES departments (departments_id),
   UNIQUE (email),
   CHECK (salary > 0)
);

INSERT INTO regions (regions_id, regions_name) VALUES (1, 'Asia');
INSERT INTO regions (regions_id, regions_name) VALUES (2, 'Europ');
INSERT INTO regions (regions_id, regions_name) VALUES (3, 'Americas');
INSERT INTO regions VALUES (4, 'Africa');
SELECT * FROM regions;
INSERT INTO countries (countries_id, countries_name, regions_id)
  VALUES ('CA', 'Canada', 3);
INSERT INTO countries (countries_id, countries_name, regions_id)
  VALUES ('US', 'United States', 3);
INSERT INTO countries (countries_id, countries_name, regions_id)
  VALUES ('UK', 'United Kingdom', 2);
INSERT INTO countries VALUES ('EG', 'Egypt', 4);
SELECT * FROM countries;
INSERT INTO locations VALUES
  (1400, '540 Jerry st.', '54004', 'Houston', 'Texas', 'US');
INSERT INTO locations VALUES
  (700, '45 st.', '22621', 'Sidi-bishr', 'Alexandria', 'EG');
SELECT * FROM locations;
INSERT INTO departments VALUES (10, 'Administration', 700);
INSERT INTO departments VALUES (20, 'Marketing', 1400);
INSERT INTO departments (departments_id, departments_name, locations_id) VALUES (1, 'Software Engineering', 700);
INSERT INTO departments (departments_id, departments_name, locations_id) VALUES (2, 'Computer Science', 700);
INSERT INTO departments (departments_id, departments_name, locations_id) VALUES (3, 'Algorithm Designing', 700);
INSERT INTO departments (departments_id, departments_name, locations_id) VALUES (4, 'Database Design', 700);
SELECT * FROM departments;
INSERT INTO jobs VALUES ('AD_PRES', 'President', 20000, 40000);
INSERT INTO jobs VALUES
  ('AD_VP', 'Administration Vice President', 30000, 50000);
INSERT INTO jobs (jobs_id, jobs_title, min_salary, max_salary) VALUES ('SOFT_ENG', 'Software Engineer', 8000, 25000);
INSERT INTO jobs (jobs_id, jobs_title, min_salary, max_salary) VALUES ('COMP_SCI', 'Computer Scientist', 10000, 30000);
INSERT INTO jobs (jobs_id, jobs_title, min_salary, max_salary) VALUES ('ALGO_DES', 'Algorithm Designer', 12000, 35000);
INSERT INTO jobs (jobs_id, jobs_title, min_salary, max_salary) VALUES ('DB_ARCH', 'Database Architect', 7000, 20000);
INSERT INTO jobs (jobs_id, jobs_title, min_salary, max_salary) VALUES ('FI_MGR', 'Finance Manager', 4000, 10000);
SELECT * FROM jobs;
INSERT INTO employees VALUES (
  100,
  'James',
  'Smith',
  'jsmith@example.com',
  '419-510-0000',
  '91-03-27',
  35000,
  .25,
  'AD_PRES',
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
  10000,
  .10,
  'AD_PRES',
  100,
  20
);
INSERT INTO employees 
    (employees_id, first_name, last_name, email, phone_number, hire_date, salary, commission_pct, jobs_id, manager_id, departments_id)
    VALUES (1, 'Mohamed', 'Alansary', 'cod3r30@gmail.com', '+201207395400', '01-01-14', 30000, .4, 'COMP_SCI', NULL, 2);
INSERT INTO employees
    (employees_id, first_name, last_name, email, phone_number, hire_date, salary, commission_pct, jobs_id, manager_id, departments_id)
    VALUE (2, 'Mohamed', 'Salah', 'm_salah@yahoo.com', '+20121111111', '25-09-15', 23000, .2, 'SOFT_ENG', 1, 1);
INSERT INTO employees
    (employees_id, first_name, last_name, email, phone_number, hire_date, salary, commission_pct, jobs_id, manager_id, departments_id)
    VALUES (3, 'Adel', 'Afify', 'adel_afify@rocketmail.com', '+2010111111', '22-11-16', 12000, .1, 'ALGO_DES', 2, 3);
INSERT INTO employees
    (employees_id, first_name, last_name, email, phone_number, hire_date, salary, commission_pct, jobs_id, manager_id, departments_id)
    VALUES (4, 'Nour', 'Eldien', 'nour_eldien@yahoo.com', '+20110000000', '10-12-14', 11000, .25, 'DB_ARCH', 1, 4);
INSERT INTO employees
    (employees_id, first_name, last_name, email, phone_number, hire_date, salary, commission_pct, jobs_id, manager_id, departments_id)
    VALUES (5, 'Mahmoud', 'Taha', 'mtr', '+20102222222', '12-12-14', 13000, NULL, 'ALGO_DES', 1, 3);
INSERT INTO employees VALUES (6, 'Ibrahim', 'Mohsen', 'hema', '+20112222222', '12-12-15', 30000, NULL, 'AD_PRES', 1, 10);
SELECT * FROM employees;
INSERT INTO job_history VALUES ('70-01-20', '91-02-15', 10, 100, 'AD_VP');
INSERT INTO job_history (start_date, end_date, departments_id, employees_id, jobs_id) VALUE     ('2014-01-20', '2015-06-20', 1, 1, 'SOFT_ENG');
INSERT INTO job_history (start_date, end_date, departments_id, employees_id, jobs_id) VALUE     ('2015-06-21', '2016-01-20', 3, 1, 'ALGO_DES');
SELECT * FROM job_history;
INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);
SELECT * FROM job_grades;
INSERT INTO archive1 VALUES (
  100,
  'James',
  'Smith',
  'jsmith@example.com',
  '419-510-0000',
  '91-03-27',
  35000,
  .25,
  'AD_PRES',
  NULL,
  10
);
INSERT INTO archive1 VALUES (
  200,
  'Mike',
  'Robin',
  'mrobin@example.com',
  '910-444-4444',
  '81-03-27',
  10000,
  .10,
  'AD_PRES',
  100,
  20
);
INSERT INTO archive1
    (employees_id, first_name, last_name, email, phone_number, hire_date, salary, commission_pct, jobs_id, manager_id, departments_id)
    VALUES (1, 'Mohamed', 'Alansary', 'cod3r30@gmail.com', '+201207395400', '01-01-14', 30000, .4, 'COMP_SCI', NULL, 2);
SELECT * FROM archive1;
INSERT INTO archive2
    (employees_id, first_name, last_name, email, phone_number, hire_date, salary, commission_pct, jobs_id, manager_id, departments_id)
    VALUES (1, 'Mohamed', 'Alansary', 'cod3r30@gmail.com', '+201207395400', '01-01-14', 30000, .4, 'COMP_SCI', NULL, 2);
INSERT INTO archive2
    (employees_id, first_name, last_name, email, phone_number, hire_date, salary, commission_pct, jobs_id, manager_id, departments_id)
    VALUE (2, 'Mohamed', 'Salah', 'm_salah@yahoo.com', '+20121111111', '25-09-15', 23000, .2, 'SOFT_ENG', 1, 1);
INSERT INTO archive2
    (employees_id, first_name, last_name, email, phone_number, hire_date, salary, commission_pct, jobs_id, manager_id, departments_id)
    VALUES (3, 'Adel', 'Afify', 'adel_afify@rocketmail.com', '+2010111111', '22-11-16', 12000, .1, 'ALGO_DES', 2, 3);
SELECT * FROM archive2;
INSERT INTO archive3
    (employees_id, first_name, last_name, email, phone_number, hire_date, salary, commission_pct, jobs_id, manager_id, departments_id)
    VALUES (4, 'Nour', 'Eldien', 'nour_eldien@yahoo.com', '+20110000000', '10-12-14', 11000, .25, 'DB_ARCH', 1, 4);
INSERT INTO archive3
    (employees_id, first_name, last_name, email, phone_number, hire_date, salary, commission_pct, jobs_id, manager_id, departments_id)
    VALUES (5, 'Mahmoud', 'Taha', 'mtr', '+20102222222', '12-12-14', 13000, NULL, 'ALGO_DES', 1, 3);
INSERT INTO archive3 VALUES (6, 'Ibrahim', 'Mohsen', 'hema', '+20112222222', '12-12-15', 30000, NULL, 'AD_PRES', 1, 10);
SELECT * FROM archive3;

CREATE VIEW vw_emp_mng AS
SELECT CONCAT(emps.first_name, ' ', emps.last_name) AS 'Employee Name', CONCAT(mng.first_name, ' ', mng.last_name) FROM
    employees AS emps INNER JOIN employees AS mng ON emps.manager_id = mng.employees_id;
SELECT * FROM vw_emp_mng;
CREATE VIEW vw_info AS
SELECT CONCAT(emps.first_name, ' ', emps.last_name) AS 'Employee Name', CONCAT(mng.first_name, ' ', mng.last_name) AS 'Manager Name',
    departments_name AS 'Department Name', jobs_title AS 'Job Title' FROM
    employees AS emps INNER JOIN employees AS mng INNER JOIN departments INNER JOIN jobs
    ON emps.manager_id = mng.employees_id AND emps.departments_id = departments.departments_id AND emps.jobs_id = jobs.jobs_id;
SELECT * FROM vw_info;
CREATE VIEW vw_full_info AS
SELECT CONCAT(emps.first_name, ' ', emps.last_name) AS 'Employee Name',
    CONCAT(mng.first_name, ' ', mng.last_name) AS 'Manager Name',
    dps.departments_name AS 'Department Name',
    jbs.jobs_title AS 'Job Title',
    locs.city AS 'City',
    cnts.countries_name AS 'Country Name',
    rgs.regions_name AS 'Regions Name'
    FROM
    employees AS emps INNER JOIN employees AS mng INNER JOIN departments AS dps INNER JOIN jobs AS jbs INNER JOIN locations AS locs
    INNER JOIN countries AS cnts INNER JOIN regions AS rgs
    ON
    emps.manager_id = mng.employees_id
    AND emps.departments_id = dps.departments_id
    AND emps.jobs_id = jbs.jobs_id
    AND dps.locations_id = locs.locations_id
    AND locs.countries_id = cnts.countries_id
    AND cnts.regions_id = rgs.regions_id;

SELECT CONCAT(emps.first_name, ' ', emps.last_name) AS 'Full Name',
    deps.departments_name AS 'Department',
    locs.city AS 'City',
    conts.countries_name AS 'Country',
    regs.regions_name AS 'Regions'
    FROM employees AS emps INNER JOIN departments AS deps INNER JOIN locations AS locs INNER JOIN countries AS conts INNER JOIN regions AS regs
    ON
    emps.departments_id = deps.departments_id
    AND deps.locations_id = locs.locations_id
    AND locs.countries_id = conts.countries_id
    AND conts.regions_id = regs.regions_id;
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Full Name',
    departments.departments_name AS 'Department',
    locations.city AS 'City',
    countries.countries_name AS 'Country',
    regions.regions_name AS 'Regions'
    FROM employees INNER JOIN departments INNER JOIN locations INNER JOIN countries INNER JOIN regions
    ON
    employees.departments_id = departments.departments_id
    AND departments.locations_id = locations.locations_id
    AND locations.countries_id = countries.countries_id
    AND countries.regions_id = regions.regions_id;
SELECT CONCAT(emps.first_name, ' ', emps.last_name) AS 'Employee Name', CONCAT(mng.first_name, ' ', mng.last_name) AS 'Manager Name',
    deps.departments_name AS 'Department', jbs.jobs_title AS 'Job Title' FROM
    employees AS emps INNER JOIN employees AS mng INNER JOIN departments AS deps INNER JOIN jobs AS jbs ON
    emps.manager_id = mng.employees_id AND emps.departments_id = deps.departments_id AND emps.jobs_id = jbs.jobs_id WHERE
    CONCAT(mng.first_name, ' ', mng.last_name) = 'Mohamed Alansary';

SELECT * FROM employees WHERE salary < (SELECT salary FROM employees WHERE last_name = 'Alansary');
UPDATE employees SET email = CONCAT(email, '@yahoo.com') WHERE employees_id IN(5, 6);
SELECT EXTRACT(YEAR FROM hire_date) AS 'Hire Year' FROM employees;
SELECT CONCAT(first_name, ' ', last_name) AS 'Full Name', EXTRACT(YEAR FROM '2016-12-23') - EXTRACT(YEAR FROM hire_date) AS 'Number of years'
    FROM employees;
SELECT COUNT(*) AS 'Number of employees', departments_name
    FROM employees INNER JOIN departments ON employees.departments_id = departments.departments_id
    WHERE employees.departments_id != 10 AND employees.departments_id != 20
    GROUP BY departments_name
    HAVING COUNT(*) > 1;
SELECT COUNT(*) AS 'Number of employees', departments_name
    FROM employees INNER JOIN departments ON employees.departments_id = departments.departments_id
    WHERE departments.departments_id != 10 AND departments.departments_id != 20
    GROUP BY departments_name
    HAVING COUNT(*) > 1;
SELECT MAX(salary) AS 'Maximum Salary', departments_name
      FROM employees INNER JOIN departments
      ON employees.departments_id = departments.departments_id
      WHERE employees.departments_id != 10
      GROUP BY departments_name
      HAVING MAX(salary) > 11000;
SELECT first_name AS 'First Name', last_name AS 'Last Name', salary AS 'Salary',
    CASE
	WHEN salary <= 10000 THEN 'Low Income'
	WHEN salary > 10000 AND salary < 20000 THEN 'Medium Income'
	WHEN salary >= 20000 AND salary <= 30000 THEN 'High Income'
	ELSE 'Very High Income'
    END AS 'Income'
    FROM employees ORDER BY salary DESC;
SELECT * FROM archive1
UNION ALL
SELECT * FROM archive2
UNION ALL
SELECT * FROM archive3;
SELECT * FROM archive1
UNION
SELECT * FROM archive2
UNION
SELECT * FROM archive3;
CREATE TABLE archives AS
SELECT * FROM archive1
UNION
SELECT * FROM archive2
UNION
SELECT * FROM archive3;
UPDATE employees SET email = CONCAT(email, '@yahoo.com') WHERE employees_id IN(5, 6);
SELECT * FROM employees WHERE hire_date = (SELECT hire_date FROM employees WHERE first_name = 'Mohamed' AND last_name = 'Alansary');
SELECT * FROM employees WHERE salary < (SELECT MIN(salary) FROM employees WHERE jobs_id IN('ALGO_DES'));
SELECT * FROM employees WHERE employees_id IN(SELECT employees_id FROM job_history GROUP BY employees_id);
SELECT * FROM employees WHERE EXISTS(SELECT * FROM job_history WHERE employees_id = employees.employees_id);
SELECT * FROM employees WHERE NOT EXISTS(SELECT * FROM job_history WHERE job_history.employees_id = employees.employees_id);
SELECT * FROM employees WHERE employees_id IN(SELECT employees_id FROM job_history);
SELECT * FROM employees WHERE employees_id IN(SELECT DISTINCT employees_id FROM job_history);
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Full Name',
    jobs.jobs_title AS 'Job Title',
    departments.departments_name AS 'Department',
    locations.city AS 'City',
    countries.countries_name AS 'Country',
    regions.regions_name AS 'Region'
    FROM employees INNER JOIN jobs INNER JOIN departments INNER JOIN locations INNER JOIN countries INNER JOIN regions
    ON employees.departments_id = departments.departments_id AND
    employees.jobs_id = jobs.jobs_id AND
    departments.locations_id = locations.locations_id AND
    locations.countries_id = countries.countries_id AND
    countries.regions_id = regions.regions_id
    WHERE EXISTS(SELECT * FROM job_history WHERE employees_id = employees.employees_id)
    ORDER BY Department DESC;
ALTER TABLE archives
    ADD is_active CHAR(1);
ALTER TABLE archives
    MODIFY first_name VARCHAR(25);
ALTER TABLE archives RENAME TO employees_archive;
ALTER TABLE employees_archive DROP COLUMN is_active;
CREATE INDEX idx_fname_employees ON employees(first_name);

