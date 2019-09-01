-- join show result set conatining fields derived from two or more tables.
-- we must find a realated column from the two tables that conatin the same type of data.
-- we will be free to add columns from these two tables to our output.

-- excercise
-- If you currently have the ‘departments_dup’ table set up, use DROP COLUMN to remove the ‘dept_manager’ column from the ‘departments_dup’ table.
-- Then, use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.
-- (If you don’t currently have the ‘departments_dup’ table set up, create it. Let it contain two columns: dept_no and dept_name. Let the data type of dept_no be CHAR of 4, and the data type of dept_name be VARCHAR of 40. Both columns are allowed to have null values. Finally, insert the information contained in ‘departments’ into ‘departments_dup’.)
-- Then, insert a record whose department name is “Public Relations”.
-- Delete the record(s) related to department number two.
-- Insert two new records in the “departments_dup” table. Let their values in the “dept_no” column be “d010” and “d011”.
USE employees;
DROP table departments_dup;
DROP table dept_manager_dup;
CREATE TABLE departments_dup (
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);
Insert into departments_dup 
Select * from departments;

Insert into departments_dup(dept_name) values('Public Relations');
insert into departments_dup(dept_no) values('d010');
insert into departments_dup(dept_no) values('d011');
Select * from departments_dup;


delete from departments_dup where dept_no = 'd002';

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup
select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002'; 

