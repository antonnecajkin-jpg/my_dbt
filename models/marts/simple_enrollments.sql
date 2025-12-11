{{ config(materialized='table', schema='marts') }}

SELECT 
    u.user_id,
    u.name as user_name,
    c.title as course_name,
    u.age
FROM {{ ref('stg_users_simple') }} u
JOIN {{ source('raw', 'enrollments') }} e ON u.user_id = e.user_id
JOIN {{ ref('stg_courses_simple') }} c ON e.course_id = c.course_id
LIMIT 12  