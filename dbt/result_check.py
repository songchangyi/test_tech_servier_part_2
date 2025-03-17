import sqlite3

query_1 = """
SELECT
	date, 
    SUM(prod_ventes) AS ventes 
FROM 
	PRODUCT_VENTES 
GROUP BY 
	date
;
"""

query_2 = """
SELECT 
    client_id,
    SUM(CASE WHEN product_type = 'MEUBLE' THEN prod_ventes END) AS ventes_meuble,
    SUM(CASE WHEN product_type = 'DECO' THEN prod_ventes END) AS ventes_deco
FROM 
    CLIENT_PRODUCT_VENTES
GROUP BY 
    client_id
;
"""

conn = sqlite3.connect('mydbt.db')

cursor = conn.cursor()

print("Q1 results : ")
cursor.execute(query_1)
rows = cursor.fetchall()
for row in rows:
    print(row)

print("\nQ2 results : ")
cursor.execute(query_2)
rows = cursor.fetchall()
for row in rows:
    print(row)

cursor.close()
conn.close()