-- AVG() average gives the average of all non-null values of a coloumn;
-- frequently used  with GROUP BY clause.
SELECT 
    AVG(salary)
FROM
    salaries;
    
-- What is the average annual salary paid to employees who started after the 1st of January 1997?
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    