SELECT * FROM OEHR_EMPLOYEES;
SELECT * FROM OEHR_JOBS;

-- QUESTION 01
SELECT LAST_NAME, SALARY FROM OEHR_EMPLOYEES WHERE SALARY> 12000;

-- QUESTION 02
SELECT LAST_NAME, DEPARTMENT_ID FROM OEHR_EMPLOYEES WHERE EMPLOYEE_ID = 176;

-- QUESTION 03
SELECT LAST_NAME, SALARY FROM OEHR_EMPLOYEES WHERE SALARY NOT BETWEEN 5000 AND 12000;

-- QUESTION 04
SELECT LAST_NAME, JOB_ID, HIRE_DATE FROM OEHR_EMPLOYEES WHERE to_date(HIRE_DATE,'MM/DD/YYYY') >= TO_DATE('02/20/1998', 'MM/DD/YYYY') AND to_date(HIRE_DATE,'MM/DD/YYYY') <= TO_DATE('05/01/1998', 'MM/DD/YYYY') ORDER BY HIRE_DATE;

-- QUESTION 05
SELECT * FROM (SELECT LAST_NAME, DEPARTMENT_ID FROM OEHR_EMPLOYEES WHERE DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 50) ORDER BY LAST_NAME;

-- QUESTION 06
SELECT LAST_NAME AS "Employee", SALARY as "Monthly Salary" FROM
    (SELECT * FROM OEHR_EMPLOYEES WHERE SALARY BETWEEN 5000 AND 12000) 
WHERE DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 50;

-- QUESTION 07
SELECT LAST_NAME,HIRE_DATE 
FROM OEHR_EMPLOYEES 
WHERE to_date(HIRE_DATE,'MM/DD/YYYY') >= TO_DATE('01/01/1998', 'MM/DD/YYYY') 
AND to_date(HIRE_DATE,'MM/DD/YYYY') <= TO_DATE('12/31/1998', 'MM/DD/YYYY');

-- QUESTION 08
SELECT OEHR_EMPLOYEES.LAST_NAME, OEHR_JOBS.JOB_TITLE 
FROM OEHR_JOBS 
JOIN OEHR_EMPLOYEES ON OEHR_EMPLOYEES.JOB_ID = OEHR_JOBS.JOB_ID
WHERE MANAGER_ID IS null;

-- QUESTION 09
SELECT * FROM
    (SELECT LAST_NAME, SALARY, COMMISSION_PCT 
    FROM OEHR_EMPLOYEES 
    WHERE COMMISSION_PCT IS NOT null)
ORDER BY SALARY DESC;

-- QUESTION 10
SELECT LAST_NAME 
FROM OEHR_EMPLOYEES 
WHERE LAST_NAME like '__a%';

-- QUESTION 11
SELECT LAST_NAME 
FROM OEHR_EMPLOYEES 
WHERE LAST_NAME LIKE 'A%e%';

-- QUESTION 12
SELECT A.LAST_NAME, A.SALARY, B.JOB_TITLE
FROM OEHR_EMPLOYEES A 
JOIN OEHR_JOBS B ON A.JOB_ID = B.JOB_ID 
WHERE B.JOB_TITLE IN ('Stock Clerk','Sales Representative') 
AND A.SALARY NOT IN (2500,3500,7000);

--QUESTION 13
SELECT LAST_NAME, SALARY, (COMMISSION_PCT*SALARY) AS "COMMISSION" 
FROM OEHR_EMPLOYEES
WHERE COMMISSION_PCT = .2;
