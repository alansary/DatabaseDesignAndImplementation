-- For all instructors who have taught some course, find their names and the course ID of the courses they taught.
SELECT name, course_id FROM instructor, teaches WHERE instructor.ID = teaches.ID; --CROSS PRODUCT
SELECT name, course_id FROM instructor NATURAL JOIN teaches; --NATURAL JOIN
SELECT name, course_id FROM instructor INNER JOIN teaches ON instructor.ID = teaches.ID; --INNER JOIN
-- Find the course_id, semester, year and title of each course offered by the Comp. Sci. department.
SELECT DISTINCT course.course_id, title, semester, year FROM course, section WHERE course.course_id = section.course_id AND dept_name = 'Comp.Sci.';
SELECT DISTINCT course.course_id, semester, year, title FROM section NATURAL JOIN course WHERE dept_name = 'Comp.Sci.';
SELECT DISTINCT section.course_id, semester, year, title FROM section INNER JOIN course ON section.course_id = course.course_id
    WHERE dept_name = 'Comp.Sci.';
-- For all instructors who have taught some course, find all data of those instructors and the courses they taught.
SELECT DISTINCT * FROM instructor NATURAL JOIN teaches;
SELECT DISTINCT * FROM instructor, teaches WHERE instructor.ID = teaches.ID;
SELECT DISTINCT * FROM instructor INNER JOIN teaches ON instructor.ID = teaches.ID;
-- (IMP) List the names of instructors along with the the titles of courses that they teach.
SELECT DISTINCT name, title
    FROM instructor INNER JOIN teaches INNER JOIN section INNER JOIN course
    ON instructor.ID = teaches.ID AND teaches.course_id = section.course_id AND section.course_id = course.course_id;
SELECT DISTINCT name, title
    FROM instructor NATURAL JOIN teaches NATURAL JOIN section NATURAL JOIN course;
SELECT DISTINCT name, title
    FROM instructor NATURAL JOIN teaches NATURAL JOIN course;
SELECT DISTINCT name, title
    FROM instructor, teaches, section, course
    WHERE instructor.ID = teaches.ID AND teaches.course_id = section.course_id AND section.course_id = course.course_id;
SELECT DISTINCT name, title
    FROM instructor NATURAL JOIN teaches, course WHERE teaches.course_id = course.course_id;
SELECT DISTINCT name, title FROM (instructor NATURAL JOIN teaches) JOIN course USING (course_id);
SELECT DISTINCT name, title FROM instructor, teaches NATURAL JOIN course WHERE instructor.ID =  teaches.ID;
-- (IMP) Find the names of all instructors who have a higher salary than some instructor in ‘Comp. Sci’.
SELECT name FROM instructor WHERE salary > (SELECT MIN(salary) FROM instructor WHERE dept_name = 'Comp.Sci.' GROUP BY dept_name);
SELECT DISTINCT T.name FROM instructor AS T, instructor AS S WHERE
    S.salary < T.salary AND S.dept_name = 'Comp.Sci.';
SELECT name FROM instructor WHERE salary > SOME (SELECT salary FROM instructor WHERE dept_name = 'Comp.Sci.');
-- Find the names of all instructors whose name includes the substring “ar”.
SELECT name FROM instructor WHERE name LIKE '%ar%';
-- List in alphabetic order the names of all instructors.
SELECT name FROM instructor ORDER BY name ASC;
--  Find the names of all instructors with salary between $90,000 and $100,000 (that is, >=$90,000 and <=$100,000).
SELECT name FROM instructor WHERE salary >= 90000 AND salary <= 100000;
SELECT name FROM instructor WHERE salary BETWEEN 90000 AND 100000;
-- (IMP) Find course titles that ran in Fall 2009 or in Spring 2010.
SELECT DISTINCT title FROM course INNER JOIN section ON course.course_id = section.course_id
    AND ((semester = 'Fall' AND year = 2009) OR (semester = 'Spring' AND year = 2010));
SELECT DISTINCT title FROM course, section WHERE course.course_id = section.course_id
    AND ((semester = 'Fall' AND year = 2009) OR (semester = 'Spring' AND year = 2010));
SELECT DISTINCT title FROM course NATURAL JOIN section WHERE (semester = 'Fall' AND year = 2009) OR (semester = 'Spring' AND year = 2010);
SELECT title FROM course NATURAL JOIN section WHERE semester = 'Fall' AND year = 2009
UNION
SELECT title FROM course NATURAL JOIN section WHERE semester = 'Spring' AND year = 2010;
SELECT DISTINCT title FROM section INNER JOIN course USING (course_id) WHERE (semester = 'Fall' AND year = 2009) OR
    (semester = 'Spring' AND year = 2010);
SELECT DISTINCT title FROM section INNER JOIN course USING (course_id) WHERE semester = 'Fall' AND year = 2009
UNION
SELECT DISTINCT title FROM section INNER JOIN course USING (course_id) WHERE semester = 'Spring' AND year = 2010;
-- Find courses that ran in Fall 2009 or in Spring 2010
SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2009
UNION
SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010;
-- (IMP-Oracle) Find courses that ran in Fall 2009 and in Spring 2010 (Oracle)
SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2009
INTERSECT
SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010;
SELECT course_id FROM section AS T WHERE semester = 'Fall' AND year = 2009 AND EXISTS (SELECT course_id FROM section WHERE semester = 'Spring'
    AND year = 2010 AND course_id = T.course_id);
SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2009 AND course_id IN
    (SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010);
-- (IMP-Oracle) Find courses that ran in Fall 2009 but not in Spring 2010 (Oracle)
SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2009
EXCEPT
SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010;
SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2009
MINUS
SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010;
SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2009 AND course_id NOT IN
    (SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010);
SELECT course_id FROM section AS T WHERE semester = 'Fall' AND year = 2009 AND NOT EXISTS
    (SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010 AND course_id = T.course_id);
    -- Set operations union, intersect, and except.
    -- Each of the above operations automatically eliminates duplicates
    -- To retain all duplicates use the corresponding multiset versions union all, intersect all and except all.
    -- Suppose a tuple occurs m times in r and n times in s, then, it occurs:
	-- m  + n times in r union all s
	-- min(m,n) times in r intersect all s
	-- max(0, m – n) times in r except all s
-- Find all instructors whose salary is NULL.
SELECT name FROM instructor WHERE salary IS NULL;
-- Find the average salary of instructors in the Computer Science department.
SELECT AVG(salary) FROM instructor WHERE dept_name = 'Comp.Sci.';
-- Find the total number of instructors who teach a course in the Spring 2010 semester.
SELECT COUNT(DISTINCT instructor.ID) FROM instructor, teaches WHERE instructor.ID = teaches.ID AND semester = 'Spring' AND year = 2010;
SELECT COUNT(DISTINCT instructor.ID) FROM instructor NATURAL JOIN teaches WHERE semester = 'Spring' AND year = 2010;
SELECT COUNT(DISTINCT instructor.ID) FROM instructor INNER JOIN teaches ON instructor.ID = teaches.ID AND semester = 'Spring' AND year = 2010;
SELECT COUNT(DISTINCT ID) FROM teaches WHERE semester = 'Spring' AND year = 2010;
-- Find the average salary of instructors in each department.
SELECT dept_name, AVG(salary) FROM instructor GROUP BY dept_name;
SELECT dept_name, AVG(salary) FROM instructor WHERE salary IS NOT NULL GROUP BY dept_name;
SELECT dept_name, AVG(salary) FROM instructor GROUP BY dept_name HAVING AVG(salary) IS NOT NULL;
-- Find the names and average salaries of all departments whose average salary is greater than 42000.
SELECT dept_name, AVG(salary) FROM instructor WHERE salary IS NOT NULL GROUP BY dept_name HAVING AVG(salary) > 42000;
-- (IMP) Find courses offered in Fall 2009 and in Spring 2010.
SELECT DISTINCT course_id FROM section WHERE semester = 'Fall' AND year = 2009
    AND course_id IN (SELECT  course_id FROM section WHERE semester = 'Spring' AND year = 2010);
SELECT course_id FROM section AS sec WHERE (semester = 'Fall' AND year = 2009) AND
    EXISTS (SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010 AND course_id = sec.course_id);
SELECT DISTINCT S.course_id FROM section AS S, section AS T WHERE S.course_id = T.course_id AND S.semester = 'Fall' AND S.year = 2009 AND
    T.semester = 'Spring' AND T.year = 2010;
-- (IMP) Find courses offered in Fall 2009 but not in Spring 2010.
SELECT DISTINCT course_id FROM section WHERE semester = 'Fall' AND year = 2009
    AND course_id NOT IN (SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010);
SELECT course_id FROM section AS sec WHERE (semester = 'Fall' AND year = 2009) AND
    NOT EXISTS (SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010 AND course_id = sec.course_id);
SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2009
EXCEPT
SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010;
-- (IMP) Find names of instructors with salary greater than that of some (at least one) instructor in the Biology department.
SELECT name FROM instructor WHERE salary > (SELECT MIN(salary) FROM instructor WHERE dept_name = 'Biology');
SELECT T.name FROM instructor AS T, instructor AS S WHERE T.salary > S.salary AND S.dept_name = 'Biology';
SELECT name FROM instructor WHERE salary > SOME (SELECT salary FROM instructor WHERE dept_name = 'Biology');
-- (IMP) Find the names of all instructors whose salary is greater than the salary of all instructors in the History department.
SELECT name FROM instructor WHERE salary > ALL (SELECT salary FROM instructor WHERE dept_name = 'History');
SELECT name FROM instructor WHERE salary > (SELECT MAX(salary) FROM instructor WHERE dept_name = 'History');
-- (IMP) Find all courses taught in both the Fall 2009 semester and in the Spring 2010 semester.
SELECT DISTINCT course_id FROM section WHERE semester = 'Fall' AND year = 2009
    AND course_id IN (SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010);
SELECT course_id FROM section AS S WHERE semester = 'Fall' AND year = 2009
    AND EXISTS (SELECT course_id FROM section AS T WHERE semester = 'Spring' AND year = 2010 AND T.course_id = S.course_id);
SELECT course_id FROM section AS S WHERE semester = 'Fall' AND year = 2009 AND
    EXISTS (SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010 AND course_id = S.course_id);
SELECT DISTINCT T.course_id FROM section AS T, section AS S WHERE T.course_id = S.course_id AND T.semester = 'Fall' AND T.year = 2009 AND
    S.semester = 'Spring' AND S.year = 2010;
-- (VERY-IMP-Oracle) Find all students who have taken all courses offered in the Biology department.
SELECT DISTINCT S.ID, S.name FROM student AS S
    WHERE NOT EXISTS ((SELECT course_id FROM course WHERE dept_name = 'Biology') EXCEPT (SELECT T.course_id FROM takes AS T WHERE T.ID = S.ID));
SELECT DISTINCT S.ID, S.name FROM student AS S
    WHERE NOT EXISTS ((SELECT course_id FROM course WHERE dept_name = 'Biology') EXCEPT (SELECT course_id FROM takes WHERE ID = S.ID));
  -- The unique construct tests whether a subquery has any duplicate tuples in its result.
  -- (Evaluates to “true” on an empty set)
-- (VERY-IMP-Oracle) Find all courses that were offered at most once in 2009.
SELECT T.course_id FROM course AS T WHERE UNIQUE (SELECT R.course_id FROM section AS R WHERE T.course_id = R.course_id AND R.year = 2009);
-- Find the average instructors’ salaries of those departments where the average salary is greater than $42,000.
SELECT dept_name, AVG(salary) FROM instructor GROUP BY dept_name HAVING AVG(salary) > 42000;
-- (VERY-IMP-Oracle) Find the average instructors’ salaries of those departments where the average salary is greater than $42,000.
SELECT dept_name, avg_salary FROM (SELECT dept_name, AVG(salary) AS avg_salary FROM instructor GROUP BY dept_name)
    WHERE avg_salary > 42000;
SELECT dept_name, avg_salary FROM (SELECT dept_name, AVG(salary) FROM instructor GROUP BY dept_name) AS dept_avg (dept_name, avg_salary)
    WHERE avg_salary > 42000;
-- (Testing Purposes Only) Delete all instructors.
DELETE FROM instructor;
-- (Testing Purposes Only) Delete all instructors from the Finance department.
DELETE FROM instructor WHERE dept_name = 'Finance';
-- (Testing Purposes Only) Delete all tuples in the instructor relation for those instructors associated with a department located in the Watson
-- building.
DELETE FROM instructor WHERE dept_name IN (SELECT dept_name FROM department WHERE building = 'Watson');
-- (Testing Purposes Only) Delete all instructors whose salary is less than the average salary of instructors.
DELETE FROM instructor WHERE salary < (SELECT AVG(salary) FROM instructor);
-- Problem:  as we delete tuples from deposit, the average salary changes.
-- Solution used in SQL:
       -- 1.   First, compute avg salary and find all tuples to delete
       -- 2.   Next, delete all tuples found above (without recomputing avg or retesting the tuples)
SELECT AVG(salary) FROM instructor;
-- DELETE FROM instructor WHERE salary < <result obtained above>;
-- (IMP - Testing Purposes Only) Add all instructors to the student relation with tot_creds set to 0.
INSERT INTO student SELECT ID, name, dept_name, 0 FROM instructor;
-- The SELECT FROM WHERE statement is evaluated fully before any of its results are inserted into the relation.
-- (IMP) Increase salaries of instructors whose salary is over $100,000 by 3%, and all others receive a 5% raise.
UPDATE instructor SET salary = salary * 1.03 WHERE salary > 100000;
UPDATE instructor SET salary = salary * 1.05 WHERE salary <= 100000;
-- The order is important
-- Can be done better using the case statement
-- (VERY-IMP) Increase salaries of instructors whose salary is over $100,000 by 3%, and all others receive a 5% raise.
UPDATE instructor SET salary =
    CASE WHEN salary > 100000 THEN salary * 1.03
    ELSE salary * 1.05
    END;
-- (VERY-IMP)
SELECT * FROM student, instructor; --CROSS PRODUCT (does not require any matches)
SELECT * FROM student, instructor WHERE student.ID = instructor.ID; --CROSS PRODUCT (matches on ID)
SELECT * FROM student NATURAL JOIN instructor; --NATURAL JOIN (matches all common attributes)
SELECT * FROM student INNER JOIN instructor ON student.ID = instructor.ID; --INNER JOIN (CROSS PRODUCT that matches on ID)
SELECT * FROM course NATURAL LEFT OUTER JOIN prereq;
SELECT * FROM course NATURAL RIGHT OUTER JOIN prereq;
SELECT * FROM course INNER JOIN prereq ON course.course_id = prereq.course_id; --This is equivalent to the next query
SELECT * FROM course, prereq WHERE course.course_id = prereq.course_id;
SELECT * FROM course LEFT OUTER JOIN prereq ON course.course_id = prereq.course_id; --The matched column is returned with the result relation
SELECT * FROM course LEFT OUTER JOIN prereq USING (course_id); --The matched column is not returned with the result relation
SELECT * FROM course NATURAL RIGHT OUTER JOIN prereq;
-- (Oracle Only)
SELECT * FROM course NATURAL FULL OUTER JOIN prereq;
SELECT * FROM course FULL OUTER JOIN prereq USING (course_id);
-- Joined Relations (Summary)
   -- Join Condition (ON <predicate> / USING (A1, A2, ..., An) / NATURAL)
   -- Join Types (INNER JOIN / LEFT OUTER JOIN / RIGHT OUTER JOIN / FULL OUTER JOIN)
   -- NATURAL INNER JOIN doesn't exist because it is represented in NATURAL JOIN
   -- INNER JOIN ON <P> is the same as CROSS PRODUCT WHERE <P>
   -- NATURAL JOIN matches on all common attributes
   -- LEFT OUTER JOIN ON <P> is the same as INNER JOIN ON <P> added to it the results from r1 that doesn't match any r2
   -- RIGHT OUTER JOIN ON <P> is the same as INNER JOIN ON <P> added to it the results from r2 that doesn't match any r1
   -- FULL OUTER JOIN ON <P> combines RIGHT OUTER JOIN ON <P> and LEFT OUTER JOIN ON <P>
   -- USING doesn't return the matched column(s) with the result. However, ON returns the matched column(s) with the result
-- Views
   -- A view provides a mechanism to hide certain data from the view of certain users. 
   -- Any relation that is not of the conceptual model but is made visible to a user as a “virtual relation” is called a view.
   -- CREATE VIEW vw AS < query expression >
   -- A view definition causes the saving of an expression; the expression is substituted into queries using the view.
CREATE VIEW vw_faculty AS
    SELECT ID, name, dept_name FROM instructor;
SELECT * FROM vw_faculty;
-- Find all instructors in the Biology department.
SELECT name FROM instructor WHERE dept_name = 'Biology';
SELECT name FROM vw_faculty WHERE dept_name = 'Biology';
-- Create a view of department salary totals.
CREATE VIEW vw_dept_sal (department, total_salary) AS
    SELECT dept_name, SUM(salary) FROM instructor GROUP BY dept_name;
-- Create the view physics_fall_2009.
CREATE VIEW physics_fall_2009 AS
    SELECT section.course_id, sec_id, building, room_number
    FROM section, course
    WHERE section.course_id = course.course_id
    AND course.dept_name = 'Physics' AND section.semester = 'Fall' AND section.year = 2009;
CREATE VIEW physics_fall_2009_watson AS
    SELECT course_id, room_number
    FROM physics_fall_2009
    WHERE building= 'Watson';
-- (Oracle Only)
CREATE VIEW physics_fall_2009_watson AS
SELECT course_id, room_number
FROM (SELECT course.course_id, building, room_number
          FROM course, section
          WHERE course.course_id = section.course_id
               AND course.dept_name = 'Physics'
               AND section.semester = 'Fall'
               AND section.year = 2009)
WHERE building= 'Watson';
-- A view relation v1 is said to depend directly on a view relation v2  if v2 is used in the expression defining v1.
-- A view relation v1 is said to depend on view relation v2 if either v1 depends directly to v2  or there is a path of dependencies from v1 to v2.
-- A view relation v is said to be recursive  if it depends on itself.
-- Add a new tuple to vw_faculty view which we defined earlier.
INSERT INTO vw_faculty VALUES ('11112', 'Elsolimany','Comp.Sci.');
-- (VERY-IMP) This insertion must be represented by the insertion of the tuple ('11112', 'Elsolimany', 'Comp.Sci.', NULL) in the instructor relation.
-- Some updates cannot be translated uniquely
CREATE VIEW instructor_info AS
      SELECT ID, name, building
       FROM instructor, department
       WHERE instructor.dept_name= department.dept_name;
INSERT INTO instructor_info VALUES (’69987’, ’White’, ’Taylor’); --Can not insert into join view 'UNIVERSITY.instructor_info' without fields list
   -- dept_name is a primary key and can not be set to NULL.
-- Most SQL implementations allow updates only on simple views
   -- The FROM clause has only one database relation.
   -- The SELECT clause contains only attribute names of the relation, and does not have any expressions, aggregates, or DISTINCT specification.
   -- Any attribute not listed in the SELECT clause can be set to NULL.
   -- The query does not have a GROUP BY or HAVING clause.
CREATE VIEW history_instructors AS
   SELECT *
   FROM instructor
   WHERE dept_name= 'History';
-- (VERY-IMP) The following query will INSERT INTO instructor but not in history_instructors
INSERT INTO history_instructors VALUES  ('25566', 'Brown', 'Biology', 100000);
-- Integrity Constraints on a Single Relation
   -- NOT NULL
   -- PRIMARY KEY(A1, A2, ..., Am)
      -- A D PRIMARY KEY
   -- UNIQUE(A1, A2, ..., Am)
      -- A D UNIQUE
   -- CHECK(P), where P is a predicate
-- Referential Integrity
   -- FOREIGN KEY (A1, A2, ..., Am) REFERENCES R (B1, B2, ..., Bm)
      -- A D REFERENCES R (B)
   -- FOREIGN KEY (A1, A2, ..., Am) REFERENCES R (B1, B2, ..., Bm)
      -- ON DELETE CASCADE/SET NULL/SET DEFAULT
      -- ON UPDATE CASCADE/SET NULL/SET DEFALUT
      -- The default option is restriction
CREATE INDEX studentID_index ON student(ID);
CREATE INDEX student_index ON student(name);
   -- CREATE INDEX i ON R(A);
      -- INDEX(A)
-- (Oracle Only) User-Defined Types
-- CREATE TYPE type AS datatype FINAL;
CREATE TYPE Dollars AS NUMERIC(12, 2) FINAL;
-- (Oracle Only) User-Defined Domain Types
-- CREATE DOMAIN domain datatype constraints;
CREATE DOMAIN person_name CHAR(20) NOT NULL;
-- Types and domains are similar.  Domains can have constraints, such as not null, specified on them.
CREATE DOMAIN degree_level VARCHAR(10)
CONSTRAINT degree_level_test
CHECK (VALUE IN ('Bachelors', 'Masters', 'Doctorate'));
-- Authorization
   -- Forms of authorization on parts of  the database (IRUD):
      -- Read 'SELECT'     - allows reading, but not modification of data.
      -- Insert 'INSERT'   - allows insertion of new data, but not modification of existing data.
      -- Update 'UPDATE'   - allows modification, but not deletion of data.
      -- Delete 'DELETE'   - allows deletion of data.
      -- 'ALL PRIVILEGES'  - used as a short form for all the allowable privileges.
   -- Forms of authorization to modify the database schema (IRAD):
      -- Index - allows creation and deletion of indices.
      -- Resources - allows creation of new relations.
      -- Alteration - allows addition or deletion of attributes in a relation.
      -- Drop - allows deletion of relations.
      -- REFERENCE (A1, A2, ..., An)
-- GRANT <privilege list> ON <relation name or view name> TO <user list>;
   -- CREATE ROLE role;
   -- GRANT role TO <user list>;
   -- <user list> is:
      -- a user-id
      -- PUBLIC, which allows all valid users the privilege granted
      -- A role
   -- Example: GRANT SELECT ON instructor TO U1, U2, U3;
-- REVOKE <privilege list> ON <relation name or view name> FROM <user list>;
   -- Example REVOKE SELECT ON branch FRO U1, U2, U3;
   -- If <revoke-list> includes PUBLIC, all users lose the privilege except those granted it explicitly.
   -- If the same privilege was granted twice to the same user by different grantees, the user may retain the privilege after the revocation.
   -- All privileges that depend on the privilege being revoked are also revoked.
-- Examples
GRANT SELECT ON department TO Amit WITH GRANT OPTION;
REVOKE SELECT ON department FROM Amit, Satoshi CASCADE;
REVOKE SELECT ON department FROM Amit, Satoshi RESTRICT;
-- (IMP - Oracle Only) LATERAL
-- Find all the names of the instructors along with the average salary of their departments.
SELECT name, salary, avg_salary
FROM instructor I1, 
                LATERAL (SELECT AVG(salary) AS avg_salary
                             FROM instructor I2
                             WHERE I2.dept_name= I1.dept_name);
-- (IMP - Oracle Only) WITH
-- The WITH clause provides a way of defining a temporary view whose definition is available only to the query in which the with clause occurs. 
-- Find the department whose budget is the max budget of all departments.
WITH max_budget (value) AS
         (SELECT max(budget)
           FROM department)
     SELECT budget
     FROM department, max_budget
     WHERE department.budget = max_budget.value;
-- (IMP - Oracle Only) WITH
-- Find all departments where the total salary is greater than the average of the total salary at all departments.
WITH dept _total (dept_name, value) AS
        (SELECT dept_name, sum(salary)
         FROM instructor
         GROUP BY dept_name),
dept_total_avg(value) AS
       (SELECT AVG(value)
       FROM dept_total)
SELECT dept_name
FROM dept_total, dept_total_avg
WHERE dept_total.value >= dept_total_avg.value;
-- (IMP - Oracle Only) Scalar Subquery
-- Find the department names along with the number of instructors in this department.
SELECT dept_name, 
             (SELECT COUNT(*) 
                FROM instructor 
                WHERE department.dept_name = instructor.dept_name)
             AS num_instructors
         FROM department;
-- (IMP - Oracle Only) Scalar Subquery
-- Runtime error if subquery returns more than one result tuple.
-- Find all the instructors where there salary multiplied by 10 exceeds the budget of their department.
SELECT name
        FROM instructor
        WHERE  salary * 10 > 
             (SELECT budget  FROM department 
                WHERE department.dept_name = instructor.dept_name);
-- (IMP - Oracle Only) Updates with scalar subquery
-- Set tot_creds to NULL for students who have not taken any course else, set it to tot_creds.
UPDATE student S 
     SET tot_cred = (SELECT SUM(credits)
                              FROM takes NATURAL JOIN course
                             WHERE S.ID= takes.ID AND
                                         takes.grade <> ’F’ AND
                                         takes.grade IS NOT NULL);
-- Using CASE
--CASE 
   --WHEN SUM(credits) IS NOT NULL THEN SUM(credits)
   --ELSE 0
--END;

