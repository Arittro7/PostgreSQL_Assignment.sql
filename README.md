# Bonus Section

# :dart:Explain the Primary Key and Foreign Key concepts in PostgreSQL.

A Primary key is the uniquely identifier of each row in a table. A Primary key ensure that all the records of a tables are different and each row can be distinguished from others.

A Foreign key is a column or group of column of a table which reference the primary key of another table. A Foreign key used to build relation between two table.

Assume we have Two tables  
1. Course table 
2. Mentor Table 
 
Where course table contain tuples like (course_id, course_name, duration, fees) and Mentor table has (mentor_id, mentor_name)
Here course_id and mentor_id both are primary key for separate table, If I try to establish a relation between course table with mentor table the mentor_id will be the foreign key on the course table.

# :dart:Explain the purpose of the WHERE clause in a SELECT statement.

The where clause in a select statement used to filter the result to retrieve only those records which are required for a specific condition.

**For example:** Suppose We have a students table where millions of students data has been Inserted from all over the world and we want to filter out only those student who are from **Bangladesh**. In this case the where clause used.

```
SELECT * FROM students
WHERE country = 'Bangladesh';
```

# :dart:What are the LIMIT and OFFSET clauses used for?

The Limit and Offset clause both are used to control the queries to get required number of row, Where Limit specified the maximum number of row to return and Offset specified the number of rows to skip before starting the return of rows.

**Example**
To get only top 10 selling products
```
SELECT * FROM products LIMIT 10;
```
To see the products list of a table from 21 to 30
```
SELECT * FROM products LIMIT 10 OFFSET 30;
```



