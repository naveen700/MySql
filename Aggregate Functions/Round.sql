-- Round is a mathemetical function used to round off the decimal value
--  it requires argument decimal value  with second argument - decimal point upto which we want to truncate (optional,  if not provided all decimal value will be removed)

SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries;	

-- Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';