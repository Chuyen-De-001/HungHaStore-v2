USE [master]
GO
/****** Object:  Database [hung_ha_store]    Script Date: 25/3/2022 3:03:58 AM ******/
CREATE DATABASE [hung_ha_store]
ALTER DATABASE [hung_ha_store] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hung_ha_store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hung_ha_store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hung_ha_store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hung_ha_store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hung_ha_store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hung_ha_store] SET ARITHABORT OFF 
GO
ALTER DATABASE [hung_ha_store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hung_ha_store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hung_ha_store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hung_ha_store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hung_ha_store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hung_ha_store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hung_ha_store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hung_ha_store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hung_ha_store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hung_ha_store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hung_ha_store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hung_ha_store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hung_ha_store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hung_ha_store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hung_ha_store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hung_ha_store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hung_ha_store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hung_ha_store] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hung_ha_store] SET  MULTI_USER 
GO
ALTER DATABASE [hung_ha_store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hung_ha_store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hung_ha_store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hung_ha_store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hung_ha_store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hung_ha_store] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [hung_ha_store] SET QUERY_STORE = OFF
GO
USE [hung_ha_store]
GO
/****** Object:  Table [dbo].[chitiet_hd]    Script Date: 25/3/2022 3:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitiet_hd](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_hd] [int] NOT NULL,
	[id_sp] [int] NOT NULL,
	[gia_tien] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
	[ten_sp] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_chitiet_hd] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dat_hang]    Script Date: 25/3/2022 3:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dat_hang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[id_sp] [int] NOT NULL,
	[tg_tao] [date] NOT NULL,
 CONSTRAINT [PK_dat_hang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don]    Script Date: 25/3/2022 3:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nd] [int] NOT NULL,
	[trang_thai] [int] NOT NULL,
	[tong_tien] [int] NOT NULL,
	[ten_nguoi_nhan] [nvarchar](255) NOT NULL,
	[dia_chi_nhan] [nvarchar](255) NOT NULL,
	[sdt_nhan] [nvarchar](255) NOT NULL,
	[tg_tao] [date] NOT NULL,
 CONSTRAINT [PK_hoa_don] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kho]    Script Date: 25/3/2022 3:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[so_luong] [int] NOT NULL,
 CONSTRAINT [PK_kho] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loai_sp]    Script Date: 25/3/2022 3:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai_sp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](255) NOT NULL,
	[mo_ta] [nvarchar](255) NULL,
	[tg_tao] [date] NOT NULL,
 CONSTRAINT [PK_loai_sp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoi_dung]    Script Date: 25/3/2022 3:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoi_dung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tai_khoan] [nvarchar](255) NOT NULL,
	[mat_khau] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[ho_ten] [nvarchar](255) NULL,
	[ngay_sinh] [date] NULL,
	[sdt] [nchar](11) NULL,
	[dia_chi] [nvarchar](255) NULL,
	[gioi_tinh] [int] NULL,
	[quyen] [int] NOT NULL,
	[tg_tao] [date] NOT NULL,
 CONSTRAINT [PK_nguoi_dung] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nha_cung_cap]    Script Date: 25/3/2022 3:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nha_cung_cap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](255) NOT NULL,
	[dia_chi] [nvarchar](255) NULL,
	[sdt] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
 CONSTRAINT [PK_nha_cung_cap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[san_pham]    Script Date: 25/3/2022 3:03:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[san_pham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](255) NOT NULL,
	[id_loai_sp] [int] NOT NULL,
	[gia_tien] [int] NOT NULL,
	[giam_gia] [int] NOT NULL,
	[mo_ta] [nvarchar](255) NOT NULL,
	[id_kho] [int] NULL,
	[id_ncc] [int] NULL,
	[hinh_anh] [nvarchar](255) NULL,
	[luot_xem] [int] NOT NULL,
	[tg_tao] [date] NOT NULL,
 CONSTRAINT [PK_san_pham] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[chitiet_hd] ON 

INSERT [dbo].[chitiet_hd] ([id], [id_hd], [id_sp], [gia_tien], [so_luong], [ten_sp]) VALUES (5, 1, 4, 1900000, 1, N'Kệ để sách báo gỗ MDF phủ melamine GHS-2397')
INSERT [dbo].[chitiet_hd] ([id], [id_hd], [id_sp], [gia_tien], [so_luong], [ten_sp]) VALUES (6, 1, 3, 1600000, 1, N'Giá kệ sách gỗ thiết kế đơn giản GHS-2398')
SET IDENTITY_INSERT [dbo].[chitiet_hd] OFF
GO
SET IDENTITY_INSERT [dbo].[dat_hang] ON 

INSERT [dbo].[dat_hang] ([id], [email], [id_sp], [tg_tao]) VALUES (1, N'hai@gmail.com', 5, CAST(N'2022-03-18' AS Date))
SET IDENTITY_INSERT [dbo].[dat_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[hoa_don] ON 

INSERT [dbo].[hoa_don] ([id], [id_nd], [trang_thai], [tong_tien], [ten_nguoi_nhan], [dia_chi_nhan], [sdt_nhan], [tg_tao]) VALUES (1, 36, 0, 3500000, N'Phạm Văn Hải', N'885 Tam trinh ', N'0354326853 ', CAST(N'2022-03-25' AS Date))
SET IDENTITY_INSERT [dbo].[hoa_don] OFF
GO
SET IDENTITY_INSERT [dbo].[kho] ON 

INSERT [dbo].[kho] ([id], [so_luong]) VALUES (0, 0)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (1, 34)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (2, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (3, 15)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (4, 29)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (5, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (6, 22)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (7, 29)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (8, 35)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (9, 11)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (10, 34)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (11, 10)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (12, 20)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (13, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (14, 1)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (15, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (16, 29)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (17, 44)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (18, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (19, 15)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (20, 34)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (21, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (22, 28)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (23, 5)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (24, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (25, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (26, 3)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (27, 33)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (28, 34)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (29, 22)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (30, 48)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (31, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (32, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (33, 45)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (34, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (35, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (36, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (37, 40)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (38, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (39, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (40, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (41, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (42, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (43, 17)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (44, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (45, 5)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (46, 3)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (47, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (48, 23)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (49, 20)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (50, 46)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (51, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (52, 44)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (53, 46)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (54, 17)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (55, 44)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (56, 7)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (57, 26)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (58, 22)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (59, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (60, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (61, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (62, 45)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (63, 14)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (64, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (65, 25)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (66, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (67, 25)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (68, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (69, 47)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (70, 29)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (71, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (72, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (73, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (74, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (75, 45)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (76, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (77, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (78, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (79, 38)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (80, 35)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (81, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (82, 11)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (83, 14)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (84, 25)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (85, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (86, 14)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (87, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (88, 28)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (89, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (90, 47)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (91, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (92, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (93, 47)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (94, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (95, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (96, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (97, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (98, 5)
GO
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (99, 17)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (100, 46)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (101, 27)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (102, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (103, 25)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (104, 40)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (105, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (106, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (107, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (108, 3)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (109, 22)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (110, 36)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (111, 44)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (112, 15)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (113, 34)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (114, 7)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (115, 15)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (116, 29)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (117, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (118, 38)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (119, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (120, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (121, 3)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (122, 46)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (123, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (124, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (125, 47)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (126, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (127, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (128, 33)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (129, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (130, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (131, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (132, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (133, 44)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (134, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (135, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (136, 48)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (137, 35)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (138, 23)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (139, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (140, 35)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (141, 26)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (142, 3)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (143, 7)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (144, 26)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (145, 3)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (146, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (147, 34)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (148, 40)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (149, 10)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (150, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (151, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (152, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (153, 30)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (154, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (155, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (156, 30)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (157, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (158, 25)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (159, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (160, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (161, 45)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (162, 5)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (163, 41)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (164, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (165, 17)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (166, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (167, 20)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (168, 41)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (169, 48)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (170, 16)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (171, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (172, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (173, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (174, 38)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (175, 35)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (176, 1)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (177, 40)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (178, 7)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (179, 47)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (180, 30)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (181, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (182, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (183, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (184, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (185, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (186, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (187, 27)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (188, 38)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (189, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (190, 27)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (191, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (192, 10)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (193, 30)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (194, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (195, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (196, 22)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (197, 11)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (198, 35)
GO
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (199, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (200, 15)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (201, 47)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (202, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (203, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (204, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (205, 10)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (206, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (207, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (208, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (209, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (210, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (211, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (212, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (213, 28)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (214, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (215, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (216, 28)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (217, 30)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (218, 33)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (219, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (220, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (221, 11)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (222, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (223, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (224, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (225, 41)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (226, 35)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (227, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (228, 36)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (229, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (230, 17)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (231, 20)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (232, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (233, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (234, 29)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (235, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (236, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (237, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (238, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (239, 40)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (240, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (241, 25)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (242, 16)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (243, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (244, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (245, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (246, 45)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (247, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (248, 3)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (249, 45)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (250, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (251, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (252, 41)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (253, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (254, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (255, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (256, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (257, 40)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (258, 47)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (259, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (260, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (261, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (262, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (263, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (264, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (265, 46)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (266, 23)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (267, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (268, 3)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (269, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (270, 48)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (271, 41)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (272, 25)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (273, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (274, 47)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (275, 23)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (276, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (277, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (278, 3)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (279, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (280, 46)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (281, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (282, 36)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (283, 41)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (284, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (285, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (286, 28)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (287, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (288, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (289, 29)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (290, 25)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (291, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (292, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (293, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (294, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (295, 10)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (296, 7)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (297, 15)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (298, 35)
GO
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (299, 46)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (300, 47)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (301, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (302, 1)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (303, 1)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (304, 46)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (305, 28)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (306, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (307, 30)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (308, 20)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (309, 10)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (310, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (311, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (312, 38)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (313, 45)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (314, 35)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (315, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (316, 25)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (317, 27)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (318, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (319, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (320, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (321, 33)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (322, 34)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (323, 23)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (324, 27)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (325, 30)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (326, 20)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (327, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (328, 22)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (329, 38)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (330, 16)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (331, 5)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (332, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (333, 7)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (334, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (335, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (336, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (337, 35)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (338, 44)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (339, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (340, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (341, 47)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (342, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (343, 14)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (344, 48)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (345, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (346, 29)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (347, 25)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (348, 26)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (349, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (350, 35)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (351, 30)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (352, 15)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (353, 16)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (354, 28)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (355, 14)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (356, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (357, 28)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (358, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (359, 16)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (360, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (361, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (362, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (363, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (364, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (365, 26)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (366, 34)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (367, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (368, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (369, 27)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (370, 38)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (371, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (372, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (373, 26)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (374, 1)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (375, 20)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (376, 15)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (377, 20)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (378, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (379, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (380, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (381, 45)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (382, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (383, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (384, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (385, 35)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (386, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (387, 3)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (388, 28)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (389, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (390, 5)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (391, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (392, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (393, 28)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (394, 16)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (395, 44)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (396, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (397, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (398, 21)
GO
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (399, 23)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (400, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (401, 47)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (402, 33)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (403, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (404, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (405, 45)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (406, 48)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (407, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (408, 16)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (409, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (410, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (411, 34)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (412, 5)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (413, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (414, 15)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (415, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (416, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (417, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (418, 29)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (419, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (420, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (421, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (422, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (423, 3)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (424, 22)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (425, 35)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (426, 28)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (427, 5)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (428, 11)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (429, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (430, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (431, 27)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (432, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (433, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (434, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (435, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (436, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (437, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (438, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (439, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (440, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (441, 1)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (442, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (443, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (444, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (445, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (446, 48)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (447, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (448, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (449, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (450, 23)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (451, 33)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (452, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (453, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (454, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (455, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (456, 25)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (457, 1)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (458, 14)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (459, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (460, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (461, 17)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (462, 14)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (463, 30)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (464, 40)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (465, 33)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (466, 7)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (467, 47)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (468, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (469, 3)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (470, 30)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (471, 15)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (472, 33)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (473, 33)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (474, 14)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (475, 11)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (476, 5)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (477, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (478, 1)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (479, 10)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (480, 10)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (481, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (482, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (483, 44)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (484, 48)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (485, 26)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (486, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (487, 23)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (488, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (489, 38)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (490, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (491, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (492, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (493, 3)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (494, 7)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (495, 21)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (496, 47)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (497, 27)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (498, 20)
GO
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (499, 28)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (500, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (501, 10)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (502, 36)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (503, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (504, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (505, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (506, 1)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (507, 35)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (508, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (509, 11)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (510, 17)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (511, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (512, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (513, 5)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (514, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (515, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (516, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (517, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (518, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (519, 14)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (520, 34)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (521, 34)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (522, 45)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (523, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (524, 10)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (525, 30)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (526, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (527, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (528, 26)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (529, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (530, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (531, 27)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (532, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (533, 23)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (534, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (535, 1)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (536, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (537, 15)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (538, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (539, 40)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (540, 26)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (541, 15)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (542, 23)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (543, 40)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (544, 22)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (545, 11)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (546, 1)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (547, 49)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (548, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (549, 44)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (550, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (551, 29)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (552, 46)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (553, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (554, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (555, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (556, 14)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (557, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (558, 33)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (559, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (560, 47)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (561, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (562, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (563, 7)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (564, 48)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (565, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (566, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (567, 27)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (568, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (569, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (570, 44)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (571, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (572, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (573, 41)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (574, 38)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (575, 20)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (576, 11)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (577, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (578, 20)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (579, 48)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (580, 30)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (581, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (582, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (583, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (584, 29)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (585, 33)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (586, 30)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (587, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (588, 29)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (589, 27)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (590, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (591, 25)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (592, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (593, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (594, 42)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (595, 7)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (596, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (597, 17)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (598, 42)
GO
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (599, 33)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (600, 4)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (601, 23)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (602, 45)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (603, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (604, 1)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (605, 20)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (606, 23)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (607, 5)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (608, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (609, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (610, 14)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (611, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (612, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (613, 35)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (614, 22)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (615, 35)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (616, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (617, 26)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (618, 27)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (619, 15)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (620, 9)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (621, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (622, 48)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (623, 27)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (624, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (625, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (626, 12)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (627, 44)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (628, 48)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (629, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (630, 14)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (631, 44)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (632, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (633, 37)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (634, 45)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (635, 7)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (636, 17)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (637, 44)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (638, 32)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (639, 10)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (640, 10)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (641, 25)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (642, 1)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (643, 5)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (644, 13)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (645, 29)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (646, 2)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (647, 46)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (648, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (649, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (650, 6)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (651, 30)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (652, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (653, 28)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (654, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (655, 14)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (656, 24)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (657, 19)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (658, 22)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (659, 31)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (660, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (661, 29)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (662, 7)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (663, 36)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (664, 10)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (665, 20)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (666, 45)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (667, 36)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (668, 39)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (669, 15)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (670, 18)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (671, 8)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (672, 43)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (673, 0)
INSERT [dbo].[kho] ([id], [so_luong]) VALUES (674, 0)
SET IDENTITY_INSERT [dbo].[kho] OFF
GO
SET IDENTITY_INSERT [dbo].[loai_sp] ON 

INSERT [dbo].[loai_sp] ([id], [ten], [mo_ta], [tg_tao]) VALUES (3, N'Giá sách gỗ', N'', CAST(N'2022-02-20' AS Date))
INSERT [dbo].[loai_sp] ([id], [ten], [mo_ta], [tg_tao]) VALUES (4, N'Kệ ti vi', N'', CAST(N'2022-02-20' AS Date))
INSERT [dbo].[loai_sp] ([id], [ten], [mo_ta], [tg_tao]) VALUES (5, N'Tủ quần áo', N'', CAST(N'2022-02-20' AS Date))
INSERT [dbo].[loai_sp] ([id], [ten], [mo_ta], [tg_tao]) VALUES (6, N'Bàn ghế ăn', N'', CAST(N'2022-02-20' AS Date))
INSERT [dbo].[loai_sp] ([id], [ten], [mo_ta], [tg_tao]) VALUES (7, N'Bàn làm việc', N'', CAST(N'2022-02-20' AS Date))
INSERT [dbo].[loai_sp] ([id], [ten], [mo_ta], [tg_tao]) VALUES (8, N'Giường', N'', CAST(N'2022-02-20' AS Date))
SET IDENTITY_INSERT [dbo].[loai_sp] OFF
GO
SET IDENTITY_INSERT [dbo].[nguoi_dung] ON 

INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [email], [ho_ten], [ngay_sinh], [sdt], [dia_chi], [gioi_tinh], [quyen], [tg_tao]) VALUES (36, N'mitto.hai.7356', N'123456', N'mitto.hai.73559@gmail.com', NULL, NULL, N'0354326853 ', NULL, 0, 1, CAST(N'0001-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[nguoi_dung] OFF
GO
SET IDENTITY_INSERT [dbo].[nha_cung_cap] ON 

INSERT [dbo].[nha_cung_cap] ([id], [ten], [dia_chi], [sdt], [email]) VALUES (1, N'xưởng gỗ nội thất hà nội', N'XVGW+X69, Kim Mã, Ba Đình, Hà Nội 100000', N'1111111111111111', N'lehainam1994@gmail.com')
SET IDENTITY_INSERT [dbo].[nha_cung_cap] OFF
GO
SET IDENTITY_INSERT [dbo].[san_pham] ON 

INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (2, N'Kệ để sách bằng gỗ MDF cao cấp GHS-2399', 3, 1900000, 0, N'hiện tại chưa có mô tả về sản phẩm', NULL, NULL, N'274233014_705640054142415_5360553174032513759_n.jpg', 3, CAST(N'0001-01-01' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (3, N'Giá kệ sách gỗ thiết kế đơn giản GHS-2398', 3, 1600000, 0, N'hiện tại chưa có mô tả về sản phẩm', 451, NULL, N'gia-ke-sach-go-thiet-ke-don-gian-ghs-2398-ava-300x300.jpg', 7, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (4, N'Kệ để sách báo gỗ MDF phủ melamine GHS-2397', 3, 1900000, 0, N'hiện tại chưa có mô tả về sản phẩm', NULL, NULL, N'ke-de-sach-bao-go-mdf-phu-melamine-ghs-2397-ava-300x300.jpg', 9, CAST(N'0001-01-01' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (5, N'Kệ sách đa năng kiểu dáng độc đáo GHS-2395', 3, 2900000, 15, N'hiện tại chưa có mô tả về sản phẩm', 674, NULL, NULL, 3, CAST(N'0001-01-01' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (6, N'Giá kệ sách bằng gỗ đa năng GHS-2394', 3, 2400000, 0, N'hiện tại chưa có mô tả về sản phẩm', 454, NULL, N'gia-ke-sach-bang-go-da-nang-ghs-2394-ava-300x300.jpg', 2, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (7, N'Kệ sách gỗ MDF phủ melamine GHS-2393', 3, 2500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 455, NULL, N'ke-sach-go-mdf-phu-melamine-ghs-2393-ava-300x300.jpg', 1, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (8, N'Kệ giá để sách bằng gỗ tại nhà GHS-2389', 3, 3200000, 0, N'hiện tại chưa có mô tả về sản phẩm', 456, NULL, N'ke-gia-de-sach-bang-go-tai-nha-ghs-2388-ava-300x300.jpg', 1, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (9, N'Giá để sách gỗ nhỏ gọn GHS-2388', 3, 1700000, 0, N'hiện tại chưa có mô tả về sản phẩm', 457, NULL, N'gia-de-sach-go-nho-gon-ghs-2388-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (10, N'Giá để sách truyện cho bé bằng gỗ GHS-2385', 3, 2500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 458, NULL, N'gia-de-sach-truyen-cho-be-bang-go-ghs-2385-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (11, N'Kệ giá sách gỗ đa năng kiểu dáng trẻ trung GHS-51598', 3, 500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 459, NULL, N'ke-gia-sach-go-da-nang-kieu-dang-tre-trung-ghs-51598-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (12, N'Kệ sách nhỏ gọn kết cấu chắc chắn GHC-1105', 3, 1100000, 0, N'hiện tại chưa có mô tả về sản phẩm', 460, NULL, N'ke-sach-nho-gon-ket-cau-chac-chan-ghc-1105-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (13, N'Kệ để đồ hình Robot bằng gỗ thiết kế mới GHC-1104', 3, 1600000, 0, N'hiện tại chưa có mô tả về sản phẩm', 461, NULL, N'ke-de-do-hinh-robot-bang-go-thiet-ke-moi-ghc-1104-ava2-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (14, N'Kệ trưng bày Tatami 120 cm bằng gỗ MDF GHC-2430', 3, 1800000, 5, N'hiện tại chưa có mô tả về sản phẩm', 462, NULL, N'ke-go-tatami-thiet-ke-thong-minh-tien-loi-ghc-2424-ava-1-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (15, N'Kệ gỗ Tatami 90 cm thiết kế thông minh tiện lợi GHC-2424', 3, 1500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 463, NULL, N'ke-go-tatami-thiet-ke-thong-minh-tien-loi-ghc-2424-ava-1-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (16, N'Kệ gỗ Tatami kiểu dáng đơn giản phong cách Nhật GHC-2422', 3, 1600000, 0, N'hiện tại chưa có mô tả về sản phẩm', 464, NULL, N'ke-go-tatami-kieu-dang-don-gian-phong-cach-nhat-ghc-2422-ava-1-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (17, N'Giá sách gỗ nhỏ gọn thiết kế đa năng GHC-2418', 3, 950000, 0, N'hiện tại chưa có mô tả về sản phẩm', 465, NULL, N'gia-sach-go-nho-gon-thiet-ke-da-nang-ghc-2418-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (18, N'Giá kệ để đồ xếp hình lắp ráp đa năng size 36cm GHC-2406', 3, 399000, 0, N'hiện tại chưa có mô tả về sản phẩm', 466, NULL, N'Giá-k?-sách-t?-d?-d?-x?p-hình-l?p-ráp-da-nang-8-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (19, N'Kệ sách đa năng bằng gỗ công nghiệp MDF cao cấp GHC-2405', 3, 1190000, 0, N'hiện tại chưa có mô tả về sản phẩm', 467, NULL, N'gia-sach-gia-dinh-thiet-ke-da-nang-ghc-2405-9-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (20, N'Kệ sách đứng đẹp thiết kế nhỏ gọn GHS-2384', 3, 1500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 468, NULL, N'ke-sach-dung-dep-thiet-ke-nho-gon-ghs-2384-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (21, N'Kệ sách hiện đại thiết kế sang trọng GHS-2383', 3, 2100000, 0, N'hiện tại chưa có mô tả về sản phẩm', 469, NULL, N'ke-sach-hien-dai-thiet-ke-sang-trong-ghs-2383-ava-1-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (22, N'Giá sách cao cấp bằng gỗ GHS-2382', 3, 8600000, 0, N'hiện tại chưa có mô tả về sản phẩm', 470, NULL, N'gia-sach-cao-cap-bang-go-ghs-2382-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (23, N'Giá sách đa năng thiết kế sang trọng GHS-2381', 3, 5800000, 0, N'hiện tại chưa có mô tả về sản phẩm', 471, NULL, N'gia-sach-da-nang-thiet-ke-sang-trong-ghs-2381-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (24, N'Giá sách hiện đại thiết kế thông minh GHS-2380', 3, 2100000, 0, N'hiện tại chưa có mô tả về sản phẩm', 472, NULL, N'gia-sach-hien-dai-thiet-ke-thong-minh-ghs-2380-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (25, N'Giá sách gia đình kiểu dáng nhỏ gọn GHS-2379', 3, 1700000, 0, N'hiện tại chưa có mô tả về sản phẩm', 473, NULL, N'gia-sach-gia-dinh-kieu-dang-nho-gon-ghs-2379-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (26, N'Giá sách bằng gỗ kiểu dáng tiện dụng GHS-2378', 3, 2300000, 10, N'hiện tại chưa có mô tả về sản phẩm', 474, NULL, N'gia-sach-bang-go-kieu-dang-tien-dung-ghs-2378-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (27, N'Giá sách hiện đại thiết kế đơn giản GHS-2377', 3, 4200000, 0, N'hiện tại chưa có mô tả về sản phẩm', 475, NULL, N'gia-sach-hien-dai-thiet-ke-don-gian-ghs-2377-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (28, N'Bàn ăn bằng gỗ 4 chỗ thiết kế đẹp GHS-41221', 4, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 476, NULL, N'Ban-an-bang-go-4-cho-thiet-ke-dep-GHS-41221-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (29, N'Bàn ăn gia đình phong cách hiện đại GHS-41220', 4, 12500000, 8, N'hiện tại chưa có mô tả về sản phẩm', 477, NULL, N'Ban-an-gia-dinh-phong-cach-hien-dai-GHS-41220-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (30, N'Bàn ăn bằng gỗ đẹp cho gia đình GHS-41219', 4, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 478, NULL, N'ban-an-bang-go-dep-cho-gia-dinh-GHS-41219-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (31, N'Bàn ăn gỗ sồi kiểu dáng nhỏ gọn cho gia đình GHS-41218', 4, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 479, NULL, N'Ban-an-go-soi-kieu-dang-nho-gon-cho-gia-dinh-GHS-41218-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (32, N'Bộ bàn ăn hiện đại gỗ sồi kiểu dáng nhỏ gọn GHS-41217', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 480, NULL, N'Bo-ban-an-hien-dai-go-soi-kieu-dang-nho-gon-GHS-41217-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (33, N'Bàn ăn gia đình 4 chỗ bằng gỗ tự nhiên GHS-41216', 4, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 481, NULL, N'Ban-an-gia-dinh-4-cho-bang-go-tu-nhien-GHS-41216-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (34, N'Bàn ăn gỗ sồi thiết kế đẹp thanh lịch GHS-41215', 4, 14000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 482, NULL, N'Ban-an-go-soi-thiet-ke-dep-thanh-lich-GHS-41215-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (35, N'Bộ bàn ghế ăn gỗ chất lượng cao cho gia đình GHS-41214', 4, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 483, NULL, N'Bo-ban-ghe-an-go-chat-luong-cao-cho-gia-dinh-GHS-41214-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (36, N'Bàn ăn bằng gỗ kiểu dáng thanh lịch GHS-41213', 4, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 484, NULL, N'ban-an-bang-go-kieu-dang-tahnh-lich-GHS-41213-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (37, N'Bàn ăn gia đình thiết kế đẹp bằng gỗ sồi GHS-41212', 4, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 485, NULL, N'Ban-an-gia-dinh-thiet-ke-dep-bang-go-soi-GHS-41212-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (38, N'Bộ bàn ăn gia đình kiểu dáng nhỏ gọn GHS-41155', 4, 11500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 486, NULL, N'Bo-ban-an-gia-dinh-kieu-dang-nho-gon-GHS-41155-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (39, N'Bàn ăn bằng gỗ chất lượng cao GHS-41154', 4, 14500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 487, NULL, N'Ban-an-bang-go-chat-luong-cao-GHS-41154-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (40, N'Bộ bàn ăn gia đình đẹp thanh lịch GHS-41153', 4, 14000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 488, NULL, N'Bo-ban-an-gia-dinh-dep-thanh-lich-GHS-41153-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (41, N'Bàn ăn hiện đại bằng gỗ cho gia đình GHS-41152', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 489, NULL, N'Ban-an-hien-dai-bang-go-cho-gia-dinh-GHS-41152-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (42, N'Bộ bàn ghế ăn bằng gỗ tự nhiên GHS-41151', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 490, NULL, N'Bo-ban-ghe-an-bang-go-tu-nhien-GHS-41151-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (43, N'Bộ bàn ăn gỗ thiết kế ấn tượng GHS-41150', 4, 13500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 491, NULL, N'Bo-ban-an-go-thiet-ke-an-tuong-GHS-41150-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (44, N'Bộ bàn ăn tròn phong cách hiện đại GHS-41149', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 492, NULL, N'Bo-ban-an-tron-phong-cach-hien-dai-GHS-41149-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (45, N'Bàn ăn hiện đại cho gia đình GHS-41148', 4, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 493, NULL, N'Ban-an-hien-dai-cho-gia-dinh-GHS-41148-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (46, N'Bàn ăn gia đình bằng gỗ thiết kế đẹp GHS-41147', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 494, NULL, N'Ban-an-gia-dinh-bang-go-thiet-ke-dep-GHS-41147-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (47, N'Bộ bàn ghế ăn phong cách hiện đại GHS-41146', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 495, NULL, N'Bo-ban-ghe-an-phong-cach-hien-dai-GHS-41146-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (48, N'Bàn ăn hiện đại bằng gỗ cao cấp GHS-41145', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 496, NULL, N'ban-an-hien-dai-bang-go-cao-cap-GHS-41145-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (49, N'Bàn ăn đẹp bằng gỗ tự nhiên GHS-41093', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 497, NULL, N'Ban-an-dep-bang-go-tu-nhien-GHS-41093-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (50, N'Bàn ăn hình vuông bằng gỗ tự nhiên GHS-41092', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 498, NULL, N'Ban-an-hinh-vuong-bang-go-tu-nhien-GHS-41092-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (51, N'Bộ bàn ăn chất lượng cao thiết kế đẹp GHS-41091', 4, 14500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 499, NULL, N'Bo-ban-an-chat-luong-cao-thiet-ke-dep-GHS-41091-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (52, N'Bàn ăn hiện đại 4 ghế cho gia đình GHS-41090', 4, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 500, NULL, N'Ban-an-hien-dai-4-ghe-cho-gia-dinh-GHS-41090-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (53, N'Bàn ăn hiện đại thiết kế ấn tượng GHS-41089', 4, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 501, NULL, N'Ban-an-hien-dai-thiet-ke-an-tuong-GHS-41089-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (54, N'Bàn ăn gỗ tự nhiên cao cấp GHS-41088', 4, 14500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 502, NULL, N'Ban-an-go-tu-nhien-cao-cap-GHS-41088-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (55, N'Bộ bàn ăn gỗ đẹp cho gia đình GHS-41087', 4, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 503, NULL, N'Bo-ban-an-go-dep-cho-gia-dinh-GHS-41087-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (56, N'Bàn ăn gia đình bằng gỗ tự nhiên GHS-41086', 4, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 504, NULL, N'Ban-an-gia-dinh-bang-go-tu-nhien-GHS-41086-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (57, N'Bàn ăn bằng gỗ thiết kế đẹp GHS-41085', 4, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 505, NULL, N'Ban-an-bang-go-thiet-ke-dep-GHS-41085-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (58, N'Bộ bàn ăn hiện đại cho gia đình GHS-41084', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 506, NULL, N'Bo-ban-an-hien-dai-cho-gia-dinh-GHS-41084-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (59, N'Bộ bàn ăn gia đình thiết kế đẹp GHS-41083', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 507, NULL, N'Bo-ban-an-gia-dinh-thiet-ke-dep-GHS-41083-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (60, N'Bộ bàn ăn gỗ kiểu dáng nhỏ gọn GHS-41082', 4, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 508, NULL, N'Bo-ban-an-gi-kieu-dang-nho-gon-GHS-41082-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (61, N'Bàn ăn bằng gỗ chất lượng cao GHS-41081', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 509, NULL, N'Ban-an-bang-go-chat-luong-cao-GHS-41081-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (62, N'Bộ bàn ăn gỗ 4 ghế hiện đại GHS-41080', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 510, NULL, N'Bo-ban-an-go-4-ghe-hien-dai-GHS-41080-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (63, N'Bàn ăn gia đình hiện đại đẹp GHS-41079', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 511, NULL, N'Ban-an-gia-dinh-hien-dai-dep-GHS-41079-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (64, N'Bàn ăn gỗ gia đình ghế bọc nỉ cao cấp GHS-4909', 4, 11500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 512, NULL, N'ban-an-go-gia-dinh-ghe-boc-ni-cao-cap-ghs-4909-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (65, N'Bàn ăn gỗ hiện đại thiết kế nhỏ gọn sang trọng GHS-4908', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 513, NULL, N'ban-an-go-hien-dai-thiet-ke-nho-gon-sang-trong-ghs-4908-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (66, N'Bàn ăn gỗ gia đình đẹp sang trọng hiện đại GHS-4905', 4, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 514, NULL, N'ban-an-go-gia-dinh-dep-sang-trong-hien-dai-ghs-4905-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (67, N'Bàn ăn gỗ sồi gia đình thiết kế đẹp hiện đại GHS-4902', 4, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 515, NULL, N'ban-an-go-soi-gia-dinh-thiet-ke-dep-hien-dai-ghs-4902-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (68, N'Bàn ăn hiện đại bằng gỗ sồi tự nhiên sang trọng GHS-4900', 4, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 516, NULL, N'ban-an-hien-dai-bang-go-soi-tu-nhien-sang-trong-ghs-4900-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (69, N'Bàn ăn gỗ gia đình thiết kế sang trọng hiện đại GHS-4899', 4, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 517, NULL, N'ban-an-go-gia-dinh-thiet-ke-sang-trong-hien-dai-ghs-4899-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (70, N'Bàn ăn gỗ công nghiệp nhỏ gọn tiện lợi GHS-4854', 4, 7000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 518, NULL, N'ban-an-go-cong-nghiep-nho-gon-tien-loi-ghs-4854-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (71, N'Bàn ăn gỗ gia đình thiết kế đẹp hiện đại GHS-4853', 4, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 519, NULL, N'ban-an-go-gia-dinh-thiet-ke-dep-hien-dai-ghs-4853-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (72, N'Bàn ăn gỗ hiện đại sang trọng tiện dụng GHS-4852', 4, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 520, NULL, N'ban-an-go-hien-dai-sang-trong-tien-dung-ghs-4852-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (73, N'Tủ áo Tatami gỗ thiết kế tiện dụng GHC-51469', 5, 1900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 521, NULL, N'tu-ao-tatami-go-thiet-ke-tien-dung-ghc-51469-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (74, N'Tủ áo gỗ nhỏ gọn thiết kế phong cách hiện đại GHC-51473', 5, 699000, 0, N'hiện tại chưa có mô tả về sản phẩm', 522, NULL, N'tu-ao-go-nho-gon-thiet-ke-phong-cach-hien-dai-ghc-51473-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (75, N'Tủ áo gỗ MDF kết cấu chắc chắn phủ melamine GHC-51472', 5, 1299000, 0, N'hiện tại chưa có mô tả về sản phẩm', 523, NULL, N'tu-ao-go-mdf-ket-cau-chac-chan-phu-melamine-ghc-51472-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (76, N'Tủ áo gỗ hiện đại thiết kế cánh mở GHS-51444', 5, 6400000, 0, N'hiện tại chưa có mô tả về sản phẩm', 524, NULL, N'tu-ao-go-hien-dai-thiet-ke-canh-mo-ghs-51444-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (77, N'Tủ áo cánh lùa bằng gỗ sồi tự nhiên GHS-51443', 5, 15000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 525, NULL, N'tu-ao-canh-lua-bang-go-soi-tu-nhien-ghs-51143-ava1-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (78, N'Tủ áo cánh chớp bằng gỗ sồi tự nhiên cao cấp GHS-51442', 5, 15900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 526, NULL, N'tu-ao-canh-chop-bang-go-soi-tu-nhien-cao-cap-ghs-51442-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (79, N'Tủ áo cánh lùa thiết kế chớp giả GHS-51441', 5, 15200000, 0, N'hiện tại chưa có mô tả về sản phẩm', 527, NULL, N'tu-ao-canh-lua-thiet-ke-chop-gia-ghs-51441-ava-1-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (80, N'Tủ để quần áo gỗ cánh chớp giả cao cấp GHS-51440', 5, 22000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 528, NULL, N'tu-quan-ao-go-canh-chop-gia-cao-cap-ghs-51440-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (81, N'Tủ quần áo cánh trượt bằng gỗ cao cấp GHS-51439', 5, 8900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 529, NULL, N'tu-quan-ao-canh-truot-bang-go-cao-cap-ghs-51439-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (82, N'Tủ áo gỗ MDF cho bé gái kiểu dáng dễ thương GHS-51438', 5, 8900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 530, NULL, N'tu-ao-go-mdf-cho-be-gai-kieu-dang-de-thuong-ghs-51438-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (83, N'Tủ quần áo cho bé bằng gỗ công nghiệp GHS-51437', 5, 4900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 531, NULL, N'tu-quan-ao-cho-be-bang-go-cong-nghiep-ghs-51437-ava-1-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (84, N'Tủ áo bằng gỗ thiết kế cánh mở tiện dụng GHS-51436', 5, 13500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 532, NULL, N'tu-ao-bang-go-thiet-ke-canh-mo-tien-dung-ghs-51436-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (85, N'Tủ áo cánh mở gia đình bằng gỗ cao cấp GHS-51435', 5, 9500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 533, NULL, N'tu-ao-canh-mo-gia-dinh-bang-go-cao-cap-ghs-51435-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (86, N'Tủ áo gia đình bằng gỗ thiết kế đẹp GHS-51434', 5, 7900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 534, NULL, N'tu-ao-gia-dinh-bang-go-thiet-ke-dep-ghs-51434-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (87, N'Tủ để quần áo bằng gỗ MDF phun sơn GHS-51433', 5, 7500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 535, NULL, N'tu-de-quan-ao-bang-go-mdf-phun-son-ghs-51433-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (88, N'Tủ đựng quần áo gỗ sồi sang trọng GHS-51432', 5, 18500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 536, NULL, N'tu-dung-quan-ao-go-soi-sang-trong-ghs-51432-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (89, N'Tủ quần áo đẹp thiết kế cánh mở GHS-51431', 5, 4200000, 0, N'hiện tại chưa có mô tả về sản phẩm', 537, NULL, N'tu-quan-ao-dep-thiet-ke-canh-mo-ghs-51431-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (90, N'Tủ để quần áo bằng gỗ thiết kế tiện lợi GHS-51430', 5, 4200000, 0, N'hiện tại chưa có mô tả về sản phẩm', 538, NULL, N'tu-de-quan-ao-bang-go-thiet-ke-tien-loi-ghs-51430-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (91, N'Tủ quần áo cánh lùa thiết kế hiện đại GHS-51429', 5, 13200000, 0, N'hiện tại chưa có mô tả về sản phẩm', 539, NULL, N'tu-quan-ao-canh-lua-thiet-ke-hien-dai-ghs-51429-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (92, N'Tủ đựng quần áo cánh mở kích thước nhỏ gọn GHS-51428', 5, 4600000, 0, N'hiện tại chưa có mô tả về sản phẩm', 540, NULL, N'tu-dung-quan-ao-canh-mo-kich-thuoc-nho-gon-ghs-51428-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (93, N'Tủ áo cánh mở bằng gỗ kiểu dáng nhỏ gọn GHS-51345', 5, 7600000, 0, N'hiện tại chưa có mô tả về sản phẩm', 541, NULL, N'tu-ao-canh-mo-bang-go-kieu-dang-nho-gon-ghs-51345-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (94, N'Tủ để quần áo gỗ công nghiệp kết cấu chắc chắn GHS-51344', 5, 5700000, 0, N'hiện tại chưa có mô tả về sản phẩm', 542, NULL, N'tu-de-quan-ao-go-cong-nghiep-ket-cau-chac-chan-ghs-51344-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (95, N'Tủ gỗ đựng quần áo gia đình thiết kế hiện đại GHS-51343', 5, 8900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 543, NULL, N'tu-go-dung-quan-ao-gia-dinh-thiet-ke-hien-dai-ghs-51343-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (96, N'Tủ để quần áo cánh trượt gỗ MDF cốt lõi xanh GHS-51342', 5, 8900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 544, NULL, N'tu-de-quan-ao-canh-truot-go-mdf-cot-loi-xanh-ghs-51342-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (97, N'Tủ quần áo cánh mở gỗ MDF thiết kế hiện đại GHS-51341', 5, 6900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 545, NULL, N'tu-quan-ao-canh-mo-go-mdf-thiet-ke-hien-dai-ghs-51341-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (98, N'Tủ đựng quần áo thiết kế cánh trượt triện dụng GHS-51340', 5, 12900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 546, NULL, N'tu-dung-quan-ao-thiet-ke-canh-truot-trien-dung-ghs-51340-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (99, N'Tủ quần áo cánh lùa bằng gỗ kết cấu chắc chắn GHS-51339', 5, 9300000, 0, N'hiện tại chưa có mô tả về sản phẩm', 547, NULL, N'tu-quan-ao-canh-lua-bang-go-ket-cau-chac-chan-ghs-51339-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (100, N'Tủ áo bằng gỗ cánh trượt thiết kế tiện lợi GHS-51338', 5, 8900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 548, NULL, N'tu-ao-bang-go-canh-truot-thiet-ke-tien-loi-ghs-51338-ava-1-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
GO
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (101, N'Bàn ăn bằng gỗ 4 chỗ thiết kế đẹp GHS-41221', 6, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 549, NULL, N'Ban-an-bang-go-4-cho-thiet-ke-dep-GHS-41221-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (102, N'Bàn ăn gia đình phong cách hiện đại GHS-41220', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 550, NULL, N'Ban-an-gia-dinh-phong-cach-hien-dai-GHS-41220-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (103, N'Bàn ăn bằng gỗ đẹp cho gia đình GHS-41219', 6, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 551, NULL, N'ban-an-bang-go-dep-cho-gia-dinh-GHS-41219-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (104, N'Bàn ăn gỗ sồi kiểu dáng nhỏ gọn cho gia đình GHS-41218', 6, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 552, NULL, N'Ban-an-go-soi-kieu-dang-nho-gon-cho-gia-dinh-GHS-41218-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (105, N'Bộ bàn ăn hiện đại gỗ sồi kiểu dáng nhỏ gọn GHS-41217', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 553, NULL, N'Bo-ban-an-hien-dai-go-soi-kieu-dang-nho-gon-GHS-41217-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (106, N'Bàn ăn gia đình 4 chỗ bằng gỗ tự nhiên GHS-41216', 6, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 554, NULL, N'Ban-an-gia-dinh-4-cho-bang-go-tu-nhien-GHS-41216-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (107, N'Bàn ăn gỗ sồi thiết kế đẹp thanh lịch GHS-41215', 6, 14000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 555, NULL, N'Ban-an-go-soi-thiet-ke-dep-thanh-lich-GHS-41215-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (108, N'Bộ bàn ghế ăn gỗ chất lượng cao cho gia đình GHS-41214', 6, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 556, NULL, N'Bo-ban-ghe-an-go-chat-luong-cao-cho-gia-dinh-GHS-41214-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (109, N'Bàn ăn bằng gỗ kiểu dáng thanh lịch GHS-41213', 6, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 557, NULL, N'ban-an-bang-go-kieu-dang-tahnh-lich-GHS-41213-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (110, N'Bàn ăn gia đình thiết kế đẹp bằng gỗ sồi GHS-41212', 6, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 558, NULL, N'Ban-an-gia-dinh-thiet-ke-dep-bang-go-soi-GHS-41212-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (111, N'Bộ bàn ăn gia đình kiểu dáng nhỏ gọn GHS-41155', 6, 11500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 559, NULL, N'Bo-ban-an-gia-dinh-kieu-dang-nho-gon-GHS-41155-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (112, N'Bàn ăn bằng gỗ chất lượng cao GHS-41154', 6, 14500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 560, NULL, N'Ban-an-bang-go-chat-luong-cao-GHS-41154-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (113, N'Bộ bàn ăn gia đình đẹp thanh lịch GHS-41153', 6, 14000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 561, NULL, N'Bo-ban-an-gia-dinh-dep-thanh-lich-GHS-41153-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (114, N'Bàn ăn hiện đại bằng gỗ cho gia đình GHS-41152', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 562, NULL, N'Ban-an-hien-dai-bang-go-cho-gia-dinh-GHS-41152-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (115, N'Bộ bàn ghế ăn bằng gỗ tự nhiên GHS-41151', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 563, NULL, N'Bo-ban-ghe-an-bang-go-tu-nhien-GHS-41151-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (116, N'Bộ bàn ăn gỗ thiết kế ấn tượng GHS-41150', 6, 13500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 564, NULL, N'Bo-ban-an-go-thiet-ke-an-tuong-GHS-41150-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (117, N'Bộ bàn ăn tròn phong cách hiện đại GHS-41149', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 565, NULL, N'Bo-ban-an-tron-phong-cach-hien-dai-GHS-41149-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (118, N'Bàn ăn hiện đại cho gia đình GHS-41148', 6, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 566, NULL, N'Ban-an-hien-dai-cho-gia-dinh-GHS-41148-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (119, N'Bàn ăn gia đình bằng gỗ thiết kế đẹp GHS-41147', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 567, NULL, N'Ban-an-gia-dinh-bang-go-thiet-ke-dep-GHS-41147-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (120, N'Bộ bàn ghế ăn phong cách hiện đại GHS-41146', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 568, NULL, N'Bo-ban-ghe-an-phong-cach-hien-dai-GHS-41146-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (121, N'Bàn ăn hiện đại bằng gỗ cao cấp GHS-41145', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 569, NULL, N'ban-an-hien-dai-bang-go-cao-cap-GHS-41145-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (122, N'Bàn ăn đẹp bằng gỗ tự nhiên GHS-41093', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 570, NULL, N'Ban-an-dep-bang-go-tu-nhien-GHS-41093-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (123, N'Bàn ăn hình vuông bằng gỗ tự nhiên GHS-41092', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 571, NULL, N'Ban-an-hinh-vuong-bang-go-tu-nhien-GHS-41092-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (124, N'Bộ bàn ăn chất lượng cao thiết kế đẹp GHS-41091', 6, 14500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 572, NULL, N'Bo-ban-an-chat-luong-cao-thiet-ke-dep-GHS-41091-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (125, N'Bàn ăn hiện đại 4 ghế cho gia đình GHS-41090', 6, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 573, NULL, N'Ban-an-hien-dai-4-ghe-cho-gia-dinh-GHS-41090-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (126, N'Bàn ăn hiện đại thiết kế ấn tượng GHS-41089', 6, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 574, NULL, N'Ban-an-hien-dai-thiet-ke-an-tuong-GHS-41089-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (127, N'Bàn ăn gỗ tự nhiên cao cấp GHS-41088', 6, 14500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 575, NULL, N'Ban-an-go-tu-nhien-cao-cap-GHS-41088-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (128, N'Bộ bàn ăn gỗ đẹp cho gia đình GHS-41087', 6, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 576, NULL, N'Bo-ban-an-go-dep-cho-gia-dinh-GHS-41087-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (129, N'Bàn ăn gia đình bằng gỗ tự nhiên GHS-41086', 6, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 577, NULL, N'Ban-an-gia-dinh-bang-go-tu-nhien-GHS-41086-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (130, N'Bàn ăn bằng gỗ thiết kế đẹp GHS-41085', 6, 13000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 578, NULL, N'Ban-an-bang-go-thiet-ke-dep-GHS-41085-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (131, N'Bộ bàn ăn hiện đại cho gia đình GHS-41084', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 579, NULL, N'Bo-ban-an-hien-dai-cho-gia-dinh-GHS-41084-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (132, N'Bộ bàn ăn gia đình thiết kế đẹp GHS-41083', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 580, NULL, N'Bo-ban-an-gia-dinh-thiet-ke-dep-GHS-41083-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (133, N'Bộ bàn ăn gỗ kiểu dáng nhỏ gọn GHS-41082', 6, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 581, NULL, N'Bo-ban-an-gi-kieu-dang-nho-gon-GHS-41082-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (134, N'Bàn ăn bằng gỗ chất lượng cao GHS-41081', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 582, NULL, N'Ban-an-bang-go-chat-luong-cao-GHS-41081-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (135, N'Bộ bàn ăn gỗ 4 ghế hiện đại GHS-41080', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 583, NULL, N'Bo-ban-an-go-4-ghe-hien-dai-GHS-41080-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (136, N'Bàn ăn gia đình hiện đại đẹp GHS-41079', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 584, NULL, N'Ban-an-gia-dinh-hien-dai-dep-GHS-41079-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (137, N'Bàn ăn gỗ gia đình ghế bọc nỉ cao cấp GHS-4909', 6, 11500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 585, NULL, N'ban-an-go-gia-dinh-ghe-boc-ni-cao-cap-ghs-4909-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (138, N'Bàn ăn gỗ hiện đại thiết kế nhỏ gọn sang trọng GHS-4908', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 586, NULL, N'ban-an-go-hien-dai-thiet-ke-nho-gon-sang-trong-ghs-4908-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (139, N'Bàn ăn gỗ gia đình đẹp sang trọng hiện đại GHS-4905', 6, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 587, NULL, N'ban-an-go-gia-dinh-dep-sang-trong-hien-dai-ghs-4905-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (140, N'Bàn ăn gỗ sồi gia đình thiết kế đẹp hiện đại GHS-4902', 6, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 588, NULL, N'ban-an-go-soi-gia-dinh-thiet-ke-dep-hien-dai-ghs-4902-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (141, N'Bàn ăn hiện đại bằng gỗ sồi tự nhiên sang trọng GHS-4900', 6, 12500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 589, NULL, N'ban-an-hien-dai-bang-go-soi-tu-nhien-sang-trong-ghs-4900-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (142, N'Bàn ăn gỗ gia đình thiết kế sang trọng hiện đại GHS-4899', 6, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 590, NULL, N'ban-an-go-gia-dinh-thiet-ke-sang-trong-hien-dai-ghs-4899-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (143, N'Bàn ăn gỗ công nghiệp nhỏ gọn tiện lợi GHS-4854', 6, 7000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 591, NULL, N'ban-an-go-cong-nghiep-nho-gon-tien-loi-ghs-4854-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (144, N'Bàn ăn gỗ gia đình thiết kế đẹp hiện đại GHS-4853', 6, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 592, NULL, N'ban-an-go-gia-dinh-thiet-ke-dep-hien-dai-ghs-4853-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (145, N'Bàn ăn gỗ hiện đại sang trọng tiện dụng GHS-4852', 6, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 593, NULL, N'ban-an-go-hien-dai-sang-trong-tien-dung-ghs-4852-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (146, N'Bàm làm việc thông minh tiết kiệm diện tích GHC-4624', 7, 1400000, 0, N'hiện tại chưa có mô tả về sản phẩm', 594, NULL, N'ban-lam-viec-thong-minh-GHC-4624-11-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (147, N'Bàn Nhật đa năng bằng gỗ sồi cao cấp GHC-41414', 7, 2200000, 0, N'hiện tại chưa có mô tả về sản phẩm', 595, NULL, N'ban-nhat-da-nang-bang-go-soi-cao-cap-ghc-41414-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (148, N'Bàn làm việc thông minh bằng gỗ công nghiệp GHS-4155-2', 7, 2800000, 0, N'hiện tại chưa có mô tả về sản phẩm', 596, NULL, N'ban-lam-viec-thong-minh-bang-go-cong-nghiep-ghs-4155-2-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (149, N'Bàn làm việc hiện đại liền giá sách bằng gỗ GHS-41413', 7, 4800000, 0, N'hiện tại chưa có mô tả về sản phẩm', 597, NULL, N'ban-lam-viec-hien-dai-lien-gia-sach-bang-go-ghs-41413-15-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (150, N'Bàn làm việc gỗ liền giá sách bền đẹp GHS-41411', 7, 4600000, 0, N'hiện tại chưa có mô tả về sản phẩm', 598, NULL, N'ban-lam-viec-go-lien-gia-sach-ben-dep-ghs-41411-ava-3-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (151, N'Bàn làm việc liền giá kết cấu chắc chắn GHS-41410', 7, 4800000, 0, N'hiện tại chưa có mô tả về sản phẩm', 599, NULL, N'ban-lam-viec-lien-gia-ket-cau-chac-chan-ghs-41410-ava-1-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (152, N'Bàn làm việc tại nhà liền tủ chứa tài liệu GHS-41408', 7, 3600000, 0, N'hiện tại chưa có mô tả về sản phẩm', 600, NULL, N'ban-lam-viec-tai-nha-lien-tu-chua-tai-lieu-ghs-41408-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (153, N'Bàn làm việc đơn giản kiểu dáng hiện đại GHS-41407', 7, 2900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 601, NULL, N'ban-lam-viec-don-gian-kieu-dang-hien-dai-ghs-41407-9-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (154, N'Bàn làm việc gỗ MDF liền tủ tài liệu GHS-41406', 7, 3600000, 0, N'hiện tại chưa có mô tả về sản phẩm', 602, NULL, N'ban-lam-viec-go-mdf-lien-tu-tai-lieu-ghs-41406-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (155, N'Bàn làm việc tại nhà bằng gỗ công nghiệp GHS-41405', 7, 3600000, 0, N'hiện tại chưa có mô tả về sản phẩm', 603, NULL, N'ban-lam-viec-tai-nha-bang-go-cong-nghiep-ghs-41405-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (156, N'Bàn làm việc nhỏ gọn bằng gỗ MDF cốt lõi xanh GHS-41404', 7, 3500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 604, NULL, N'ban-lam-viec-nho-gon-bang-go-mdf-cot-loi-xanh-ghs-41404-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (157, N'Bàn làm việc cá nhân thiết kế đơn giản GHS-41403', 7, 3600000, 0, N'hiện tại chưa có mô tả về sản phẩm', 605, NULL, N'ban-lam-viec-ca-nhan-thiet-ke-don-gian-ghs-41403-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (158, N'Bàn làm việc bằng gỗ thiết kế đa năng GHS-41401', 7, 2900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 606, NULL, N'ban-lam-viec-bang-go-thiet-ke-da-nang-ghs-41401-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (159, N'Bàn làm việc gỗ kiểu dáng nhỏ gọn GHS-41396', 7, 5300000, 0, N'hiện tại chưa có mô tả về sản phẩm', 607, NULL, N'ban-lam-viec-go-kieu-dang-nho-gon-ghs-41396-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (160, N'Bàn làm việc gỗ công nghiệp cao cấp GHS-41400', 7, 3200000, 0, N'hiện tại chưa có mô tả về sản phẩm', 608, NULL, N'ban-lam-viec-go-cong-nghiep-cao-cap-ghs-41400-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (161, N'Bàn làm việc hiện đại kích thước nhỏ gọn GHS-41399', 7, 3200000, 0, N'hiện tại chưa có mô tả về sản phẩm', 609, NULL, N'ban-lam-viec-hien-dai-go-GHS-41399-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (162, N'Bàn làm việc liền giá kiểu dáng đơn giản GHS-41398', 7, 3000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 610, NULL, N'ban-lam-viec-lien-gia-kieu-dang-don-gian-ghs-41398-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (163, N'Bàn làm việc bằng gỗ MDF phủ melamine GHS-41397', 7, 5300000, 0, N'hiện tại chưa có mô tả về sản phẩm', 611, NULL, N'ban-lam-viec-bang-go-mdf-phu-melamine-ghs-41397-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (164, N'Bàn làm việc đẹp bằng gỗ phong cách hiện đại GHS-41373', 7, 7800000, 0, N'hiện tại chưa có mô tả về sản phẩm', 612, NULL, N'Ban-lam-viec-dep-bang-go-phong-cach-hien-dai-GHS-41373-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (165, N'Bàn làm việc gỗ sồi tự nhiên thiết kế đẹp GHS-41372', 7, 7000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 613, NULL, N'Ban-lam-viec-go-soi-tu-nhien-thiet-ke-dep-GHS-41372-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (166, N'Bàn làm việc cá nhân bằng gỗ công nghiệp nhỏ gọn GHS-41371', 7, 3300000, 0, N'hiện tại chưa có mô tả về sản phẩm', 614, NULL, N'Ban-lam-viec-ca-nhan-bang-go-cong-nghiep-nho-gon-GHS-41371-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (167, N'Bàn làm việc gỗ công nghiệp khung sắt chất lượng cao GHS-41370', 7, 3400000, 0, N'hiện tại chưa có mô tả về sản phẩm', 615, NULL, N'Ban-lam-viec-go-cong-nghiep-khung-sat-chat-luong-cao-GHS-41370-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (168, N'Bàn làm việc tại nhà bằng gỗ thiết kế tiện lợi GHS-41369', 7, 3600000, 0, N'hiện tại chưa có mô tả về sản phẩm', 616, NULL, N'Ban-lam-viec-tai-nha-bang-go-thiet-ke-tien-loi-GHS-41369-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (169, N'Bàn làm việc đẹp kiểu dáng nhỏ gọn gỗ công nghiệp GHS-41368', 7, 3300000, 0, N'hiện tại chưa có mô tả về sản phẩm', 617, NULL, N'Ban-lam-viec-dep-kieu-dang-nho-gon-go-cong-nghiep-GHS-41368-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (170, N'Bàn làm việc gỗ tự nhiên thiết kế tiện dụng GHS-41366', 7, 4900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 618, NULL, N'Ban-lam-viec-go-tu-nhien-thiet-ke-tien-dung-GHS-41366-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (171, N'Bàn làm việc hiện đại thiết kế đẹp thông minh GHS-41365', 7, 3900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 619, NULL, N'Ban-lam-viec-hien-dai-thiet-ke-dep-thong-minh-GHS-41365-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (172, N'Bàn làm việc tại nhà nhỏ gọn thiết kế đẹp GHS-41364', 7, 4500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 620, NULL, N'Ban-lam-viec-tai-nha-nho-gon-thiet-ke-dep-GHS-41364-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (173, N'Bàn làm việc gỗ công nghiệp phun sơn cao cấp GHS-41363', 7, 4200000, 0, N'hiện tại chưa có mô tả về sản phẩm', 621, NULL, N'Ban-lam-viec-go-cong-nghiep-phun-son-cao-cap-GHS-41363-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (174, N'Bàn làm việc hiện đại bằng gỗ công nghiệp cho cá nhân GHS-41362', 7, 3500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 622, NULL, N'Ban-lam-viec-hien-dai-bang-go-cong-nghiep-cho-ca-nhan-GHS-41362-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (175, N'Bàn làm việc tại nhà bằng gỗ kiểu dáng nhỏ gọn GHS-41361', 7, 3200000, 0, N'hiện tại chưa có mô tả về sản phẩm', 623, NULL, N'Ban-lam-viec-tai-nha-bang-go-kieu-dang-nho-gon-GHS-41361-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (176, N'Bàn làm việc gỗ công nghiệp tiện lợi kèm giá sách GHS-41360', 7, 4100000, 0, N'hiện tại chưa có mô tả về sản phẩm', 624, NULL, N'Ban-lam-viec-go-cong-nghiep-tien-loi-kem-gia-sach-GHS-41360-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (177, N'Bàn làm việc cá nhân tại nhà kiểu dáng nhỏ gọn GHS-41359', 7, 3500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 625, NULL, N'Ban-lam-viec-ca-nhan-tai-nha-kieu-dang-nho-gon-GHS-41359-ava-300x300.png', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (178, N'Bàn làm việc gỗ công nghiệp phun sơn hiện đại GHS-41358', 7, 3800000, 0, N'hiện tại chưa có mô tả về sản phẩm', 626, NULL, N'Ban-lam-viec-go-cong-nghiep-phun-son-hien-dai-GHS-41358-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (179, N'Bàn làm việc tại nhà khung sắt chất lượng cao GHS-41357', 7, 3500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 627, NULL, N'Ban-lam-viec-tai-nha-khung-sat-chat-luong-cao-GHS-41357-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (180, N'Bàn làm việc cá nhân bằng gỗ kiểu dáng nhỏ gọn GHS-41356', 7, 3300000, 0, N'hiện tại chưa có mô tả về sản phẩm', 628, NULL, N'Ban-lam-viec-ca-nhan-bang-go-kieu-dang-nho-gon-GHS-41356-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (181, N'Bàn làm việc gỗ công nghiệp khung sắt tĩnh điện GHS-41355', 7, 3700000, 0, N'hiện tại chưa có mô tả về sản phẩm', 629, NULL, N'Ban-lam-viec-go-cong-nghiep-khung-sat-phun-son-tinh-dien-GHS-41355-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (182, N'Bàn làm việc tại nhà thiết kế hiện đại GHS-41315', 7, 4700000, 0, N'hiện tại chưa có mô tả về sản phẩm', 630, NULL, N'Ban-lam-viec-tai-nha-thiet-ke-hien-dai-bang-go-GHS-41315-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (183, N'Bàn làm việc tiện dụng bằng gỗ công nghiệp GHS-41314', 7, 6500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 631, NULL, N'Ban-lam-viec-tien-dung-bang-go-cong-nghiep-GHS-41314-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (184, N'Giường ngủ Nhật Tatami 1m8 x 2m bằng gỗ công nghiệp GHC-9230', 8, 2500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 632, NULL, N'giuong-ngu-nhat-tatami-bang-go-cong-nghiep-ghc-9230-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (185, N'Giường ngủ cho trẻ em 1m4 thiết kế ấn tượng GHC-9226', 8, 3500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 633, NULL, N'giuong-ngu-cho-tre-em-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (186, N'Giường gỗ cho bé 1m2 kết hợp giá sách hiện đại GHC-9225', 8, 3300000, 0, N'hiện tại chưa có mô tả về sản phẩm', 634, NULL, N'giuong-go-cho-be-ghc-9226-1-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (187, N'Giường Nhật bằng gỗ MDF chất lượng rộng 1m6 GHC-9224', 8, 2100000, 0, N'hiện tại chưa có mô tả về sản phẩm', 635, NULL, N'giuong-nhat-bang-go-GHC-9224-10-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (188, N'Giường gỗ MDF phong cách Tatami rộng 1m4 GHC-9223', 8, 2100000, 0, N'hiện tại chưa có mô tả về sản phẩm', 636, NULL, N'giuong-go-MDF-ghc-9223-11-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (189, N'Giường Tatami bằng gỗ công nghiệp cao cấp rộng 1m2 GHC-9222', 8, 1900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 637, NULL, N'giuong-tatami-bang-go-ghc-9222-11-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (190, N'Giường ngủ bệt kiểu Nhật gỗ công nghiệp rộng 1m GHC-9221', 8, 1900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 638, NULL, N'giuong-ngu-bet-GHC-9221-11-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (191, N'Giường ngủ Nhật Tatami rộng 1m6 bằng gỗ công nghiệp GHC-9220', 8, 2400000, 0, N'hiện tại chưa có mô tả về sản phẩm', 639, NULL, N'giuong-ngu-nhat-tatami-rong-1m6-bang-go-cong-nghiep-ghc-9220-ava-1-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (192, N'Giường ngủ gỗ MDF Tatami rộng 1m4 thiết kế mới GHC-9219', 8, 2200000, 0, N'hiện tại chưa có mô tả về sản phẩm', 640, NULL, N'giuong-ngu-go-mdf-tatami-rong-1m4-thiet-ke-moi-ghc-9219-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (193, N'Giường ngủ hiện đại Tatami rộng 1m2 kết cấu chắc chắn GHC-9218', 8, 2000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 641, NULL, N'giuong-ngu-hien-dai-tatami-rong-1m2-ket-cau-chac-chan-ghc-9218-ava-1-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (194, N'Giường ngủ gia đình rộng 1m phong cách Nhật GHC-9217', 8, 1900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 642, NULL, N'giuong-ngu-gia-dinh-phong-cach-nhat-ghc-9217-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (195, N'Giường ngủ gỗ công nghiệp MDF thiết kế mới GHC-9216', 8, 2500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 643, NULL, N'giuong-ngu-go-cong-nghiep-mdf-thiet-ke-moi-ghc-9216-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (196, N'Giường Nhật bằng gỗ rộng 1m4 kiểu dáng hiện đại GHC-9215', 8, 2300000, 0, N'hiện tại chưa có mô tả về sản phẩm', 644, NULL, N'giuong-nhat-bang-go-rong-1m4-kieu-dang-hien-dai-ghc-9215-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (197, N'Giường gỗ MDF rộng 1m2 phong cách Nhật GHC-9214', 8, 2200000, 0, N'hiện tại chưa có mô tả về sản phẩm', 645, NULL, N'giuong-go-mdf-rong-1m2-phong-cach-nhat-ghc-9214-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (198, N'Giường ngủ Tatami rộng 1m thiết kế đơn giản GHC-9213', 8, 2100000, 0, N'hiện tại chưa có mô tả về sản phẩm', 646, NULL, N'giuong-ngu-tatami-rong-1m-thiet-ke-don-gian-ghc-9213-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (199, N'Giường ngủ Tatami thiết kế trẻ trung GHC-9209', 8, 2400000, 0, N'hiện tại chưa có mô tả về sản phẩm', 647, NULL, N'giuong-ngu-tatami-thiet-ke-tre-trung-ghc-9209-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (200, N'Set giường bệt tab đầu giường kiểu Nhật GHC-9208', 8, 2999000, 0, N'hiện tại chưa có mô tả về sản phẩm', 648, NULL, N'set-giuong-bet-tab-dau-giuong-kieu-nhat-ghc-9208-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
GO
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (201, N'Giường Nhật Tatami bằng gỗ công nghiệp GHC-9207', 8, 2999000, 0, N'hiện tại chưa có mô tả về sản phẩm', 649, NULL, N'giuong-nhat-tatami-bang-go-cong-nghiep-ghc-9207-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (202, N'Giường gia đình gỗ cao cấp thiết kế đa năng GHS-9205', 8, 8200000, 0, N'hiện tại chưa có mô tả về sản phẩm', 650, NULL, N'giuong-gia-dinh-go-cao-cap-thiet-ke-da-nang-ghs-9205-ava-1-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (203, N'Giường đơn bằng gỗ công nghiệp thiết kế đơn giản GHS-9204', 8, 4900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 651, NULL, N'giuong-don-bang-go-cong-nghiep-thiet-ke-don-gian-ghs-9204-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (204, N'Giường ngủ gỗ gia đình thiết kế đơn giản GHS-9203', 8, 5600000, 0, N'hiện tại chưa có mô tả về sản phẩm', 652, NULL, N'giuong-ngu-go-gia-dinh-thiet-ke-don-gian-ghs-9203-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (205, N'Giường ngủ Nhật bằng gỗ thiết kế tiện lợi GHS-9202', 8, 6900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 653, NULL, N'giuong-ngu-nhat-bang-go-thiet-ke-tien-loi-ghs-9202-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (206, N'Giường ngủ gỗ MDF thiết kế kiểu dáng đơn giản GHS-9201', 8, 7900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 654, NULL, N'giuong-ngu-go-mdf-thiet-ke-kieu-dang-don-gian-ghs-9201-ava-1-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (207, N'Giường gỗ gia đình kiểu dáng sang trọng GHS-9200', 8, 7900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 655, NULL, N'giuong-go-gia-dinh-kieu-dang-sang-trong-ghs-9200-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (208, N'Giường ngủ đẹp hiện đại thiết kế đa năng GHS-9199', 8, 7800000, 0, N'hiện tại chưa có mô tả về sản phẩm', 656, NULL, N'giuong-ngu-dep-hien-dai-thiet-ke-da-nang-ghs-9199-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (209, N'Giường ngủ gia đình cao cấp làm bằng gỗ MDF GHS-9198', 8, 8300000, 0, N'hiện tại chưa có mô tả về sản phẩm', 657, NULL, N'giuong-ngu-gia-dinh-cao-cap-lam-bang-go-mdf-ghs-9198-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (210, N'Giường ngủ hiện đại bằng gỗ thiết kế liền giá trưng bày GHS-9196', 8, 7500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 658, NULL, N'giuong-ngu-hien-dai-bang-go-thiet-ke-lien-gia-trung-bay-ghs-9196-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (211, N'Giường ngủ gia đình hiện đại thiết kế trẻ trung GHS-9195', 8, 6500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 659, NULL, N'giuong-ngu-gia-dinh-hien-dai-thiet-ke-tre-trung-ghs-9195-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (212, N'Giường gỗ công nghiệp MDF thiết kế đa năng GHS-9192', 8, 5900000, 0, N'hiện tại chưa có mô tả về sản phẩm', 660, NULL, N'giuong-go-cong-nghiep-mdf-thiet-ke-da-nang-ghs-9192-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (213, N'Giường ngủ bằng gỗ thiết kế sang trọng GHC-9093', 8, 10000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 661, NULL, N'giuong-ngu-bang-go-thiet-ke-sang-trong-ghc-9093-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (214, N'Giường gỗ tự nhiên cao cấp thiết kế đơn giản GHS-9191', 8, 10500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 662, NULL, N'giuong-go-tu-nhien-cao-cap-thiet-ke-don-gian-ghs-9191-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (215, N'Giường ngủ bằng gỗ hiện đại kiểu dáng sang trọng GHS-9190', 8, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 663, NULL, N'giuong-ngu-bang-go-hien-dai-kieu-dang-sang-trong-ghs-9190-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (216, N'Giường gỗ sồi tự nhiên kết cấu chắc chắn GHS-9189', 8, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 664, NULL, N'giuong-go-soi-tu-nhien-ket-cau-chac-chan-ghs-9189-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (217, N'Giường ngủ hiện đại bằng gỗ sồi GHS-9188', 8, 11500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 665, NULL, N'giuong-ngu-hien-dai-bang-go-soi-ghs-9188-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (218, N'Giường ngủ gỗ sồi thiết kế đơn giản GHS-9187', 8, 12000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 666, NULL, N'giuong-ngu-go-soi-thiet-ke-don-gian-ghs-9187-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (219, N'Giường ngủ gia đình bằng gỗ thiết kế sang trọng GHS-9186', 8, 11500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 667, NULL, N'giuong-ngu-gia-dinh-bang-go-thiet-ke-sang-trong-ghs-9186-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (220, N'Giường ngủ hiện đại kiểu dáng sang trọng GHS-9185', 8, 11000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 668, NULL, N'giuong-ngu-hien-dai-kieu-dang-sang-trong-ghs-9185-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (221, N'Giường ngủ gỗ sồi thiết kế sang trọng GHS-9184', 8, 11000000, 0, N'hiện tại chưa có mô tả về sản phẩm', 669, NULL, N'giuong-ngu-go-soi-thiet-ke-sang-trong-ghs-9184-ava-300x300.jpg', 0, CAST(N'2022-02-20' AS Date))
INSERT [dbo].[san_pham] ([id], [ten], [id_loai_sp], [gia_tien], [giam_gia], [mo_ta], [id_kho], [id_ncc], [hinh_anh], [luot_xem], [tg_tao]) VALUES (222, N'Giường ngủ gỗ sồi đa năng tiện dụng GHS-9183', 8, 11500000, 0, N'hiện tại chưa có mô tả về sản phẩm', 670, NULL, N'giuong-ngu-go-soi-da-nang-tien-dung-ghs-9183-ava-300x300.jpg', 2, CAST(N'2022-02-20' AS Date))
SET IDENTITY_INSERT [dbo].[san_pham] OFF
GO
ALTER TABLE [dbo].[chitiet_hd] ADD  CONSTRAINT [DF_chitiet_hd_so_luong]  DEFAULT ((1)) FOR [so_luong]
GO
ALTER TABLE [dbo].[hoa_don] ADD  CONSTRAINT [DF_hoa_don_trang_thai]  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[hoa_don] ADD  CONSTRAINT [DF_hoa_don_tong_tien]  DEFAULT ((0)) FOR [tong_tien]
GO
ALTER TABLE [dbo].[nguoi_dung] ADD  CONSTRAINT [DF_nguoi_dung_gioi_tinh]  DEFAULT ((0)) FOR [gioi_tinh]
GO
ALTER TABLE [dbo].[nguoi_dung] ADD  CONSTRAINT [DF_nguoi_dung_quyen]  DEFAULT ((0)) FOR [quyen]
GO
ALTER TABLE [dbo].[chitiet_hd]  WITH CHECK ADD  CONSTRAINT [FK_chitiet_hd_hoa_don] FOREIGN KEY([id_hd])
REFERENCES [dbo].[hoa_don] ([id])
GO
ALTER TABLE [dbo].[chitiet_hd] CHECK CONSTRAINT [FK_chitiet_hd_hoa_don]
GO
ALTER TABLE [dbo].[chitiet_hd]  WITH CHECK ADD  CONSTRAINT [FK_chitiet_hd_san_pham] FOREIGN KEY([id_sp])
REFERENCES [dbo].[san_pham] ([id])
GO
ALTER TABLE [dbo].[chitiet_hd] CHECK CONSTRAINT [FK_chitiet_hd_san_pham]
GO
ALTER TABLE [dbo].[dat_hang]  WITH CHECK ADD  CONSTRAINT [FK_dat_hang_san_pham] FOREIGN KEY([id_sp])
REFERENCES [dbo].[san_pham] ([id])
GO
ALTER TABLE [dbo].[dat_hang] CHECK CONSTRAINT [FK_dat_hang_san_pham]
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD  CONSTRAINT [FK_hoa_don_nguoi_dung] FOREIGN KEY([id_nd])
REFERENCES [dbo].[nguoi_dung] ([id])
GO
ALTER TABLE [dbo].[hoa_don] CHECK CONSTRAINT [FK_hoa_don_nguoi_dung]
GO
ALTER TABLE [dbo].[san_pham]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_kho1] FOREIGN KEY([id_kho])
REFERENCES [dbo].[kho] ([id])
GO
ALTER TABLE [dbo].[san_pham] CHECK CONSTRAINT [FK_san_pham_kho1]
GO
ALTER TABLE [dbo].[san_pham]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_loai_sp1] FOREIGN KEY([id_loai_sp])
REFERENCES [dbo].[loai_sp] ([id])
GO
ALTER TABLE [dbo].[san_pham] CHECK CONSTRAINT [FK_san_pham_loai_sp1]
GO
ALTER TABLE [dbo].[san_pham]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_nha_cung_cap] FOREIGN KEY([id_ncc])
REFERENCES [dbo].[nha_cung_cap] ([id])
GO
ALTER TABLE [dbo].[san_pham] CHECK CONSTRAINT [FK_san_pham_nha_cung_cap]
GO
USE [master]
GO
ALTER DATABASE [hung_ha_store] SET  READ_WRITE 
GO
