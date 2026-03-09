CREATE TABLE IF NOT EXISTS purchase_results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user VARCHAR(255),
    product VARCHAR(255),
    price VARCHAR(50),
    status VARCHAR(50)
);