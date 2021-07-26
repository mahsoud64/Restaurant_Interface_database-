USE [master]
GO
/****** Object:  Database [YummyPizza]    Script Date: 3/28/2021 9:43:56 PM ******/
CREATE DATABASE [YummyPizza]
 CONTAINMENT = NONE

GO
ALTER DATABASE [YummyPizza] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YummyPizza].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YummyPizza] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YummyPizza] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YummyPizza] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YummyPizza] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YummyPizza] SET ARITHABORT OFF 
GO
ALTER DATABASE [YummyPizza] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YummyPizza] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YummyPizza] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YummyPizza] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YummyPizza] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YummyPizza] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YummyPizza] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YummyPizza] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YummyPizza] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YummyPizza] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YummyPizza] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YummyPizza] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YummyPizza] SET TRUSTWORTHY ON 
GO
ALTER DATABASE [YummyPizza] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YummyPizza] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YummyPizza] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YummyPizza] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YummyPizza] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [YummyPizza] SET  MULTI_USER 
GO
ALTER DATABASE [YummyPizza] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YummyPizza] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YummyPizza] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YummyPizza] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YummyPizza] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YummyPizza] SET QUERY_STORE = OFF
GO
USE [YummyPizza]
GO
/****** Object:  UserDefinedTableType [dbo].[Items]    Script Date: 3/28/2021 9:43:56 PM ******/
CREATE TYPE [dbo].[Items] AS TABLE(
	[Item_Qty] [int] NULL,
	[Item_Price] [numeric](18, 4) NULL,
	[Total_Price] [numeric](18, 4) NULL,
	[Item_Number] [int] NULL
)
GO
/****** Object:  Table [dbo].[Customer_Delivery_Address]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Delivery_Address](
	[Customer_Delivery_Id] [int] IDENTITY(1,1) NOT NULL,
	[Delivery_Address] [varchar](100) NULL,
	[Order_id] [int] NULL,
	[Customer_Id] [int] NULL,
 CONSTRAINT [PK_Customer_Delivery_Address] PRIMARY KEY CLUSTERED 
(
	[Customer_Delivery_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Customer_id] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nchar](300) NOT NULL,
	[Last_Name] [nchar](100) NULL,
	[Phone_No] [int] NULL,
	[Email] [nchar](100) NULL,
	[City] [nchar](100) NULL,
	[Street_Name] [nchar](100) NULL,
	[House_No] [nchar](100) NULL,
	[Customer_Type] [varchar](100) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[Delivery_Id] [int] IDENTITY(1,1) NOT NULL,
	[Total_No_Of_Delivery] [int] NULL,
	[Delivery_Date] [datetime] NULL,
	[Employee_Id] [int] NULL,
	[Shift_Id] [int] NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[Delivery_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[Discount_Id] [int] IDENTITY(1,1) NOT NULL,
	[Discount_Code] [nchar](50) NULL,
	[Disc_Percentage] [decimal](18, 0) NULL,
	[Disc_Start_Date] [datetime] NULL,
	[Disc_End_Date] [datetime] NULL,
	[Req_For_Disc] [varchar](300) NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[Discount_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Payment]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Payment](
	[Emp_Payment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Total_Payment] [numeric](18, 0) NULL,
	[Total_Shift_Hours] [numeric](18, 0) NULL,
	[Payment_Date] [datetime] NULL,
	[Shift_Id] [int] NULL,
	[Employee_Id] [int] NULL,
 CONSTRAINT [PK_Employee_Payment] PRIMARY KEY CLUSTERED 
(
	[Emp_Payment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Employee_Id] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Name] [nchar](100) NULL,
	[Emp_Phone_No] [int] NULL,
	[Postal_Address] [nchar](500) NULL,
	[Emp_Type] [nchar](10) NULL,
	[Tax_File] [nchar](100) NULL,
	[Bank_Code] [nchar](10) NULL,
	[Bank_Name] [nchar](50) NULL,
	[Bank_Account_No] [nchar](100) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[Ingredients_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Description] [nchar](100) NULL,
	[Suggested_Stock_Level] [varchar](30) NULL,
	[Stock_Take] [nchar](10) NULL,
	[Stock_Date] [datetime] NULL,
	[Supplier_Id] [int] NULL,
 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED 
(
	[Ingredients_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Menu_Id] [int] IDENTITY(1,1) NOT NULL,
	[Ingredient_Qty] [int] NULL,
	[Menu_Item_Id] [int] NULL,
	[Ingredient_Id] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Menu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_Items]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Items](
	[Menu_Item_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NULL,
	[Size] [nchar](10) NULL,
	[Current_Selling_Price] [decimal](18, 0) NULL,
	[Item_Code] [nchar](50) NULL,
 CONSTRAINT [PK_Menu_Items] PRIMARY KEY CLUSTERED 
(
	[Menu_Item_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_Id] [int] IDENTITY(1,1) NOT NULL,
	[Order_Status] [nchar](10) NULL,
	[Order_Date] [datetime] NULL,
	[Delivery_Date] [datetime] NULL,
	[Total_Price] [numeric](18, 4) NULL,
	[Customer_Type] [nchar](10) NULL,
	[Total_Items] [int] NULL,
	[Discount_Code] [nchar](50) NULL,
	[Dis_Amount] [numeric](18, 4) NULL,
	[Total_Due_Amount] [numeric](18, 4) NULL,
	[Description] [nchar](200) NULL,
	[Payment_Method] [nchar](10) NULL,
	[Payment_Approval_Code] [nchar](50) NULL,
	[Delivery_Type] [nchar](10) NULL,
	[Customer_Id] [int] NULL,
	[Employee_Id] [int] NULL,
	[Order_Number] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[Order_Detail_Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Qty] [int] NULL,
	[Item_Price] [numeric](18, 4) NULL,
	[Total_Price] [numeric](18, 4) NULL,
	[Item_Number] [int] NULL,
	[Order_Id] [int] NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[Order_Detail_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Payment]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Payment](
	[Order_Payment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Payment_Method] [nchar](10) NULL,
	[Payment_Approval_No] [nchar](100) NULL,
	[Customer_Id] [int] NULL,
	[Order_Id] [int] NULL,
 CONSTRAINT [PK_Order_Payment] PRIMARY KEY CLUSTERED 
(
	[Order_Payment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shift]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[Shift_Id] [int] IDENTITY(1,1) NOT NULL,
	[Start_Date] [date] NULL,
	[Start_Time] [time](7) NULL,
	[End_Date] [date] NULL,
	[End_Time] [time](7) NULL,
 CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED 
(
	[Shift_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Supplier_id] [int] IDENTITY(1,1) NOT NULL,
	[Supplier_Name] [nchar](50) NULL,
	[Supplier_Email] [nchar](50) NULL,
	[Supplier_Phone] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer_Delivery_Address] ON 
GO
INSERT [dbo].[Customer_Delivery_Address] ([Customer_Delivery_Id], [Delivery_Address], [Order_id], [Customer_Id]) VALUES (1, N'Birmingham Gardens Nsw                                                                              ', 1, 2)
GO
INSERT [dbo].[Customer_Delivery_Address] ([Customer_Delivery_Id], [Delivery_Address], [Order_id], [Customer_Id]) VALUES (2, N'Wallsend Road unit 4 Nsw                                                                            ', 2, 1)
GO
INSERT [dbo].[Customer_Delivery_Address] ([Customer_Delivery_Id], [Delivery_Address], [Order_id], [Customer_Id]) VALUES (3, N'John Hunter  Nsw                                                                                    ', 3, 3)
GO
SET IDENTITY_INSERT [dbo].[Customer_Delivery_Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([Customer_id], [First_Name], [Last_Name], [Phone_No], [Email], [City], [Street_Name], [House_No], [Customer_Type]) VALUES (1, N'JOHN                                                                                                                                                                                                                                                                                                        ', N'DOE                                                                                                 ', 98989889, N'john@gmail.com                                                                                      ', N'Sydney                                                                                              ', N'10-H, Block, Aus                                                                                    ', N'House no 10                                                                                         ', N'WALKING-IN')
GO
INSERT [dbo].[Customers] ([Customer_id], [First_Name], [Last_Name], [Phone_No], [Email], [City], [Street_Name], [House_No], [Customer_Type]) VALUES (2, N'Frank                                                                                                                                                                                                                                                                                                       ', N'Smith                                                                                               ', 1234321, N'frank@gmail.com                                                                                     ', N'Sydney                                                                                              ', N'Millerd rd Nsw                                                                                      ', N'House No 4                                                                                          ', N'PHONE')
GO
INSERT [dbo].[Customers] ([Customer_id], [First_Name], [Last_Name], [Phone_No], [Email], [City], [Street_Name], [House_No], [Customer_Type]) VALUES (3, N'Peter                                                                                                                                                                                                                                                                                                       ', N'Anderson                                                                                            ', 43214592, N'peter@gmail.com                                                                                     ', N'Sydney                                                                                              ', N'Canara place Nsw                                                                                    ', N'House no 7                                                                                          ', N'ONLINE')
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 
GO
INSERT [dbo].[Delivery] ([Delivery_Id], [Total_No_Of_Delivery], [Delivery_Date], [Employee_Id], [Shift_Id]) VALUES (1, 3, CAST(N'2021-01-04T11:10:14.000' AS DateTime), 1, 2)
GO
INSERT [dbo].[Delivery] ([Delivery_Id], [Total_No_Of_Delivery], [Delivery_Date], [Employee_Id], [Shift_Id]) VALUES (2, 2, CAST(N'2021-01-05T10:17:13.000' AS DateTime), 3, 3)
GO
INSERT [dbo].[Delivery] ([Delivery_Id], [Total_No_Of_Delivery], [Delivery_Date], [Employee_Id], [Shift_Id]) VALUES (3, 6, CAST(N'2021-01-06T13:15:15.000' AS DateTime), 2, 2)
GO
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 
GO
INSERT [dbo].[Discount] ([Discount_Id], [Discount_Code], [Disc_Percentage], [Disc_Start_Date], [Disc_End_Date], [Req_For_Disc]) VALUES (1, N'GMMZHH                                            ', CAST(5 AS Decimal(18, 0)), CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-03T00:00:00.000' AS DateTime), N'Minimun 50 dollar spent')
GO
INSERT [dbo].[Discount] ([Discount_Id], [Discount_Code], [Disc_Percentage], [Disc_Start_Date], [Disc_End_Date], [Req_For_Disc]) VALUES (2, N'ZZZGHT                                            ', CAST(7 AS Decimal(18, 0)), CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-04T00:00:00.000' AS DateTime), N'Buy Minimum 2 items')
GO
INSERT [dbo].[Discount] ([Discount_Id], [Discount_Code], [Disc_Percentage], [Disc_Start_Date], [Disc_End_Date], [Req_For_Disc]) VALUES (3, N'FFF333                                            ', CAST(8 AS Decimal(18, 0)), CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-05T00:00:00.000' AS DateTime), N'Minimun 50 dollar spent')
GO
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee_Payment] ON 
GO
INSERT [dbo].[Employee_Payment] ([Emp_Payment_Id], [Total_Payment], [Total_Shift_Hours], [Payment_Date], [Shift_Id], [Employee_Id]) VALUES (1, CAST(125 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), CAST(N'2021-03-25T00:00:00.000' AS DateTime), 3, 3)
GO
INSERT [dbo].[Employee_Payment] ([Emp_Payment_Id], [Total_Payment], [Total_Shift_Hours], [Payment_Date], [Shift_Id], [Employee_Id]) VALUES (2, CAST(100 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(N'2021-03-26T00:00:00.000' AS DateTime), 2, 2)
GO
INSERT [dbo].[Employee_Payment] ([Emp_Payment_Id], [Total_Payment], [Total_Shift_Hours], [Payment_Date], [Shift_Id], [Employee_Id]) VALUES (3, CAST(100 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(N'2021-03-26T00:00:00.000' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Employee_Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([Employee_Id], [Emp_Name], [Emp_Phone_No], [Postal_Address], [Emp_Type], [Tax_File], [Bank_Code], [Bank_Name], [Bank_Account_No]) VALUES (1, N'Amy                                                                                                 ', 2304050, N'2300                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'InStore   ', N'3358221                                                                                             ', N'000234    ', N'Commonwealth                                      ', N'2341458                                                                                             ')
GO
INSERT [dbo].[Employees] ([Employee_Id], [Emp_Name], [Emp_Phone_No], [Postal_Address], [Emp_Type], [Tax_File], [Bank_Code], [Bank_Name], [Bank_Account_No]) VALUES (2, N'Selana                                                                                              ', 4582284, N'2300                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'Driver    ', N'4434522                                                                                             ', N'333777    ', N'NAB                                               ', N'4234555                                                                                             ')
GO
INSERT [dbo].[Employees] ([Employee_Id], [Emp_Name], [Emp_Phone_No], [Postal_Address], [Emp_Type], [Tax_File], [Bank_Code], [Bank_Name], [Bank_Account_No]) VALUES (3, N'Raymond                                                                                             ', 7738834, N'2300                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'Driver    ', N'5422345                                                                                             ', N'444333    ', N'ANZ                                               ', N'4532235                                                                                             ')
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingredients] ON 
GO
INSERT [dbo].[Ingredients] ([Ingredients_Id], [Name], [Type], [Description], [Suggested_Stock_Level], [Stock_Take], [Stock_Date], [Supplier_Id]) VALUES (1, N'Onion                                             ', N'Salad', N'Red onion                                                                                           ', N'2kg', N'1.5kg     ', CAST(N'2021-02-08T14:49:33.000' AS DateTime), 1)
GO
INSERT [dbo].[Ingredients] ([Ingredients_Id], [Name], [Type], [Description], [Suggested_Stock_Level], [Stock_Take], [Stock_Date], [Supplier_Id]) VALUES (2, N'Capsicum                                          ', N'vegetable', N'only green capsicum                                                                                 ', N'1kg', N'500mg     ', CAST(N'2021-03-09T12:13:51.000' AS DateTime), 3)
GO
INSERT [dbo].[Ingredients] ([Ingredients_Id], [Name], [Type], [Description], [Suggested_Stock_Level], [Stock_Take], [Stock_Date], [Supplier_Id]) VALUES (3, N'Chicken                                           ', N'Mean', N'only chicken breat                                                                                  ', N'5kg', N'4kg       ', CAST(N'2021-04-01T11:10:14.000' AS DateTime), 2)
GO
SET IDENTITY_INSERT [dbo].[Ingredients] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([Menu_Id], [Ingredient_Qty], [Menu_Item_Id], [Ingredient_Id]) VALUES (1, 2, 2, 1)
GO
INSERT [dbo].[Menu] ([Menu_Id], [Ingredient_Qty], [Menu_Item_Id], [Ingredient_Id]) VALUES (2, 1, 1, 2)
GO
INSERT [dbo].[Menu] ([Menu_Id], [Ingredient_Qty], [Menu_Item_Id], [Ingredient_Id]) VALUES (3, 2, 3, 3)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu_Items] ON 
GO
INSERT [dbo].[Menu_Items] ([Menu_Item_Id], [Name], [Size], [Current_Selling_Price], [Item_Code]) VALUES (1, N'Chesse pizza                                      ', N'large     ', CAST(19 AS Decimal(18, 0)), N'2                                                 ')
GO
INSERT [dbo].[Menu_Items] ([Menu_Item_Id], [Name], [Size], [Current_Selling_Price], [Item_Code]) VALUES (2, N'Meat lover pizza                                  ', N'Medium    ', CAST(24 AS Decimal(18, 0)), N'3                                                 ')
GO
INSERT [dbo].[Menu_Items] ([Menu_Item_Id], [Name], [Size], [Current_Selling_Price], [Item_Code]) VALUES (3, N'Chicken pizza                                     ', N'Small     ', CAST(15 AS Decimal(18, 0)), N'4                                                 ')
GO
SET IDENTITY_INSERT [dbo].[Menu_Items] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([Order_Id], [Order_Status], [Order_Date], [Delivery_Date], [Total_Price], [Customer_Type], [Total_Items], [Discount_Code], [Dis_Amount], [Total_Due_Amount], [Description], [Payment_Method], [Payment_Approval_Code], [Delivery_Type], [Customer_Id], [Employee_Id], [Order_Number]) VALUES (1, N'pending   ', CAST(N'2021-01-06T00:00:00.000' AS DateTime), CAST(N'2021-01-06T00:00:00.000' AS DateTime), CAST(50.0000 AS Numeric(18, 4)), N'Phone     ', 4, N'GMMZHH                                            ', CAST(6.0000 AS Numeric(18, 4)), CAST(44.0000 AS Numeric(18, 4)), N'please dont add pineapple                                                                                                                                                                               ', N'Card      ', N'000111                                            ', N'Pickup    ', 2, 2, NULL)
GO
INSERT [dbo].[Order] ([Order_Id], [Order_Status], [Order_Date], [Delivery_Date], [Total_Price], [Customer_Type], [Total_Items], [Discount_Code], [Dis_Amount], [Total_Due_Amount], [Description], [Payment_Method], [Payment_Approval_Code], [Delivery_Type], [Customer_Id], [Employee_Id], [Order_Number]) VALUES (2, N'completed ', CAST(N'2021-01-05T00:00:00.000' AS DateTime), CAST(N'2021-01-05T00:00:00.000' AS DateTime), CAST(70.0000 AS Numeric(18, 4)), N'Walking-In', 6, N'ZZZGHT                                            ', CAST(12.0000 AS Numeric(18, 4)), CAST(58.0000 AS Numeric(18, 4)), N'please call on arrival                                                                                                                                                                                  ', N'Cash      ', N'000112                                            ', N'delivery  ', 1, 1, NULL)
GO
INSERT [dbo].[Order] ([Order_Id], [Order_Status], [Order_Date], [Delivery_Date], [Total_Price], [Customer_Type], [Total_Items], [Discount_Code], [Dis_Amount], [Total_Due_Amount], [Description], [Payment_Method], [Payment_Approval_Code], [Delivery_Type], [Customer_Id], [Employee_Id], [Order_Number]) VALUES (3, N'completed ', CAST(N'2021-01-04T00:00:00.000' AS DateTime), CAST(N'2021-01-04T00:00:00.000' AS DateTime), CAST(80.0000 AS Numeric(18, 4)), N'Online    ', 5, N'FFF333                                            ', CAST(14.0000 AS Numeric(18, 4)), CAST(70.0000 AS Numeric(18, 4)), N'add extra cheese                                                                                                                                                                                        ', N'Card      ', N'000113                                            ', N'Takeaway  ', 3, 3, NULL)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Detail] ON 
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (1, 4, CAST(12.0000 AS Numeric(18, 4)), CAST(50.0000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (2, 5, CAST(14.0000 AS Numeric(18, 4)), CAST(70.0000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (3, 3, CAST(27.0000 AS Numeric(18, 4)), CAST(80.0000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (4, 2, CAST(3.0000 AS Numeric(18, 4)), CAST(3.0000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (5, 2, CAST(3.0000 AS Numeric(18, 4)), CAST(3.0000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (6, 2, CAST(3.0000 AS Numeric(18, 4)), CAST(3.0000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (7, 2, CAST(3.0000 AS Numeric(18, 4)), CAST(3.0000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (8, 2, CAST(3.0000 AS Numeric(18, 4)), CAST(3.0000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (9, 2, CAST(3.0000 AS Numeric(18, 4)), CAST(3.0000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (10, 2, CAST(3.0000 AS Numeric(18, 4)), CAST(3.0000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (11, 2, CAST(3.0000 AS Numeric(18, 4)), CAST(3.0000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (12, 2, CAST(3.0000 AS Numeric(18, 4)), CAST(3.0000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (13, 2, CAST(2.5000 AS Numeric(18, 4)), CAST(3.2000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (14, 2, CAST(2.5000 AS Numeric(18, 4)), CAST(3.2000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (15, 2, CAST(2.5000 AS Numeric(18, 4)), CAST(3.2000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (16, 2, CAST(2.5000 AS Numeric(18, 4)), CAST(5.2000 AS Numeric(18, 4)), NULL, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (17, 2, CAST(2.5000 AS Numeric(18, 4)), CAST(3.2000 AS Numeric(18, 4)), 2, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (18, 2, CAST(2.5000 AS Numeric(18, 4)), CAST(3.2000 AS Numeric(18, 4)), 2, NULL)
GO
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Item_Qty], [Item_Price], [Total_Price], [Item_Number], [Order_Id]) VALUES (19, 2, CAST(2.5000 AS Numeric(18, 4)), CAST(3.2000 AS Numeric(18, 4)), 3, NULL)
GO
SET IDENTITY_INSERT [dbo].[Order_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Payment] ON 
GO
INSERT [dbo].[Order_Payment] ([Order_Payment_Id], [Payment_Method], [Payment_Approval_No], [Customer_Id], [Order_Id]) VALUES (1, N'Card      ', N'000111                                                                                              ', 2, 2)
GO
INSERT [dbo].[Order_Payment] ([Order_Payment_Id], [Payment_Method], [Payment_Approval_No], [Customer_Id], [Order_Id]) VALUES (2, N'Cash      ', N'000112                                                                                              ', 1, 1)
GO
INSERT [dbo].[Order_Payment] ([Order_Payment_Id], [Payment_Method], [Payment_Approval_No], [Customer_Id], [Order_Id]) VALUES (3, N'Card      ', N'000113                                                                                              ', 3, 3)
GO
SET IDENTITY_INSERT [dbo].[Order_Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Shift] ON 
GO
INSERT [dbo].[Shift] ([Shift_Id], [Start_Date], [Start_Time], [End_Date], [End_Time]) VALUES (1, CAST(N'2021-01-04' AS Date), CAST(N'05:00:05' AS Time), CAST(N'2021-01-04' AS Date), CAST(N'10:30:55' AS Time))
GO
INSERT [dbo].[Shift] ([Shift_Id], [Start_Date], [Start_Time], [End_Date], [End_Time]) VALUES (2, CAST(N'2021-01-05' AS Date), CAST(N'04:00:07' AS Time), CAST(N'2021-01-05' AS Date), CAST(N'08:30:45' AS Time))
GO
INSERT [dbo].[Shift] ([Shift_Id], [Start_Date], [Start_Time], [End_Date], [End_Time]) VALUES (3, CAST(N'2021-01-06' AS Date), CAST(N'06:00:09' AS Time), CAST(N'2021-01-06' AS Date), CAST(N'10:00:30' AS Time))
GO
SET IDENTITY_INSERT [dbo].[Shift] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 
GO
INSERT [dbo].[Supplier] ([Supplier_id], [Supplier_Name], [Supplier_Email], [Supplier_Phone]) VALUES (1, N'Staggels                                          ', N'staggels@gmail.com                                ', 12394959)
GO
INSERT [dbo].[Supplier] ([Supplier_id], [Supplier_Name], [Supplier_Email], [Supplier_Phone]) VALUES (2, N'Woolworth                                         ', N'woolworth@gmail.com                               ', 45322358)
GO
INSERT [dbo].[Supplier] ([Supplier_id], [Supplier_Name], [Supplier_Email], [Supplier_Phone]) VALUES (3, N'Coles                                             ', N'coles@gmail.com                                   ', 2348583)
GO
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
ALTER TABLE [dbo].[Customer_Delivery_Address]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Delivery_Address_Customers] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customers] ([Customer_id])
GO
ALTER TABLE [dbo].[Customer_Delivery_Address] CHECK CONSTRAINT [FK_Customer_Delivery_Address_Customers]
GO
ALTER TABLE [dbo].[Customer_Delivery_Address]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Delivery_Address_Order] FOREIGN KEY([Order_id])
REFERENCES [dbo].[Order] ([Order_Id])
GO
ALTER TABLE [dbo].[Customer_Delivery_Address] CHECK CONSTRAINT [FK_Customer_Delivery_Address_Order]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Employees] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employees] ([Employee_Id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Employees]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Shift] FOREIGN KEY([Shift_Id])
REFERENCES [dbo].[Shift] ([Shift_Id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Shift]
GO
ALTER TABLE [dbo].[Employee_Payment]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Payment_Employees] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employees] ([Employee_Id])
GO
ALTER TABLE [dbo].[Employee_Payment] CHECK CONSTRAINT [FK_Employee_Payment_Employees]
GO
ALTER TABLE [dbo].[Employee_Payment]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Payment_Shift] FOREIGN KEY([Shift_Id])
REFERENCES [dbo].[Shift] ([Shift_Id])
GO
ALTER TABLE [dbo].[Employee_Payment] CHECK CONSTRAINT [FK_Employee_Payment_Shift]
GO
ALTER TABLE [dbo].[Ingredients]  WITH CHECK ADD  CONSTRAINT [FK_Ingredients_Supplier] FOREIGN KEY([Supplier_Id])
REFERENCES [dbo].[Supplier] ([Supplier_id])
GO
ALTER TABLE [dbo].[Ingredients] CHECK CONSTRAINT [FK_Ingredients_Supplier]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Ingredients] FOREIGN KEY([Ingredient_Id])
REFERENCES [dbo].[Ingredients] ([Ingredients_Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Ingredients]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Menu_Items] FOREIGN KEY([Menu_Item_Id])
REFERENCES [dbo].[Menu_Items] ([Menu_Item_Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Menu_Items]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customers] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customers] ([Customer_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customers]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employees] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employees] ([Employee_Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employees]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Menu_Items] FOREIGN KEY([Item_Number])
REFERENCES [dbo].[Menu_Items] ([Menu_Item_Id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Menu_Items]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Order] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Order] ([Order_Id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Order]
GO
ALTER TABLE [dbo].[Order_Payment]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment_Customers] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customers] ([Customer_id])
GO
ALTER TABLE [dbo].[Order_Payment] CHECK CONSTRAINT [FK_Order_Payment_Customers]
GO
ALTER TABLE [dbo].[Order_Payment]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment_Order] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Order] ([Order_Id])
GO
ALTER TABLE [dbo].[Order_Payment] CHECK CONSTRAINT [FK_Order_Payment_Order]
GO
/****** Object:  StoredProcedure [dbo].[usp_createCustomerOrder]    Script Date: 3/28/2021 9:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT * FROM [Order]
--DECLARE @Items_TVP AS Items;
--INSERT INTO @Items_TVP(Order_Detail_Id, Item_Qty, Item_Price, Total_Price)
--VALUES 
--(13, 2, 2.5, 3.2),
--(14, 2, 2.5, 3.2),
--(15, 2, 2.5, 3.2)
--EXEC usp_createCustomerOrder  @Items_TVP, '1', 'QQQQ', 'TYPE', '2021-01-06 00:00:00.000', '2021-01-06 00:00:00.000', '2021-01-06 00:00:00.000', 'Pickup', 'New Address','000111', 1

-- =============================================
-- Author:		<Ahmed Masoud>
-- Create date: <3/28/2021>
-- =============================================
CREATE PROCEDURE [dbo].[usp_createCustomerOrder]
	@Items_TVP Items READONLY,
    @Customer_Id int,
	@Discount_Code varchar(50),
	@Type varchar(50),
	@OrderDateTime datetime,
	@DateTimeOrderNeedsFulfilling datetime,
	@DateTimeOrderComplete datetime,
	@DeliveryMode varchar(50),
	@DeliveryAddress varchar(500),
	@PaymentConfirmation varchar(100),
	@OrderTakeBy int

AS
BEGIN

	SET NOCOUNT ON;

	--INSERT INTO [Order](Customer_Id, Customer_Type,Delivery_Date,Delivery_Type, [Description], Dis_Amount
	--, Discount_Code, Employee_Id, Order_Date, Order_Detail_Id, Order_Id, Order_Number, Order_Status
	--, Payment_Approval_Code, Total_Due_Amount, Total_Items, Total_Price)

	INSERT INTO [Order_Detail](Item_Qty, Item_Price, Total_Price, Item_Number)
	SELECT * FROM @Items_TVP
END
GO
USE [master]
GO
ALTER DATABASE [YummyPizza] SET  READ_WRITE 
GO
