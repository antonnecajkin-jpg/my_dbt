{{ config(materialized='view', schema='staging') }}

SELECT 
    course_id,
    title,
    category as course_category,
    created_at
FROM raw.courses