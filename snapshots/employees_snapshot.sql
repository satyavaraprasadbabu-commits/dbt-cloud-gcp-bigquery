{% snapshot employees_hist %}

    {{
        config(
            target_schema ='Staging',
            unique_key = 'EMPLOYEEID',
            strategy = 'check',
            check_cols = 'all'
        )
    }}

    select 
        *
    from 
        {{ ref('employees_ephemeral_model') }}

{% endsnapshot %}