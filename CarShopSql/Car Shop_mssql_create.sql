CREATE TABLE [Моделі автомобілів] (
	Id bigint NOT NULL identity,
	Name nvarchar(100) NOT NULL,
  CONSTRAINT [PK_МОДЕЛІ АВТОМОБІЛІВ] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Таблиця продаж] (
	Id bigint NOT NULL identity,
	ModelId int NOT NULL,
	Price money NOT NULL,
  CONSTRAINT [PK_ТАБЛИЦЯ ПРОДАЖ] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Машини] (
	Id bigint NOT NULL identity,
	SaleDate date NOT NULL,
	Tablesale bigint NOT NULL,
  CONSTRAINT [PK_МАШИНИ] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

ALTER TABLE [Таблиця продаж] WITH CHECK ADD CONSTRAINT [Таблиця продаж_fk0] FOREIGN KEY ([ModelId]) REFERENCES [Моделі автомобілів]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Таблиця продаж] CHECK CONSTRAINT [Таблиця продаж_fk0]
GO

ALTER TABLE [Машини] WITH CHECK ADD CONSTRAINT [Машини_fk0] FOREIGN KEY ([Tablesale]) REFERENCES [Таблиця продаж]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Машини] CHECK CONSTRAINT [Машини_fk0]
GO

