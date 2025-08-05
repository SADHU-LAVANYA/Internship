Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows

PS C:\Users\Lavanya sadhu> mysql -u root -p
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.43 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

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
7 rows in set (0.00 sec)

mysql> use danceteam
Database changed
mysql> CREATE TABLE DanceClub (
    ->     MemberID INT PRIMARY KEY,
    ->     FirstName VARCHAR(50) NOT NULL,
    ->     LastName VARCHAR(50) NOT NULL,
    ->     DanceStyle VARCHAR(50) DEFAULT 'Freestyle',
    ->     Age INT,
    ->     Level VARCHAR(20) DEFAULT 'Beginner'
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO DanceClub (MemberID, FirstName, LastName, DanceStyle, Age, Level)
    -> VALUES (1, 'Anu', 'Thalari', 'Bharatanatyam', 25, 'Intermediate');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO DanceClub (MemberID, FirstName, LastName, DanceStyle, Age)
    -> VALUES (2, 'Lavanya', 'Sadhu', 'Hip Hop', 22);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO DanceClub (MemberID, FirstName, LastName)
    -> VALUES (3, 'Ajay', 'Kumar');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO DanceClub (MemberID, FirstName, LastName, Age)
    -> VALUES (4, 'Durga', 'Bhavani', 27);INSERT INTO DanceClub (MemberID, FirstName, LastName, DanceStyle, Age, Level)
Query OK, 1 row affected (0.01 sec)

    -> VALUES (5, 'Srishanth', 'Sai', 'Contemporary', 30, 'Advanced');
Query OK, 1 row affected (0.00 sec)

mysql> UPDATE DanceClub
    -> SET DanceStyle = 'Salsa', Age = 26, Level = 'Beginner'
    -> WHERE FirstName = 'Ajay' AND LastName = 'Kumar';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE DanceClub
    -> SET DanceStyle = 'Kathak'
    -> WHERE FirstName = 'Durga' AND LastName = 'Bhavani';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM DanceClub
    -> WHERE Age < 23;
Query OK, 1 row affected (0.01 sec)

mysql> DELETE FROM DanceClub
    -> WHERE Level = 'Beginner';
Query OK, 2 rows affected (0.01 sec)

mysql> select * from DanceClub;
+----------+-----------+----------+---------------+------+--------------+
| MemberID | FirstName | LastName | DanceStyle    | Age  | Level        |
+----------+-----------+----------+---------------+------+--------------+
|        1 | Anu       | Thalari  | Bharatanatyam |   25 | Intermediate |
|        5 | Srishanth | Sai      | Contemporary  |   30 | Advanced     |
+----------+-----------+----------+---------------+------+--------------+
2 rows in set (0.01 sec)

mysql>
