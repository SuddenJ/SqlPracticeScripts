DROP TABLE IF EXISTS cust;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS junctionTable;


CREATE TABLE cust (
    id INTEGER PRIMARY KEY, 
    name TEXT,
    phone int,
);

CREATE TABLE items (
    id INTEGER PRIMARY KEY,
    name TEXT,
    description TEXT
);

CREATE TABLE junctionTable (
    id              INTEGER PRIMARY KEY,
    item_id         INTEGER,
    customer_id     INTEGER,
    date            TEXT,
    quantity        INTEGER,
    price           Money   
);

INSERT INTO cust ( id, name, phone) VALUES ( 1, 'John Smith', '027527555');
INSERT INTO cust ( id, name, phone) VALUES ( 2, 'Death Smith', '123494832');
INSERT INTO cust ( id, name, phone) VALUES ( 3, 'Ted Smith', '554353453');

INSERT INTO items ( id, name, description ) VALUES ( 1, 'Box of 64 Pixels', '64 RGB pixels in a decorative box' );
INSERT INTO items ( id, name, description ) VALUES ( 2, 'Sense of Humor', 'Especially dry. Imported from England.' );
INSERT INTO items ( id, name, description ) VALUES ( 3, 'Beauty', 'Inner beauty. No cosmetic surgery required!' );
INSERT INTO items ( id, name, description ) VALUES ( 4, 'Bar Code', 'Unused. In original packaging.' );

INSERT INTO junctionTable ( id, item_id, customer_id, date, quantity, price ) VALUES ( 1, 1, 2, '2022-07-27', 3, 10.1 );
INSERT INTO junctionTable ( id, item_id, customer_id, date, quantity, price ) VALUES ( 2, 2, 2, '2022-07-27', 1, 30.99 );
INSERT INTO junctionTable ( id, item_id, customer_id, date, quantity, price ) VALUES ( 3, 1, 1, '2022-07-28', 1, 15.56 );
INSERT INTO junctionTable ( id, item_id, customer_id, date, quantity, price ) VALUES ( 4, 4, 3, '2022-07-28', 2, 999.99 );
INSERT INTO junctionTable ( id, item_id, customer_id, date, quantity, price ) VALUES ( 5, 1, 2, '2022-07-28', 1, 10000.01 );

--This is the part to show the displayed table
SELECT j.date, i.name, i.description, j.price, c.name as cust_name
  FROM junctionTable AS j
  JOIN items AS i ON j.item_id = i.id
  JOIN cust AS c ON j.customer_id = c.id