-- Create Type

create type grocery_shop.status as enum('SUBMITTED', 'PROCESSED', 'IN-TRANSIT', 'SHIPPED');

drop table grocery_shop.customers;
drop table grocery_shop.sellers;
drop table grocery_shop.products;
drop table grocery_shop.orders;

-- Create Tables
create table if not exists grocery_shop.customers (
    customer_id varchar(15) primary key,
    customer_name varchar(40),
    customer_email varchar(40),
    customer_address varchar(60),
    last_update_time timestamp NOT NULL
);

create table if not exists grocery_shop.sellers (
    seller_id varchar(15) primary key,
    seller_name varchar(40),
    seller_company varchar(40),
    seller_email varchar(40),
    seller_address varchar(60),
    last_update_time timestamp NOT NULL
);

create table if not exists grocery_shop.products (
    product_id integer primary key,
    product_name varchar(40),
    product_cost money,
    product_quantity int,
    seller_id varchar(15),
    last_update_time timestamp NOT NULL,
    CONSTRAINT sellers FOREIGN KEY (seller_id) REFERENCES grocery_shop.sellers (seller_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);

create table if not exists grocery_shop.orders (
    order_id integer,
    customer_id varchar(15),
    item_ordered integer,
    order_quantity integer,
    order_status grocery_shop.status,
    tracking_number varchar(20),
    create_time timestamp,
    last_update_time timestamp NOT NULL,
    CONSTRAINT customers FOREIGN KEY (customer_id) REFERENCES grocery_shop.customers (customer_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Insert Customers
insert into grocery_shop.customers (customer_id, customer_name, customer_email, customer_address, last_update_time) values('53-570-6948', 'Alan Turing', 'aturing@science.br', '56 Di Loreto Terrace', '2022-07-08 12:00:00'::timestamp);
insert into grocery_shop.customers (customer_id, customer_name, customer_email, customer_address, last_update_time) values('23-606-4767', 'Bob Barker', 'barkerbob@google.com.br', '593 Thompson Drive', '2022-07-09 12:00:00'::timestamp);
insert into grocery_shop.customers (customer_id, customer_name, customer_email, customer_address, last_update_time) values('14-786-6861', 'Chris Farley', 'funnyfarley@giggle.net', '1 Gale Court', '2022-07-09 12:00:00'::timestamp);
insert into grocery_shop.customers (customer_id, customer_name, customer_email, customer_address, last_update_time) values('58-308-6113', 'Luke Skywalker', 'theforce@jedi.com', '2 Declaration Pass', '2022-07-10 12:00:00'::timestamp);
insert into grocery_shop.customers (customer_id, customer_name, customer_email, customer_address, last_update_time) values('19-791-0773', 'Ronald Reagan', 'mrpresidentactor4@usa.gov', '32 Bluestem Avenue', '2022-07-11 12:00:00'::timestamp);

-- Insert Sellers
insert into grocery_shop.sellers (seller_id, seller_name, seller_company, seller_email, seller_address, last_update_time) values('87-017-4611', 'Rad Rainbird', 'Nlounge', 'rrainbird0@nlounge.com', '13 Sundown Way', '2022-07-12 12:00:00'::timestamp);
insert into grocery_shop.sellers (seller_id, seller_name, seller_company, seller_email, seller_address, last_update_time) values('51-894-3698', 'Clarence Hulstrom', 'Mybuzz', 'chulstrom1@mybuzz.com', '26 Iowa Lane', '2022-07-12 12:00:00'::timestamp);
insert into grocery_shop.sellers (seller_id, seller_name, seller_company, seller_email, seller_address, last_update_time) values('79-156-2194', 'Neddie Labell', 'Wordware', 'nlabell2@wordware.jp', '82 Mifflin Alley', '2022-07-13 12:00:00'::timestamp);
insert into grocery_shop.sellers (seller_id, seller_name, seller_company, seller_email, seller_address, last_update_time) values('50-617-6068', 'Tess Loiterton', 'Skivee', 'tloiterton3@skivee.com', '71 Washington Hill', '2022-07-13 12:00:00'::timestamp);
insert into grocery_shop.sellers (seller_id, seller_name, seller_company, seller_email, seller_address, last_update_time) values('35-950-3000', 'Randie Gresser', 'Skipstorm', 'rgresser4@skipstorm.com', '1 Montana Court', '2022-07-14 12:00:00'::timestamp);


-- Insert Products
insert into grocery_shop.products (product_id, product_name, product_cost, product_quantity, seller_id, last_update_time) values(1, 'Pork - Caul Fat', '$5.63', 16, '87-017-4611', '2022-07-11 18:58:42'::timestamp);
insert into grocery_shop.products (product_id, product_name, product_cost, product_quantity, seller_id, last_update_time) values(2, 'Tarragon - Primerba, Paste', '$27.94', 20, '51-894-3698', '2022-07-09 20:05:52'::timestamp);
insert into grocery_shop.products (product_id, product_name, product_cost, product_quantity, seller_id, last_update_time) values(3, 'Bagel - Ched Chs Presliced', '$18.01', 26, '79-156-2194', '2022-07-10 04:32:17'::timestamp);
insert into grocery_shop.products (product_id, product_name, product_cost, product_quantity, seller_id, last_update_time) values(4, 'V8 Splash Strawberry Kiwi', '$33.85', 16, '50-617-6068', '2022-07-08 12:52:26'::timestamp);
insert into grocery_shop.products (product_id, product_name, product_cost, product_quantity, seller_id, last_update_time) values(5, 'Potatoes - Yukon Gold, 80 Ct', '$33.92', 12, '35-950-3000', '2022-07-11 07:09:15'::timestamp);

-- Insert Orders
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6706', '53-570-6948', 1, 1, 'SUBMITTED', 'N/A', '2022-07-13 11:54:00'::timestamp, '2022-07-13 11:54:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6706', '53-570-6948', 3, 1, 'SUBMITTED', 'N/A', '2022-07-13 11:54:00'::timestamp, '2022-07-13 11:54:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6706', '53-570-6948', 5, 2, 'SUBMITTED', 'N/A', '2022-07-13 11:54:00'::timestamp, '2022-07-13 11:54:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6707', '23-606-4767', 1, 2, 'SUBMITTED', 'N/A', '2022-07-13 11:55:00'::timestamp, '2022-07-13 11:55:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6707', '23-606-4767', 3, 1, 'SUBMITTED', 'N/A', '2022-07-13 11:55:00'::timestamp, '2022-07-13 11:55:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6708', '14-786-6861', 2, 1, 'SUBMITTED', 'N/A', '2022-07-13 11:56:00'::timestamp, '2022-07-13 11:56:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6708', '14-786-6861', 4, 1, 'SUBMITTED', 'N/A', '2022-07-13 11:56:00'::timestamp, '2022-07-13 11:56:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6709', '58-308-6113', 1, 1, 'SUBMITTED', 'N/A', '2022-07-13 11:57:00'::timestamp, '2022-07-13 11:57:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6710', '19-791-0773', 2, 3, 'SUBMITTED', 'N/A', '2022-07-13 11:58:00'::timestamp, '2022-07-13 11:58:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6706', '53-570-6948', 1, 1, 'PROCESSED', 'N/A', '2022-07-13 11:54:00'::timestamp, '2022-07-13 12:54:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6706', '53-570-6948', 3, 1, 'PROCESSED', 'N/A', '2022-07-13 11:54:00'::timestamp, '2022-07-13 12:54:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6706', '53-570-6948', 5, 2, 'PROCESSED', 'N/A', '2022-07-13 11:54:00'::timestamp, '2022-07-13 12:54:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6707', '23-606-4767', 1, 2, 'PROCESSED', 'N/A', '2022-07-13 11:55:00'::timestamp, '2022-07-13 12:55:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6707', '23-606-4767', 3, 1, 'PROCESSED', 'N/A', '2022-07-13 11:55:00'::timestamp, '2022-07-13 12:55:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6708', '14-786-6861', 2, 1, 'PROCESSED', 'N/A', '2022-07-13 11:56:00'::timestamp, '2022-07-13 12:56:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6708', '14-786-6861', 4, 1, 'PROCESSED', 'N/A', '2022-07-13 11:56:00'::timestamp, '2022-07-13 12:56:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6709', '58-308-6113', 1, 1, 'PROCESSED', 'N/A', '2022-07-13 11:57:00'::timestamp, '2022-07-13 12:57:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6710', '19-791-0773', 2, 3, 'PROCESSED', 'N/A', '2022-07-13 11:58:00'::timestamp, '2022-07-13 12:58:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6708', '14-786-6861', 2, 1, 'IN-TRANSIT', '1349826936', '2022-07-13 11:56:00'::timestamp, '2022-07-14 11:56:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6708', '14-786-6861', 4, 1, 'IN-TRANSIT', '1349826936', '2022-07-13 11:56:00'::timestamp, '2022-07-14 11:56:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6709', '58-308-6113', 1, 1, 'IN-TRANSIT', '7616308716', '2022-07-13 11:57:00'::timestamp, '2022-07-14 11:57:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6710', '19-791-0773', 2, 3, 'IN-TRANSIT', '4276596882', '2022-07-13 11:58:00'::timestamp, '2022-07-14 11:58:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6709', '58-308-6113', 1, 1, 'SHIPPED', '7616308716', '2022-07-13 11:57:00'::timestamp, '2022-07-16 11:57:00'::timestamp);
insert into grocery_shop.orders (order_id, customer_id, item_ordered, order_quantity, order_status, tracking_number, create_time, last_update_time) values('6710', '19-791-0773', 2, 3, 'SHIPPED', '4276596882', '2022-07-13 11:58:00'::timestamp, '2022-07-16 11:58:00'::timestamp);

select * from grocery_shop.customers;
select * from grocery_shop.sellers;
select * from grocery_shop.products;
select * from grocery_shop.orders;