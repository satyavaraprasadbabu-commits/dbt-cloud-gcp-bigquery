select count(*) as num_orders_today
from {{ref('employees_ephemeral_model')}}
where DEPARTMENT = 'IT Services'
having count(*) > 1
