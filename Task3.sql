Microsoft Windows [Version 10.0.26100.4770]
(c) Microsoft Corporation. All rights reserved.

C:\Users\Lavanya sadhu>mysql -u root -p
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.43 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use Danceteam
Database changed
mysql> CREATE TABLE Students (
    ->     StudentID INT PRIMARY KEY,
    ->     Name VARCHAR(50),
    ->     Age INT,
    ->     Grade CHAR(1),
    ->     City VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO Students VALUES (1, 'Aakash', 18, 'A', 'Hyderabad');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Students VALUES (2, 'Bhavna', 19, 'B', 'Delhi');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Students VALUES (3, 'Charan', 17, 'A', 'Chennai');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Students VALUES (4, 'Divya', 20, 'C', 'Mumbai');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Students VALUES (5, 'Esha', 18, 'B', 'Hyderabad');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Students VALUES (6, 'Farhan', 21, 'A', 'Delhi');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM Students;
+-----------+--------+------+-------+-----------+
| StudentID | Name   | Age  | Grade | City      |
+-----------+--------+------+-------+-----------+
|         1 | Aakash |   18 | A     | Hyderabad |
|         2 | Bhavna |   19 | B     | Delhi     |
|         3 | Charan |   17 | A     | Chennai   |
|         4 | Divya  |   20 | C     | Mumbai    |
|         5 | Esha   |   18 | B     | Hyderabad |
|         6 | Farhan |   21 | A     | Delhi     |
+-----------+--------+------+-------+-----------+
6 rows in set (0.00 sec)

mysql> SELECT Name, Grade FROM Students;
+--------+-------+
| Name   | Grade |
+--------+-------+
| Aakash | A     |
| Bhavna | B     |
| Charan | A     |
| Divya  | C     |
| Esha   | B     |
| Farhan | A     |
+--------+-------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM Students
    -> WHERE City = 'Delhi';
+-----------+--------+------+-------+-------+
| StudentID | Name   | Age  | Grade | City  |
+-----------+--------+------+-------+-------+
|         2 | Bhavna |   19 | B     | Delhi |
|         6 | Farhan |   21 | A     | Delhi |
+-----------+--------+------+-------+-------+
2 rows in set (0.01 sec)

mysql> SELECT * FROM Students
    -> WHERE Grade = 'A' AND City = 'Hyderabad';
+-----------+--------+------+-------+-----------+
| StudentID | Name   | Age  | Grade | City      |
+-----------+--------+------+-------+-----------+
|         1 | Aakash |   18 | A     | Hyderabad |
+-----------+--------+------+-------+-----------+
1 row in set (0.00 sec)

mysql> SELECT * FROM Students
    -> WHERE Grade = 'A' OR Grade = 'B';
+-----------+--------+------+-------+-----------+
| StudentID | Name   | Age  | Grade | City      |
+-----------+--------+------+-------+-----------+
|         1 | Aakash |   18 | A     | Hyderabad |
|         2 | Bhavna |   19 | B     | Delhi     |
|         3 | Charan |   17 | A     | Chennai   |
|         5 | Esha   |   18 | B     | Hyderabad |
|         6 | Farhan |   21 | A     | Delhi     |
+-----------+--------+------+-------+-----------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM Students
    -> WHERE Name LIKE 'A%';  -- names starting with A
+-----------+--------+------+-------+-----------+
| StudentID | Name   | Age  | Grade | City      |
+-----------+--------+------+-------+-----------+
|         1 | Aakash |   18 | A     | Hyderabad |
+-----------+--------+------+-------+-----------+
1 row in set (0.01 sec)

mysql> ^C
mysql> SELECT * FROM Students
    -> WHERE Age BETWEEN 18 AND 20;
+-----------+--------+------+-------+-----------+
| StudentID | Name   | Age  | Grade | City      |
+-----------+--------+------+-------+-----------+
|         1 | Aakash |   18 | A     | Hyderabad |
|         2 | Bhavna |   19 | B     | Delhi     |
|         4 | Divya  |   20 | C     | Mumbai    |
|         5 | Esha   |   18 | B     | Hyderabad |
+-----------+--------+------+-------+-----------+
4 rows in set (0.01 sec)

mysql>
mysql> SELECT * FROM Students
    -> ORDER BY Age ASC;   -- ascending order
+-----------+--------+------+-------+-----------+
| StudentID | Name   | Age  | Grade | City      |
+-----------+--------+------+-------+-----------+
|         3 | Charan |   17 | A     | Chennai   |
|         1 | Aakash |   18 | A     | Hyderabad |
|         5 | Esha   |   18 | B     | Hyderabad |
|         2 | Bhavna |   19 | B     | Delhi     |
|         4 | Divya  |   20 | C     | Mumbai    |
|         6 | Farhan |   21 | A     | Delhi     |
+-----------+--------+------+-------+-----------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM Students
    -> ORDER BY Name DESC; -- descending order
+-----------+--------+------+-------+-----------+
| StudentID | Name   | Age  | Grade | City      |
+-----------+--------+------+-------+-----------+
|         6 | Farhan |   21 | A     | Delhi     |
|         5 | Esha   |   18 | B     | Hyderabad |
|         4 | Divya  |   20 | C     | Mumbai    |
|         3 | Charan |   17 | A     | Chennai   |
|         2 | Bhavna |   19 | B     | Delhi     |
|         1 | Aakash |   18 | A     | Hyderabad |
+-----------+--------+------+-------+-----------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM Students
    -> LIMIT 3;
+-----------+--------+------+-------+-----------+
| StudentID | Name   | Age  | Grade | City      |
+-----------+--------+------+-------+-----------+
|         1 | Aakash |   18 | A     | Hyderabad |
|         2 | Bhavna |   19 | B     | Delhi     |
|         3 | Charan |   17 | A     | Chennai   |
+-----------+--------+------+-------+-----------+
3 rows in set (0.00 sec)

mysql> ^A