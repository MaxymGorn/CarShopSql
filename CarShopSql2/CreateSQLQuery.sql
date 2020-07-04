create table People
(
	Id int identity not null,
	Name nvarchar(max) not null,
	Surname nvarchar(max) not null,
	PoBatkovi nvarchar(max) not null,
	DateOfbir date not null,
	Pol nvarchar(max) not null,
	Phone nvarchar(max) null,
	City nvarchar(max) not null,
	Country nvarchar(max) not null,
	Adresss nvarchar(max) not null
	Constraint Pk_People  primary key(Id),
	Constraint Ck_Fio check
	(Name!='' and Surname!='' and PoBatkovi!='')
);


