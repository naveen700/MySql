-- checks whether certain row values are found within a subquery.
-- this check is conducted row by row.
-- it returns a boolean value.
-- if row value of subquery exists it gives true , if it does not exist then it returns false.

-- example 
Use Employees;
SELECT 
    em.*
FROM
    employees em
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            em.emp_no = dm.emp_no)
            
-- diffrence btw 	'Exists' and 'IN'
-- Exists
-- tests row values for existence . 
-- quicker in retrievng large amounts of data. 


-- IN
-- searches among values. 
-- faster with smaller datasets. 

