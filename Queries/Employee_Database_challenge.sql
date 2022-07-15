CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE departmentEmployee (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

CREATE TABLE managers (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);


CREATE TABLE employees(
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL, 
	hire_date DATE NOT NULL
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

CREATE TABLE titles(
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

SELECT * FROM  departmentemployee;

SELECT emp_no, first_name, last_name
FROM employees;

SELECT title, from_date, to_date 
FROM titles; 

SELECT *  FROM retirement_titles;

SELECT employees.emp_no, employees.first_name, employees.last_name,
titles.title, titles.from_date, titles.to_date
INTO retirement_titles
FROM employees, titles
WHERE  employees.emp_no =titles.emp_no
AND (birth_date BETWEEN '1952-01-01' AND '1955-01-01');

SELECT * FROM retirement_titles
ORDER BY emp_no ASC;

SELECT emp_no, first_name, last_name, title
FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (retirement_titles.emp_no) retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title
INTO unique_titles
FROM retirement_titles 
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT(unique_titles.emp_no), unique_titles.title
INTO retiring_titles
FROM unique_titles 
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;