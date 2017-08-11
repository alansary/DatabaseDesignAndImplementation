CREATE TABLE jobs (
  jobs_id VARCHAR(10) NOT NULL,
  jobs_title VARCHAR(35) NOT NULL,
  min_salary NUMERIC(6),
  max_salary NUMERIC(6),
  PRIMARY KEY (jobs_id)
);
INSERT INTO jobs VALUES ('AD_PRES', 'President', 20000, 40000);
INSERT INTO jobs VALUES
  ('AD_VP', 'Administration Vice President', 30000, 50000);
SELECT * FROM jobs;

