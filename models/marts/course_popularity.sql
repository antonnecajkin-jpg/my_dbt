{{ config(materialized='table', schema='marts') }}

SELECT 
    c.title,
    count(u.user_id) as count_users
FROM {{ ref('stg_users') }} u
JOIN raw.enrollments e ON u.user_id = e.user_id
JOIN {{ ref('stg_courses') }} c ON e.course_id = c.course_id
group by c.title