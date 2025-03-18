# Servier Technical Test

## Part II : SQL

### Objective
Use SQL to perform data analysis as demanded. Using DBT with SQLite offers a lightweight, easy-to-setup solution for this small projects.

PS : in the original question we are asked to filter on year 2019. Here 2020 is used instead to help result check.

### Description of the results
1. `product_ventes.sql` (**answer for Task 1**) : calculate total ventes by date. 
2. `client_product_ventes.sql` (**answer for Task 2**): calculate total ventes on different product types by client. 

### Commands
1. Install dependencies with Poetry : 
- `poetry install`
- `cd dbt`
2. Run models
    - To run all with build : `poetry run dbt build`
    - To run a specific command : 
        - `poetry run dbt seed`
        - `poetry run dbt run`
        - `poetry run dbt test`
3. Check resuts using : `poetry run python result_check.py`
Expected output : 
```
Q1 results : 
('2020-01-01', 524.24)

Q2 results : 
(845, 400.0, 60.0)
(999, 50.0, 14.24)
```
