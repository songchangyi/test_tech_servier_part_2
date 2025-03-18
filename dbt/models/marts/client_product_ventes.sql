{{ config(materialized='view') }}

WITH product_ventes AS (
    SELECT 
        client_id, 
        prod_id, 
        prod_price * prod_qty AS prod_ventes 
    FROM {{ ref('transactions') }} 
    WHERE date BETWEEN "2020-01-01" AND "2020-12-31"
), client_product_ventes AS (
    SELECT 
        pv.client_id, 
        pv.prod_ventes, 
        pn.product_type 
    FROM product_ventes pv
    LEFT JOIN {{ ref('product_nomenclature') }} pn
        ON pv.prod_id = pn.product_id
)

SELECT
    client_id,
    SUM(CASE WHEN product_type = 'MEUBLE' THEN prod_ventes END) AS ventes_meuble,
    SUM(CASE WHEN product_type = 'DECO' THEN prod_ventes END) AS ventes_deco
FROM 
    client_product_ventes
GROUP BY 
    client_id