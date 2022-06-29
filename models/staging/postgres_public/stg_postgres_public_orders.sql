WITH base_orders AS (
    SELECT * 
    FROM {{ ref('base_postgres_public_orders') }}
),

renamed_casted AS (
    SELECT
          order_id 
        , user_id 
        , promo_id
        , address_id
        , created_at AS created_at_utc
        , order_cost AS item_order_cost_usd
        , shipping_cost AS shipping_cost_usd
        , order_total AS total_order_cost_usd
        , tracking_id
        , shipping_service
        , estimated_delivery_at AS estimated_delivery_at_utc
        , delivered_at AS delivered_at_utc
        , status AS status_order
        , _fivetran_synced as date_load
    FROM base_orders 
    )

SELECT * FROM renamed_casted