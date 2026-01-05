{{
    config(
            unique_key = 'EMPLOYEEID'
    )
}}

 SELECT DISTINCT
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
FROM 
   {{ref('employees_hist')}}
{% if is_inremental %}

where 1=1
      and dbt_valid_to is null 
{%endif%}