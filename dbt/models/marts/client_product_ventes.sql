{{ config(materialized='view') }}

WITH product_ventes AS (
    SELECT 
        client_id, 
        prod_id, 
        prod_price * prod_qty AS prod_ventes 
    FROM {{ ref('transactions') }} 
    WHERE strftime('%Y', date) = '2020'
)

SELECT 
    pv.client_id, 
    pv.prod_ventes, 
    pn.product_type 
FROM product_ventes pv
LEFT JOIN {{ ref('product_nomenclature') }} pn
    ON pv.prod_id = pn.product_id
