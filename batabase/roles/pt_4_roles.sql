-- Creacion de roles para los usuarios en TENANTS
-- Comercial Aurora (tenant_id = 1)
CREATE ROLE aurora_admin LOGIN PASSWORD 'aurora_admin123';
CREATE ROLE aurora_seller LOGIN PASSWORD 'aurora_seller123';

-- Tienda La Estrella (tenant_id = 2)
CREATE ROLE estrella_admin LOGIN PASSWORD 'estrella_admin123';
CREATE ROLE estrella_seller LOGIN PASSWORD 'estrella_seller123';

-- Mercado Nova (tenant_id = 3)
CREATE ROLE nova_admin LOGIN PASSWORD 'nova_admin123';
CREATE ROLE nova_seller LOGIN PASSWORD 'nova_seller123';

-- Distribuidora El Sol (tenant_id = 4)
CREATE ROLE sol_admin LOGIN PASSWORD 'sol_admin123';
CREATE ROLE sol_seller LOGIN PASSWORD 'sol_seller123';

-- Almacén Punto Azul (tenant_id = 5)
CREATE ROLE puntoazul_admin LOGIN PASSWORD 'puntoazul_admin123';
CREATE ROLE puntoazul_seller LOGIN PASSWORD 'puntoazul_seller123';

-- TechnoShop (tenant_id = 6)
CREATE ROLE technoshop_admin LOGIN PASSWORD 'technoshop_admin123';
CREATE ROLE technoshop_seller LOGIN PASSWORD 'technoshop_seller123';

-- Asignando permisos con GRANT en los metodos de SELECT, INSERT, UPDATE, DELETE
-- PARA ADMINISTRADORES
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO aurora_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO estrella_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO nova_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO sol_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO puntoazul_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO technoshop_admin;

-- PARA VENDEDORES:
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA public TO aurora_seller;
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA public TO estrella_seller;
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA public TO nova_seller;
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA public TO sol_seller;
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA public TO puntoazul_seller;
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA public TO technoshop_seller;