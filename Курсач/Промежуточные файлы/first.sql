USE [master]
GO
/****** Object:  Database [Продажа_товаров]    Script Date: 24.12.2022 17:22:26 ******/
CREATE DATABASE [Продажа_товаров]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Продажа_товаров', FILENAME = N'D:\games\MSSQL15.SQLEXPRESS\MSSQL\DATA\Продажа_товаров.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Продажа_товаров_log', FILENAME = N'D:\games\MSSQL15.SQLEXPRESS\MSSQL\DATA\Продажа_товаров_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [Продажа_товаров] SET QUERY_STORE = OFF
GO
USE [Продажа_товаров]
GO
/****** Object:  Table [dbo].[Buyer]    Script Date: 24.12.2022 17:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buyer](
	[id_buyer] [int] IDENTITY(1,100000) NOT NULL,
	[name_buyer] [varchar](50) NOT NULL,
	[fam_buyer] [varchar](50) NOT NULL,
	[otchestvo_buyer] [varchar](50) NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_Buyer] PRIMARY KEY CLUSTERED 
(
	[id_buyer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cash_register]    Script Date: 24.12.2022 17:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cash_register](
	[id_cash_register] [int] IDENTITY(1,1) NOT NULL,
	[name_cash_register] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cash_register] PRIMARY KEY CLUSTERED 
(
	[id_cash_register] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cashier]    Script Date: 24.12.2022 17:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cashier](
	[id_cashier] [int] IDENTITY(1,1) NOT NULL,
	[name_cashier] [varchar](50) NOT NULL,
	[fam_cashier] [varchar](50) NOT NULL,
	[otchestvi_cashier] [varchar](50) NULL,
	[id_company] [int] NOT NULL,
 CONSTRAINT [PK_Cashier] PRIMARY KEY CLUSTERED 
(
	[id_cashier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cheque]    Script Date: 24.12.2022 17:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cheque](
	[id_fisc_check] [bigint] IDENTITY(1,10000) NOT NULL,
	[subtotal] [float] NULL,
	[result] [float] NULL,
	[date_time] [datetime] NOT NULL,
	[entered] [float] NOT NULL,
	[change] [float] NULL,
	[count_product_strings] [smallint] NULL,
	[id_buyer] [int] NOT NULL,
	[id_cash_register] [int] NOT NULL,
	[id_cashier] [int] NOT NULL,
	[id_reg_lent] [bigint] NOT NULL,
	[id_payment] [smallint] NOT NULL,
	[id_status] [smallint] NOT NULL,
 CONSTRAINT [PK_Cheque] PRIMARY KEY CLUSTERED 
(
	[id_fisc_check] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 24.12.2022 17:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[id_company] [int] IDENTITY(1,1) NOT NULL,
	[name_company] [varchar](50) NOT NULL,
	[address_company] [varchar](50) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[reg_nom] [varchar](12) NOT NULL,
	[id_work_time] [int] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[id_company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ELKZ_lent]    Script Date: 24.12.2022 17:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELKZ_lent](
	[id_reg_lent] [bigint] IDENTITY(1,1000000000) NOT NULL,
	[num_KPK] [int] NOT NULL,
	[value_KPK] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ELKZ_lent] PRIMARY KEY CLUSTERED 
(
	[id_reg_lent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kotegory]    Script Date: 24.12.2022 17:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kotegory](
	[id_kategory] [int] IDENTITY(1,1) NOT NULL,
	[name_kategory] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Kotegory] PRIMARY KEY CLUSTERED 
(
	[id_kategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 24.12.2022 17:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id_payment] [smallint] IDENTITY(1,1) NOT NULL,
	[type_payment] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[id_payment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_status]    Script Date: 24.12.2022 17:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_status](
	[id_status] [smallint] IDENTITY(1,1) NOT NULL,
	[payment_status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Payment_status] PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 24.12.2022 17:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id_product] [bigint] IDENTITY(1,1000000000000) NOT NULL,
	[price_product] [money] NOT NULL,
	[name_product] [varchar](50) NOT NULL,
	[count_product_on_warehose] [int] NOT NULL,
	[id_unit_of_measurement] [int] NOT NULL,
	[id_kategory] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit_of_measurement]    Script Date: 24.12.2022 17:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit_of_measurement](
	[id_unit_of_measurement] [int] IDENTITY(1,1) NOT NULL,
	[unit_of_measurement] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Unit_of_measurement] PRIMARY KEY CLUSTERED 
(
	[id_unit_of_measurement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Work_time]    Script Date: 24.12.2022 17:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Work_time](
	[id_work_time] [int] IDENTITY(1,1) NOT NULL,
	[days_work] [varchar](50) NOT NULL,
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
USE [master]
GO
ALTER DATABASE [Продажа_товаров] SET  READ_WRITE 
GO
