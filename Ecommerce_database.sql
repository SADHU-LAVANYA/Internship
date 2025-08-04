mysql> CREATE DATABASE ecommerce_site;
Query OK, 1 row affected (0.02 sec)

mysql> CREATE DATABASE ecommerce_Database;
Query OK, 1 row affected (0.01 sec)

mysql> use ecommerce_Database;
Database changed
mysql> CREATE TABLE users()
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql>  CREATE TABLE users(user_id INT Auto_incerment PRIMARY KEY,name VARCHAR(100),email VARCHAR(100) UNIQUE,Password VARCHAR(255),phone VARCHAR(15),address TEXT,created_at DATETIME DEFAULT CURRENT_TIMESTAMP,updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Auto_incerment PRIMARY KEY,name VARCHAR(100),email VARCHAR(100) UNIQUE,Password ' at line 1
mysql>  CREATE TABLE users(user_id INT AUTO_INCERMENT PRIMARY KEY,name VARCHAR(100),email VARCHAR(100) UNIQUE,Password VARCHAR(255),phone VARCHAR(15),address TEXT,created_at DATETIME DEFAULT CURRENT_TIMESTAMP,updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AUTO_INCERMENT PRIMARY KEY,name VARCHAR(100),email VARCHAR(100) UNIQUE,Password ' at line 1
mysql>  CREATE TABLE users(user_id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100),email VARCHAR(100) UNIQUE,Password VARCHAR(255),phone VARCHAR(15),address TEXT,created_at DATETIME DEFAULT CURRENT_TIMESTAMP,updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
Query OK, 0 rows affected (0.10 sec)

mysql> CREATE TABLE categories(category_id INT AUTO_INCERMENT PRIMARY KEY name VARCHAR(100),description TEXT);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AUTO_INCERMENT PRIMARY KEY name VARCHAR(100),description TEXT)' at line 1
mysql> CREATE TABLE categories(category_id INT AUTO_INCREMENT PRIMARY KEY name VARCHAR(100),description TEXT);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'name VARCHAR(100),description TEXT)' at line 1
mysql> CREATE TABLE categories(category_id INT AUTO_INCREMENT PRIMARY KEY name VARCHAR(100),description TEXT);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'name VARCHAR(100),description TEXT)' at line 1
mysql> CREATE TABLE categories(category_id INT AUTO_INCREMENT PRIMARY KEY name VARCHAR(100),description TEXT);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'name VARCHAR(100),description TEXT)' at line 1
mysql> CREATE TABLE categories(category_id INT AUTO_INCERMENT PRIMARY KEY, name VARCHAR(100),description TEXT);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AUTO_INCERMENT PRIMARY KEY, name VARCHAR(100),description TEXT)' at line 1
mysql> CREATE TABLE categories(category_id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100),description TEXT);
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE products(product_id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100),description TEXT,price DECIMAL(10,2),stock_quantity INT,category_id INT,brand VARCHAR(100),image_url VARCHAR(255),created_at DATETIME DEFAULT CURRENT_TIMESTAMP,updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,FOREIGN KEY(category_id) REFERENCES categories(category_id));
Query OK, 0 rows affected (0.07 sec)

mysql> CREATE TABLE cart(cart_id INT AUTO_INCREMENT PRIMARY KEY,user_id INT UNIQUE,created_at DATETIME DEFAULT CURRENT_TIMESTAMP,FOREIGN KEY (user_id) REFERENCES users(users_id));
ERROR 3734 (HY000): Failed to add the foreign key constraint. Missing column 'users_id' for constraint 'cart_ibfk_1' in the referenced table 'users'
mysql> CREATE TABLE cart(cart_id INT AUTO_INCREMENT PRIMARY KEY,user_id INT UNIQUE,created_at DATETIME DEFAULT CURRENT_TIMESTAMP,FOREIGN KEY (user_id) REFERENCES users(users_id));
ERROR 3734 (HY000): Failed to add the foreign key constraint. Missing column 'users_id' for constraint 'cart_ibfk_1' in the referenced table 'users'
mysql> CREATE TABLE cart(cart_id INT AUTO_INCREMENT PRIMARY KEY,user_id INT UNIQUE,created_at DATETIME DEFAULT CURRENT_TIMESTAMP,FOREIGN KEY (user_id) REFERENCES users(user_id));
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE cart_items(cart_item_id INT AUTO_INCREMENT PRIMARY KEY,cart_id INT,product_id INT,quantity INT,FOREIGN KEY(cart_id) REFERENCES cart(cart_id),FOREIGN KEY(product_id) REFERENCES product(product_id));
ERROR 1824 (HY000): Failed to open the referenced table 'product'
mysql> CREATE TABLE cart_items(cart_item_id INT AUTO_INCREMENT PRIMARY KEY,cart_id INT,product_id INT,quantity INT,FOREIGN KEY(cart_id) REFERENCES cart(cart_id),FOREIGN KEY(product_id) REFERENCES products(product_id));
Query OK, 0 rows affected (0.07 sec)

mysql> CREATE TABLE orders (
    ->     order_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     user_id INT,
    ->     total_amount DECIMAL(10,2),
    ->     status VARCHAR(50),
    ->     payment_method VARCHAR(50),
    ->     created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    ->     updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ->     FOREIGN KEY (user_id) REFERENCES users(user_id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE order_items (
    ->     order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     order_id INT,
    ->     product_id INT,
    ->     quantity INT,
    ->     price DECIMAL(10,2),
    ->     FOREIGN KEY (order_id) REFERENCES orders(order_id),
    ->     FOREIGN KEY (product_id) REFERENCES products(product_id)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> CREATE TABLE payments (
    ->     payment_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     order_id INT,
    ->     amount DECIMAL(10,2),
    ->     payment_method VARCHAR(50),
    ->     payment_status VARCHAR(50),
    ->     payment_date DATETIME,
    ->     FOREIGN KEY (order_id) REFERENCES orders(order_id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE shipping (
    ->     shipping_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     order_id INT,
    ->     shipping_address TEXT,
    ->     shipping_method VARCHAR(50),
    ->     shipping_status VARCHAR(50),
    ->     shipped_date DATETIME,
    ->     delivery_date DATETIME,
    ->     FOREIGN KEY (order_id) REFERENCES orders(order_id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE reviews (
    ->     review_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     user_id INT,
    ->     product_id INT,
    ->     rating INT CHECK (rating BETWEEN 1 AND 5),
    ->     comment TEXT,
    ->     created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    ->     FOREIGN KEY (user_id) REFERENCES users(user_id),
    ->     FOREIGN KEY (product_id) REFERENCES products(product_id)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql>