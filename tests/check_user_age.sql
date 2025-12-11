-- Этот тест проверит что возраст пользователей от 10 до 100 лет
SELECT 
    user_id,
    age
FROM {{ ref('stg_users_simple') }}
WHERE age < 10 OR age > 100