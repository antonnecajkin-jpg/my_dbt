{{ config(materialized='view', schema='staging') }}

SELECT 
    course_id,
    title as course_name,
    category,
    created_at,
    CASE 
        WHEN category = 'data' THEN 'Анализ данных'
        WHEN category = 'programming' THEN 'Программирование'
        WHEN category = 'business' THEN 'Бизнес'
        ELSE 'Другое'
    END as category_ru
FROM {{ source('raw', 'courses') }}