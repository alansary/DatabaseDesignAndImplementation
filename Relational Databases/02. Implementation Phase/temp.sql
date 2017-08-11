-- INTEGER stores a whole number
-- NUMERIC(n, m) n is the maximum number of digits before the decimal point
-- m is the maximum number of digits after the deciaml point
-- NUMERIC(n) n is the maximum number of digits before the decimal, also
-- accepts digits after the decimal point but as many as you want
-- Notice that the fk domain must match the pk domain.
ROLLBACK; -- Undo
COMMIT; -- Saves every transaction that happened during that session
/*
INSERT statement is a transaction and UPDATE statement is also a transaction
After each transaction a change is gonna happen to the table
Any transaction is not saved unless you commit
If you set autocommit=true, then each transaction will be saved once
executed
The session is from the moment you connect to the moment you leave the
application
rollback will undo any uncommited transactions
*/
DROP TABLE table_name CASCADE CONSTRAINTS;
/* This enforces the drop operation of a table that is referenced by
   another table and the relation is ended with the other table but
   the values are still there in the other table (referential integrity ends)
*/
/*
Deleting a record that is referenced by other table:
  - Deleting all the records that reference that table first, then deleting
    the referenced record.
  == FOREIGN KEY(FK) REFERENCES table_name(PK) ON DELETE CASCADE
  == If pk row is deleted from table_name cascade and delete fk rows = pk
     from the table
-- The default rule doesn't support cascade option.
*/
/*
Any primary key is set to be NOT NULL by default, you do not have to
explicitely state it, but, it is better to explecitely state it all the
time.
*/

