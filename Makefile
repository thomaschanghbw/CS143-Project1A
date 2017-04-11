CC=mysql
DB=TEST

refresh:
	$(CC) $(DB) < delete.sql
	$(CC) $(DB) < create.sql
	$(CC) $(DB) < load.sql
