{% snapshot users_snapshot_timestamp %}

{{
    config(
        target_schema='snapshots',
        unique_key='user_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

SELECT 
    user_id::text,
    name::text,
    email::text,
    age::text,
    registration_date::text,
    updated_at::text 
FROM {{ source('raw', 'users') }}

{% endsnapshot %}
