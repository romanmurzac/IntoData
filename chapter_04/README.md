# Data manipulation and querying​

## Implement and Manage Transactions & Isolation Levels
Stages:
* Start a transaction explicitly.
* Set SERIALIZABLE isolation level.
* Use Savepoints to allow partial rollbacks.
* Commit or rollback based on success/failure.

`isolation_level.sql`

## Perform operatipons in a Single Statement
PostgreSQL does not have native MERGE, but it can be used `INSERT ... ON CONFLICT` or `CTEs` with `UPDATE` and `DELETE`.
* If candidate_id = 6 exists, it's updated.
* If candidate_id = 7 exists, it's deleted.
* If candidate_id = 8 doesn't exist, it's inserted. If it exists, it's updated.

`single_statement.sql`

## Usage of the Analytical Functions in Queries
Window functions:
* `LAG` fetches the previous row’s age.
* `LEAD` fetches the next row’s age.
* `CUME_DIST` computes cumulative distribution.
* `FIRST_VALUE` returns the first row’s age.
* `LAST_VALUE` returns the last row’s age.
* `PERCENTILE_CONT(0.5)` computes the median.
* `PERCENT_RANK` calculates the relative rank of each row.

`analytical_functions_1.sql` and `analytical_functions_2.sql`

## Select semi-structured data
Use `jsonb` function for semi-structured data.

`semi_structured_data.sql`

## Pivot a dataset
Transpose a dataset from rows to columns and vice versa.

`pivot_dataset.sql`

## Run full-text queries
To run full-text queries against character-based data.

`full_text_search.sql`