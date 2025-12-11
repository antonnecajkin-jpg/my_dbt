{{ config(materialized='table', schema='marts') }}

SELECT 
    c.course_name,
    c.category_ru,
    COUNT(DISTINCT u.user_id) as total_students,
    COUNT(*) as total_enrollments,

    COUNT(DISTINCT CASE WHEN u.age_group = '18-30' THEN u.user_id END) as students_18_30,
    COUNT(DISTINCT CASE WHEN u.age_group = '31-50' THEN u.user_id END) as students_31_50,

    MIN(e.enrolled_at) as first_enrollment,
    MAX(e.enrolled_at) as last_enrollment,

    AVG(COUNT(*)) OVER () as avg_enrollments_per_course

FROM {{ ref('int_user_course_activity') }} e
JOIN {{ ref('stg_users_complete') }} u ON e.user_id = u.user_id
JOIN {{ ref('stg_courses_complete') }} c ON e.course_name = c.course_name
GROUP BY c.course_name, c.category_ru
ORDER BY total_students DESC
