{{ config(materialized='view', schema='staging') }}

SELECT 
    user_id,
    name,
    email,
    age
FROM raw.users