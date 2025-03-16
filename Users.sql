

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    mail VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, surname, username, mail, password_hash)
VALUES ('Eren', 'Bozyer', 'erenbozyer', 'eren@eren.com', '123');
INSERT INTO users (name, surname, username, mail, password_hash)
VALUES ('mahmut', 'mut', 'mahmuttt', 'mahmut@mahmut.com', '1234');

SELECT * FROM users;
