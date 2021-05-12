-- Dropping tables in case they already exist

-- Child tables
drop table dept_emp;
drop table salaries;
drop table titles;
drop table dept_manager;

-- Parent tables
drop table departments;
drop table employees;

-- Creating all tables

create table employees (emp_no int primary key,
						emp_title_id varchar(5),
						birth_date varchar(10),
						first_name varchar(30),
						last_name varchar(30),
						sex varchar (1),
						hire_date varchar(10));

create table departments (dept_no int primary key,
				   dept_name varchar(30));

create table salaries (emp_no int,
					  salary int,
					  constraint fk_employee foreign key(emp_no) references employees(emp_no));

create table titles (title_id int primary key,
					title varchar (30));

create table dept_manager (depto_no int,
						  emp_no int,
						  constraint fk_department foreign key(emp_no) references departments(dept_no),
						  constraint fk_employee foreign key(emp_no) references employees(emp_no));

create table dept_emp (emp_no int,
				dept_no int,
				constraint fk_employee foreign key(emp_no) references employees(emp_no),
				constraint fk_department foreign key(emp_no) references departments(dept_no));
