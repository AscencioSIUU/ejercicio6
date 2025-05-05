-- Entrar como rol aurora admin 
SET ROLE aurora_admin;
SET app.tenant_id = '1'; 

-- Verificar el select *
SELECT * FROM products;

-- verificar el insert
INSERT INTO products (client_id, name, price)
VALUES (1, 'NOVO PRODUCTO SIUU', 150);

-- verificar el UPDATE
UPDATE products
SET price = 199
WHERE client_id = 1 AND name = 'NOVO PRODUCTO SIUU';

-- verificar el DELETE
DELETE FROM products
WHERE client_id = 1 AND name = 'NOVO PRODUCTO SIUU';


-- Entrar como seller aurora
SET ROLE aurora_seller;
SET app.tenant_id = '1';

-- verificar el select *
SELECT * FROM products;

-- verificar insert 
INSERT INTO products (client_id, name, price)
VALUES (1, 'Producto del seller Aurora', 199);

-- verificar update (FALLA)
UPDATE products
SET price = 299
WHERE name = 'Producto del seller Aurora';

-- verificar delete (FALLA)
DELETE FROM products
WHERE name = 'Producto del seller Aurora';

-- regresar a usuario normal
RESET ROLE;
