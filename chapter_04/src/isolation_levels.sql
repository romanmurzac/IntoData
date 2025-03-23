-- Start transaction with SERIALIZABLE isolation level
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Savepoint in case we need to rollback partially
SAVEPOINT sp1;

-- Update a candidate's age
UPDATE raw.candidate 
SET age = 33
WHERE candidate_id = 6;

-- Savepoint before next operation
SAVEPOINT sp2;

-- Try to update a candidate's experience
UPDATE raw.candidate 
SET experience = 5
WHERE candidate_id = 6;

-- Simulate an error to trigger rollback
DO $$ BEGIN RAISE EXCEPTION 'Simulating an error'; END $$;

-- If something goes wrong, rollback to the savepoint
ROLLBACK TO sp2;

-- Commit the transaction
COMMIT;