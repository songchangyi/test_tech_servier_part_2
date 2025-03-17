{{ config(materialized='view') }}

SELECT
    date,
    prod_price * prod_qty AS prod_ventes
FROM {{ ref('transactions') }}
WHERE strftime('%Y', date) = '2020'
