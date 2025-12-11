{{ 
    config(
        materialized='incremental',
        unique_key='id',  -- обязательное поле для incremental
        schema='marts'
    ) 
}}

SELECT 
    id,
    user_id,
    lesson_id,
    viewed_at
FROM raw.lesson_views

-- Это МАГИЧЕСКАЯ СТРОЧКА для incremental
{% if is_incremental() %}
WHERE viewed_at > (SELECT MAX(viewed_at) FROM {{ this }})
{% endif %}