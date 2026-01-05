{% macro get_date_parts(JOININGDATE) %}

   ( SELECT struct (
        {{ JOININGDATE }} AS JOININGDATE,
        EXTRACT(YEAR FROM {{ JOININGDATE }}) AS year,
        EXTRACT(MONTH FROM {{ JOININGDATE }}) AS month,
        EXTRACT(DAY FROM {{ JOININGDATE }}) AS day,
        EXTRACT(DAYOFWEEK FROM {{ JOININGDATE }}) AS day_of_week,
        EXTRACT(DAYOFYEAR FROM {{ JOININGDATE }}) AS day_of_year,
        EXTRACT(WEEK FROM {{ JOININGDATE }}) AS week,
        EXTRACT(QUARTER FROM {{ JOININGDATE }}) AS quarter ) as extract_date
   )
{% endmacro %}