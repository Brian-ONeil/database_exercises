-- 1. Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.


/* 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name.
 In your comments, answer: What was the first and last name in the first row of the results? Irena Reutenauer
 What was the first and last name of the last person in the table? Vidya Simmen */
select *
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name asc;


/* 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name
 and then last name. In your comments, answer: What was the first and last name in the first row of the results? Irena Acton
What was the first and last name of the last person in the table? Vidya Zweizig*/
select *
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name ASC, last_name ASC;


-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. 
-- In your comments, answer: What was the first and last name in the first row of the results? Irena Acton
-- What was the first and last name of the last person in the table? Maya Zyda
select *
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by last_name ASC, first_name ASC;

/*  5. Write a query to to find all employees whose last name starts and ends with 'E'. 
Sort the results by their employee number. Enter a comment with the number of employees returned - 899, 
the first employee number and their first and last name - Ramzi Erde
, and the last employee number with their first and last name. - Tadahiro Erde
*/
select *
from employees
where last_name LIKE '%e'
	and last_name LIKE 'e%'
order by emp_no;

/* Write a query to to find all employees whose last name starts and ends with 'E'. 
Sort the results by their hire date, so that the newest employees are listed first. 
Enter a comment with the number of employees returned 899
, the name of the newest employee - Teiji Eldridge
, and the name of the oldest employee. Sergi Erde*/
select *
from employees
where last_name LIKE '%e'
	and last_name LIKE 'e%'
order by hire_date DESC;

/* Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first. */
select *
from employees
where hire_date > '1990-01-01'
	AND hire_date < '1999-12-31'
    AND hire_date LIKE '%12-25%'
order by hire_date ASC;
