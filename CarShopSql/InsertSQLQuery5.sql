create proc CreateContent as
begin
	declare @name nvarchar(max),@surname nvarchar(max),@poBatkovi nvarchar(max), @pol nvarchar(max) , @country nvarchar(max) , @city nvarchar(max) , 
	@i int, @Date date, @adress nvarchar(max) , @phone nvarchar(max) 
	set @i=0
	while @i<100
		begin
			set @i=@i+1
			set @name=N'Name - '+convert(nvarchar,ROUND((1 + rand() * 100),0))
			set @surname=N'Surname - '+convert(nvarchar,ROUND((1 + rand() * 200),0))
			set @poBatkovi=N'Po-Batkovi - '+convert(nvarchar,ROUND((1 + rand() * 100),0))
			set @country=N'Country - '+convert(nvarchar,ROUND((1 + rand() * 300),0))
			set @city=N'City - '+convert(nvarchar,ROUND((1 + rand() * 30000),0))
			set @adress=N'Adress - '+convert(nvarchar,ROUND((1 + rand() *9000000),0))
			set @phone=N'+0'+convert(nvarchar,ROUND(( 100000+ rand() * 9999999),0))
			set @pol= CASE
				WHEN ROUND((0 + rand() * 2),0) = 0 THEN 'Man' else 'Woman' end
			set @Date = dateadd(DAY,round((rand()*400),0),'2019-01-01')
		INSERT INTO People(Name, Surname, PoBatkovi, Pol, DateOfbir,Country,City,Adresss,Phone)
		VALUES (@name, @surname,@poBatkovi, @pol, @Date, @country,@city,@adress,@phone)
		end
end
go

EXEC CreateContent GO
SELECT *FROM People GO