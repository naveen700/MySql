-- Create Database if not  exists  Sales;
-- or create using schema commanad
-- Create Schema  if not exists Sales 
-- sum function only work with numeric data.
Use Employees;
SELECT 
    SUM(salary)
FROM
    salaries;
    
-- exercise 
-- What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?    
SELECT 
    sum(salary)
FROM
    salaries
WHERE from_date > '1997-01-01';

