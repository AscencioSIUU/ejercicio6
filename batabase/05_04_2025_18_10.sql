-- Borrar tablas si existen (en orden inverso por dependencias) ARMAGEDON
DROP TABLE IF EXISTS detail_order;
DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tenants;

CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  client_id INTEGER REFERENCES tenants(id) ON DELETE CASCADE,
  name VARCHAR(255)
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  client_id INTEGER REFERENCES tenants(id) ON DELETE CASCADE,
  name VARCHAR(255),
  price INTEGER
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  client_id INTEGER REFERENCES tenants(id) ON DELETE CASCADE,
  date DATE
);

CREATE TABLE detail_order (
  order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE,
  product_id INTEGER REFERENCES products(id) ON DELETE CASCADE,
  quantity INTEGER,
  PRIMARY KEY (order_id, product_id)
);

CREATE TABLE stock (
  product_id INTEGER REFERENCES products(id) ON DELETE CASCADE,
  client_id INTEGER REFERENCES tenants(id) ON DELETE CASCADE,
  stock INTEGER,
  PRIMARY KEY (product_id, client_id)
);
