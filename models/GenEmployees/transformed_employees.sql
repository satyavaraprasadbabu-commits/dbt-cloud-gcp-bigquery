
WITH base_employees AS (
  SELECT
    EMPLOYEEID,
    FIRSTNAME,
    LASTNAME,
    DEPARTMENT,
    DESIGNATION,
    SALARY,
    JOININGDATE,
    ORGANIZATION,
    BUSINESSLINE,
    GENDER
  FROM {{ source('bigquery_source', 'GENEMPLOYEES') }} 
)

SELECT
  EMPLOYEEID,
  FIRSTNAME,
  LASTNAME,
  DEPARTMENT,
  DESIGNATION,
  SALARY,
  JOININGDATE,
  ORGANIZATION,
  BUSINESSLINE,
  GENDER,
  DATE_DIFF(CURRENT_DATE(), JOININGDATE, DAY) AS days_since_joined,
  CASE
    WHEN DEPARTMENT = 'Data Engineering' THEN TRUE
    ELSE FALSE
  END AS department_filter,
  CASE
    WHEN SALARY > 100000 THEN 'High'
    WHEN SALARY > 90000 THEN 'Medium'
    ELSE 'Low'
  END AS salary_grade
FROM base_employees