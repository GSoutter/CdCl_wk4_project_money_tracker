DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS budgets;

CREATE TABLE merchants
(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    active BOOLEAN,
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
    transaction_timestamp TIMESTAMP,
    amount DECIMAL,
    merchant_id INT references merchants(id),
    tag_id INT references tags(id)
);

CREATE TABLE budgets
(
  name VARCHAR(255),
  budget DECIMAL
);

INSERT INTO budgets (name, budget) VALUES ('Overall', 1000);
INSERT INTO budgets (name, budget) VALUES ('Monthly', 300);
