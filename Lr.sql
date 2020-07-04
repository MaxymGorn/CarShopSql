exec CreateContent 
select * from People 

--1.
select 
	[City] AS 'POKAZATEL / Pol',
	[Man],[Woman],[Other]
	from (	
		select
		p.City as N'City',
		p.Pol as 'Stat'

		from  People p
		) as SourceTable

	pivot (
		count(Stat) for [Stat] in (
		[Man],[Woman],[Other])
		) as PivotTable 


go


--2.

select 
	[Country] AS 'POKAZATEL / Pol',
	[Man],[Woman],[Other]
	from (	
		select
		p.Country as N'Country',
		p.Pol as 'Stat'

		from  People p
		) as SourceTable

	pivot (
		count(Stat) for [Stat] in (
		[Man],[Woman],[Other])
		) as PivotTable

--3
-- запускати весь третій блок(використовуэться dynamic pivot)
DECLARE @Columns as nVARCHAR(MAX)
DECLARE @SQL as nVARCHAR(MAX)
SELECT @Columns= ISNULL(@Columns + ',','') 
          + QUOTENAME(Country)
FROM (SELECT DISTINCT Country
         FROM People WITH (TABLOCK, HOLDLOCK)) AS b

SET @SQL = 'with counttt(Pol, Name, forcount) as
(
select p.Country as forcount, p.Pol as Name, p.City as Name
from People p
)
select *from counttt
pivot(count(forcount) for Pol in(' + @Columns + ')) as pv'
print @SQL
EXEC (@SQL);
--
