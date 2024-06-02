Program 1

FACTORIAL OF A NUMBER USING FUNCTION

declare 
fac number :=1;    
n number := &1;    
begin            
while n > 0 loop   
fac:=n*fac;         
n:=n-1;            
end loop;       
dbms_output.put_line(fac);  
end;
/

Program 2

Write a PL/SQL program using Procedures IN,INOUT,OUT parameters to retrieve the
corresponding book information in library

CREATE TABLE books (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(100),
    author VARCHAR2(100),
    genre VARCHAR2(50),
    available NUMBER
);
INSERT INTO books (book_id, title, author, genre, available) VALUES (1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 5);
INSERT INTO books (book_id, title, author, genre, available) VALUES (2, '1984', 'George Orwell', 'Dystopian', 3);
INSERT INTO books (book_id, title, author, genre, available) VALUES (3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 7);

CREATE OR REPLACE PROCEDURE get_book_info (
    p_book_id IN books.book_id%TYPE,
    p_title OUT books.title%TYPE,
    p_author OUT books.author%TYPE,
    p_genre OUT books.genre%TYPE,
    p_available IN OUT books.available%TYPE
)
IS
BEGIN
    SELECT title, author, genre, available
    INTO p_title, p_author, p_genre, p_available
    FROM books
    WHERE book_id = p_book_id;
END;
/

DECLARE
    v_title books.title%TYPE;
    v_author books.author%TYPE;
    v_genre books.genre%TYPE;
    v_available books.available%TYPE;
BEGIN
    get_book_info(2, v_title, v_author, v_genre, v_available);
    DBMS_OUTPUT.PUT_LINE('Title: ' || v_title);
    DBMS_OUTPUT.PUT_LINE('Author: ' || v_author);
    DBMS_OUTPUT.PUT_LINE('Genre: ' || v_genre);
    DBMS_OUTPUT.PUT_LINE('Available copies: ' || v_available);
END;
/