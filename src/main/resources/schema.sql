CREATE TABLE tbl_categories (
id BIGINT auto_increment not null primary key,
name varchar(250) null
);

CREATE TABLE tbl_products (
id BIGINT auto_increment not null primary key,
name varchar(250) null,
description varchar(250) null,
stock decimal(8,2) null,
price decimal(8,2) null,
status varchar(25) null,
create_at date null,
category_id BIGINT not null,
FOREIGN KEY (category_id) REFERENCES tbl_categories (id)
);