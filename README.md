# SQL-CHALLENGE

*Overview
This project is a relational database schema designed to organize employee information for a fictional company's HR system. It includes employee details, job titles, salaries, department assignments, and managerial roles.

* Database Structure
The schema includes the following tables:

Departments: Contains department identifiers and names.
Titles: Stores job titles linked to employees.
Employees: Central table with biographical and job information.
Salaries: Holds salary records for each employee.
Dept_emp: Maps employees to departments (many-to-many relationship).
Dept_manager: Tracks which employees manage which departments.
All primary and foreign key relationships are clearly defined to ensure referential integrity.

* ER Diagram
The entity-relationship diagram for this database was created using QuickDBD, and reflects all key relationships, including:

Employees ↔ Titles
Employees ↔ Salaries
Employees ↔ Departments (via dept_emp)
Departments ↔ Managers (via dept_manager)
