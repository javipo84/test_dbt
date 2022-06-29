WITH src_promos AS (
    SELECT * 
    FROM {{ ref('base_postgres_public_promos') }}
    ),

renamed_casted AS (
    SELECT
    promo_id
    , name_promo
    , total_discount_usd
    , status_promo
    , date_load
    FROM src_promos
    )

SELECT * FROM renamed_casted