{{ config(materialized='view', schema='staging') }}

SELECT 
    user_id,
    name,
    age,
    email,
    registration_date,
    -- Добавляем вычисляемые поля
    CASE 
        WHEN age < 18 THEN 'Младше 18'
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 50 THEN '31-50'
        ELSE 'Старше 50'
    END as age_group
FROM {{ source('raw', 'users') }}