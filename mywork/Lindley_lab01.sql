# Nathan Lindley (nfl6fh)
# 9/7/22
# DS 2002 - Lab01

USE northwind;

# 0
SELECT COUNT(*) FROM products;

# 1
SELECT product_name, quantity_per_unit FROM products;

# 2
SELECT product_code, product_name FROM products WHERE discontinued = 0;

# 3
SELECT product_code, product_name FROM products WHERE discontinued != 0;

# 4
SELECT product_name, list_price FROM products ORDER BY list_price DESC LIMIT 1;
SELECT product_name, list_price FROM products ORDER BY list_price ASC LIMIT 1;

# 5
SELECT product_code, product_name, list_price FROM products WHERE list_price < 20;

# 6
SELECT product_code, product_name, list_price FROM products WHERE list_price < 20 AND list_price > 15;

# 7
SELECT product_name, list_price FROM products WHERE list_price > (SELECT AVG(list_price) FROM products);

# 8
SELECT product_name, list_price FROM products ORDER BY list_price DESC LIMIT 10;

# 9
SELECT COUNT(*) FROM products WHERE discontinued = 0;
SELECT COUNT(*) FROM products WHERE discontinued != 0;

-- Extra Credit --

# 11
SELECT product_name, company, address FROM products JOIN suppliers;

# 12
SELECT * FROM (SELECT category, COUNT(*) AS count FROM products GROUP BY category) AS counts WHERE count > 5;

# 13
SELECT category, COUNT(*) AS count FROM products WHERE list_price < 20 GROUP BY category;