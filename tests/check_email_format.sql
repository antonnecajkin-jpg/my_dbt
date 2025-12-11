SELECT email 
FROM {{ ref('stg_users_simple') }} WHERE email NOT LIKE '%@%'