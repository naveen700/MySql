Use Employees;
-- CREATE TABLE department_dup (
--     dept_no char(4) ,
--     dept_name varchar(40)
-- );
-- INSERT INTO department_dup
-- Select * from departments;
-- -- DROP TABLE department_dup;
-- to alter table ,adding one more column
-- ALTER TABLE department_dup
-- ADD COLUMN dept_manager varchar(40) AFTER dept_name;

SELECT 
    *
FROM
    department_dup;

-- ifnull(expression1, expression2) , when its not null expression 1 will be returned to tables column , if null is present then expression2 will be returned. 
-- it comes handy when we do not want to show the null values to Users , it's better to show something else in place of null 

-- INSERT INTO department_dup(dept_no) values('d011');
-- ifnull cannot conatin more than two parameters

SELECT 
    dept_no,ifnull(dept_name, 'Department not provided') as 'dept_name'
FROM
    department_dup;


-- coalesce allows to insert n number of expression 
-- coalesce(exp1,exp2,exp3,exp4..., expN)
-- caolesce wil return first non-null values from  the list of parameters above , reading values from left to right.
-- work same like ifnull if only two parameters are passed.


SELECT 
    dept_no,
    ifnull(dept_name,'Department Not Found') as dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    department_dup
ORDER BY dept_no asc;

COMMIT;

-- coalesce can be used to create fake_column or additional column
-- it can help to visualize how table will look, like giving a prototype
Select dept_no,
	   dept_name,
       coalesce('Department Manager Name here') as Prototype_View
from department_dup;
-- here caolesce works better than ifnull ,because ifnull requires two parameters ,not less not more, whereas coalesce can work with  only one argument.
-- we can do this with ifnull but it will require first parameter as null. so professionals prefer coalesce() then ifnull.

-- exercise
-- Select the department number and name from the ‘departments_dup’ table and add a third column where you name the department number (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have a value, use ‘dept_name’.
INSERT INTO department_dup(dept_name) values('Human Resource');
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    department_dup;
