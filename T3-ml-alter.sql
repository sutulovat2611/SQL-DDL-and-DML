--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-ml-alter.sql

--Student ID: 30806151
--Student Name: Tatiana Sutulova 
--Tutorial No: Assignment 2A 


/* Comments for your marker:
*/

-- 3 (a)

-- Adding a new column for the L, D, G
ALTER TABLE book_copy
ADD bc_condition CHAR(1) DEFAULT 'G' NOT NULL
CONSTRAINT bc_condition_chk CHECK ( bc_condition IN ( 'G', 'L', 'D' ) );

--Adding a comment for a new column
COMMENT ON COLUMN book_copy.bc_condition IS 
    'Condition of the book: D - damaged, L - lost, G - good';

--Change data about one book copy, that it's lost
UPDATE book_copy
SET bc_condition = 'L'
WHERE bc_id= (SELECT bc_id from book_copy WHERE branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no = '0395601655')
    AND book_call_no='005.74 C824C');
    
COMMIT;

-- 3 (b)
--Adding return column
ALTER TABLE loan
ADD loan_return_branch_code NUMBER(2) ;

--Adding a comment for a new column
COMMENT ON COLUMN loan.loan_return_branch_code IS 
    'The code of the branch where the loan was returned to';
    
-- For all completed loans, to this time, books were returned at the same branch from where those were loaned.
UPDATE loan
SET loan_return_branch_code = branch_code
WHERE loan_actual_return_date < (SELECT sysdate FROM dual);

COMMIT;

-- 3 (c)
DROP TABLE manager_branch PURGE;

-- create the manager branch table to see which manager works in which branch and what their position there is
CREATE TABLE manager_branch (
    branch_code        NUMBER(2) NOT NULL,
    man_id             NUMBER(2) NOT NULL,
    man_branch_collection CHAR(1) DEFAULT 'B' NOT NULL
);

COMMENT ON COLUMN manager_branch.branch_code IS
    'Branch number ';

COMMENT ON COLUMN manager_branch.man_id IS
    'Managers assigned identifier';

COMMENT ON COLUMN manager_branch.man_branch_collection IS
    'Represents which collection the manager is responsible for: F-Fiction, R-Reference, B-Both';

--Adding constraints
ALTER TABLE manager_branch
    ADD CONSTRAINT manager_branch_collection_chk CHECK ( man_branch_collection IN ( 'F', 'R', 'B' ) );

ALTER TABLE manager_branch
    ADD CONSTRAINT manager_branch_pk PRIMARY KEY( branch_code, man_id);  

ALTER TABLE manager_branch
    ADD CONSTRAINT manager_branch_branch FOREIGN KEY ( branch_code )
        REFERENCES branch ( branch_code );
    
ALTER TABLE manager_branch
    ADD CONSTRAINT manager_branch_manager FOREIGN KEY (man_id)
        REFERENCES manager ( man_id );

-- insert all the values
INSERT INTO manager_branch(branch_code, man_id) 
SELECT  branch_code, man_id 
FROM branch;

-- drop the man_id column in branch
ALTER TABLE branch
DROP COLUMN man_id;

--make changes for the Clayton manager
UPDATE manager_branch
SET man_branch_collection='R'
WHERE branch_code= (SELECT branch_code FROM branch WHERE branch_contact_no = '0395413120') AND man_id=10;

--assign new manager for Clayton library fiction collection
INSERT INTO manager_branch VALUES (
    (SELECT branch_code FROM branch WHERE branch_contact_no = '0395413120'),
    12,
    'F'
);

COMMIT;

