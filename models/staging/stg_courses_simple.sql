{{ config(materialized='view', schema='staging') }}

SELECT 
    course_id,
    title
FROM raw.courses