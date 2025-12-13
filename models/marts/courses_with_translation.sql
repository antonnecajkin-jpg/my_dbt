{{ config(materialized='table', schema='marts') }}

SELECT 
    course_id,
    title,
    category,
    -- Используем macro для перевода!
    {{ translate_category('category') }} as category_russian,
    created_at
FROM raw.courses