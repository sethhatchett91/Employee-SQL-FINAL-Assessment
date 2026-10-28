SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT AS DEPARTMENT
FROM emp_record_table
ORDER BY DEPT;
-----------------------------------------------------------------
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT AS DEPARTMENT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING<2;
-----------------------------------------------------------------------------
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT AS DEPARTMENT, EMP_RATING
FROM emp_record_table ert 
WHERE EMP_RATING > 4;
-----------------------------------------------------------------------------
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT AS DEPARTMENT, EMP_RATING
FROM emp_record_table ert 
WHERE EMP_RATING BETWEEN 2 AND 4;
-----------------------------------------------------------------------------
SELECT FIRST_NAME || '' || LAST_NAME AS NAME
FROM emp_record_table ert 
WHERE DEPT = 'FINANCE';
------------------------------------------------------------------------------
SELECT EMP_ID, FIRST_NAME, ROLE, DEPT AS DEPARTMENT
FROM emp_record_table ert WHERE ROLE IN ('MANAGER', "PRESIDENT", "CEO");
------------------------------------------------------------------------------
SELECT EMP_ID, FIRST_NAME, LAST_NAME, DEPT
FROM emp_record_table
WHERE DEPT = 'HEALTHCARE'

UNION ALL

SELECT EMP_ID, FIRST_NAME, LAST_NAME, DEPT
FROM emp_record_table ert 
WHERE DEPT = "FINANCE";
-------------------------------------------------------------------------------
SELECT EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, EMP_RATING, MAX(EMP_RATING) OVER (PARTITION BY DEPT) AS MAX_DEPT_RATING
FROM emp_record_table ert 
ORDER BY DEPT;
--------------------------------------------------------------------------------------------------------------------------
SELECT ROLE, MIN(SALARY) AS MIN_SALARY, MAX(SALARY) AS MAX_SALERY
FROM emp_record_table ert 
GROUP BY ROLE;
-----------------------------------------------------------------------
SELECT EMP_ID, FIRST_NAME, LAST_NAME, EXP, RANK() OVER (ORDER BY EXP DESC) AS EXP_RANK
FROM emp_record_table;
---------------------------------------------------------------------------------------------------------------
CREATE VIEW HIGH_SALARY_EMPLOYEES AS 
SELECT EMP_ID, FIRST_NAME, LAST_NAME, COUNTRY, SALARY
FROM emp_record_table
WHERE SALARY > 60000;

SELECT *
FROM HIGH_SALARY_EMPLOYEES;
----------------------------------------------------------------------
SELECT EMP_ID, FIRST_NAME, LAST_NAME, EXP
FROM emp_record_table ert 
WHERE EMP_ID IN (
	SELECT EMP_ID
	FROM emp_record_table
	WHERE EXP > 10
);
------------------------------------------------------------------

SELECT *,
	CASE 
		WHEN ROLE = EXPECTED_ROLE THEN "MATCH"
		ELSE "MISMATCH"
	END AS ROLE_STATUS
FROM (
	SELECT
		EMP_ID,
		FIRST_NAME,
		LAST_NAME,
		ROLE,
		EXP,
		CASE
			WHEN EXP <= 2 THEN "JUNIOR DATA SCIENTIST"
			WHEN EXP <= 5 THEN "ASSOCIATE DATA SCIENTIST"
			WHEN EXP <= 10 THEN "SENIOR DATA SCIENTIST"
			WHEN EXP <= 12 THEN "LEAD DATA SCIENTIST"
			WHEN EXP <= 16 THEN "MANAGER"
			ELSE "OUTSIDE STANDARD"
		END AS EXPECTED_ROLE
	FROM data_science_team
) AS t;
-----------------------------------------------------------------
SELECT
	EMP_ID,
	FIRST_NAME,
	LAST_NAME,
	SALARY,
	EMP_RATING,
	ROUND(SALARY * 0.05 * EMP_RATING, 2) AS BONUS
FROM emp_record_table;
----------------------------------------------------------------
SELECT 
	CONTINENT,
	COUNTRY,
	ROUND(AVG(SALARY), 2) AS AVG_SALARY
FROM emp_record_table ert 
GROUP BY CONTINENT, COUNTRY 
ORDER BY CONTINENT, COUNTRY;
		
	
