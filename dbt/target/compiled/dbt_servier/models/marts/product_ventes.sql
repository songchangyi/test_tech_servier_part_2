

SELECT
    date,
    prod_price * prod_qty AS prod_ventes
FROM main."transactions"
WHERE strftime('%Y', date) = '2020'