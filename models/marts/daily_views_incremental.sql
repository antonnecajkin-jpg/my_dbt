{{ 
    config(
        materialized='incremental',
        unique_key='id',  
        schema='marts'
    ) 
}}

SELECT 
    id,
    user_id,
    lesson_id,
    viewed_at
FROM {{ source('raw', 'lesson_views') }} 


{% if is_incremental() %}
WHERE viewed_at > (SELECT MAX(viewed_at) FROM {{ this }})
{% endif %}