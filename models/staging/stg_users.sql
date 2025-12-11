{{ config(materialized='view', schema='staging') }}

SELECT 
    user_id,
    name as user_name,
    age,
    email,
    registration_date
FROM raw.users