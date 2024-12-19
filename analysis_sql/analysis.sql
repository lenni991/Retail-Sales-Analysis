-- validating
select count(*) from orders_mod;

select * from orders_mod LIMIT 10;

PRAGMA table_info(orders_mod);


-- top 10 highest/lowest revueue generating products
with CTE_TOP_PRODUCTS AS(
    SELECT *, sum(sale_price) as sales
    from orders_mod 
    group by product_id
)
SELECT product_id, sales
FROM CTE_TOP_PRODUCTS 
ORDER BY sales DESC LIMIT 10; 



-- top 5 highest selling products in each region
with cte_region as (
    SELECT region, product_id, sum(sale_price) as sales
    from orders_mod 
    group by region,product_id
    ORDER BY region, sales
)
select * 
from (SELECT * , row_number() OVER(PARTITION BY region ORDER BY sales DESC) as row_num FROM cte_region)
where row_num <= 5;


--finding month over month growth comparsion for 2022 and 2023 sales eg : jan 2022 vs jan 2023

--select substr(order_date,0,5) from orders_mod;
SELECT sum(sale_price), strftime('%Y', order_date) AS year
FROM orders_mod
GROUP BY year;

SELECT strftime('%Y', order_date) AS year, strftime('%m', order_date) AS month, CAST(sum(sale_price) AS INTERGER) AS sales
FROM orders_mod
GROUP BY year, month
ORDER BY year, month;

--for each category which month had highest sales
SELECT category, substr(order_date,0,8) AS order_year_month, sum(sale_price) AS sales
FROM orders_mod
GROUP BY 1, 2;


WITH monthly_sales AS (
    SELECT category, strftime('%Y-%m', order_date) AS date, sum(sale_price) AS sales
    FROM orders_mod
    GROUP BY category, date
)
SELECT category, date, sales
FROM monthly_sales
WHERE sales = (
    SELECT max(sales)
    FROM monthly_sales sub
    WHERE sub.category = monthly_sales.category
);


--which sub catergory had highest growth by profit in 2023 compare to 2022
with cte_subcat as ( 
    SELECT sub_category, strftime('%Y', order_date) AS year, sum(sale_price) AS sales
    FROM orders_mod
    GROUP BY sub_category, year
)
SELECT a.sub_category, a.sales AS sales_2022, b.sales AS sales_2023, 
       round((b.sales - a.sales)*100/a.sales,2) AS growth
FROM cte_subcat a
JOIN cte_subcat b ON a.sub_category = b.sub_category
WHERE a.year = '2022' AND b.year = '2023'
ORDER BY growth DESC;




