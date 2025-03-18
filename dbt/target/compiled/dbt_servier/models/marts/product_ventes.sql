

SELECT
    date,
    SUM(prod_price * prod_qty) AS ventes
FROM main."transactions"
WHERE date BETWEEN "2020-01-01" AND "2020-12-31"
GROUP BY date
ORDER BY date