--T2-ml-insert.sql
--Author: Tatiana Sutulova 

/* Comments for your marker:
    When book copy is inserted, the branch_count_books in branch table is increased by 1
*/

-- 2 (a) Load the BOOK_COPY, LOAN and RESERVE tables with your own
-- test data following the data requirements expressed in the brief

--BOOK COPIES
INSERT INTO book_copy VALUES (
    11, 
    123456,
    30.00,
    'Y',
    '005.74 D691D'
);  

UPDATE branch
SET branch_count_books = branch_count_books+1
WHERE branch_code = 11;

INSERT INTO book_copy VALUES (
    11, 
    223456,
    30.00,
    'N',
    '005.74 D691D'
);

UPDATE branch
SET branch_count_books = branch_count_books+1
WHERE branch_code = 11;

INSERT INTO book_copy VALUES (
    11, 
    323456,
    30.00,
    'N',
    '005.74 D691D'
);

UPDATE branch
SET branch_count_books = branch_count_books+1
WHERE branch_code = 11;

INSERT INTO book_copy VALUES (
    11, 
    423456,
    18.00,
    'Y',
    '823.914 H219A'
); 

UPDATE branch
SET branch_count_books = branch_count_books+1
WHERE branch_code = 11;


INSERT INTO book_copy VALUES (
    12, 
    123321,
    18.00,
    'N',
    '823.914 H219A'
); 
UPDATE branch
SET branch_count_books = branch_count_books+1
WHERE branch_code = 12;

INSERT INTO book_copy VALUES (
    13,
    523456,
    22.00,
    'N',
    '823.914 A211H'
); 
UPDATE branch
SET branch_count_books = branch_count_books+1
WHERE branch_code = 13;

INSERT INTO book_copy VALUES (
    11, 
    623456,
    23.00,
    'N',
    '005.432 L761P'
); 
UPDATE branch
SET branch_count_books = branch_count_books+1
WHERE branch_code = 11;

INSERT INTO book_copy VALUES (
    13,
    823456,
    40.00,
    'N',
     '112.6 S874D'
); 
UPDATE branch
SET branch_count_books = branch_count_books+1
WHERE branch_code = 13;

INSERT INTO book_copy VALUES (
    11,
    923456,
    33.00,
    'N',
    '005.756 G476F'
); 
UPDATE branch
SET branch_count_books = branch_count_books+1
WHERE branch_code = 11;

INSERT INTO book_copy VALUES (
    12,
    123457,
    30.00,
    'N',
    '005.74 D691D'
); 
UPDATE branch
SET branch_count_books = branch_count_books+1
WHERE branch_code = 12;



--LOANS
INSERT INTO loan VALUES (
    12,
    123457,
    TO_DATE('2021-06-02 13:30', 'YYYY-MM-DD HH24:MI'),
    TO_DATE('2021-06-16', 'YYYY-MM-DD'),
    TO_DATE('2021-06-14', 'YYYY-MM-DD'),
    1
); 
INSERT INTO loan VALUES (
    11,
    923456,
    TO_DATE('2021-06-08 12:00', 'YYYY-MM-DD HH24:MI'),
    TO_DATE('2021-06-22', 'YYYY-MM-DD'),
    TO_DATE('2021-06-17', 'YYYY-MM-DD'),
    2
); 
INSERT INTO loan VALUES (
    13,
    823456,
    TO_DATE('2021-06-25 17:15', 'YYYY-MM-DD HH24:MI'),
    TO_DATE('2021-07-09', 'YYYY-MM-DD'),
    TO_DATE('2021-06-26', 'YYYY-MM-DD'),
    3
); 
INSERT INTO loan VALUES (
    13,
    823456,
    TO_DATE('2021-07-10 09:45', 'YYYY-MM-DD HH24:MI'),
    TO_DATE('2021-07-24', 'YYYY-MM-DD'),
    TO_DATE('2021-07-25', 'YYYY-MM-DD'), --returned late
    1
); 
INSERT INTO loan VALUES (
    12,
    123457,
    TO_DATE('2021-07-13 15:20', 'YYYY-MM-DD HH24:MI'),
    TO_DATE('2021-07-27', 'YYYY-MM-DD'),
    TO_DATE('2021-07-23', 'YYYY-MM-DD'),
    2
); 
INSERT INTO loan VALUES (
    12,
    123457,
    TO_DATE('2021-08-01 20:00', 'YYYY-MM-DD HH24:MI'),
    TO_DATE('2021-08-15', 'YYYY-MM-DD'),
    TO_DATE('2021-08-09', 'YYYY-MM-DD'),
    2
); 
INSERT INTO loan VALUES (
    11, 
    423456,
    TO_DATE('2021-08-02 14:40', 'YYYY-MM-DD HH24:MI'),
    TO_DATE('2021-08-16', 'YYYY-MM-DD'),
    NULL, -- still due
    1
); 
INSERT INTO loan VALUES (
    11, 
    423456,
    TO_DATE('2021-08-15 18:30', 'YYYY-MM-DD HH24:MI'),
    TO_DATE('2021-08-29', 'YYYY-MM-DD'),
    TO_DATE('2021-08-19', 'YYYY-MM-DD'),
    1
); 
INSERT INTO loan VALUES (
    13,
    823456,
    TO_DATE('2021-08-17 13:15', 'YYYY-MM-DD HH24:MI'),
    TO_DATE('2021-08-31', 'YYYY-MM-DD'),
    TO_DATE('2021-08-28', 'YYYY-MM-DD'),
    4
);
INSERT INTO loan VALUES (
    12,
    123457,
    TO_DATE('2021-08-18 16:00', 'YYYY-MM-DD HH24:MI'),
    TO_DATE('2021-09-01', 'YYYY-MM-DD'),
    TO_DATE('2021-08-19', 'YYYY-MM-DD'),
    5
); 



INSERT INTO reserve VALUES (
    111222,
    11, 
    423456,
    TO_DATE('2021-08-10 13:50', 'YYYY-MM-DD HH24:MI'),
    5
); 
INSERT INTO reserve VALUES (
    111223,
    12, 
    123321,
    TO_DATE('2021-09-01 09:45', 'YYYY-MM-DD HH24:MI'),
    3
); 

COMMIT;
