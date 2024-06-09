USE AdventureWorks2019;

/*
Intermediate
Question 2:

a. Write a SQL Statement that will show a count of schemas, tables, and columns (do not include views) in the AdventureWorks database.

b. Write a similar statement as part a but list each schema, table, and column (do not include views). This table can be used later in the course.
*/

--a.

SELECT COUNT(DISTINCT s.name) as SchemaName, COUNT(DISTINCT t.name) AS TableName, COUNT(c.name) AS ColumnName
FROM sys.tables t
INNER JOIN sys.columns c ON c.object_id = t.object_id
INNER JOIN sys.schemas s ON s.schema_id = t.schema_id

Select 
	Count(Distinct table_schema) as SchemaName
	,Count(Distinct table_name) as TableName
	,Count(column_name) as ColumnName
From information_schema.columns
Where table_name not in(
		Select Distinct TABLE_NAME 
		From information_schema.views)


--b.

Select 
	s.name as SchemaName
	,t.name as TableName
	,c.name as ColumnName
From sys.tables t
	INNER JOIN sys.columns c on c.object_id = t.object_id
	INNER JOIN sys.schemas s on s.schema_id = t.schema_id

Select 
	table_schema as SchemaName
	,table_name as TableName
	,column_name as ColumnName
From information_schema.columns
Where table_name not in(Select Distinct table_name 
			From information_schema.views)