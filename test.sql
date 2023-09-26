-- Active: 1695295897220@@127.0.0.1@5432@test3
-- CREATE PROCEDURE deactivate_unpaid_account()
-- LANGUAGE SQL
-- AS $$
--     UPDATE accounts SET account=FALSE WHERE balance=0;
-- $$

-- CALL deactivate_unpaid_account();


-- CREATE FUNCTION account_type_count(account_type text) RETURNS INTEGER
-- LANGUAGE plpgsql
-- AS $$
--     DECLARE account_count INT;
--     BEGIN
--     SELECT count(*) INTO account_count from accounts WHERE accounts.account_type=$1;
--     RETURN account_count;
--     END;
-- $$



-- TRIGGER
CREATE TABLE products(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    base_price FLOAT8 NOT NULL,
    final_price FLOAT8
);

INSERT INTO products(title,base_price) VALUES ('Orange',60);

SELECT *  FROM products;

CREATE or REPLACE trigger add_tax_trigger 
AFTER 
INSERT ON products
FOR EACH ROW
EXECUTE FUNCTION update_final_price();

CREATE or REPLACE FUNCTION update_final_price()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
BEGIN
NEW.final_price:=NEW.base_price*1.05;
RETURN NEW;
END;
$$;


-- INDEX
CREATE INDEX title_idx on products(title);

EXPLAIN ANALYZE SELECT title FROM products;

EXPLAIN ANALYZE SELECT id FROM products WHERE id=1;


-- Resourses SQL Language
-- Databasestar.com 
-- Postgrestutoriul.com

