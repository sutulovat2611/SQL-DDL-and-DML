# SQL-DDL-and-DML
![Picture](https://user-images.githubusercontent.com/91307462/139055824-c25eaaec-209e-4d5b-9b73-820de735ad20.png)
I was supplied with an SQL script mlib_initialSchemaInsert.sql which partially implements the MLib model (represented on the diagram above). It creates the tables colored in purple and inserts some initial sample data.

## T1-ml-schm.sql
Adding the CREATE TABLE and CONSTRAINT definitions which are mission from the supplied partial schema script.

## T1-ml-drop.sql
Adding the full set of DROP TABLE statements, that drops all the tables created by the supplied partial schema script and tables created in __T1-ml-schm.sql__, as well as the ones that are created in HI ADD HERE

## T2-ml-insert.sql
Loading the BOOK_COPY, LOAN and RESERVE tables with my own test data:
1. 10 BOOK_COPIES:
  - representing at least 3 different book details,
  - distributed across 3 different libraries,
  - with at least 1 library holding multiple copies of a book,
  -  at least one copy on counter reserve 
2. 10 LOANS:
  - 8 of which must have been completed, with at least one of these returned late and one still due,
  - borrowed from at least 2 different libraries,
  -  by at least 3 different borrowers
3. 2 RESERVE entries 

The inserted data conforms to the following rules:
1. All the data is treared as a single transation
2. The primary key values for this data are hardcoded values
3. Date used is chosen between  the 1st June 2021 and 13th September 2021 (inclusive).

## T2-ml-dm.sql
Adding new data and modifying the existing data accordingly

## T3-ml-alter.sql
Making changes to the "live" database created before.

# Run files
Files are to be run in the following order:
1. T1-ml-drop.sql (not needed for the first time run)
2. mlib_initialSchemaInsert.sql
3. T1-ml-schm.sql
4. T2-ml-insert.sql
5. T2-ml-dm.sql
6. T3-ml-alter.sql
