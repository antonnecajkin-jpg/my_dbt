{% macro translate_category(category) %}
    -- Переводим категории курсов на русский
    CASE {{ category }}
        WHEN 'data' THEN 'Анализ данных'
        WHEN 'programming' THEN 'Программирование'
        WHEN 'business' THEN 'Бизнес'
        ELSE 'Другое'
    END
{% endmacro %}