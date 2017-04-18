CC=mysql
DB=TEST

refresh:
	echo "Deleting any existing tables"
	$(CC) $(DB) < delete.sql
	echo "Creating new tables"
	$(CC) $(DB) < create.sql
	echo "Loading tables"
	$(CC) $(DB) < load.sql

test_queries:
	$(CC) $(DB) < delete.sql
	$(CC) $(DB) < create.sql
	$(CC) $(DB) < test_query.sql
	($(CC) $(DB) < queries.sql) > test
	diff test expected_test_results
