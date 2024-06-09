USE AdventureWorks2019;

/*
Basic
Question 1:

Write a SQL Statement that will give you a count of each object type in the AdventureWorks database. Order by count descending.
*/

SELECT type_desc, COUNT(*) AS Object_Count
FROM sys.objects
GROUP BY type_desc
ORDER BY 2 DESC;