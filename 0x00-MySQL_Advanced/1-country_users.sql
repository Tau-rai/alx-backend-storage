-- This scripts creates a table to store the users of a country

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255),
    country VARCHAR(255) NOT NULL ENUM('US', 'CO', 'TN') DEFAULT 'US',
    PRIMARY KEY (id)
);