ALTER TABLE products
ADD CONSTRAINT chk_product_price CHECK (price >= 0);
