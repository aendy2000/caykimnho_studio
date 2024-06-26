USE [CayKimNho]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 4/3/2024 1:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NULL,
	[Total_Product] [int] NULL,
	[Total_Price] [money] NULL,
	[First_Product_ID] [int] NULL,
	[First_Product_Name] [nvarchar](max) NULL,
	[First_Product_Images] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_Detail]    Script Date: 4/3/2024 1:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cart] [int] NOT NULL,
	[ID_Products] [int] NOT NULL,
	[Product_Name] [nvarchar](max) NOT NULL,
	[Product_Color] [nvarchar](max) NOT NULL,
	[Product_Size] [nvarchar](max) NOT NULL,
	[Product_Quantity] [int] NOT NULL,
	[Product_Price] [money] NOT NULL,
	[Product_Import_Price] [money] NOT NULL,
	[Product_Sale] [decimal](5, 2) NOT NULL,
	[Add_Date] [datetime] NOT NULL,
	[ID_Color] [int] NOT NULL,
	[ID_Size] [int] NOT NULL,
	[Product_Images] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cart_Detail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/3/2024 1:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 4/3/2024 1:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailProducts]    Script Date: 4/3/2024 1:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Products] [int] NOT NULL,
	[ID_Colors] [int] NOT NULL,
	[ID_Size] [int] NOT NULL,
	[Import_Price] [money] NOT NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Images] [nvarchar](max) NOT NULL,
	[Sale] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_DetailProducts_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/3/2024 1:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[State] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ID_Category] [int] NULL,
	[Create_Date] [datetime] NOT NULL,
	[Videos] [nvarchar](max) NULL,
	[Images] [nvarchar](max) NOT NULL,
	[ToTalViews] [int] NOT NULL,
	[TotalOrders] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 4/3/2024 1:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Name]) VALUES (1, N'Áo')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (2, N'Áo khoác')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (3, N'Đầm/Váy')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (4, N'Chân váy')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (5, N'Quần đùi')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([ID], [Name]) VALUES (1, N'Caro 1')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (2, N'Caro 2')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (3, N'Caro 3')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (4, N'Caro 4')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (5, N'Caro 5')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (6, N'Trắng')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (7, N'Đen')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (8, N'Kem dài')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (9, N'Sọc caro')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (10, N'Be hoa')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (11, N'Xanh rêu đậm')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (12, N'Be kem nơ đen')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (13, N'Nâu nơ trắng')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (14, N'Màu 1')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (15, N'Màu 2')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (16, N'Màu 3')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (17, N'Màu 4')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (18, N'Thun đen nơ')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (19, N'Thun trắng nơ')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (20, N'Nâu line ren')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (21, N'Nâu 1')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (22, N'Nâu 2')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (23, N'Nâu 3')
INSERT [dbo].[Colors] ([ID], [Name]) VALUES (24, N'Nâu nhạt')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[DetailProducts] ON 

INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (1, 1, 1, 1, 22000.0000, 49000.0000, 0, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-1%2Fao6.jpg?alt=media&token=cfcad356-553d-4708-832c-6dd1e12c9719', CAST(0.05 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (4, 1, 2, 1, 22000.0000, 49000.0000, 1, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-1%2Fao7.jpg?alt=media&token=b7671ca4-5769-4e0a-a00e-0a523c0ce883', CAST(0.05 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (5, 1, 3, 1, 22000.0000, 49000.0000, 0, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-1%2Fao5.jpg?alt=media&token=c0b94f9f-1714-4161-b48d-0129b3acc0aa', CAST(0.05 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (6, 1, 4, 1, 22000.0000, 49000.0000, 0, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-1%2Fao4.jpg?alt=media&token=e00916d9-b4c4-4e68-b615-4ccbb88ff661', CAST(0.05 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (7, 1, 5, 1, 22000.0000, 49000.0000, 0, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-1%2Fao9.jpg?alt=media&token=7c4cfb77-3a48-445e-832e-d072576105db', CAST(0.05 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (8, 1, 6, 1, 22000.0000, 49000.0000, 10, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-1%2Fao8.jpg?alt=media&token=72d0a7d9-30a5-47fd-93e3-8da1c259cbbf', CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (9, 1, 7, 1, 22000.0000, 49000.0000, 10, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-1%2Fao3.jpg?alt=media&token=77873d4f-228a-4069-a58e-4042adf6b484', CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (10, 2, 8, 1, 50000.0000, 130000.0000, 100, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-2%2F4.jpg?alt=media&token=1100ca7a-9ba1-44ac-ac57-8147ea49a854', CAST(0.04 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (11, 4, 10, 1, 50000.0000, 185000.0000, 100, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-3%2F1.jpg?alt=media&token=56aa20ad-49be-4055-9db1-8f1193a4d237', CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (12, 5, 9, 1, 50000.0000, 179000.0000, 3, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-4%2F1.jpg?alt=media&token=a88f65b0-aaee-4394-bb7d-3a08c5c9ee9f', CAST(0.05 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (13, 6, 11, 1, 50000.0000, 200000.0000, 6, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-5%2F4.jpg?alt=media&token=d672504b-dd50-4440-84e5-32b55c5884b2', CAST(0.11 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (14, 7, 12, 1, 50000.0000, 170000.0000, 150, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-6%2F8.jpg?alt=media&token=b573cb73-708e-4101-bc5c-f53a6802d3e9', CAST(0.06 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (15, 7, 13, 1, 50000.0000, 150000.0000, 3, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-6%2F4.jpg?alt=media&token=c2c3033f-c264-4214-91b1-bf139982a639', CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (17, 8, 14, 1, 50000.0000, 179000.0000, 1, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-7%2F4.jpg?alt=media&token=49cbbe46-ef5e-4df3-a757-669ef863bafa', CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (19, 8, 15, 1, 50000.0000, 179000.0000, 1, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-7%2F5.jpg?alt=media&token=c9ae7e0e-3862-477e-a1cb-47908d343167', CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (20, 8, 16, 1, 50000.0000, 179000.0000, 2, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-7%2F8.jpg?alt=media&token=22580412-abb4-46d9-a96f-97e48a09947e', CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (21, 8, 17, 1, 50000.0000, 179000.0000, 1, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-7%2F9.jpg?alt=media&token=006eec5f-3fed-4e10-8a08-5dc72cfa7d02', CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (22, 10, 18, 1, 40000.0000, 110000.0000, 10, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-8%2F1.jpg?alt=media&token=988e4f19-d442-4160-80a8-68c262901be0', CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (23, 10, 19, 1, 40000.0000, 110000.0000, 10, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-8%2F2.jpg?alt=media&token=f79a9472-6b0a-49f2-8abd-782cd134cd1b', CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (24, 12, 20, 1, 50000.0000, 159000.0000, 8, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-9%2F4.jpg?alt=media&token=55c3ddc2-6aec-4014-ae1e-b909ef542209', CAST(0.05 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (25, 13, 21, 1, 50000.0000, 179000.0000, 1, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-10%2F9.jpg?alt=media&token=ebb17254-542e-4752-b10e-cc58150c997f', CAST(0.05 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (26, 13, 22, 1, 50000.0000, 179000.0000, 2, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-10%2F8.jpg?alt=media&token=faf2702d-02ee-493d-a21c-c98e019a98c3', CAST(0.05 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (27, 13, 23, 1, 50000.0000, 179000.0000, 0, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-10%2F1.jpg?alt=media&token=b72b7b1a-c50b-44db-851e-11fe86c3f629', CAST(0.05 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (28, 14, 24, 1, 50000.0000, 169000.0000, 4, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-11%2F8.jpg?alt=media&token=703383fa-a15d-4a47-acd5-fe1ebd985105', CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[DetailProducts] ([ID], [ID_Products], [ID_Colors], [ID_Size], [Import_Price], [Price], [Quantity], [Images], [Sale]) VALUES (29, 14, 6, 1, 50000.0000, 169000.0000, 5, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-11%2F9.jpg?alt=media&token=464672ac-91bc-4e32-973a-ba6eb49e7fd0', CAST(0.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[DetailProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Name], [State], [Description], [ID_Category], [Create_Date], [Videos], [Images], [ToTalViews], [TotalOrders]) VALUES (1, N'Áo Thun 2 Dây Siêu Cute (Tặng Kèm Scrunchies)', 1, N'Áo 2 dây freesize co giãn phối đồ siêu cute nheee 😘
Freesize 55kg nhe mí bà uiiii 
Có gì thắc mắc cứ dr cho tui nheee', 1, CAST(N'2023-09-14T00:00:00.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/videos-product%2FProduct-1%2Fvideo1.mp4?alt=media&token=55169e69-4fb0-4484-a36f-96cd3081fe59', N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-1%2Fao6.jpg?alt=media&token=cfcad356-553d-4708-832c-6dd1e12c9719#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-1%2Fao7.jpg?alt=media&token=b7671ca4-5769-4e0a-a00e-0a523c0ce883#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-1%2Fao5.jpg?alt=media&token=c0b94f9f-1714-4161-b48d-0129b3acc0aa#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-1%2Fao4.jpg?alt=media&token=e00916d9-b4c4-4e68-b615-4ccbb88ff661#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-1%2Fao9.jpg?alt=media&token=7c4cfb77-3a48-445e-832e-d072576105db#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-1%2Fao8.jpg?alt=media&token=72d0a7d9-30a5-47fd-93e3-8da1c259cbbf#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-1%2Fao3.jpg?alt=media&token=77873d4f-228a-4069-a58e-4042adf6b484', 0, 0)
INSERT [dbo].[Products] ([ID], [Name], [State], [Description], [ID_Category], [Create_Date], [Videos], [Images], [ToTalViews], [TotalOrders]) VALUES (2, N'Áo Cổ Yếm Babydoll Dây Rút Tự Điều Chỉnh (Tặng Kèm Dây Cột Tóc)', 1, N'• Áo cổ yếm babydoll chất xinh handmade tặng kèm scrunchies nha 
• Chất đũi thô hoặc kate tuỳ đợt vải nhập và tui may nhe mn ơiii 
dưới 50kg mặc xinh nha mí bà uiii 🌼🌼🌼
NOTE: hàng tự may nên thời gian là 7 ngày nhe nhưng có khi 2 ngày ạ 😘😘
🌼 Lưu ý: 🌼
* Sẽ có sắc sai nhẹ do ánh sáng nên sẽ giống hình > 95%. 
* Mình đã ghi rõ size kích thước của váy nên khi mua các bạn nên ib để được tư vấn.
*  Vì lần đầu tiên chúng mình bán nên có gì sai sót mong các bạn hãy góp ý để chúng mình cải thiện 🐣
* Nếu có khiếu nại thì hãy liên hệ với mình trước còn đánh giá 1 sao có vấn đề gì tự giải quyết ạ. ', 1, CAST(N'2023-09-14T00:00:00.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/videos-product%2FProduct-2%2Fvideo.mp4?alt=media&token=0e43d715-f2fb-4270-b353-ef6b8c1a9128', N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-2%2F1.jpg?alt=media&token=abc5319b-d3a9-4c30-8a04-3cc978080669#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-2%2F2.jpg?alt=media&token=a9547d75-7d1c-4b4a-ac75-93f567a26a75#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-2%2F3.jpg?alt=media&token=cc3b5ed9-81fe-460c-9305-ee390f15ff9d#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-2%2F4.jpg?alt=media&token=1100ca7a-9ba1-44ac-ac57-8147ea49a854#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-2%2F5.jpg?alt=media&token=431fcc59-cfb2-46d1-ae8a-0d5d6eb7398e#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-2%2F6.jpg?alt=media&token=20151ea4-d85f-47c9-a39b-6f4b760a7c32#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-2%2F7.jpg?alt=media&token=ae1ae434-cd64-48b9-ab28-ed56341fa6f7#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-2%2F8.jpg?alt=media&token=c00bad1b-ae85-44f1-ac0b-532bde455436#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-2%2F9.jpg?alt=media&token=af09dbee-0dae-48d2-8cab-b3ef72c3b4c2', 0, 0)
INSERT [dbo].[Products] ([ID], [Name], [State], [Description], [ID_Category], [Create_Date], [Videos], [Images], [ToTalViews], [TotalOrders]) VALUES (4, N'Áo Babydoll Cổ Trụ Đính Nút Hoạ Tiết Hoa Tulip🌷 (Tặng Kèm Scrunchies)', 1, N'Áo sơmi babydoll basic cổ trụ cực kì đáng iu luôn í, điểm nhấn là nút kết chỉ thành hoa tulip nheee 🌷
Áo phù hợp tất cả các dịp đi học, đi chơi, phối rất xinkk luôn heheehe 
Freesize 55kg trở xuống nho 💕 Chất đũi xước nhe

Áo có lúc có sẵn có lúc không nha, Ib cho tui nếu cần gấp nheeee
Áo dài ~60cm Ngực ~90cm ', 1, CAST(N'2023-09-14T00:00:00.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/videos-product%2FProduct-3%2Fvideo.mp4?alt=media&token=103c5028-d282-45f1-b33d-46c100bef174', N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-3%2F1.jpg?alt=media&token=56aa20ad-49be-4055-9db1-8f1193a4d237#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-3%2F2.jpg?alt=media&token=87bb7a38-ccdd-49e1-b0e5-d23cd0c56e49#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-3%2F3.jpg?alt=media&token=4e8b94f0-ac5b-45b2-9349-b58ac8b2a31e#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-3%2F4.jpg?alt=media&token=ef3d5a89-b313-49c1-9a8d-526f528aa606', 0, 0)
INSERT [dbo].[Products] ([ID], [Name], [State], [Description], [ID_Category], [Create_Date], [Videos], [Images], [ToTalViews], [TotalOrders]) VALUES (5, N'Áo Trễ Vai Caro Tím Pastel Siêu Cute Freesize (Tặng Kèm Scrunchies)', 1, N'Áo babydoll trễ vai với chất xô mềm mịn siêu mát thấm hút mồ hôi (chất vải của em bé í nhe) 
Với hoạ tiết caro trắng - tím pastel siêu ngọt ngào luôn í 🌷
Freesize 38kg - 55kg nhó', 1, CAST(N'2023-09-14T00:00:00.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/videos-product%2FProduct-4%2Fvideo.mp4?alt=media&token=6d4f3d32-7f80-4bfa-81b1-f82aace4c21b', N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-4%2F1.jpg?alt=media&token=a88f65b0-aaee-4394-bb7d-3a08c5c9ee9f#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-4%2F2.jpg?alt=media&token=fd78ca10-5707-4f7f-a633-80857e032ff6#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-4%2F3.jpg?alt=media&token=10218f63-61dd-4d2b-a118-413e6ad95193#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-4%2F4.jpg?alt=media&token=34c12e0a-2f1a-43d4-a202-3717fca4934e#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-4%2F5.jpg?alt=media&token=3ccf132c-172e-4578-83d8-45f0d964a9a8#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-4%2F66.jpg?alt=media&token=8f34aaff-d033-4217-97f9-e13a5170a96c#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-4%2F7.jpg?alt=media&token=860cb538-7056-46b3-8f8b-33129a32a5c2#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-4%2F8.jpg?alt=media&token=6da07c87-7739-4274-953b-953c6179bdc7', 0, 0)
INSERT [dbo].[Products] ([ID], [Name], [State], [Description], [ID_Category], [Create_Date], [Videos], [Images], [ToTalViews], [TotalOrders]) VALUES (6, N'𝑵𝑬𝑾 𝑰𝑵 - Babydoll Hoa Tặng Kèm Scrunchies🌼', 1, N'• Áo babydoll siêu xinh màu xanh rêu đậm cực kì tôn da (hợp cho cả da ngăm và trắng) là một gợi ý siêu cute cho outfit của mí nàng đây
• Áo babydoll với độ dài 45cm và ngang là 87cm (phù hợp cho nàng mặc size S và M)
• Chất liệu kate mát có độ bồng bềnh giữ form áo nhất định và được may 2 lớp dày dặn phần ngực
• Form áo thiết kế may cực kì dễ phối với tất cả món đồ như là quần jean, quần tây, quần short và chân váy,.. 
🌼 Lưu ý: 🌼
* Sẽ có sắc sai nhẹ do ánh sáng nên sẽ giống hình > 95%. 
* Mình đã ghi rõ size kích thước của váy nên khi mua các bạn nên ib để được tư vấn.
*  Vì lần đầu tiên chúng mình bán nên có gì sai sót mong các bạn hãy góp ý để chúng mình cải thiện 🐣
* Nếu có khiếu nại thì hãy liên hệ với mình trước còn đánh giá 1 sao có vấn đề gì tự giải quyết ạ. ', 1, CAST(N'2023-09-14T00:00:00.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/videos-product%2FProduct-5%2Fvideo.mp4?alt=media&token=89b7790f-1dce-4c94-93e6-f4c734598648', N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-5%2F1.jpg?alt=media&token=444ed044-0a83-40ae-9fbe-e1d5a197769e#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-5%2F2.jpg?alt=media&token=5b817b71-9d16-43ac-929b-0c732e8b1b5b#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-5%2F3.jpg?alt=media&token=f7574dd2-bc35-4131-82e5-ec349d4ac1d4#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-5%2F4.jpg?alt=media&token=d672504b-dd50-4440-84e5-32b55c5884b2#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-5%2F5.jpg?alt=media&token=d9224d80-04aa-4c83-a4bd-9fbc994f333e#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-5%2F6.jpg?alt=media&token=551ae8bd-c653-427a-bc07-86618af98964#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-5%2F7.jpg?alt=media&token=4cd70a08-9335-4f45-92d9-9d48e86f53bc#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-5%2F8.jpg?alt=media&token=d40cb306-1d8a-4b7e-a478-40d9984d95a0#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-5%2F9.jpg?alt=media&token=1aaa8143-b7c8-425c-ac54-7ab84ef14c13', 0, 0)
INSERT [dbo].[Products] ([ID], [Name], [State], [Description], [ID_Category], [Create_Date], [Videos], [Images], [ToTalViews], [TotalOrders]) VALUES (7, N'𝑵𝑬𝑾 𝑰𝑵 Summer Bowr 🎀🪡 [Áo Nơ 2 Dây]', 1, N'• Áo 2 dây đính nơ có tăng đơ điều chỉnh dây áo là một gợi ý cho outfit mùa hè cho mí nàng đâyyy 
• Áo croptop với chiều dài 40cm (có thể dài hơn tuỳ điều chỉnh tăng đơ) và chiều ngang form babydoll ~ 90cm (phù hợp cho nàng mặc size S và M)
• Chất liệu đũi thô (có lúc kate nha ạ tùy đợt vải) có độ bồng bềnh giữ form áo nhất định và được may 2 lớp dày dặn 
• Form áo thiết kế may cực kì dễ phối với tất cả món đồ như là quần jean, quần tây, quần short và chân váy,.. 
🌼 Lưu ý: 🌼
* Sẽ có sắc sai nhẹ do ánh sáng nên sẽ giống hình > 95%. 
* Mình đã ghi rõ size kích thước của váy nên khi mua các bạn nên ib để được tư vấn.
*  Vì lần đầu tiên chúng mình bán nên có gì sai sót mong các bạn hãy góp ý để chúng mình cải thiện 🐣
* Nếu có khiếu nại thì hãy liên hệ với mình trước còn đánh giá 1 sao có vấn đề gì tự giải quyết ạ. ', 1, CAST(N'2023-09-14T00:00:00.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/videos-product%2FProduct-6%2Fvideo.mp4?alt=media&token=1e39e58a-5f25-4e4c-bcc2-a7a5fed167e5', N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-6%2F1.jpg?alt=media&token=d01b8790-0eba-4c07-905c-2e0150f917ea#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-6%2F2.jpg?alt=media&token=59bd1202-4548-499a-a54a-31c5dba8989e#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-6%2F3.jpg?alt=media&token=f569250e-9c08-4dac-bfff-92bb551ac39c#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-6%2F4.jpg?alt=media&token=c2c3033f-c264-4214-91b1-bf139982a639#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-6%2F5.jpg?alt=media&token=0492f83d-345b-4537-8080-10c5c8d184dd#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-6%2F6.jpg?alt=media&token=94e68761-c6c5-431c-ba2f-6fb5d936f7de#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-6%2F7.jpg?alt=media&token=ac81f65a-5e97-4822-84a0-9dadecb7c10b#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-6%2F8.jpg?alt=media&token=b573cb73-708e-4101-bc5c-f53a6802d3e9#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-6%2F9.jpg?alt=media&token=4659ef00-9537-432d-8d5b-8e0a9eca8834', 0, 0)
INSERT [dbo].[Products] ([ID], [Name], [State], [Description], [ID_Category], [Create_Date], [Videos], [Images], [ToTalViews], [TotalOrders]) VALUES (8, N'Áo Trễ Vai Bo Lưng Chun Siêu Cute (Tặng Kèm Scrunchies Nhe)', 1, N'Áo này shop tự may handmade nên mỗi mẫu được vài chiếc hem có restock cùng màu nhe😘 babii nào ưng màu nào thì chốt ngay nheee chỉ restock mẫu áo thui còn màu áo thì hem nhe hheehehe ', 1, CAST(N'2023-09-14T00:00:00.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/videos-product%2FProduct-7%2Fvideo.mp4?alt=media&token=17425612-95d7-4c8a-b52d-b739559323a4', N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-7%2F1.jpg?alt=media&token=b721d9cd-f6eb-4c57-b0e1-e2f9c7a08927#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-7%2F2.jpg?alt=media&token=4ecd6b6c-e021-4b7f-8068-aeb50e1b6e09#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-7%2F3.jpg?alt=media&token=ff473456-ca43-4849-a011-514f0e39c6d9#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-7%2F4.jpg?alt=media&token=49cbbe46-ef5e-4df3-a757-669ef863bafa#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-7%2F5.jpg?alt=media&token=c9ae7e0e-3862-477e-a1cb-47908d343167#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-7%2F6.jpg?alt=media&token=aa95eb7d-afe2-411c-9dc7-3a9be9bb1727#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-7%2F7.jpg?alt=media&token=b7dbcd6b-6077-40cd-ba45-4fd2260b9ec0#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-7%2F8.jpg?alt=media&token=22580412-abb4-46d9-a96f-97e48a09947e#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-7%2F9.jpg?alt=media&token=006eec5f-3fed-4e10-8a08-5dc72cfa7d02', 0, 0)
INSERT [dbo].[Products] ([ID], [Name], [State], [Description], [ID_Category], [Create_Date], [Videos], [Images], [ToTalViews], [TotalOrders]) VALUES (10, N'Áo Thun Ôm Nhẹ Mặc Kèm Áo Babydoll', 1, N'vì coá thể bạn sẽ cần đến một chiếc áo thun basic để phối cho nhiều áo nên CKN đã cho ra mẫu áo thun basic ôm nhẹ để có thể áp dụng đa năng vào nhiều outfit xinh xinh của bạn nè hehee.
áo coá 2 màu đen và trắng cực kì basic và hạt zẻ luôn í nha 😘
🌼 Lưu ý: 🌼
* Sẽ có sắc sai nhẹ do ánh sáng nên sẽ giống hình > 95%. 
* Mình đã ghi rõ size kích thước của váy nên khi mua các bạn nên ib để được tư vấn.
*  Vì lần đầu tiên chúng mình bán nên có gì sai sót mong các bạn hãy góp ý để chúng mình cải thiện 🐣
* Nếu có khiếu nại thì hãy liên hệ với mình trước còn đánh giá 1 sao có vấn đề gì tự giải quyết ạ. ', 1, CAST(N'2023-09-14T00:00:00.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/videos-product%2FProduct-8%2Fvideo.mp4?alt=media&token=b06ebe6b-3ebd-4bf5-938c-6926ca6f4443', N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-8%2F1.jpg?alt=media&token=988e4f19-d442-4160-80a8-68c262901be0#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-8%2F2.jpg?alt=media&token=f79a9472-6b0a-49f2-8abd-782cd134cd1b', 0, 0)
INSERT [dbo].[Products] ([ID], [Name], [State], [Description], [ID_Category], [Create_Date], [Videos], [Images], [ToTalViews], [TotalOrders]) VALUES (12, N'Áo Babydoll Nâu Line Ren Thuê Cột 2 Dây Vintages (Tặng Kèm Scrunchies)', 1, N'Áo babydoll line ren thuê với chất đũi thô tơ mềm nhẹ siêu cute cho outfit của mí bà nè 🍂
Áo freesize 50kg được may phần trên ngực 2 lớp không sợ mỏng nhe 🍂
Dr để tui tư vấn kỹ hơn nha🍂', 1, CAST(N'2023-09-14T00:00:00.000' AS DateTime), NULL, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-9%2F1.jpg?alt=media&token=63dbe4a1-76e7-4bff-86ea-0d41adb89641#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-9%2F2.jpg?alt=media&token=ee2dbce7-469c-44c8-a6ca-3d9a597f25e8#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-9%2F3.jpg?alt=media&token=d9816589-9dc8-428f-8143-fe080e9d92b9#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-9%2F4.jpg?alt=media&token=55c3ddc2-6aec-4014-ae1e-b909ef542209#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-9%2F5.jpg?alt=media&token=50930645-2038-4448-8b49-5aca20593d4b#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-9%2F6.jpg?alt=media&token=f46eade7-1bee-4619-a120-3af326095ca9#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-9%2F7.jpg?alt=media&token=055de16e-fd7c-4138-a48a-2d18583d0a9c#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-9%2F8.jpg?alt=media&token=eb621efe-ea2d-4fd3-b1fa-adc302914c7a', 0, 0)
INSERT [dbo].[Products] ([ID], [Name], [State], [Description], [ID_Category], [Create_Date], [Videos], [Images], [ToTalViews], [TotalOrders]) VALUES (13, N'Áo Babydoll Hoa Mai Siêu Cute Freesize Dưới 52kg (Tặng Kèm Scrunchies)', 1, N'Áo babydoll có mí màu nâu luôn nhe mí bà chất vải kate cực kì mát nhee. đơn hàng luôn tặng kèm dây cột tóc cho mí bà nè
Có gì thắc mắc cứ dr cho tui nhe.', 1, CAST(N'2023-09-14T00:00:00.000' AS DateTime), NULL, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-10%2F1.jpg?alt=media&token=b72b7b1a-c50b-44db-851e-11fe86c3f629#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-10%2F2.jpg?alt=media&token=538de7f9-ac64-4d05-ae60-62cc0cd4b3f3#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-10%2F3.jpg?alt=media&token=14d6030f-1a27-46a7-8376-5ba37592b54c#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-10%2F4.jpg?alt=media&token=d65386ed-a154-4ddd-b752-c62bcf118b34#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-10%2F5.jpg?alt=media&token=4b3a3b02-23b7-459a-996f-42980a66d7f7#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-10%2F6.jpg?alt=media&token=84d310df-578e-4f53-a653-8ea937394c32#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-10%2F7.jpg?alt=media&token=85509135-6074-4a7b-9848-c850a09c4289#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-10%2F8.jpg?alt=media&token=faf2702d-02ee-493d-a21c-c98e019a98c3#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-10%2F9.jpg?alt=media&token=ebb17254-542e-4752-b10e-cc58150c997f', 0, 0)
INSERT [dbo].[Products] ([ID], [Name], [State], [Description], [ID_Category], [Create_Date], [Videos], [Images], [ToTalViews], [TotalOrders]) VALUES (14, N'Áo Cổ Bèo Tay Bồng Siêu Đáng Yêu (Tặng Kèm Scrunchies Nhe)', 1, N'Áo cổ bèo tay bồng này freesize 55kg trở xuống nhoo
Áo có 2 màu mặc cưng lắm à nha, mặc rời hay phối yếm, đầm babydoll gì cũng cưng hết trơn.
Đi học, đi làm, đi chơi gì áo cân được hết í nha, nhanh tay đem em nó về nhà nào hehee 
Có thắc mắc cứ dr tui nha, À à shop này tui tự may handmade không phải hàng nhập đâu nha 😚', 1, CAST(N'2023-09-14T00:00:00.000' AS DateTime), NULL, N'https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-11%2F1.jpg?alt=media&token=b70a9637-d7c8-4d76-a66a-8e95d3b8141b#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-11%2F2.jpg?alt=media&token=ca56062c-63f2-48df-813e-9209c45d4881#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-11%2F3.jpg?alt=media&token=370ee48f-1c8d-409b-96e8-2ac19472dafe#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-11%2F4.jpg?alt=media&token=e723dc69-9825-4b4e-861b-26605d53d243#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-11%2F5.jpg?alt=media&token=c68fc90b-d8b8-4bdd-8fe0-fe8388075a17#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-11%2F6.jpg?alt=media&token=610261dd-870b-4b37-b35d-74df191c663e#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-11%2F7.jpg?alt=media&token=83240f82-30f2-4c72-902e-71f4c5b00c0b#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-11%2F8.jpg?alt=media&token=703383fa-a15d-4a47-acd5-fe1ebd985105#https://firebasestorage.googleapis.com/v0/b/caykimnho-studio.appspot.com/o/images-product%2FProduct-11%2F9.jpg?alt=media&token=464672ac-91bc-4e32-973a-ba6eb49e7fd0', 0, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([ID], [Name]) VALUES (1, N'Free Size 52kg')
INSERT [dbo].[Size] ([ID], [Name]) VALUES (2, N'XS')
INSERT [dbo].[Size] ([ID], [Name]) VALUES (3, N'S')
INSERT [dbo].[Size] ([ID], [Name]) VALUES (4, N'M')
INSERT [dbo].[Size] ([ID], [Name]) VALUES (5, N'L')
INSERT [dbo].[Size] ([ID], [Name]) VALUES (6, N'XL')
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
ALTER TABLE [dbo].[Cart_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Detail_Cart] FOREIGN KEY([ID_Cart])
REFERENCES [dbo].[Cart] ([ID])
GO
ALTER TABLE [dbo].[Cart_Detail] CHECK CONSTRAINT [FK_Cart_Detail_Cart]
GO
ALTER TABLE [dbo].[Cart_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Detail_Colors] FOREIGN KEY([ID_Color])
REFERENCES [dbo].[Colors] ([ID])
GO
ALTER TABLE [dbo].[Cart_Detail] CHECK CONSTRAINT [FK_Cart_Detail_Colors]
GO
ALTER TABLE [dbo].[Cart_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Detail_Products] FOREIGN KEY([ID_Products])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Cart_Detail] CHECK CONSTRAINT [FK_Cart_Detail_Products]
GO
ALTER TABLE [dbo].[Cart_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Detail_Size] FOREIGN KEY([ID_Size])
REFERENCES [dbo].[Size] ([ID])
GO
ALTER TABLE [dbo].[Cart_Detail] CHECK CONSTRAINT [FK_Cart_Detail_Size]
GO
ALTER TABLE [dbo].[Colors]  WITH CHECK ADD  CONSTRAINT [FK_Colors_Colors] FOREIGN KEY([ID])
REFERENCES [dbo].[Colors] ([ID])
GO
ALTER TABLE [dbo].[Colors] CHECK CONSTRAINT [FK_Colors_Colors]
GO
ALTER TABLE [dbo].[DetailProducts]  WITH CHECK ADD  CONSTRAINT [FK_DetailProducts_Colors] FOREIGN KEY([ID_Colors])
REFERENCES [dbo].[Colors] ([ID])
GO
ALTER TABLE [dbo].[DetailProducts] CHECK CONSTRAINT [FK_DetailProducts_Colors]
GO
ALTER TABLE [dbo].[DetailProducts]  WITH CHECK ADD  CONSTRAINT [FK_DetailProducts_Products] FOREIGN KEY([ID_Products])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[DetailProducts] CHECK CONSTRAINT [FK_DetailProducts_Products]
GO
ALTER TABLE [dbo].[DetailProducts]  WITH CHECK ADD  CONSTRAINT [FK_DetailProducts_Size] FOREIGN KEY([ID_Size])
REFERENCES [dbo].[Size] ([ID])
GO
ALTER TABLE [dbo].[DetailProducts] CHECK CONSTRAINT [FK_DetailProducts_Size]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([ID_Category])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
