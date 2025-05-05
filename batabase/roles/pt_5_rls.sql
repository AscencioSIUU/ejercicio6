-- ACTIVAR RLS PARA TABLAS `users`, `products`, `orders`, `detail_order`, `stock` 
-- tabla tenants no requiere porque no tiene relación o vinculación con client_id 
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE detail_order ENABLE ROW LEVEL SECURITY;
ALTER TABLE stock ENABLE ROW LEVEL SECURITY;

-- Creando Politicas (CREATE POLICY) correspondiente a cada tenant
-- tabla users
CREATE POLICY rls_users_policy ON users
  USING (client_id = current_setting('app.tenant_id')::int);

-- tabla products
CREATE POLICY rls_products_policy ON products
  USING (client_id = current_setting('app.tenant_id')::int);

-- tabla orders
CREATE POLICY rls_orders_policy ON orders
  USING (client_id = current_setting('app.tenant_id')::int);

-- tabla stock
CREATE POLICY rls_stock_policy ON stock
  USING (client_id = current_setting('app.tenant_id')::int);

-- tabla detail_order
CREATE POLICY rls_detail_order_policy ON detail_order
  USING (
    EXISTS (
      SELECT 1 FROM orders
      WHERE orders.id = detail_order.order_id
        AND orders.client_id = current_setting('app.tenant_id')::int
    )
  );
