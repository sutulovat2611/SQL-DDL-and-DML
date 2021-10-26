--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-ml-drop.sql

--Student ID: 30806151
--Student Name: Tatiana Sutulova 
--Tutorial No: Assignment 2A 

/* Comments for your marker:
    Drops all the tables, including the one created in task 3, otherwise it gives an error
    "unique/primary keys in table referenced by foreign keys.."
*/

-- 1.2 Add Drop table statements for ALL table below (not just those created
-- in this script)use ONLY
--      DROP TABLE tblname PURGE
-- syntax DO NOT use CASCADE CONSTRAINTS

-- dropping newly created tables
DROP TABLE loan PURGE;
DROP TABLE reserve PURGE;
DROP TABLE book_copy PURGE;

-- dropping table from task 3
DROP TABLE manager_branch PURGE;

-- dropping initial tables
DROP TABLE book_detail PURGE;
DROP TABLE branch PURGE;
DROP TABLE manager PURGE;
DROP TABLE borrower PURGE;
