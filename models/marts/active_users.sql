{{ config(materialized='table') }}

SELECT 
    l.lesson_id,
    l.title as lesson_title,
    l.course_id,
    c.title as course_title,
    COUNT(v.viewed_at) as total_views,
    COUNT(DISTINCT v.user_id) as unique_users,
    MIN(v.viewed_at) as first_view,
    MAX(v.viewed_at) as last_view
FROM core.dim_lesson l
JOIN core.dim_course c ON l.course_id = c.course_id
LEFT JOIN core.fact_lesson_views v ON l.lesson_id = v.lesson_id
GROUP BY l.lesson_id, l.title, l.course_id, c.title
ORDER BY total_views DESC 