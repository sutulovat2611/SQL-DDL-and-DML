--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-ml-dm.sql

--Student ID: 30806151
--Student Name: Tatiana Sutulova 
--Tutorial No: Assignment 2A 

/* Comments for your marker:
*/

-- 2 (b) (i)
--Insert new book
INSERT INTO book_detail VALUES (
    '005.74 C824C',
    'Database Systems: Design, Implementation, and Management',
    'R',
    793,
    TO_DATE('2019', 'YYYY'),
    '13'
);



-- Add a new copy of a book 
INSERT INTO book_copy VALUES (
    (SELECT branch_code FROM branch WHERE branch_contact_no = '0395413120'),
    (SELECT COUNT(book_call_no) FROM book_copy WHERE book_copy.book_call_no = '005.74 C824C' AND 
    branch_code= (SELECT branch_code FROM branch WHERE branch_contact_no = '0395413120') ) +1 ,
    120,
    'N',
    '005.74 C824C'
);
--increasing the number of copies in the branch
UPDATE branch
SET branch_count_books = branch_count_books+1
WHERE branch_code =  (SELECT branch_code FROM branch WHERE branch_contact_no = '0395413120');

INSERT INTO book_copy VALUES (
    (SELECT branch_code FROM branch WHERE branch_contact_no = '0395601655'),
    (SELECT COUNT(book_call_no) FROM book_copy WHERE book_copy.book_call_no = '005.74 C824C' AND 
    branch_code= (SELECT branch_code FROM branch WHERE branch_contact_no = '0395601655') ) +1 ,
    120,
    'N',
    '005.74 C824C'
);
--increasing the number of copies in the branch
UPDATE branch
SET branch_count_books = branch_count_books+1
WHERE branch_code =  (SELECT branch_code FROM branch WHERE branch_contact_no = '0395601655');

INSERT INTO book_copy VALUES (
    (SELECT branch_code FROM branch WHERE branch_contact_no = '0395461253'),
    (SELECT COUNT(book_call_no) FROM book_copy WHERE book_copy.book_call_no = '005.74 C824C' AND 
    branch_code= (SELECT branch_code FROM branch WHERE branch_contact_no = '0395461253') ) +1 ,
    120,
    'N',
    '005.74 C824C'
);
--increasing the number of copies in the branch
UPDATE branch
SET branch_count_books = branch_count_books+1
WHERE branch_code =  (SELECT branch_code FROM branch WHERE branch_contact_no = '0395461253');

COMMIT;

-- 2 (b) (ii)
DROP SEQUENCE borrower_seq;
CREATE SEQUENCE borrower_seq START WITH 100 INCREMENT BY 1;

DROP SEQUENCE reserve_seq;
CREATE SEQUENCE reserve_seq START WITH 100 INCREMENT BY 1;

COMMIT;

-- 2 (b) (iii)
INSERT INTO borrower VALUES (
    borrower_seq.NEXTVAL,
    'Ada',
    'LOVELACE',
    '1 Sunflower Street',
    'Sunflower',
    '4545',
    (SELECT branch_code FROM branch WHERE branch_contact_no = '0395413120')
);

INSERT INTO reserve VALUES (
    reserve_seq.NEXTVAL,
    (SELECT branch_code FROM branch WHERE branch_contact_no = '0395413120'), 
    (SELECT bc_id FROM book_copy WHERE book_call_no='005.74 C824C' AND branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no = '0395413120')),
    TO_DATE('2021-09-14 15:30', 'YYYY-MM-DD HH24:MI'),
    borrower_seq.CURRVAL
); 

--update the book reserve status ( assuming there is only one copy of that book in thar branch)
UPDATE book_copy
SET bc_counter_reserve = 'Y'
WHERE bc_id = (SELECT bc_id FROM book_copy WHERE branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no = '0395413120') AND book_call_no='005.74 C824C');

COMMIT;
-- 2 (b) (iv)

--Loan a book
INSERT INTO loan VALUES (
    (SELECT branch_code FROM branch WHERE branch_contact_no = '0395413120'), 
    (SELECT bc_id FROM book_copy WHERE book_call_no='005.74 C824C' AND branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no = '0395413120')),
    TO_DATE('2021-09-21 12:30', 'YYYY-MM-DD HH24:MI'),
    TO_DATE('2021-10-05', 'YYYY-MM-DD'),
    NULL,
    (SELECT bor_no FROM borrower WHERE bor_fname ='Ada'  AND bor_lname = 'LOVELACE')
);

--DROP a reservation
DELETE FROM reserve 
WHERE 
    bor_no = (SELECT bor_no FROM borrower WHERE bor_fname ='Ada'  AND bor_lname = 'LOVELACE') AND 
    branch_code = (SELECT branch_code FROM branch WHERE branch_contact_no = '0395413120') AND 
    bc_id= (SELECT bc_id FROM book_copy WHERE branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no = '0395413120')
    AND book_copy.book_call_no='005.74 C824C');

COMMIT;