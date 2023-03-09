SHOW DATABASES;
USE albums_db;
SELECT database();
SHOW CREATE DATABASE albums_db;
SHOW TABLES;

USE employees;
SELECT database();
SHOW CREATE DATABASE employees;
SHOW TABLES;
-- 11. Which table(s) do you think contain a numeric type column? emp_no, dept_manager
-- 12. Which table(s) do you think contain a string type column? departments, employees, titles
-- 13. Which table(s) do you think contain a date type column? from_date, to_date, dept_emp, titles
-- 14. What is the relationship between the employees and the departments tables? dept_emp table
/* 
# 'CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1'
*/


USE dept_manager;
SELECT database();
SHOW TABLES;
SHOW CREATE TABLE dept_manager;

show tables;
SHOW CREATE TABLE salaries;

SELECT *
from salaries;

select emp_no, salary
from salaries;

show tables;
show create table employees;
show tables;
select *
from dept_manager;

show tables;
show create table employees;
select *
from employees;



