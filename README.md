# Bonus Section

# :dart:Explain the Primary Key and Foreign Key concepts in PostgreSQL.

A Primary key is the uniquely identifier of each row in a table. A Primary key ensure that all the records of a tables are different and each row can be distinguished from others.

A Foreign key is a column or group of column of a table which reference the primary key of another table. A Foreign key used to build relation between two table.

Assume we have Two tables  
1. Course table 
2. Mentor Table 
 
Where course table contain tuples like (course_id, course_name, duration, fees) and Mentor table has (mentor_id, mentor_name)
Here course_id and mentor_id both are primary key for separate table, If I try to establish a relation between course table with mentor table the mentor_id will be the foreign key on the course table.

# Explain the purpose of the WHERE clause in a SELECT statement.