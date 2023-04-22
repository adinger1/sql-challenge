drop table if exists departments cascade;
drop table if exists dept_emp cascade;
drop table if exists dept_manager cascade;
drop table if exists employees cascade;
drop table if exists salaries cascade;
drop table if exists titles cascade

CREATE TABLE "departments" (
    "dept_no" varchar(4) NOT NULL primary key,
    "dept_name" varchar(30) NOT NULL
);

CREATE TABLE "titles" (
    "title_id" varchar(5) NOT NULL primary key,
    "title" varchar(30) NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int NOT NULL primary key,
    "emp_title_id" varchar(5)   NOT NULL,
    "birth_date" date NOT NULL,
    "first_name" varchar(30) NOT NULL,
    "last_name" Varchar(30) NOT NULL,
    "sex" char NOT NULL,
    "hire_date" date NOT NULL,
    constraint fk_employees_titles foreign key (emp_title_id) references titles(title_id)
);


CREATE TABLE "dept_emp" (
    "emp_no" int NOT NULL,
    "dept_no" varchar(4) NOT NULL,
	constraint fk_dept_emp_employees foreign key (emp_no) references employees(emp_no),
	constraint fk_dept_emp_departments foreign key (dept_no) references departments(dept_no)
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(4) NOT NULL,
    "emp_no" int   NOT NULL,
	constraint fk_dept_manager_departments foreign key (dept_no) references departments(dept_no),
	constraint fk_dept_manager_employees foreign key (emp_no) references employees(emp_no)
);


CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
	constraint fk_salaries_employees foreign key (emp_no) references employees(emp_no)
);


--importing data in order

Copy departments from 'C:\Rutgers Bootcamp\Homework\Homework7SQL\sql-challenge\data\departments.csv' 
delimiter ',' CSV HEADER;

copy titles from 'C:\Rutgers Bootcamp\Homework\Homework7SQL\sql-challenge\data\titles.csv'
Delimiter ',' csv header;

copy employees from 'C:\Rutgers Bootcamp\Homework\Homework7SQL\sql-challenge\data\employees.csv'
Delimiter ',' csv header;

copy dept_emp from 'C:\Rutgers Bootcamp\Homework\Homework7SQL\sql-challenge\data\dept_emp.csv'
Delimiter ',' csv header;

copy dept_manager from 'C:\Rutgers Bootcamp\Homework\Homework7SQL\sql-challenge\data\dept_manager.csv'
Delimiter ',' csv header;

copy salaries from 'C:\Rutgers Bootcamp\Homework\Homework7SQL\sql-challenge\data\salaries.csv'
Delimiter ',' csv header;

