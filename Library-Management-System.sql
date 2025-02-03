USE LibraryDB;

-- Create Tables
CREATE TABLE books(
book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(255) NOT NULL,
author VARCHAR(255) NOT NULL,
genre VARCHAR(255) NOT NULL,
published_year INT NOT NULL
);

CREATE TABLE borrowers(
borrower_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE borrowedBooks(
borrowed_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
book_id INT,
borrower_id INT,
borrow_date DATE NOT NULL,
return_date DATE NOT NULL,
CONSTRAINT book_id
FOREIGN KEY(book_id)
REFERENCES books(book_id)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT borrower_id
FOREIGN KEY(borrower_id)
REFERENCES borrowers(borrower_id)
);

-- Update return date when borrower id = 2
UPDATE borrowedBooks
SET return_date = '2025-02-03'
WHERE borrowed_id = 2;

-- Delete borrowed record when book is returned
DELETE FROM borrowedBooks
WHERE borrowed_id = 8;


SELECT * FROM books;
SELECT * FROM borrowers;
SELECT * FROM borrowedBooks;
