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
select 
* 
from base_employees

