COMMENT ON SCHEMA public IS 'standard public schema';

/* Table 'cart_products' */
CREATE TABLE public.cart_products (
cart_id integer NOT NULL,
product_id integer NOT NULL,
quantity integer DEFAULT 1,
PRIMARY KEY(cart_id,product_id));

/* Table 'carts' */
CREATE TABLE public.carts (
id serial NOT NULL,
user_id integer NOT NULL,
PRIMARY KEY(id),
CONSTRAINT carts_user_id_key UNIQUE(user_id));

/* Table 'order_products' */
CREATE TABLE public.order_products (
order_id integer,
product_id integer,
quantity integer DEFAULT 1,
price numeric(10,2));

/* Table 'orders' */
CREATE TABLE public.orders (
id serial NOT NULL,
user_id integer,
status character varying(100),
created_at timestamp without time zone DEFAULT now(),
order_price numeric(10,2),
PRIMARY KEY(id));

/* Table 'products' */
CREATE TABLE public.products (
id serial NOT NULL,
"name" character varying(100) NOT NULL,
price numeric(10,2) NOT NULL,
description character varying,
category character varying(100),
image_url character varying(255),
status character varying(100),
PRIMARY KEY(id));

/* Table 'users' */
CREATE TABLE public.users (
id serial NOT NULL,
email character varying(100) NOT NULL,
google_id character varying(100),
first_name character varying(100),
last_name character varying(100),
address1 character varying(100),
address2 character varying(100),
postcode character varying(10),
city character varying(100),
country character varying(100),
pwd_hash character varying(100),
date_joined timestamp without time zone DEFAULT now(),
active boolean DEFAULT true,
user_role character varying(100),
PRIMARY KEY(id));

/* Relation 'cart_products_cart_id_fkey' */
ALTER TABLE public.cart_products ADD CONSTRAINT cart_products_cart_id_fkey
FOREIGN KEY (cart_id)
REFERENCES public.carts(id)
ON DELETE No action
ON UPDATE No action;

/* Relation 'cart_products_product_id_fkey' */
ALTER TABLE public.cart_products ADD CONSTRAINT cart_products_product_id_fkey
FOREIGN KEY (product_id)
REFERENCES public.products(id)
ON DELETE No action
ON UPDATE No action;

/* Relation 'carts_user_id_fkey' */
ALTER TABLE public.carts ADD CONSTRAINT carts_user_id_fkey
FOREIGN KEY (user_id)
REFERENCES public.users(id)
ON DELETE No action
ON UPDATE No action;

/* Relation 'order_products_order_id_fkey' */
ALTER TABLE public.order_products ADD CONSTRAINT order_products_order_id_fkey
FOREIGN KEY (order_id)
REFERENCES public.orders(id)
ON DELETE No action
ON UPDATE No action;

/* Relation 'order_products_product_id_fkey' */
ALTER TABLE public.order_products ADD CONSTRAINT order_products_product_id_fkey
FOREIGN KEY (product_id)
REFERENCES public.products(id)
ON DELETE No action
ON UPDATE No action;

/* Relation 'orders_user_id_fkey' */
ALTER TABLE public.orders ADD CONSTRAINT orders_user_id_fkey
FOREIGN KEY (user_id)
REFERENCES public.users(id)
ON DELETE No action
ON UPDATE No action;

