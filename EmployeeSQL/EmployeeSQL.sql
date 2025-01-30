CREATE TABLE departments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE titles (
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(40) NOT NULL
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(10) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex CHAR(1) CHECK(sex IN ('M', 'F')),
	hire_date DATE NOT NULL, 
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL CHECK (salary >0),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR (10) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

COPY departments FROM '/Users/annamikulich/Desktop/Starter_Code/data/departments.csv' 
DELIMITER ',' CSV HEADER;

COPY titles FROM '/Users/annamikulich/Desktop/Starter_Code/data/titles.csv' 
DELIMITER ',' CSV HEADER;

COPY employees FROM '/Users/annamikulich/Desktop/Starter_Code/data/employees.csv' 
DELIMITER ',' CSV HEADER;

COPY salaries FROM '/Users/annamikulich/Desktop/Starter_Code/data/salaries.csv' 
DELIMITER ',' CSV HEADER;

COPY dept_emp FROM '/Users/annamikulich/Desktop/Starter_Code/data/dept_emp.csv' 
DELIMITER ',' CSV HEADER;

COPY dept_manager FROM '/Users/annamikulich/Desktop/Starter_Code/data/dept_manager.csv' 
DELIMITER ',' CSV HEADER;

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'; 

SELECT dm.dept_no, d.dept_name, dm.emp_no, employees.last_name, employees.first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees ON dm.emp_no = employees.emp_no;

SELECT de.dept_no, de.emp_no, employees.last_name, employees.first_name, d.dept_name
FROM dept_emp de
JOIN employees ON de.emp_no = employees.emp_no
JOIN departments d on de.dept_no = d.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees 
JOIN dept_emp de on employees.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

SELECT employees.emp_no, employees.last_name, employees.first_name, d.dept_name
FROM employees 
JOIN dept_emp de on employees.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;