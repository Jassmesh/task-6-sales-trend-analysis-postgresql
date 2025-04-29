CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    region TEXT NOT NULL
);

DO $$
BEGIN
    FOR i IN 1..1000 LOOP
        INSERT INTO orders (
            product_id, customer_id, order_date, amount, region
        )
        VALUES (
            (100 + (random() * 50)::INT),
            (1 + (random() * 200)::INT),
            NOW() - ((random() * 365)::INT * INTERVAL '1 DAY'), -- Subtract days as interval
            ROUND((50 + random() * 950)::NUMERIC, 2),
            (ARRAY['North', 'South', 'East', 'West'])[1 + floor(random() * 4)::INT]
        );
    END LOOP;
END;
$$;