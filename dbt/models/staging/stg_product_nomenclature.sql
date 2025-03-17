{{ config(materialized='table') }}

SELECT
    *
FROM {{ source('main', 'product_nomenclature') }}
