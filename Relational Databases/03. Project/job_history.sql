CREATE TABLE job_history (
  employees_id INTEGER NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  jobs_id VARCHAR(10) NOT NULL,
  departments_id INTEGER NOT NULL,
  PRIMARY KEY (employees_id, start_date),
  FOREIGN KEY (jobs_id) REFERENCES jobs (jobs_id),
  FOREIGN KEY (departments_id) REFERENCES departments (departments_id),
  FOREIGN KEY (employees_id) REFERENCES employees (employees_id),
  CHECK (end_date > start_date)
);
INSERT INTO job_history VALUES (100, '70-01-20', '91-02-15', 'AD_VP', 10);
SELECT * FROM job_history;

