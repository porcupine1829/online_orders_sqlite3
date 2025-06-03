
-- >sqlite3 orders.db

CREATE TABLE orders (
  order_id         INTEGER PRIMARY KEY,
  date             DATE,
  product_category TEXT,
  product_name     TEXT,
  units_sold       INTEGER,
  unit_price       REAL,
  total_revenue    REAL,
  region           TEXT,
  payment_method   TEXT
);

--In sqlite3 shell
-->.mode csv
-->.import online_orders_data.csv --skip 1 orders


-- Query 1:Fetch monthly_revenue and order_volume of Quarter 1
SELECT
  CAST(strftime('%Y', date) AS INTEGER) AS year,
  CAST(strftime('%m', date) AS INTEGER) AS month,
  SUM(total_revenue)                      AS monthly_revenue,
  COUNT(DISTINCT order_id)                AS order_volume
FROM
  orders
GROUP BY
  month
ORDER BY
  month ASC
LIMIT 4
;


-- Query 2:Fetch top 3 months with highest revenue
SELECT
  CAST(strftime('%Y', date) AS INTEGER) AS year,
  CAST(strftime('%m', date) AS INTEGER) AS month,
  SUM(total_revenue)                      AS monthly_revenue,
  COUNT(DISTINCT order_id)                AS order_volume
FROM
  orders
GROUP BY
  month
ORDER BY
  monthly_revenue ASC
LIMIT 3
;