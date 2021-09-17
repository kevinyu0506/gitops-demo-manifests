CREATE DATABASE order_application;
USE order_application; 

CREATE USER 'order-admin'@'%' IDENTIFIED BY 'admin-password';
CREATE USER 'order-user'@'%' IDENTIFIED BY 'user-password';

GRANT ALL PRIVILEGES ON order_application.* TO 'order-admin'@'%';
GRANT SELECT, INSERT, DELETE ON order_application.* TO 'order-user'@'%';

CREATE TABLE customers (
    customerId INT NOT NULL AUTO_INCREMENT,
    customerName varchar(20) NOT NULL,

    PRIMARY KEY (customerId)
);

CREATE TABLE items (
    itemId INT NOT NULL AUTO_INCREMENT,
    itemName varchar(20) NOT NULL,

    PRIMARY KEY (itemId)
);

CREATE TABLE orders (
    orderId INT NOT NULL,
    customerId INT NOT NULL,

    PRIMARY KEY (orderId),
    CONSTRAINT constr_order_customer_fk FOREIGN KEY customer_fk (customerId) REFERENCES customers (customerId) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE order_items (
    orderId INT NOT NULL,
    itemId INT NOT NULL,

    PRIMARY KEY (orderId, itemId),
    CONSTRAINT constr_orderitem_order_fk FOREIGN KEY order_fk (orderId) REFERENCES orders (orderId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT constr_orderitem_item_fk FOREIGN KEY item_fk (itemId) REFERENCES items (itemId) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO customers (customerName) VALUES ('Steve');
INSERT INTO customers (customerName) VALUES ('Dave');
INSERT INTO customers (customerName) VALUES ('Ann');
INSERT INTO customers (customerName) VALUES ('Bob');

INSERT INTO items (itemName) VALUES ('Apple');
INSERT INTO items (itemName) VALUES ('Banana');
INSERT INTO items (itemName) VALUES ('Coffe');
INSERT INTO items (itemName) VALUES ('Donut');

INSERT INTO orders (customerId, orderId) VALUES (1, 1);
INSERT INTO orders (customerId, orderId) VALUES (1, 2);
INSERT INTO orders (customerId, orderId) VALUES (1, 3);
INSERT INTO orders (customerId, orderId) VALUES (2, 4);
INSERT INTO orders (customerId, orderId) VALUES (2, 5);
INSERT INTO orders (customerId, orderId) VALUES (3, 6);
INSERT INTO orders (customerId, orderId) VALUES (4, 7);
INSERT INTO orders (customerId, orderId) VALUES (4, 8);
INSERT INTO orders (customerId, orderId) VALUES (4, 9);
INSERT INTO orders (customerId, orderId) VALUES (4, 10);

INSERT INTO order_items (orderId, itemId) VALUES (1, 1);
INSERT INTO order_items (orderId, itemId) VALUES (1, 2);
INSERT INTO order_items (orderId, itemId) VALUES (1, 3);
INSERT INTO order_items (orderId, itemId) VALUES (1, 4);
INSERT INTO order_items (orderId, itemId) VALUES (2, 1);
INSERT INTO order_items (orderId, itemId) VALUES (2, 4);
INSERT INTO order_items (orderId, itemId) VALUES (3, 1);
INSERT INTO order_items (orderId, itemId) VALUES (3, 3);
INSERT INTO order_items (orderId, itemId) VALUES (3, 4);
INSERT INTO order_items (orderId, itemId) VALUES (4, 1);
INSERT INTO order_items (orderId, itemId) VALUES (5, 1);
INSERT INTO order_items (orderId, itemId) VALUES (5, 2);
INSERT INTO order_items (orderId, itemId) VALUES (5, 3);
INSERT INTO order_items (orderId, itemId) VALUES (5, 4);
INSERT INTO order_items (orderId, itemId) VALUES (6, 3);
INSERT INTO order_items (orderId, itemId) VALUES (6, 4);
INSERT INTO order_items (orderId, itemId) VALUES (7, 1);
INSERT INTO order_items (orderId, itemId) VALUES (8, 3);
INSERT INTO order_items (orderId, itemId) VALUES (8, 4);
INSERT INTO order_items (orderId, itemId) VALUES (9, 1);
INSERT INTO order_items (orderId, itemId) VALUES (10, 1);
INSERT INTO order_items (orderId, itemId) VALUES (10, 2);

