EXP 3:Create a database using DDL and apply integrity constraints for the specified system.

SQL> CREATE TABLE department(dept_id NUMBER(5), dept_name VARCHAR2(30));
SQL> CREATE TABLE student(id NUMBER(5) PRIMARY KEY, name VARCHAR2(30) NOT NULL, age NUMBER(3) CHECK(age >= 17), dept_id NUMBER(5), CONSTRAINT fk_dept FOREIGN KEY(dept_id) REFERENCES department(dept_id));
SQL> ALTER TABLE department ADD CONSTRAINT pk_dept PRIMARY KEY(dept_id);
SQL> ALTER TABLE department ADD CONSTRAINT unq_dept UNIQUE(dept_name);
SQL> DESC department;
SQL> DESC student;

EXP 4: To implement DML commands of SQL with suitable examples.To implement DML commands of SQL with suitable examples.

SQL> CREATE TABLE student(id NUMBER(5),name VARCHAR2(30),age NUMBER(3),dept_id NUMBER(5));
SQL> INSERT INTO student VALUES (1,'Amit',18,101);
SQL> INSERT INTO student VALUES (2,'Riya',19,101);
SQL> INSERT INTO student VALUES (3,'Rahul',21,102);
SQL> SELECT * FROM student;
SQL> UPDATE student SET age = 20  WHERE id = 1;
SQL> SELECT * FROM student;
SQL> DELETE FROM student WHERE id = 2;
SQL> SELECT * FROM student;

EXP 5: Aggregate Functions & Set Operators

CREATE TABLE student(id NUMBER(5),name VARCHAR2(30),age NUMBER(3));
INSERT INTO student VALUES (1,'Amit',18);
INSERT INTO student VALUES (2,'Riya',20);
INSERT INTO student VALUES (3,'Rahul',22);
SELECT * FROM student;
SELECT COUNT(*) FROM student;
SELECT MAX(age) FROM student;
SELECT MIN(age) FROM student;
SELECT AVG(age) FROM student;
SELECT SUM(age) FROM student;
CREATE TABLE student2(id NUMBER(5),name VARCHAR2(30),age NUMBER(3));
INSERT INTO student2 VALUES (2,'Riya',20);
INSERT INTO student2 VALUES (4,'Neha',23);
SELECT id FROM student UNION SELECT id FROM student2;
SELECT id FROM student INTERSECT SELECT id FROM student2;
SELECT id FROM student MINUS SELECT id FROM student2;

EXP 6: Nested and Complex Queries

CREATE TABLE student(id NUMBER(5),name VARCHAR2(30),age NUMBER(3),marks NUMBER(3));
INSERT INTO student VALUES (1,'Amit',18,85);
INSERT INTO student VALUES (2,'Riya',19,90);
INSERT INTO student VALUES (3,'Rahul',20,75);
INSERT INTO student VALUES (4,'Neha',21,95);
SELECT * FROM student;
SELECT name, marks FROM student WHERE marks = (SELECT MAX(marks) FROM student);
SELECT name FROM student WHERE marks > (SELECT AVG(marks) FROM student);
SELECT name, marks FROM student WHERE marks BETWEEN 80 AND 95;
SELECT name FROM student WHERE age IN (SELECT age FROM student WHERE age > 19);

EXP 7: Join Operations

CREATE TABLE department(dept_id NUMBER(5),dept_name VARCHAR2(30));
CREATE TABLE student(id NUMBER(5),name VARCHAR2(30),dept_id NUMBER(5));
INSERT INTO department VALUES (101,'Computer');
INSERT INTO department VALUES (102,'IT');
INSERT INTO student VALUES (1,'Amit',101);
INSERT INTO student VALUES (2,'Riya',101);
INSERT INTO student VALUES (3,'Rahul',102);
INSERT INTO student VALUES (4,'Neha',103);
SELECT s.id, s.name, d.dept_name FROM student s, department d WHERE s.dept_id = d.dept_id;
SELECT s.id, s.name, d.dept_name FROM student s LEFT JOIN department d ON s.dept_id = d.dept_id;
SELECT s.id, s.name, d.dept_name FROM student s RIGHT JOIN department d ON s.dept_id = d.dept_id;
SELECT s.id, s.name, d.dept_name FROM student s FULL OUTER JOIN department d ON s.dept_id = d.dept_id;

EXP 8: COMMIT, ROLLBACK, SAVEPOINT

CREATE TABLE student(id NUMBER(5), name VARCHAR2(30), marks NUMBER(3));
INSERT INTO student VALUES (1,'Amit',80);
INSERT INTO student VALUES (2,'Riya',85);
INSERT INTO student VALUES (3,'Rahul',75);
SELECT * FROM student;
UPDATE student SET marks = 90 WHERE id = 1;
SAVEPOINT sp1;
UPDATE student SET marks = 95 WHERE id = 2;
ROLLBACK TO sp1;
SELECT * FROM student;

EXP 9: Views and Triggers

CREATE TABLE student(id NUMBER(5),name VARCHAR2(30),marks NUMBER(3));
INSERT INTO student VALUES (1,'Amit',80);
INSERT INTO student VALUES (2,'Riya',85);
INSERT INTO student VALUES (3,'Rahul',75);
CREATE VIEW student_view AS SELECT name, marks FROM student;
CREATE OR REPLACE TRIGGER trg_student BEFORE INSERT ON student FOR EACH ROW BEGIN DBMS_OUTPUT.PUT_LINE('Record inserted') END;/
SELECT * FROM student_view;
INSERT INTO student VALUES (4,'Neha',90);

EXP 10: Types of Constraints

CREATE TABLE department(dept_id NUMBER(5) PRIMARY KEY, dept_name VARCHAR2(30) UNIQUE); 
CREATE TABLE employee(emp_id NUMBER(5) PRIMARY KEY, name VARCHAR2(30) NOT NULL, age NUMBER(3) CHECK(age > 18), email VARCHAR2(50) UNIQUE, dept_id NUMBER(5), CONSTRAINT fk_dept FOREIGN KEY(dept_id) REFERENCES department(dept_id));
INSERT INTO department VALUES (101,'Computer');
INSERT INTO department VALUES (102,'IT');
INSERT INTO employee VALUES (1,'Amit',25,'amit@gmail.com',101);
INSERT INTO employee VALUES (2,'Riya',22,'riya@gmail.com',102);
SELECT * FROM employee;
added project files
