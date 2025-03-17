{{ config(materialized='table') }}

SELECT
    *
FROM {{ source('main', 'transactions') }}
