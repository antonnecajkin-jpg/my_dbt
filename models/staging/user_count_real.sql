{{ config(materialized='table') }}

SELECT 
    COUNT(*) as количество_юзеров
FROM raw.users