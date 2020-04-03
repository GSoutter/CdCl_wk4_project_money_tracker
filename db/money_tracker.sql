DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS merchants;

CREATE TABLE merchants
(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    img_url TEXT
);

CREATE TABLE tags
(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    active BOOLEAN,
    img_url TEXT
);

CREATE TABLE transactions
(
    id SERIAL PRIMARY KEY,
    transcation_timestamp TIMESTAMP,
    amount DECIMAL,
    merchant_id INT references merchants(id),
    tag_id INT references tags(id)
);
