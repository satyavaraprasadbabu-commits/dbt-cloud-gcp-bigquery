-- Use the `ref` function to select from other models-

SELECT
    e.EMPLOYEEID,
    e.FIRSTNAME,
    e.LASTNAME,
    e.DEPARTMENT,
    e.DESIGNATION,
    e.SALARY,
    e.JOININGDATE,
    e.ORGANIZATION,
    e.BUSINESSLINE,
    e.GENDER,
    d.NumberOfEmployees,
    d.DeptHeadLoc,
    {{get_date_parts('e.JOININGDATE')}} as JOININGDATE_PARTS
FROM
    dbt_sprasadbabu.GenEmployeesDept d
JOIN
    {{ ref('employees_ephemeral_model') }} e ON d.DEPARTMENT = e.DEPARTMENT
