
{{ config(materialized='table', schema='marts') }}

SELECT 
    l.lesson_id,
    l.title AS lesson_title,
    l.course_id,
    c.title AS course_title,
    COUNT(v.viewed_at) AS total_views,
    COUNT(DISTINCT v.user_id) AS unique_users,
    MIN(v.viewed_at) AS first_view,
    MAX(v.viewed_at) AS last_view            
FROM {{ source('core', 'dim_lesson') }} l
JOIN {{ source('core', 'dim_course') }} c 
  ON l.course_id = c.course_id
LEFT JOIN {{ source('core', 'fact_lesson_views') }} v 
  ON l.lesson_id = v.lesson_id
GROUP BY l.lesson_id, l.title, l.course_id, c.title
ORDER BY total_views DESC
          