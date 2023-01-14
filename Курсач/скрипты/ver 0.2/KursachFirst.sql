USE [master]
GO
/****** Object:  Database [Продажа_товаров]    Script Date: 27.12.2022 0:40:02 ******/
CREATE DATABASE [Продажа_товаров]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Продажа_товаров', FILENAME = N'D:\Games\MSSQL15.MSSQLSERVER\MSSQL\DATA\Продажа_товаров.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Продажа_товаров_log', FILENAME = N'D:\Games\MSSQL15.MSSQLSERVER\MSSQL\DATA\Продажа_товаров_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Продажа_товаров] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Продажа_товаров].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Продажа_товаров] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Продажа_товаров] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Продажа_товаров] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Продажа_товаров] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Продажа_товаров] SET ARITHABORT OFF 
GO
ALTER DATABASE [Продажа_товаров] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Продажа_товаров] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Продажа_товаров] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Продажа_товаров] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Продажа_товаров] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Продажа_товаров] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Продажа_товаров] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Продажа_товаров] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Продажа_товаров] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Продажа_товаров] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Продажа_товаров] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Продажа_товаров] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Продажа_товаров] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Продажа_товаров] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Продажа_товаров] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Продажа_товаров] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Продажа_товаров] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Продажа_товаров] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Продажа_товаров] SET  MULTI_USER 
GO
ALTER DATABASE [Продажа_товаров] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Продажа_товаров] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Продажа_товаров] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Продажа_товаров] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Продажа_товаров] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Продажа_товаров] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Продажа_товаров', N'ON'
GO
ALTER DATABASE [Продажа_товаров] SET QUERY_STORE = OFF
GO
USE [Продажа_товаров]
GO
/****** Object:  Table [dbo].[Cashier]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cashier](
	[id_cashier] [int] IDENTITY(1,1) NOT NULL,
	[name_cashier] [nvarchar](50) NOT NULL,
	[fam_cashier] [nvarchar](50) NOT NULL,
	[otchestvi_cashier] [nvarchar](50) NULL,
	[id_company] [int] NOT NULL,
 CONSTRAINT [PK_Cashier] PRIMARY KEY CLUSTERED 
(
	[id_cashier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[id_company] [int] IDENTITY(1,1) NOT NULL,
	[name_company] [nvarchar](50) NOT NULL,
	[address_company] [nvarchar](100) NOT NULL,
	[INN] [nchar](12) NOT NULL,
	[reg_nom] [nchar](12) NOT NULL,
	[id_work_time] [int] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[id_company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kotegory]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kotegory](
	[id_kategory] [smallint] IDENTITY(1,1) NOT NULL,
	[name_kategory] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Kotegory] PRIMARY KEY CLUSTERED 
(
	[id_kategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product-Cheque]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product-Cheque](
	[id_product] [bigint] NOT NULL,
	[id_fisc_check] [bigint] NOT NULL,
	[count_product] [float] NOT NULL,
 CONSTRAINT [PK_Product-Cheque] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC,
	[id_fisc_check] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit_of_measurement]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit_of_measurement](
	[id_unit_of_measurement] [smallint] IDENTITY(1,1) NOT NULL,
	[unit_of_measurement] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Unit_of_measurement] PRIMARY KEY CLUSTERED 
(
	[id_unit_of_measurement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id_product] [bigint] IDENTITY(1000000000000,1) NOT NULL,
	[price_product] [money] NOT NULL,
	[name_product] [varchar](50) NOT NULL,
	[count_product_on_warehose] [float] NOT NULL,
	[id_unit_of_measurement] [smallint] NOT NULL,
	[id_kategory] [smallint] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cheque]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cheque](
	[id_fisc_check] [bigint] IDENTITY(10000,1) NOT NULL,
	[subtotal] [float] NULL,
	[result] [float] NULL,
	[date_time] [datetime] NOT NULL,
	[entered] [float] NULL,
	[change] [float] NULL,
	[count_product_strings] [smallint] NULL,
	[id_buyer] [int] NULL,
	[id_cash_register] [int] NOT NULL,
	[id_cashier] [int] NOT NULL,
	[id_reg_lent] [bigint] NOT NULL,
	[id_payment] [tinyint] NULL,
	[id_status] [tinyint] NULL,
 CONSTRAINT [PK_Cheque] PRIMARY KEY CLUSTERED 
(
	[id_fisc_check] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CountProdKategoryCashier]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CountProdKategoryCashier]
AS
SELECT DISTINCT Cash.id_cashier, 
				name_cashier, 
				fam_cashier, 
				otchestvi_cashier, 
				sum(count_product) over (partition by Kat.id_kategory) count_prod_kat, 
				unit_of_measurement,
				name_kategory, 
				sum(price_product) over (partition by Kat.id_kategory) sum_price_kat,
				name_company
	FROM Cashier Cash JOIN Cheque Ch ON Cash.id_cashier = Ch.id_cashier 
		JOIN [Product-Cheque] PC ON Ch.id_fisc_check = PC.id_fisc_check 
		JOIN Product Prod ON Prod.id_product = PC.id_product
		JOIN Kotegory Kat ON Prod.id_kategory = Kat.id_kategory 
		JOIN Unit_of_measurement Unit ON Prod.id_unit_of_measurement = Unit.id_unit_of_measurement 
		JOIN Company Com ON Com.id_company = Cash.id_company
GO
/****** Object:  Table [dbo].[Buyer]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buyer](
	[id_buyer] [int] IDENTITY(100000,1) NOT NULL,
	[name_buyer] [nvarchar](50) NOT NULL,
	[fam_buyer] [nvarchar](50) NOT NULL,
	[otchestvo_buyer] [nvarchar](50) NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_Buyer] PRIMARY KEY CLUSTERED 
(
	[id_buyer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cash_register]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cash_register](
	[id_cash_register] [int] IDENTITY(1,1) NOT NULL,
	[name_cash_register] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cash_register] PRIMARY KEY CLUSTERED 
(
	[id_cash_register] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ELKZ_lent]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELKZ_lent](
	[id_reg_lent] [bigint] IDENTITY(1000000000,1) NOT NULL,
	[num_KPK] [nchar](8) NOT NULL,
	[value_KPK] [nchar](7) NOT NULL,
 CONSTRAINT [PK_ELKZ_lent] PRIMARY KEY CLUSTERED 
(
	[id_reg_lent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id_payment] [tinyint] IDENTITY(1,1) NOT NULL,
	[type_payment] [varchar](11) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[id_payment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_status]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_status](
	[id_status] [tinyint] IDENTITY(1,1) NOT NULL,
	[payment_status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Payment_status] PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Work_time]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Work_time](
	[id_work_time] [int] IDENTITY(1,1) NOT NULL,
	[days_work] [nvarchar](50) NOT NULL,
	[time_start] [time](7) NOT NULL,
	[time_stop] [time](7) NOT NULL,
 CONSTRAINT [PK_Work_time] PRIMARY KEY CLUSTERED 
(
	[id_work_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cashier]  WITH CHECK ADD  CONSTRAINT [FK_Cashier_Company] FOREIGN KEY([id_company])
REFERENCES [dbo].[Company] ([id_company])
GO
ALTER TABLE [dbo].[Cashier] CHECK CONSTRAINT [FK_Cashier_Company]
GO
ALTER TABLE [dbo].[Cheque]  WITH CHECK ADD  CONSTRAINT [FK_Cheque_Buyer] FOREIGN KEY([id_buyer])
REFERENCES [dbo].[Buyer] ([id_buyer])
GO
ALTER TABLE [dbo].[Cheque] CHECK CONSTRAINT [FK_Cheque_Buyer]
GO
ALTER TABLE [dbo].[Cheque]  WITH CHECK ADD  CONSTRAINT [FK_Cheque_Cash_register] FOREIGN KEY([id_cash_register])
REFERENCES [dbo].[Cash_register] ([id_cash_register])
GO
ALTER TABLE [dbo].[Cheque] CHECK CONSTRAINT [FK_Cheque_Cash_register]
GO
ALTER TABLE [dbo].[Cheque]  WITH CHECK ADD  CONSTRAINT [FK_Cheque_Cashier] FOREIGN KEY([id_cashier])
REFERENCES [dbo].[Cashier] ([id_cashier])
GO
ALTER TABLE [dbo].[Cheque] CHECK CONSTRAINT [FK_Cheque_Cashier]
GO
ALTER TABLE [dbo].[Cheque]  WITH CHECK ADD  CONSTRAINT [FK_Cheque_ELKZ_lent] FOREIGN KEY([id_reg_lent])
REFERENCES [dbo].[ELKZ_lent] ([id_reg_lent])
GO
ALTER TABLE [dbo].[Cheque] CHECK CONSTRAINT [FK_Cheque_ELKZ_lent]
GO
ALTER TABLE [dbo].[Cheque]  WITH CHECK ADD  CONSTRAINT [FK_Cheque_Payment] FOREIGN KEY([id_payment])
REFERENCES [dbo].[Payment] ([id_payment])
GO
ALTER TABLE [dbo].[Cheque] CHECK CONSTRAINT [FK_Cheque_Payment]
GO
ALTER TABLE [dbo].[Cheque]  WITH CHECK ADD  CONSTRAINT [FK_Cheque_Payment_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[Payment_status] ([id_status])
GO
ALTER TABLE [dbo].[Cheque] CHECK CONSTRAINT [FK_Cheque_Payment_status]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Work_time] FOREIGN KEY([id_work_time])
REFERENCES [dbo].[Work_time] ([id_work_time])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Work_time]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Kotegory] FOREIGN KEY([id_kategory])
REFERENCES [dbo].[Kotegory] ([id_kategory])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Kotegory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Unit_of_measurement1] FOREIGN KEY([id_unit_of_measurement])
REFERENCES [dbo].[Unit_of_measurement] ([id_unit_of_measurement])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Unit_of_measurement1]
GO
ALTER TABLE [dbo].[Product-Cheque]  WITH CHECK ADD  CONSTRAINT [FK_Product-Cheque_Cheque] FOREIGN KEY([id_fisc_check])
REFERENCES [dbo].[Cheque] ([id_fisc_check])
GO
ALTER TABLE [dbo].[Product-Cheque] CHECK CONSTRAINT [FK_Product-Cheque_Cheque]
GO
ALTER TABLE [dbo].[Product-Cheque]  WITH CHECK ADD  CONSTRAINT [FK_Product-Cheque_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id_product])
GO
ALTER TABLE [dbo].[Product-Cheque] CHECK CONSTRAINT [FK_Product-Cheque_Product]
GO
ALTER TABLE [dbo].[Buyer]  WITH CHECK ADD  CONSTRAINT [CK_Buyer] CHECK  (([discount]>(0) AND [discount]<(50) OR [discount] IS NULL))
GO
ALTER TABLE [dbo].[Buyer] CHECK CONSTRAINT [CK_Buyer]
GO
ALTER TABLE [dbo].[Cheque]  WITH CHECK ADD  CONSTRAINT [CK_count_product_strings] CHECK  (([count_product_strings] IS NULL OR [count_product_strings]>=(1)))
GO
ALTER TABLE [dbo].[Cheque] CHECK CONSTRAINT [CK_count_product_strings]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [CK_INN] CHECK  (([INN] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [CK_INN]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [CK_reg_nom] CHECK  (([reg_nom] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [CK_reg_nom]
GO
ALTER TABLE [dbo].[ELKZ_lent]  WITH CHECK ADD  CONSTRAINT [CK_num_KPK] CHECK  (([num_KPK] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[ELKZ_lent] CHECK CONSTRAINT [CK_num_KPK]
GO
ALTER TABLE [dbo].[ELKZ_lent]  WITH CHECK ADD  CONSTRAINT [CK_value_KPK] CHECK  (([value_KPK] like '#[0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[ELKZ_lent] CHECK CONSTRAINT [CK_value_KPK]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK_count_product_on_warehose] CHECK  (([count_product_on_warehose]>=(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK_count_product_on_warehose]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK_Product] CHECK  (([price_product]>(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK_Product]
GO
ALTER TABLE [dbo].[Product-Cheque]  WITH CHECK ADD  CONSTRAINT [CK_count_product] CHECK  (([count_product]>(0)))
GO
ALTER TABLE [dbo].[Product-Cheque] CHECK CONSTRAINT [CK_count_product]
GO
ALTER TABLE [dbo].[Work_time]  WITH CHECK ADD  CONSTRAINT [CK_Work_days] CHECK  (([days_work] like '[А-Я][а-я] - [А-Я][а-я]'))
GO
ALTER TABLE [dbo].[Work_time] CHECK CONSTRAINT [CK_Work_days]
GO
/****** Object:  StoredProcedure [dbo].[AllProductsForPeriod]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AllProductsForPeriod]
	@name_company AS nvarchar(50),
	@dateStart AS date,
	@dateStop AS date
AS
BEGIN
SELECT DISTINCT 
		name_kategory,
		name_product,
		sum(count_product) over (partition by name_company, name_product) count_buy,
		unit_of_measurement,
		sum(price_product) over (partition by name_company, name_product) sum_buy
	FROM Cheque Ch
		JOIN [Product-Cheque] PC ON Ch.id_fisc_check = PC.id_fisc_check 
		JOIN Product Prod ON Prod.id_product = PC.id_product
		JOIN Unit_of_measurement Unit ON Unit.id_unit_of_measurement = Prod.id_unit_of_measurement
		JOIN Kotegory Kat ON Kat.id_kategory = Prod.id_kategory
		JOIN Cashier Cash ON Cash.id_cashier = Ch.id_cashier
		JOIN Company Com ON Com.id_company = Cash.id_company
	WHERE name_company = @name_company AND CAST(date_time as date) > @dateStart AND CAST(date_time as date) < @dateStop
END
GO
/****** Object:  StoredProcedure [dbo].[BestCashierOnMounth]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BestCashierOnMounth]
		@name_company AS nvarchar(50),
		@mounth AS tinyint,
		@year as smallint
AS
BEGIN

--SELECT @name_company = 'ООО "Citilink"',
		--@mounth = 11,
		--@year = 2022

SELECT TOP 1 Cash.id_cashier,
		name_cashier,
		fam_cashier,
		otchestvi_cashier,
		sum(result) over (partition by Cash.id_cashier) sum_on_mounth,
		name_company
FROM Cashier Cash JOIN Cheque Ch ON Cash.id_cashier = Ch.id_cashier 
		JOIN [Product-Cheque] PC ON Ch.id_fisc_check = PC.id_fisc_check 
		JOIN Product Prod ON Prod.id_product = PC.id_product
		JOIN Company Com ON Com.id_company = Cash.id_company
		WHERE MONTH(date_time) = @mounth AND YEAR(date_time) = @year AND name_company = @name_company
		ORDER BY sum_on_mounth DESC
END
GO
/****** Object:  StoredProcedure [dbo].[CountProductSell]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountProductSell]
		@name_company AS nvarchar(50),
		@date_start AS date
AS
BEGIN
	DECLARE @date_end as datetime
	SELECT @date_end = (SELECT DateAdd(DAY, 14, @date_start))

	SELECT name_product,
		sum(count_product) over (partition by Prod.id_product) sum_prod,
		sum(price_product) over (partition by Prod.id_product) sum_price_prod
	FROM Cashier Cash JOIN Cheque Ch ON Cash.id_cashier = Ch.id_cashier 
		JOIN [Product-Cheque] PC ON Ch.id_fisc_check = PC.id_fisc_check 
		JOIN Product Prod ON Prod.id_product = PC.id_product
		JOIN Company Com ON Com.id_company = Cash.id_company
		WHERE name_company = @name_company AND CAST(date_time AS date) > @date_start AND date_time < @date_end
		--SELECT @name_company = 'ООО "Citilink"',
			--@date_start = '2022-12-15'

END
GO
/****** Object:  StoredProcedure [dbo].[DelitedFromWarehose]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DelitedFromWarehose]
		@check as bigint
AS
BEGIN
	DECLARE @id_prod AS bigint
	
	DECLARE MyCursor CURSOR FOR --создание курсора
	SELECT id_product FROM [Product-Cheque]  WHERE id_fisc_check = @check
	OPEN MyCursor --открытие курсора
	FETCH next FROM MyCursor INTO @id_prod --переход к следующей записи в крсоре
	WHILE @@FETCH_STATUS = 0
	BEGIN
	EXEC('
		DECLARE @count_on_sklad AS float,
				@count_prod AS float

		SELECT @count_on_sklad = (SELECT count_product_on_warehose FROM Product P 
			JOIN [Product-Cheque] PC ON P.id_product = PC.id_product WHERE id_fisc_check = '+ @check + ' AND P.id_product = '+ @id_prod + ')
		
		SELECT @count_prod = (SELECT count_product FROM [Product-Cheque] P WHERE id_fisc_check = '+ @check + ' AND id_product = '+ @id_prod + ')
		
		IF (@count_on_sklad >= @count_prod AND @count_on_sklad > 0)
		BEGIN
			UPDATE dbo.Product
			SET count_product_on_warehose = @count_on_sklad - @count_prod
			WHERE id_product = '+ @id_prod + '
		END
	')
	FETCH next FROM MyCursor INTO @id_prod --переход к следующей записи в крсоре
	END
	CLOSE MyCursor --закрытие курсора
	DEALLOCATE MyCursor --удаление курсора
END
GO
/****** Object:  StoredProcedure [dbo].[PopularInKategoryInDate]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PopularInKategoryInDate]
	@name_compant AS nvarchar(50),
	@name_kategory AS nvarchar(50),
	@dateStart AS date,
	@dateStop AS date
AS
BEGIN

SELECT TOP 1 name_product, 
		sum(count_product) over (partition by PC.id_product) count_prod_kat,
		name_kategory, 
		sum(price_product) over (partition by PC.id_product) sum_price_kat,
		name_company
	FROM Cashier Cash JOIN Cheque Ch ON Cash.id_cashier = Ch.id_cashier 
		JOIN [Product-Cheque] PC ON Ch.id_fisc_check = PC.id_fisc_check 
		JOIN Product Prod ON Prod.id_product = PC.id_product
		JOIN Kotegory Kat ON Prod.id_kategory = Kat.id_kategory
		JOIN Company Com ON Com.id_company = Cash.id_company

		WHERE name_company = @name_compant AND 
		name_kategory = @name_kategory AND 
		CAST(date_time as date) > @dateStart AND 
		CAST(date_time as date) < @dateStop

	ORDER BY count_prod_kat DESC
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStatus]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStatus] 
		@check as bigint
AS
BEGIN
DECLARE @payment as tinyint
SELECT @payment = (SELECT id_payment FROM Cheque WHERE id_fisc_check = @check )
		IF (@payment = 1)
		BEGIN
			IF ((SELECT change FROM Cheque WHERE id_fisc_check = @check) IS NULL)
				BEGIN
					UPDATE dbo.Cheque
					SET id_status = 2
					WHERE id_fisc_check = @check
				END
			ELSE
				BEGIN
					UPDATE dbo.Cheque
					SET id_status = 3
					WHERE id_fisc_check = @check
					EXEC dbo.DelitedFromWarehose @check
				END
		END
		ELSE
		BEGIN
		IF ((SELECT entered FROM Cheque WHERE id_fisc_check = @check) IS NOT NULL)
			BEGIN
				UPDATE dbo.Cheque
				SET id_status = 3
				WHERE id_fisc_check = @check
				EXEC dbo.DelitedFromWarehose @check
			END
			ELSE
			BEGIN
				UPDATE dbo.Cheque
				SET id_status = 2
				WHERE id_fisc_check = @check
			END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[СalculationChange]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[СalculationChange] 
		@enter as float,
		@check as bigint,
		@payment as tinyint,
		@result as float
AS
BEGIN
DECLARE @change as float
	IF ( @payment = 1 )
	BEGIN
		SELECT @change =  ROUND ((@enter - @result) , 2)
		IF (@change IS NULL) 
			BEGIN
				SELECT @change = 0
			END
		IF ( @change > 0 )
		BEGIN
		UPDATE dbo.Cheque
		SET change = @change
		WHERE id_fisc_check = @check

		RETURN 1

		END
		ELSE
		BEGIN
			UPDATE dbo.Cheque
			SET change = NULL
			WHERE id_fisc_check = @check
			RETURN 1
		END
	END
	IF (@payment = 2)
	BEGIN
		SELECT @enter = @result
		SELECT @change = 0
		UPDATE dbo.Cheque
		SET change = @change,
			entered = @enter
		WHERE id_fisc_check = @check

		RETURN 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[СalculationResult]    Script Date: 27.12.2022 0:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[СalculationResult] 
		@Prod as bigint, 
		@check as bigint, 
		@coll as float
AS
BEGIN
	IF (@coll > 0 AND @check in (SELECT id_fisc_check FROM Cheque) AND @Prod in (SELECT id_product FROM Product))
	BEGIN
		DECLARE @subtotal as float,
				@result as float,
				@count_prod as smallint,-- объявляем переменную для подсчета записей
				@bimbim as float

		
		SELECT @count_prod = (Select count(*) from [Product-Cheque]
		where id_fisc_check = @check) -- Кол товарных строк

		SELECT @bimbim = (SELECT discount FROM Buyer WHERE id_buyer = (SELECT id_buyer FROM Cheque WHERE id_fisc_check = @check)) --Скидка

		SELECT @subtotal = ROUND ( (SELECT  sum(price_product*count_product) FROM (SELECT * FROM [Product-Cheque] WHERE id_fisc_check = @check) PC join Product P
		ON PC.id_product = P.id_product), 2) -- подитог

		SELECT @result = ROUND ((@subtotal - @subtotal * (SELECT CASE WHEN @bimbim Is NOT NULL THEN @bimbim ELSE 0 END discount)/100) , 2)--итог
		
		UPDATE dbo.Cheque
		SET subtotal = @subtotal,
			result = @result,
			count_product_strings = @count_prod
		WHERE id_fisc_check = @check
		RETURN 1
	END
	ELSE
	BEGIN
		RETURN 0
	END
END
GO
USE [master]
GO
ALTER DATABASE [Продажа_товаров] SET  READ_WRITE 
GO
