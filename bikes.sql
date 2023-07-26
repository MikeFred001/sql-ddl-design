CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

--don't change customers table--
--need an orders table,bikes table--
--orders:bike_model_code, sale_date, total_cost, note--
--bikes: default_price, model_code--
--Models:model_name,model_code--

CREATE TABLE bikes (
    model_code VARCHAR(5) PRIMARY KEY,
    name VARCHAR(25) NOT NULL UNIQUE,
    price NUMERIC(10,2) CHECK (price > 0)

);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    model_code VARCHAR(5) NOT NULL REFERENCES bikes,
    customer_id INT NOT NULL,
    sale_date DATE NOT NULL,
    note VARCHAR(50)
);

CREATE TABLE bikes_ordered(
    model_code VARCHAR(5) PRIMARY KEY,





);




