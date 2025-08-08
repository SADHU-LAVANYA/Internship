Microsoft Windows [Version 10.0.26100.4770]
(c) Microsoft Corporation. All rights reserved.

C:\Users\Lavanya sadhu>mysql -u root -p
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.43 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SELECT Name, SUM(Marks) AS Total_Marks
    -> FROM StudentMarks
    -> GROUP BY Name;
ERROR 1046 (3D000): No database selected
mysql> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| danceteam          |
| ecommerce_database |
| ecommerce_site     |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
7 rows in set (0.12 sec)

mysql> use danceteam
Database changed
mysql> CREATE TABLE StudentMarks (
    ->     StudentID INT,
    ->     Name VARCHAR(50),
    ->     Subject VARCHAR(50),
    ->     Marks INT
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO StudentMarks VALUES (1, 'Aakash', 'Math', 85);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO StudentMarks VALUES (2, 'Bhavna', 'Math', 78);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO StudentMarks VALUES (1, 'Aakash', 'Science', 90);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO StudentMarks VALUES (2, 'Bhavna', 'Science', 88);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO StudentMarks VALUES (3, 'Charan', 'Math', 92);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO StudentMarks VALUES (3, 'Charan', 'Science', 95);
Query OK, 1 row affected (0.00 sec)

mysql> SELECT Name, SUM(Marks) AS Total_Marks
    -> FROM StudentMarks
    -> GROUP BY Name;
+--------+-------------+
| Name   | Total_Marks |
+--------+-------------+
| Aakash |         175 |
| Bhavna |         166 |
| Charan |         187 |
+--------+-------------+
3 rows in set (0.01 sec)

mysql> SELECT Subject, AVG(Marks) AS Average_Marks
    -> FROM StudentMarks
    -> GROUP BY Subject;
+---------+---------------+
| Subject | Average_Marks |
+---------+---------------+
| Math    |       85.0000 |
| Science |       91.0000 |
+---------+---------------+
2 rows in set (0.01 sec)

mysql> SELECT Subject, COUNT(DISTINCT StudentID) AS Student_Count
    -> FROM StudentMarks
    -> GROUP BY Subject;
+---------+---------------+
| Subject | Student_Count |
+---------+---------------+
| Math    |             3 |
| Science |             3 |
+---------+---------------+
2 rows in set (0.01 sec)

mysql> SELECT Name, SUM(Marks) AS Total_Marks
    -> FROM StudentMarks
    -> GROUP BY Name
    -> HAVING Total_Marks > 170;
+--------+-------------+
| Name   | Total_Marks |
+--------+-------------+
| Aakash |         175 |
| Charan |         187 |
+--------+-------------+
2 rows in set (0.00 sec)
