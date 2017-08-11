CREATE TABLE countries (
  countries_id CHAR(2) NOT NULL,
  countries_name VARCHAR(50),
  regions_id INTEGER NOT NULL,
  PRIMARY KEY (countries_id),
  FOREIGN KEY (regions_id) REFERENCES regions (regions_id)
);
INSERT INTO countries (countries_id, countries_name, regions_id)
  VALUES ('CA', 'Canada', 3);
INSERT INTO countries (countries_id, countries_name, regions_id)
  VALUES ('US', 'United States', 3);
INSERT INTO countries (countries_id, countries_name, regions_id)
  VALUES ('UK', 'United Kingdom', 2);
INSERT INTO countries VALUES ('EG', 'Egypt', 4);
SELECT * FROM countries;

