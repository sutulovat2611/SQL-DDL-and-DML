--T1-ml-drop.sql
- Author: Tatiana Sutulova 

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
