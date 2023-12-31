USE [master]
GO
/****** Object:  Database [Shopper]    Script Date: 18/12/2021 12:31:25 CH ******/
CREATE DATABASE [Shopper]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shopper', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Shopper.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shopper_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Shopper_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Shopper] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shopper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shopper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shopper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shopper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shopper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shopper] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shopper] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Shopper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shopper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shopper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shopper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shopper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shopper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shopper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shopper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shopper] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Shopper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shopper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shopper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shopper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shopper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shopper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shopper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shopper] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Shopper] SET  MULTI_USER 
GO
ALTER DATABASE [Shopper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shopper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shopper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shopper] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shopper] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shopper] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Shopper] SET QUERY_STORE = OFF
GO
USE [Shopper]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 18/12/2021 12:31:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[adAcc] [varchar](500) NOT NULL,
	[adPass] [varchar](500) NULL,
	[fullname] [nvarchar](500) NULL,
	[gmail] [varchar](500) NULL,
	[address] [nvarchar](500) NULL,
	[adphone] [numeric](18, 0) NULL,
	[adsex] [bit] NULL,
	[Imgtv] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[adAcc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 18/12/2021 12:31:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[cateID] [int] IDENTITY(1,1) NOT NULL,
	[cateName] [nvarchar](100) NULL,
	[catePhoto] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 18/12/2021 12:31:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[proID] [varchar](50) NULL,
	[commentMessage] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 18/12/2021 12:31:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[cusPhone] [varchar](20) NOT NULL,
	[cusFullName] [nvarchar](200) NULL,
	[cusEmail] [varchar](100) NULL,
	[cusAddress] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[cusPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 18/12/2021 12:31:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderID] [varchar](20) NOT NULL,
	[proID] [varchar](50) NOT NULL,
	[ordtsQuantity] [int] NULL,
	[ordtsThanhTien] [varchar](50) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 18/12/2021 12:31:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [varchar](20) NOT NULL,
	[cusPhone] [varchar](20) NULL,
	[orderMessage] [nvarchar](max) NULL,
	[orderDateTime] [varchar](50) NULL,
	[orderStatus] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producers]    Script Date: 18/12/2021 12:31:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producers](
	[pdcID] [int] IDENTITY(1,1) NOT NULL,
	[pdcName] [nvarchar](100) NULL,
	[pdcPhone] [varchar](20) NULL,
	[pdcEmail] [varchar](50) NULL,
	[pdcAddress] [nvarchar](max) NULL,
	[pdcPhoto] [nvarchar](max) NULL,
	[pdcInfo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[pdcID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 18/12/2021 12:31:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[proID] [varchar](50) NOT NULL,
	[pdcID] [int] NULL,
	[typeID] [int] NULL,
	[proName] [nvarchar](200) NULL,
	[proSize] [varchar](10) NULL,
	[proPrice] [varchar](10) NULL,
	[proDiscount] [int] NULL,
	[proPhoto] [nvarchar](max) NULL,
	[proUpdateDate] [varchar](50) NULL,
	[proDescription] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 18/12/2021 12:31:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[typeID] [int] IDENTITY(1,1) NOT NULL,
	[cateID] [int] NULL,
	[typeName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rates]    Script Date: 18/12/2021 12:31:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rates](
	[proID] [varchar](50) NOT NULL,
	[rateStar] [int] NULL,
 CONSTRAINT [PK_Rates] PRIMARY KEY CLUSTERED 
(
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Administrator] ([adAcc], [adPass], [fullname], [gmail], [address], [adphone], [adsex], [Imgtv]) VALUES (N'hodat4115', N'123456', N'Hồ Tấn Đạt', N'hotandat17@gmail.com', N'tỉnh đồng tháp', NULL, NULL, NULL)
INSERT [dbo].[Administrator] ([adAcc], [adPass], [fullname], [gmail], [address], [adphone], [adsex], [Imgtv]) VALUES (N'hotandat17', N'123456', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Administrator] ([adAcc], [adPass], [fullname], [gmail], [address], [adphone], [adsex], [Imgtv]) VALUES (N'hotanty17', N'123456', N'Hồ Tấn Tỷ', N'hotandat17@gmail.com', N'tỉnh đồng tháp', CAST(939062509 AS Numeric(18, 0)), NULL, N'/ImgTV/z2213179975122_6ebdd2220e0a4ae57b48698dc71fab11.jpg')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([cateID], [cateName], [catePhoto]) VALUES (1, N'Quần-áo', N'/Image/img (7).jpg')
INSERT [dbo].[Categories] ([cateID], [cateName], [catePhoto]) VALUES (2, N'Giày-dép', N'/Image/img (23).jpg')
INSERT [dbo].[Categories] ([cateID], [cateName], [catePhoto]) VALUES (3, N'Mũ(nón)', N'/Image/img (4).png')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([commentID], [proID], [commentMessage]) VALUES (1, N'MU001', N'đã đánh giá MU001')
INSERT [dbo].[Comments] ([commentID], [proID], [commentMessage]) VALUES (2, N'MU002', N'đã đánh giá MU002')
INSERT [dbo].[Comments] ([commentID], [proID], [commentMessage]) VALUES (3, N'MU003', N'đã đánh giá MU003')
INSERT [dbo].[Comments] ([commentID], [proID], [commentMessage]) VALUES (4, N'MU004', N'đã đánh giá MU004')
INSERT [dbo].[Comments] ([commentID], [proID], [commentMessage]) VALUES (5, N'CS001', N'đã đánh giá CS001')
INSERT [dbo].[Comments] ([commentID], [proID], [commentMessage]) VALUES (6, N'CS002', N'đã đánh giá CS002')
INSERT [dbo].[Comments] ([commentID], [proID], [commentMessage]) VALUES (7, N'CS003', N'đã đánh giá CS003')
INSERT [dbo].[Comments] ([commentID], [proID], [commentMessage]) VALUES (8, N'AK001', N'đã đánh giá AK001')
INSERT [dbo].[Comments] ([commentID], [proID], [commentMessage]) VALUES (9, N'AT001', N'đã đánh giá AT001')
INSERT [dbo].[Comments] ([commentID], [proID], [commentMessage]) VALUES (10, N'AT002', N'đã đánh giá AT002')
INSERT [dbo].[Comments] ([commentID], [proID], [commentMessage]) VALUES (11, N'AT003', N'đã đánh giá AT003')
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567891', N'Vũ Văn A', N'a@gmail.com', N'Nhà A')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567892', N'Vũ Văn B', N'b@gmail.com', N'Nhà B')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567893', N'Vũ Văn C', N'c@gmail.com', N'Nhà C')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567894', N'Vũ Văn D', N'd@gmail.com', N'Nhà D')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567895', N'Vũ Văn E', N'e@gmail.com', N'Nhà E')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'0939062509', N'Hồ Tấn Đạt', N'hotandat17@gmail.com', N'Tp.Hồng Ngự')
GO
INSERT [dbo].[OrderDetails] ([orderID], [proID], [ordtsQuantity], [ordtsThanhTien]) VALUES (N'HD1', N'AT001', 2, N'160000')
INSERT [dbo].[OrderDetails] ([orderID], [proID], [ordtsQuantity], [ordtsThanhTien]) VALUES (N'HD1', N'AT002', 1, N'130000')
INSERT [dbo].[OrderDetails] ([orderID], [proID], [ordtsQuantity], [ordtsThanhTien]) VALUES (N'HD1', N'AT003', 1, N'170000')
INSERT [dbo].[OrderDetails] ([orderID], [proID], [ordtsQuantity], [ordtsThanhTien]) VALUES (N'HD2', N'AD2', 1, N'420000')
INSERT [dbo].[OrderDetails] ([orderID], [proID], [ordtsQuantity], [ordtsThanhTien]) VALUES (N'HD2', N'AD4', 1, N'380000')
GO
INSERT [dbo].[Orders] ([orderID], [cusPhone], [orderMessage], [orderDateTime], [orderStatus]) VALUES (N'HD1', N'01234567891', N'Size: M', N'11/20/2017 10:40:30 AM', N'0')
INSERT [dbo].[Orders] ([orderID], [cusPhone], [orderMessage], [orderDateTime], [orderStatus]) VALUES (N'HD2', N'0939062509', N'hello', N'18/12/2021 12:18:18 CH', N'0')
GO
SET IDENTITY_INSERT [dbo].[Producers] ON 

INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (1, N'Adidas', N'01212692802', N'adidas@gmail.com', N'TpHCM', N'/Image/img (2).png', N'Thông tin tự gút gồ')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (2, N'FILA', N'01212692802', N'fila@gmail.com', N'TpHCM', N'/Image/img (3).png', N'Thông tin tự gút gồ')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (3, N'Versage', N'01212692802', N'versage@gmail.com', N'TpHCM', N'/Image/img (5).jpg', N'Thông tin tự gút gồ')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (4, N'Chanel', N'01212692802', N'chanel@gmail.com', N'TpHCM', N'/Image/img (15).jpg', N'Thông tin tự gút gồ')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (5, N'D&G', N'01212692802', N'dg@gmail.com', N'TpHCM', N'/Image/img (18).jpg', N'Thông tin tự gút gồ')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (6, N'LV', N'01212692802', N'lv@gmail.com', N'TpHCM', N'/Image/img (21).jpg', N'Thông tin tự gút gồ')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (7, N'Nike', N'01212692802', N'nike@gmail.com', N'TpHCM', N'/Image/img (26).jpg', N'Thông tin tự gút gồ')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (8, N'Lacoste', N'01212692802', N'lacoste@gmail.com', N'TpHCM', N'/Image/img (30).jpg', N'Thông tin tự gút gồ')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (9, N'Hades', N'0912345678', N'hades@gmail.com', N'Tp.HCM', N'/Image/3f1031ba995709570bf5487efe74c30b.jfif', NULL)
SET IDENTITY_INSERT [dbo].[Producers] OFF
GO
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'AD1', 9, 2, N'SAIGON VINTAGE WASH TEE', N'XL', N'380000', 0, N'/Image/sgnau_1_ec53052094c943b5be1d7b6568610603.jpg', N'18/12/2021 12:00:31 CH', NULL)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'AD2', 9, 2, N'BLACKCORDUROY TEE', N'XL', N'420000', 0, N'/Image/2310_8_8f886f646f4f4cefa6c46af0d0e22cc2.jpg', N'18/12/2021 12:01:29 CH', NULL)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'AD3', 9, 2, N'WOLF GANG TEE', N'XL', N'285000', 0, N'/Image/0612_3_2ee0b4a757ea4c7f8dd19ec51b0c3de7.jpg', N'18/12/2021 12:01:49 CH', NULL)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'AD4', 9, 2, N'RETRO LOFI POLO', N'XL', N'380000', 0, N'/Image/1612_3_e0817538a63b4ca395aa07634a51f111.jpg', N'18/12/2021 12:03:28 CH', NULL)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'AD5', 9, 2, N'HORIZONTAL STRIPES TEE', N'XL,XXL,L', N'380000', 0, N'/Image/1412_4_2a7fdb0534d24c7983b82610a01135ee.jpg', N'18/12/2021 12:05:11 CH', NULL)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'AF1', 4, 3, N'Quần Kaki Trơn QK009 Màu Xám', N'29 30 31', N'395000', 0, N'/Image/_2_small-16455.jpg', N'18/12/2021 12:07:46 CH', NULL)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'AF2', 4, 3, N'Quần Kaki Trơn Thêu 4MEN Màu Nâu Nhạt QK008', N'29 30 31', N'395000', 0, N'/Image/quan-kaki-tron-theu-4men-qk008_2_small-16145.png', N'18/12/2021 12:08:53 CH', NULL)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'AG1', 1, 10, N'Giày Superstar J Màu trắng H03993 - Adidas chính hãng', N'36 37 39 ', N'1480000', 0, N'/Image/superstar-shoes-white-h03993-01-standard.jpg', N'18/12/2021 12:11:56 CH', NULL)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'AG2', 1, 10, N'Giày Supernova màu trắng FV6026 - Adidas chính hãng', N'36 37 39 ', N'1480000', 0, N'/Image/giay-supernova-trang-fv6026-01-standard.jpg', N'18/12/2021 12:13:15 CH', NULL)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'AK001', 3, 5, N'Áo khoác nam', N'XL,XXL,L', N'110000', 0, N'/Image/img (3).jpg', N'10/08/2017 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'Ak1', 4, 14, N'Nón kết Adidas ông già', N'36 37 39 ', N'380000', 0, N'/Image/21f4ace86a11894fd000-247x296.jpg', N'18/12/2021 12:16:01 CH', NULL)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'Ak2', 7, 14, N'Nón kết vải dù VAPO RZN (trắng)', N'36 37 39 ', N'380000', 0, N'/Image/623fe7974b6ca832f17d-247x296.jpg', N'18/12/2021 12:15:23 CH', NULL)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'AT001', 4, 2, N'Áo thun nữ sành điệu', N'S,M,L...', N'80000', 0, N'/Image/img (8).jpg', N'10/09/2017 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'AT002', 3, 2, N'Áo body nam', N'L,XL,XXL', N'130000', 0, N'/Image/img (12).jpg', N'10/10/2017 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'AT003', 8, 2, N'Áo nữ 100% cotton', N'S,M,L...', N'170000', 0, N'/Image/img (13).jpg', N'10/11/2017 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CS001', 5, 7, N'Đầm công sở nữ', N'S,M,...', N'320000', 10, N'/Image/img (2).jpg', N'10/05/2017 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CS002', 6, 7, N'Đồ công sở quần dài', N'M,S,L', N'230000', 5, N'/Image/img (4).jpg', N'10/06/2017 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CS003', 3, 7, N'Kiểu dáng học sinh', N'M,S,...', N'200000', 0, N'/Image/img (19).jpg', N'10/07/2017 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MU001', 1, 14, N'Mũ phớt nam', N'M,S,L,...', N'60000', 0, N'/Image/img (1).jpg', N'10/01/2017 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MU002', 2, 14, N'Mũ thời trang kiểu xã hội đen', N'M,S,...', N'82000', 0, N'/Image/img (20).jpg', N'10/02/2017 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MU003', 3, 14, N'Mũ thời trang FILA (đen)', N'XL,L,...', N'45000', 0, N'/Image/img (27).jpg', N'10/03/2017 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MU004', 4, 15, N'Mũ bảo hiểm honda', N'S,M,...', N'120000', 5, N'/Image/img (29).jpg', N'10/04/2017 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'QC1', 1, 3, N'Quần Dài Vải Đơn Giản B2KM01', N'29 30 31', N'285', 1, N'/Image/513a0f1e-aa13-3700-8203-0015872e2620.jpg', N'18/12/2021 11:16:31 SA', NULL)
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (2, 1, N'Áo thun')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (3, 1, N'Quần kaki')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (4, 1, N'Áo sơ mi')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (5, 1, N'Áo khoác')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (6, 1, N'Đồ bộ')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (7, 1, N'Đồ công sở')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (8, 1, N'Đồ ngủ')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (10, 2, N'Giày thể thao')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (11, 2, N'Giày thời trang')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (14, 3, N'Mũ thời trang')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (15, 3, N'Mũ bảo hiểm')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'AK001', 3)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'AT001', 4)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'AT002', 5)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'AT003', 1)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'CS001', 5)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'CS002', 1)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'CS003', 2)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'MU001', 1)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'MU002', 2)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'MU003', 3)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'MU004', 4)
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([proID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([proID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([cusPhone])
REFERENCES [dbo].[Customers] ([cusPhone])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([pdcID])
REFERENCES [dbo].[Producers] ([pdcID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([typeID])
REFERENCES [dbo].[ProductTypes] ([typeID])
GO
ALTER TABLE [dbo].[ProductTypes]  WITH CHECK ADD FOREIGN KEY([cateID])
REFERENCES [dbo].[Categories] ([cateID])
GO
ALTER TABLE [dbo].[Rates]  WITH CHECK ADD FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([proID])
GO
USE [master]
GO
ALTER DATABASE [Shopper] SET  READ_WRITE 
GO
