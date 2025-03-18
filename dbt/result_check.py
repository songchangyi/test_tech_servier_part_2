import sqlite3

query_1 = "SELECT * FROM product_ventes;"

query_2 = "SELECT * FROM client_product_ventes;"

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