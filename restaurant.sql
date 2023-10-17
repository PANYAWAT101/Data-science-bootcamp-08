# My first SQL program

-- open our database
.open restaurant.db

-- create table customers
CREATE TABLE IF NOT EXISTS customers (
    customers_id int,
    name text,
    location text
);

INSERT INTO customers VALUES 
    (01, "Zun", "NBI"),
    (02, "Toy", "BKK"),
    (03, "Lisa", "PTE"),
    (04, "Ton",  "BKK"),
    (05, "Mina", "NPT");

  -- create table menus
CREATE TABLE IF NOT EXISTS menus (
    menus_id int,
    namefood text,
    price real
);

INSERT INTO menus VALUES 
    (101,"Ice Coffee", 150.0),
    (102,"Coco", 120.0),
    (103,"Matcha Latte", 140.0),
    (104,"Lemon Soda",  90.0),
    (105,"Thai Tea", 110.0),
    (106,"Cheese Cake", 95.0),
    (107,"Brownie", 70.0),
    (108,"Croissant", 90.0);

  -- create table orders
CREATE TABLE IF NOT EXISTS orders (
    orders_date date,
    customers_id int,
    menus_id int
);

INSERT INTO orders VALUES 
    ("2023-10-10", 01, 101),
    ("2023-07-10", 01, 107),
    ("2023-07-10", 03, 104),
    ("2023-07-11", 02, 103),
    ("2023-07-11", 02, 108),
    ("2023-07-12", 05, 105),
    ("2023-07-14", 04, 108),
    ("2023-07-14", 04, 102),
    ("2023-07-15", 01, 106),
    ("2023-07-16", 02, 107);

 -- create table rewards
CREATE TABLE IF NOT EXISTS rewards (
    customers_id int,
    total_spends real,
    point int
  );

INSERT INTO rewards VALUES 
    (01 , 315.0 ,120),
    (02 , 300.0 ,100),
    (03 , 90.0  ,20 ),
    (04 , 210.0 ,60 ),
    (05 , 110.0 ,35 );


.table 

.mode box

-- query 1 : aggregate function 
SELECT
  MAX(total_spends) as max_total_cus,
  MIN(total_spends) as min_total_cus,
  AVG(total_spends) as avg_total_sales
FROM rewards;

-- query 2 : join
select 
  ct.name,
  ct.location,
  mu.namefood,
  od.orders_date,
  mu.price
from customers as ct 
join orders as od 
on ct.customers_id = od.customers_id
join menus as mu 
on od.menus_id = mu.menus_id ;

-- query 3 : subquery

select
  sub1.name,
  sub2.total_spends
from(select * from customers
  where location like "B%") as sub1
join(select * from rewards
  where point >= 15 ) as sub2
on sub1.customers_id = sub2.customers_id;


