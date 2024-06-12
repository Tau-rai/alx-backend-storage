-- This script creates a trigger that decreases the quantity of an item after adding a new order

DELIMITER $$
CREATE TRIGGER decrease_quantity AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - 1
    WHERE item_name = NEW.name;
END;