# README

This README provides an overview of the MySQL Database essentials.

## Creating Tables with Constraints

To create a table with constraints in MySQL, you define the constraints within the `CREATE TABLE` statement. Constraints are rules applied to the columns of a table to enforce data integrity. Here's an example:

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);
```

In this example, `NOT NULL` ensures that the column cannot have a NULL value, `UNIQUE` ensures all values in the column are unique, and `PRIMARY KEY` is a constraint that uniquely identifies each record in the table.

## Optimizing Queries with Indexes

Indexes are used to retrieve data from the database more quickly. They are particularly important for improving the performance of queries on large tables. To add an index:

```sql
CREATE INDEX idx_username ON users (username);
```

This creates an index for the `username` column in the `users` table, which can speed up queries filtering or sorting based on the `username`.

## Implementing Stored Procedures and Functions

Stored procedures and functions are SQL statements that are stored in the database and can be executed whenever you need to perform a particular task.

### Stored Procedure

```sql
DELIMITER $$

CREATE PROCEDURE GetUserByEmail(IN user_email VARCHAR(100))
BEGIN
    SELECT * FROM users WHERE email = user_email;
END $$

DELIMITER ;
```

### Function

```sql
DELIMITER $$

CREATE FUNCTION GetUsernameById(user_id INT) RETURNS VARCHAR(50)
BEGIN
    RETURN (SELECT username FROM users WHERE id = user_id);
END $$

DELIMITER ;
```

## Implementing Views

Views are virtual tables that consist of a SQL query. Creating a view:

```sql
CREATE VIEW active_users AS
SELECT username, email FROM users WHERE active = 1;
```

Now, you can query the `active_users` view as you would a regular table.

## Implementing Triggers

Triggers are database operations that are automatically performed when certain events occur. Here's an example of a trigger that logs an audit entry after a new user is inserted:

```sql
DELIMITER $$

CREATE TRIGGER after_user_insert
AFTER INSERT ON users FOR EACH ROW
BEGIN
    INSERT INTO audit_log (user_id, action) VALUES (NEW.id, 'INSERT');
END $$

DELIMITER ;
```

This trigger inserts a new record into the `audit_log` table every time a new user is added to the `users` table.

```