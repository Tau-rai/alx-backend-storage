-- This file has a script that creates a table with unique users


CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL
);