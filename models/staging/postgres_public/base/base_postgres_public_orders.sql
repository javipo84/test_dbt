WITH snapshot_orders AS (
    SELECT * 
    FROM {{ source('postgres_public', 'orders') }}
),

renamed_casted AS (
    SELECT
        order_id 
        , user_id 
        , CASE 
            WHEN promo_id = '' THEN null
            WHEN promo_id <> '' THEN {{ dbt_utils.surrogate_key('promo_id') }} 
            ELSE null 
          END AS promo_id
        , address_id
        , created_at
        , order_cost
        , shipping_cost
        , order_total
        , tracking_id
        , shipping_service
        , estimated_delivery_at
        , delivered_at
        , status
        , _fivetran_synced
    FROM snapshot_orders
    )

SELECT * FROM renamed_casted