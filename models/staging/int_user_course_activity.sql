{{ config(materialized='view', schema='staging') }}

SELECT 
    u.user_id,
    u.name,
    u.age_group,
    c.course_name,
    c.category_ru,
    e.enrolled_at,
    DATE_PART('year', e.enrolled_at) as enrollment_year,
    DATE_PART('month', e.enrolled_at) as enrollment_month
FROM {{ ref('stg_users_complete') }} u
JOIN {{ source('raw','enrollments') }} e ON u.user_id = e.user_id
JOIN {{ ref('stg_courses_complete') }} c ON e.course_id = c.course_id