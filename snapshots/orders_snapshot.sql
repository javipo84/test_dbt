{% snapshot orders_snapshot %}

{{
    config(
      target_database='dbt_prod',
      target_schema='snapshots',
      unique_key='order_id',

      strategy='timestamp',
      updated_at='_fivetran_synced',
    )
}}

select * from {{ source('postgres_public', 'orders') }}

{% endsnapshot %}