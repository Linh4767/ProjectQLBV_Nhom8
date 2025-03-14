USE [master]
GO
/****** Object:  Database [QLBV]    Script Date: 11/22/2024 10:09:15 PM ******/
CREATE DATABASE [QLBV]
 CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'QLBV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLBV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'QLBV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLBV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLBV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBV] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBV] SET  MULTI_USER 
GO
ALTER DATABASE [QLBV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBV] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBV', N'ON'
GO
ALTER DATABASE [QLBV] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLBV] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLBV]
GO
/****** Object:  Table [dbo].[BenhNhan]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BenhNhan](
	[MSBN] [nvarchar](16) NOT NULL,
	[TenBN] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](3) NOT NULL,
	[NgSinh] [date] NULL,
	[DiaChi] [nvarchar](1000) NULL,
	[NgheNghiep] [nvarchar](80) NULL,
	[SDT] [nvarchar](15) NULL,
	[DanToc] [nvarchar](50) NULL,
	[TTLienHe] [nvarchar](15) NULL,
 CONSTRAINT [PK_BenhNhan] PRIMARY KEY CLUSTERED 
(
	[MSBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BHYT]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BHYT](
	[MaSoBHYT] [nvarchar](15) NOT NULL,
	[NgayCap] [date] NULL,
	[NgayHetHan] [date] NULL,
	[MSBN] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK_BHYT] PRIMARY KEY CLUSTERED 
(
	[MSBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaTruc]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaTruc](
	[MaCT] [varchar](12) NOT NULL,
	[MaPhong] [nvarchar](12) NOT NULL,
	[MaNV] [nvarchar](12) NOT NULL,
	[Ca] [nvarchar](12) NOT NULL,
	[NgayTruc] [datetime] NOT NULL,
 CONSTRAINT [PK_CaTruc] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonThuoc]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonThuoc](
	[MaDonThuoc] [nvarchar](100) NOT NULL,
	[MaThuoc] [nvarchar](40) NOT NULL,
	[MaLo] [nvarchar](200) NOT NULL,
	[SoLuong] [int] NULL,
	[CachDung] [nvarchar](500) NULL,
 CONSTRAINT [PK_ChiTietDonThuoc] PRIMARY KEY CLUSTERED 
(
	[MaDonThuoc] ASC,
	[MaThuoc] ASC,
	[MaLo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuanDoan]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuanDoan](
	[MaPhieuKB] [nvarchar](30) NOT NULL,
	[MaNV] [nvarchar](12) NOT NULL,
	[ChuanDoan] [nvarchar](1000) NULL,
	[NgayChuanDoan] [datetime] NULL,
 CONSTRAINT [PK_ChuanDoan] PRIMARY KEY CLUSTERED 
(
	[MaPhieuKB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaCV] [nvarchar](12) NOT NULL,
	[TenCV] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuyenNganh]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenNganh](
	[MaChuyenNganh] [nvarchar](12) NOT NULL,
	[TenChuyenNganh] [nvarchar](120) NULL,
	[MaKhoa] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_ChuyenNganh] PRIMARY KEY CLUSTERED 
(
	[MaChuyenNganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[MaDV] [nvarchar](12) NOT NULL,
	[TenDV] [nvarchar](100) NOT NULL,
	[Gia] [float] NULL,
	[MaKhoa] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonThuoc]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonThuoc](
	[MaDonThuoc] [nvarchar](100) NOT NULL,
	[NgayGioKeDon] [datetime] NULL,
	[MaNV] [nvarchar](12) NOT NULL,
	[MaPhieuKB] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_DonThuoc] PRIMARY KEY CLUSTERED 
(
	[MaDonThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiuongBenh]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiuongBenh](
	[MaGiuong] [nvarchar](100) NOT NULL,
	[SoGiuong] [int] NOT NULL,
	[TrangThai] [nvarchar](30) NOT NULL,
	[MSPhong] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_GiuongBenh] PRIMARY KEY CLUSTERED 
(
	[MaGiuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhamBenh]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhamBenh](
	[MaPhong] [nvarchar](12) NOT NULL,
	[MaKham] [nvarchar](100) NOT NULL,
	[MaNV] [nvarchar](12) NOT NULL,
	[MaPhieuKB] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_KhamBenh] PRIMARY KEY CLUSTERED 
(
	[MaKham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [nvarchar](12) NOT NULL,
	[TenKhoa] [nvarchar](90) NOT NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhoThuoc]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoThuoc](
	[MaThuoc] [nvarchar](40) NOT NULL,
	[MaLo] [nvarchar](200) NOT NULL,
	[SoLuongTrongKho] [int] NULL,
 CONSTRAINT [PK_KhoThuoc] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC,
	[MaLo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](12) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[NgSinh] [date] NULL,
	[MaCV] [nvarchar](12) NOT NULL,
	[MaChuyenNganh] [nvarchar](12) NOT NULL,
	[SDT] [nvarchar](10) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanGiuong]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanGiuong](
	[MaGiuong] [nvarchar](100) NOT NULL,
	[MaPhieuKB] [nvarchar](30) NOT NULL,
	[NgayTra] [datetime] NULL,
	[NgayNhan] [datetime] NOT NULL,
	[MaPhong] [nvarchar](12) NOT NULL,
	[MaNVYeuCau] [nvarchar](12) NOT NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_PhanGiuong] PRIMARY KEY CLUSTERED 
(
	[MaGiuong] ASC,
	[MaPhieuKB] ASC,
	[NgayNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuKhamBenh]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuKhamBenh](
	[MaPhieuKB] [nvarchar](30) NOT NULL,
	[SoPhieu] [int] NOT NULL,
	[MaBN] [nvarchar](16) NOT NULL,
	[TrieuChung] [nvarchar](100) NULL,
	[ThongTinLamSang] [nvarchar](100) NULL,
	[NgayKham] [datetime] NULL,
 CONSTRAINT [PK_PhieuKhamBenh] PRIMARY KEY CLUSTERED 
(
	[MaPhieuKB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[MSPhong] [nvarchar](12) NOT NULL,
	[TenPhong] [nvarchar](90) NULL,
	[MaKhoa] [nvarchar](12) NOT NULL,
	[SoGiuong] [int] NULL,
	[Loai] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[MSPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoBenhAn]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoBenhAn](
	[MaSoBenhAn] [nvarchar](12) NOT NULL,
	[BenhNen] [nvarchar](100) NULL,
	[MaBN] [nvarchar](16) NOT NULL,
	[NgayLap] [datetime] NULL,
 CONSTRAINT [PK_SoBenhAn] PRIMARY KEY CLUSTERED 
(
	[MaSoBenhAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuDungDichVu]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuDungDichVu](
	[MaNV] [nvarchar](12) NOT NULL,
	[MaSuDungDV] [nvarchar](100) NOT NULL,
	[MaPhieuKB] [nvarchar](30) NOT NULL,
	[MaDV] [nvarchar](12) NOT NULL,
	[NgayThucHien] [datetime] NULL,
	[NgayYeuCau] [datetime] NOT NULL,
	[MSPhong] [nvarchar](12) NULL,
	[MaNVThucHien] [nvarchar](12) NULL,
	[KetQua] [nvarchar](500) NULL,
 CONSTRAINT [PK_SuDungDichVu] PRIMARY KEY CLUSTERED 
(
	[MaSuDungDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKham]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKham](
	[MSCuocHen] [nvarchar](100) NOT NULL,
	[MaSoBenhAn] [nvarchar](12) NOT NULL,
	[MSPhong] [nvarchar](12) NULL,
	[MaNVPhuTrach] [nvarchar](12) NULL,
	[NgayTaiKham] [datetime] NULL,
	[TrangThai] [nvarchar](30) NOT NULL,
	[KetQua] [nvarchar](max) NULL,
 CONSTRAINT [PK_TaiKham] PRIMARY KEY CLUSTERED 
(
	[MSCuocHen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenTaiKhoan] [nvarchar](24) NOT NULL,
	[MatKhau] [nvarchar](12) NOT NULL,
	[MaNV] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheoDoiDieuTri]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheoDoiDieuTri](
	[MaPhieuKB] [nvarchar](30) NOT NULL,
	[NgayTheoDoi] [datetime] NOT NULL,
	[ChiSoCanNang] [nvarchar](30) NULL,
	[ChiSoHuyetAp] [nvarchar](30) NULL,
	[ChiSoNhipTho] [nvarchar](30) NULL,
	[NhietDo] [nvarchar](30) NULL,
	[MachDap] [nvarchar](30) NULL,
	[DuongHuyet] [nvarchar](30) NULL,
	[YLenh] [nvarchar](500) NULL,
	[MaNV] [nvarchar](12) NOT NULL,
	[MaGiuong] [nvarchar](100) NOT NULL,
	[MaTheoDoi] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TheoDoiDieuTri] PRIMARY KEY CLUSTERED 
(
	[MaTheoDoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thuoc]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thuoc](
	[MaThuoc] [nvarchar](40) NOT NULL,
	[TenThuoc] [nvarchar](30) NOT NULL,
	[XuatXu] [nvarchar](30) NULL,
	[NhaCungCap] [nvarchar](100) NULL,
	[TrangThai] [nvarchar](30) NULL,
	[LoaiThuoc] [nvarchar](30) NOT NULL,
	[DonViTinh] [nvarchar](10) NOT NULL,
	[QuyCachDongGoi] [nvarchar](10) NOT NULL,
	[SoLuongDVT] [int] NULL,
	[SoLuongQCDG] [int] NULL,
	[HamLuong] [nvarchar](50) NOT NULL,
	[Gia] [float] NULL,
	[NgaySanXuat] [date] NULL,
	[HSD] [date] NULL,
	[MaLo] [nvarchar](200) NOT NULL,
	[SoLuongNhap] [int] NULL,
	[SoLuongHop] [int] NULL,
 CONSTRAINT [PK_Thuoc] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC,
	[MaLo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuocTheoKhoa]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuocTheoKhoa](
	[MaThuoc] [nvarchar](40) NOT NULL,
	[SoLuongThuocCuaKhoa] [int] NULL,
	[MaKhoa] [nvarchar](12) NOT NULL,
	[Gia] [float] NULL,
	[MaLo] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ThuocTheoKhoa] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC,
	[MaKhoa] ASC,
	[MaLo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN001', N'Nguyễn Ngọc Trâm Anh', N'Nữ', CAST(N'2004-03-05' AS Date), N'Phường Phúc Xá, Quận Ba Đình, Hà Nội', N'Học sinh', N'0987654321', N'Kinh', N'0938428491')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN002', N'Phạm Việt Anh', N'Nam', CAST(N'2000-07-01' AS Date), N'Phường Phú Thượng, Quận Tây Hồ, Hà Nội', N'Công Nhân', N'0987690876', N'Kinh', N'0987639834')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN003', N'Nguyễn Ngọc Trâm Thư', N'Nữ', CAST(N'2006-08-23' AS Date), N'Xã Thân Cửu Nghĩa, Huyện Châu Thành, Tiền Giang', N'Học sinh', N'0926487210', N'Kinh', N'0337725477')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN004', N'Đỗ Tuấn Phong', N'Nam', CAST(N'1992-07-07' AS Date), N'Phường Đông Thanh, Thành phố Đông Hà, Quảng Trị', N'Viên Chức', N'0966658611', N'Kinh', N'0985345884')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN005', N'Nguyễn Thị Tuyết Nhi', N'Nữ', CAST(N'1990-10-03' AS Date), N'Xã Liên Thủy, Huyện Lệ Thủy, Quảng Bình', N'Nhân Viên Văn Phòng', N'0989934211', N'Kinh', N'0337681919')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN006', N'Đỗ Minh Quân', N'Nam', CAST(N'2001-06-09' AS Date), N'Xã Gia Khánh, Huyện Gia Lộc, Hải Dương', N'Sinh Viên', N'0387554311', N'Kinh', N'0993436165')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN007', N'Dương Thị Thuận', N'Nữ', CAST(N'2009-01-02' AS Date), N'Phường Tân Định, Quận 1, Thành phố Hồ Chí Minh', N'Học sinh', N'0877654110', N'Kinh', N'0336782467')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN008', N'Nguyễn Bình Khiêm', N'Nam', CAST(N'2010-01-08' AS Date), N'Phường Bến Thành, Quận 1, Thành phố Hồ Chí Minh', N'Học sinh', N'0381004321', N'Kinh', N'0985970772')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN009', N'Nguyễn Phạm Khánh Huyền', N'Nữ', CAST(N'1999-05-18' AS Date), N'Phường Việt Hưng, Quận Long Biên, Hà Nội', N'Giáo Viên', N'0839739669', N'Kinh', N'0985970652')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN010', N'Trần Đình Hoàng', N'Nam', CAST(N'1999-11-18' AS Date), N'Xã Luân Giới, Huyện Điện Biên Đông, Điện Biên', N'Công Nhân', N'0377923732', N'Kinh', N'0982877723')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN011', N'Nguyễn Thanh Vân', N'Nữ', CAST(N'1989-01-18' AS Date), N'Phường Quyết Thắng, Thành phố Lai Châu, Lai Châu', N'Thương Nhân', N'0947500903', N'Kinh', N'0985970772')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN012', N'Phạm Hải Nam', N'Nam', CAST(N'2012-04-07' AS Date), N'Phường Quyết Thắng, Thành phố Sơn La, Sơn La', N'Học sinh', N'0364837378', N'Kinh', N'0338825642')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN013', N'Trần Hà Phương Nghi', N'Nữ', CAST(N'1997-12-11' AS Date), N'Phường Yên Ninh, Thành phố Yên Bái, Yên Bái', N'Nội Trợ', N'0364949513', N'Kinh', N'0932447854')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN014', N'Vương Đình Hào', N'Nam', CAST(N'2011-02-16' AS Date), N'Xã Quang Tiến, Thành phố Hòa Bình, Hoà Bình', N'Học sinh', N'0329407707', N'Kinh', N'0372856890')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN015', N'Nguyễn Phương Anh', N'Nữ', CAST(N'2012-08-30' AS Date), N'Phường Thịnh Đán, Thành phố Thái Nguyên, Thái Nguyên', N'Học sinh', N'0389787665', N'Kinh', N'0365446879')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN016', N'Phạm Ngọc Quỳnh Chi', N'Nữ', CAST(N'2012-10-20' AS Date), N'Phường 02, Quận Bình Thạnh, Thành phố Hồ Chí Minh', N'Học sinh', N'0942529659', N'Kinh', N'0985764446')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN017', N'Hoàng Lan Phương', N'Nữ', CAST(N'2016-09-09' AS Date), N'Phường 12, Quận Tân Bình, Thành phố Hồ Chí Minh', N'Học sinh', N'0378722739', N'Kinh', N'0978867554')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN018', N'Đào Hà My', N'Nữ', CAST(N'1985-02-15' AS Date), N'Phường 04, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Kế Toán', N'0348832806', N'Kinh', N'0998678665')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN019', N'Nguyễn Thục Hân', N'Nữ', CAST(N'2003-12-10' AS Date), N'Phường Linh Xuân, Thành phố Thủ Đức, Thành phố Hồ Chí Minh', N'Sinh Viên', N'0332313369', N'Kinh', N'0326887543')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN020', N'Nguyễn Minh Nghĩa', N'Nam', CAST(N'2001-06-15' AS Date), N'Phường Linh Xuân, Thành phố Thủ Đức, Thành phố Hồ Chí Minh', N'Sinh Viên', N'0332319872', N'Kinh', N'0387678654')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN021', N'Nguyễn Tiến Huy Hoàng', N'Nam', CAST(N'2003-03-12' AS Date), N'Phường Đồng Nhân, Quận Hai Bà Trưng, Hà Nội', N'Sinh Viên', N'0382916032', N'Kinh', N'0989876778')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN022', N'Trần Diệu Linh', N'Nữ', CAST(N'2000-12-10' AS Date), N'Phường Phố Huế, Quận Hai Bà Trưng, Hà Nội', N'Nhân Viên Văn Phòng', N'0334980790', N'Kinh', N'0336775675')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN023', N'Lê Tuấn Kiệt', N'Nam', CAST(N'2001-04-13' AS Date), N'Thị trấn Long Điền, Huyện Long Điền, Bà Rịa / Vũng Tàu', N'Marketing', N'0385217220', N'Kinh', N'0336775334')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN024', N'Lê Cao Thắng', N'Nam', CAST(N'1993-12-11' AS Date), N'Phường Tân Chánh Hiệp, Quận 12, Thành phố Hồ Chí Minh', N'Quản Trị Nhân Lực', N'0397718400', N'Kinh', N'0336775837')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN025', N'Ngô Khánh Diệp', N'Nữ', CAST(N'2002-01-10' AS Date), N'Xã Tân Hải, Huyện Phú Tân, Cà Mau', N'Kinh Doanh', N'0937394493', N'Kinh', N'0336724675')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN026', N'Vũ Duy Hưng', N'Nam', CAST(N'1997-10-06' AS Date), N'Xã Phong Lộc, Huyện Hậu Lộc, Thanh Hóa', N'Môi Giới', N'0914257399', N'Kinh', N'0336772935')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN027', N'Phạm Phương Hà', N'Nữ', CAST(N'2000-02-02' AS Date), N'Xã Lý Thường Kiệt, Huyện Yên Mỹ, Hưng Yên', N'Sinh viên', N'0975129492', N'Kinh', N'0343475675')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN028', N'Phạm Phương Hà', N'Nữ', CAST(N'2001-02-02' AS Date), N'Phường Đông Hòa, Bình Dương', N'Sinh viên', N'0976294921', N'Kinh', N'0343476675')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN029', N'Phạm Thị Hằng Nga', N'Nữ', CAST(N'2000-01-10' AS Date), N'Xã Hưng Long, Huyện Ninh Giang, Hải Dương', N'Thợ Làm Tóc', N'0377350534', N'Kinh', N'0336123675')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN030', N'Trần Xuân Toản', N'Nam', CAST(N'1998-12-01' AS Date), N'Xã Vạn Ninh, Huyện Gia Bình, Bắc Ninh', N'Nhân Viên Ngân Hàng', N'0379379300', N'Kinh', N'0336773455')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN031', N'Bùi Hải Lâm', N'Nam', CAST(N'2000-04-21' AS Date), N'Xã Bàu Lâm, Huyện Xuyên Mộc, Bà Rịa / Vũng Tàu', N'Nhân viên ngân hàng', N'0967500903', N'Kinh', N'0336652675')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN032', N'Nguyễn Phúc Lộc', N'Nam', CAST(N'1980-07-28' AS Date), N'Phường 17, Quận Gò Vấp, Thành phố Hồ Chí Minh', N'Nghệ Sĩ', N'0338087827', N'Kinh', N'0336778825')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN033', N'Nguyễn Thị Khánh Linh', N'Nữ', CAST(N'1985-09-25' AS Date), N'Xã Vân Xuân, Huyện Vĩnh Tường, Vĩnh Phúc', N'Thu Ngân', N'0389448792', N'Kinh', N'0336823675')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN034', N'Nguyễn Hải Đăng Khoa', N'Nam', CAST(N'1992-10-20' AS Date), N'Xã Mỹ Thuận, Huyện Tân Sơn, Phú Thọ', N'Xây Dựng', N'0987159117', N'Kinh', N'0336775675')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN035', N'Nguyễn Minh Nghĩa', N'Nam', CAST(N'1979-06-09' AS Date), N'Xã Hoàng Lương, Huyện Hiệp Hòa, Bắc Giang', N'Nông Dân', N'0394728598', N'Kinh', N'0982778237')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN036', N'Nguyễn Thủy Tiên', N'Nữ', CAST(N'1999-11-09' AS Date), N'Xã Hiệp Hòa, Thị xã Quảng Yên, Quảng Ninh', N'Kiểm Toán', N'0333915393', N'Kinh', N'0336482375')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN037', N'Tạ Thị Như Ý', N'Nữ', CAST(N'2009-08-02' AS Date), N'Xã Khánh Xuân, Huyện Lộc Bình, Lạng Sơn', N'Học sinh', N'0363210215', N'Kinh', N'0335765675')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN038', N'Nguyễn Thị Hồng Ngọc', N'Nữ', CAST(N'1984-12-30' AS Date), N'Xã Bảo Lý, Huyện Phú Bình, Thái Nguyên', N'Lập Trình Viên', N'0964575125', N'Kinh', N'0336890675')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN039', N'Phạm Lê Tấn Phát', N'Nam', CAST(N'1987-04-26' AS Date), N'Xã Bảo Hiệu, Huyện Yên Thủy, Hoà Bình', N'Kỹ Sư Phần Mềm', N'0984445689', N'Kinh', N'0336776575')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN040', N'Phan Như Nguyện', N'Nữ', CAST(N'1977-09-09' AS Date), N'Thị trấn Vinh Quang, Huyện Hoàng Su Phì, Hà Giang', N'Phụ Bếp', N'0932121619', N'Kinh', N'0336890275')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN041', N'Phạm Đoàn Hạnh San', N'Nữ', CAST(N'2002-01-06' AS Date), N'Xã Chân Sơn, Huyện Yên Sơn, Tuyên Quang', N'Công Nhân', N'0982536087', N'Kinh', N'0336775765')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN042', N'Phạm Minh Nhân', N'Nam', CAST(N'1981-10-10' AS Date), N'Phường Bình Minh, Thành phố Lào Cai, Lào Cai', N'Thư Ký', N'0989702608', N'Kinh', N'0336777765')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN043', N'Đỗ Quốc Thịnh', N'Nam', CAST(N'1990-08-02' AS Date), N'Phường Hàng Bồ, Quận Hoàn Kiếm, Hà Nội', N'Giám Đốc', N'0938462665', N'Kinh', N'0336545475')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN044', N'Lê Tấn Phát', N'Nam', CAST(N'2006-07-02' AS Date), N'Xã Ô Lâm, Huyện Tri Tôn, An Giang', N'Học sinh', N'0374799679', N'Kinh', N'0336775002')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN045', N'Nguyễn Ngọc Khánh Thy', N'Nữ', CAST(N'2010-12-15' AS Date), N'Xã Hòa Điền, Huyện Kiên Lương, Kiên Giang', N'Học sinh', N'0369068104', N'Kinh', N'0336732475')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN046', N'Thạch Ngọc Thiên', N'Nam', CAST(N'2004-06-12' AS Date), N'Phường An Khánh, Quận Ninh Kiều, Cần Thơ', N'Bán Hàng', N'0354730520', N'Kinh', N'0339087675')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN047', N'Nguyễn Ngọc Như Thảo', N'Nữ', CAST(N'2003-11-14' AS Date), N'Xã Hoả Tiến, Thành phố Vị Thanh, Hậu Giang', N'Nhân Viên', N'0386097194', N'Kinh', N'0331234675')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN048', N'Trần Minh Thư', N'Nữ', CAST(N'1995-09-02' AS Date), N'Xã Kế Thành, Huyện Kế Sách, Sóc Trăng', N'Thợ May', N'0378203155', N'Kinh', N'0336774345')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN049', N'Trần Minh Anh', N'Nữ', CAST(N'1998-03-26' AS Date), N'Xã Vĩnh Lộc, Huyện Hồng Dân, Bạc Liêu', N'Nhà Văn', N'0339508877', N'Kinh', N'0336012675')
INSERT [dbo].[BenhNhan] ([MSBN], [TenBN], [GioiTinh], [NgSinh], [DiaChi], [NgheNghiep], [SDT], [DanToc], [TTLienHe]) VALUES (N'BN050', N'Nguyễn Võ Kim Tuyền', N'Nữ', CAST(N'2000-10-12' AS Date), N'Xã Khánh Lâm, Huyện U Minh, Cà Mau', N'Sinh Viên', N'0964617739', N'Kinh', N'0336232375')
GO
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'HS4562345267456', CAST(N'2024-04-11' AS Date), CAST(N'2029-04-11' AS Date), N'BN001')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN4322345262341', CAST(N'2022-05-05' AS Date), CAST(N'2027-05-05' AS Date), N'BN002')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'HS5432345341212', CAST(N'2021-02-01' AS Date), CAST(N'2026-02-01' AS Date), N'BN003')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'HC4562345223413', CAST(N'2022-05-16' AS Date), CAST(N'2027-05-16' AS Date), N'BN004')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN4122345223414', CAST(N'2023-02-27' AS Date), CAST(N'2028-02-27' AS Date), N'BN005')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'SV4322345233415', CAST(N'2024-04-11' AS Date), CAST(N'2029-04-11' AS Date), N'BN006')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'HS3792345223416', CAST(N'2022-11-28' AS Date), CAST(N'2027-11-28' AS Date), N'BN007')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'HS5322345223417', CAST(N'2022-05-09' AS Date), CAST(N'2027-05-09' AS Date), N'BN008')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'GD4792345223418', CAST(N'2024-04-11' AS Date), CAST(N'2029-04-11' AS Date), N'BN009')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'TE1792345223419', CAST(N'2024-01-18' AS Date), CAST(N'2029-01-18' AS Date), N'BN010')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'HS4562345223420', CAST(N'2024-11-12' AS Date), CAST(N'2029-11-12' AS Date), N'BN012')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'HS4212345223422', CAST(N'2024-04-11' AS Date), CAST(N'2029-04-11' AS Date), N'BN014')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'HS4782345223423', CAST(N'2020-04-11' AS Date), CAST(N'2025-04-11' AS Date), N'BN015')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'HS4262345223424', CAST(N'2021-09-11' AS Date), CAST(N'2026-09-11' AS Date), N'BN016')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'HS1792345223425', CAST(N'2020-03-07' AS Date), CAST(N'2025-03-07' AS Date), N'BN017')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN4322345223426', CAST(N'2024-02-02' AS Date), CAST(N'2029-02-02' AS Date), N'BN018')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'SV4322345223427', CAST(N'2024-02-04' AS Date), CAST(N'2029-02-04' AS Date), N'BN019')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'SV4212345223428', CAST(N'2021-06-11' AS Date), CAST(N'2026-06-11' AS Date), N'BN020')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'SV4562345223429', CAST(N'2024-07-20' AS Date), CAST(N'2029-07-20' AS Date), N'BN021')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN3212345223430', CAST(N'2020-01-01' AS Date), CAST(N'2025-01-01' AS Date), N'BN022')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN1672345223431', CAST(N'2021-03-24' AS Date), CAST(N'2026-03-24' AS Date), N'BN023')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN4612345223432', CAST(N'2023-09-12' AS Date), CAST(N'2028-09-12' AS Date), N'BN024')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN4612345223433', CAST(N'2021-12-11' AS Date), CAST(N'2026-12-11' AS Date), N'BN025')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'SV4222345223434', CAST(N'2024-04-11' AS Date), CAST(N'2029-04-11' AS Date), N'BN027')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN4212345223435', CAST(N'2022-06-12' AS Date), CAST(N'2027-06-12' AS Date), N'BN030')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN4232345223436', CAST(N'2022-08-11' AS Date), CAST(N'2027-08-11' AS Date), N'BN033')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'CN4452345223437', CAST(N'2023-02-09' AS Date), CAST(N'2028-02-09' AS Date), N'BN034')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN3612345223438', CAST(N'2023-05-20' AS Date), CAST(N'2028-05-20' AS Date), N'BN036')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'HS4592345223439', CAST(N'2024-04-11' AS Date), CAST(N'2029-04-11' AS Date), N'BN037')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN5582345223440', CAST(N'2024-04-11' AS Date), CAST(N'2029-04-11' AS Date), N'BN038')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN4432345223441', CAST(N'2021-07-01' AS Date), CAST(N'2026-07-01' AS Date), N'BN039')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN4892345223442', CAST(N'2023-08-23' AS Date), CAST(N'2028-08-23' AS Date), N'BN042')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN2342345223443', CAST(N'2024-11-11' AS Date), CAST(N'2029-11-11' AS Date), N'BN043')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'HS1342345223444', CAST(N'2024-04-11' AS Date), CAST(N'2029-04-11' AS Date), N'BN044')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'HS4672345223445', CAST(N'2024-04-11' AS Date), CAST(N'2029-04-11' AS Date), N'BN045')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'DN3452345223446', CAST(N'2022-12-01' AS Date), CAST(N'2027-12-01' AS Date), N'BN047')
INSERT [dbo].[BHYT] ([MaSoBHYT], [NgayCap], [NgayHetHan], [MSBN]) VALUES (N'SV4322345223447', CAST(N'2024-04-11' AS Date), CAST(N'2029-04-11' AS Date), N'BN050')
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT001', N'P01', N'NV001', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT002', N'P01', N'NV018', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT003', N'P01', N'NV035', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT004', N'P02', N'NV036', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT005', N'P02', N'NV037', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT006', N'P02', N'NV038', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT007', N'P03', N'NV039', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT008', N'P03', N'NV040', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT009', N'P03', N'NV041', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT010', N'P04', N'NV042', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT011', N'P04', N'NV043', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT012', N'P04', N'NV044', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT013', N'P167', N'NV045', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT014', N'P167', N'NV379', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT015', N'P167', N'NV380', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT016', N'P168', N'NV046', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT017', N'P168', N'NV380', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT018', N'P168', N'NV379', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT019', N'P169', N'NV047', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT020', N'P169', N'NV381', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT021', N'P169', N'NV382', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT022', N'P170', N'NV048', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT023', N'P170', N'NV382', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT024', N'P170', N'NV381', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT025', N'P171', N'NV049', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT026', N'P171', N'NV383', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT027', N'P171', N'NV385', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT028', N'P172', N'NV050', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT029', N'P172', N'NV385', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT030', N'P172', N'NV383', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT031', N'P77', N'NV051', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT032', N'P77', N'NV386', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT033', N'P77', N'NV387', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT034', N'P78', N'NV052', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT035', N'P78', N'NV387', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT036', N'P78', N'NV386', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT037', N'P01', N'NV001', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT038', N'P01', N'NV018', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT039', N'P01', N'NV035', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT040', N'P02', N'NV036', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT041', N'P02', N'NV037', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT042', N'P02', N'NV038', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT043', N'P03', N'NV039', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT044', N'P03', N'NV040', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT045', N'P03', N'NV041', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT046', N'P04', N'NV042', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT047', N'P04', N'NV043', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT048', N'P04', N'NV044', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT052', N'P168', N'NV046', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT053', N'P168', N'NV380', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT054', N'P168', N'NV379', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT055', N'P169', N'NV047', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT056', N'P169', N'NV381', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT057', N'P169', N'NV382', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT058', N'P170', N'NV048', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT059', N'P170', N'NV382', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT060', N'P170', N'NV381', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT061', N'P171', N'NV049', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT062', N'P171', N'NV383', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT063', N'P171', N'NV385', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT064', N'P172', N'NV050', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT065', N'P172', N'NV385', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT066', N'P172', N'NV383', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT067', N'P77', N'NV051', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT068', N'P77', N'NV386', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT069', N'P77', N'NV387', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT070', N'P78', N'NV052', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT071', N'P78', N'NV387', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT072', N'P78', N'NV386', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT073', N'P05', N'NV002', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT074', N'P05', N'NV019', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT075', N'P05', N'NV395', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT076', N'P05', N'NV053', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT077', N'P05', N'NV054', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT078', N'P05', N'NV396', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT079', N'P05', N'NV055', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT080', N'P05', N'NV056', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT081', N'P05', N'NV392', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT082', N'P06', N'NV057', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT083', N'P06', N'NV058', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT084', N'P06', N'NV395', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT085', N'P06', N'NV059', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT086', N'P06', N'NV060', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT087', N'P06', N'NV391', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT088', N'P06', N'NV061', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT089', N'P06', N'NV062', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT090', N'P06', N'NV392', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT091', N'P09', N'NV063', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT092', N'P09', N'NV064', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT093', N'P09', N'NV388', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT094', N'P09', N'NV065', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT095', N'P09', N'NV066', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT096', N'P09', N'NV394', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT097', N'P09', N'NV067', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT098', N'P09', N'NV068', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT099', N'P09', N'NV393', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT100', N'P10', N'NV070', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1000', N'P113', N'NV478', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1001', N'P114', N'NV289', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1002', N'P114', N'NV473', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1003', N'P114', N'NV290', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1004', N'P114', N'NV477', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1005', N'P114', N'NV291', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1006', N'P114', N'NV479', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1007', N'P61', N'NV292', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1008', N'P61', N'NV476', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1009', N'P61', N'NV293', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT101', N'P10', N'NV388', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1010', N'P61', N'NV480', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1011', N'P61', N'NV294', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1012', N'P61', N'NV478', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1013', N'P204', N'NV295', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1014', N'P204', N'NV473', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1015', N'P204', N'NV296', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1016', N'P204', N'NV474', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1017', N'P204', N'NV297', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1018', N'P204', N'NV475', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1019', N'P206', N'NV298', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT102', N'P10', N'NV071', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1020', N'P206', N'NV476', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1021', N'P206', N'NV299', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1022', N'P206', N'NV474', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1023', N'P206', N'NV300', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1024', N'P206', N'NV478', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1025', N'P207', N'NV301', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1026', N'P207', N'NV481', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1027', N'P207', N'NV302', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1028', N'P207', N'NV477', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1029', N'P207', N'NV300', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT103', N'P10', N'NV394', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1030', N'P207', N'NV475', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1031', N'P209', N'NV298', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1032', N'P209', N'NV481', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1033', N'P209', N'NV299', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1034', N'P209', N'NV480', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1035', N'P209', N'NV297', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1036', N'P209', N'NV475', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1037', N'P62', N'NV013', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1038', N'P62', N'NV030', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1039', N'P62', N'NV473', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT104', N'P10', N'NV072', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1040', N'P62', N'NV279', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1041', N'P62', N'NV280', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1042', N'P62', N'NV474', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1043', N'P62', N'NV282', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1044', N'P62', N'NV281', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1045', N'P62', N'NV475', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1046', N'P113', N'NV283', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1047', N'P113', N'NV284', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1048', N'P113', N'NV476', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1049', N'P113', N'NV285', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT105', N'P10', N'NV393', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1050', N'P113', N'NV286', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1051', N'P113', N'NV477', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1052', N'P113', N'NV287', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1053', N'P113', N'NV288', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1054', N'P113', N'NV478', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1055', N'P114', N'NV289', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1056', N'P114', N'NV473', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1057', N'P114', N'NV290', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1058', N'P114', N'NV477', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1059', N'P114', N'NV291', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT106', N'P250', N'NV073', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1060', N'P114', N'NV479', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1061', N'P61', N'NV292', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1062', N'P61', N'NV476', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1063', N'P61', N'NV293', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1064', N'P61', N'NV480', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1065', N'P61', N'NV294', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1066', N'P61', N'NV478', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1067', N'P204', N'NV295', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1068', N'P204', N'NV473', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1069', N'P204', N'NV296', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT107', N'P250', N'NV384', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1070', N'P204', N'NV474', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1071', N'P204', N'NV297', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1072', N'P204', N'NV475', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1073', N'P206', N'NV298', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1074', N'P206', N'NV476', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1075', N'P206', N'NV299', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1076', N'P206', N'NV474', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1077', N'P206', N'NV300', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1078', N'P206', N'NV478', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1079', N'P207', N'NV301', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT108', N'P250', N'NV074', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1080', N'P207', N'NV481', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1081', N'P207', N'NV302', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1082', N'P207', N'NV477', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1083', N'P207', N'NV300', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1084', N'P207', N'NV475', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1085', N'P209', N'NV298', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1086', N'P209', N'NV481', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1087', N'P209', N'NV299', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1088', N'P209', N'NV480', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1089', N'P209', N'NV297', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT109', N'P250', N'NV391', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1090', N'P209', N'NV475', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1091', N'P115', N'NV014', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1092', N'P115', N'NV482', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1093', N'P115', N'NV031', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1094', N'P115', N'NV483', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1095', N'P115', N'NV303', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1096', N'P115', N'NV484', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1097', N'P116', N'NV304', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1098', N'P116', N'NV485', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1099', N'P116', N'NV305', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT110', N'P250', N'NV075', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1100', N'P116', N'NV486', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1101', N'P116', N'NV306', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1102', N'P116', N'NV487', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1103', N'P65', N'NV307', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1104', N'P65', N'NV482', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1105', N'P65', N'NV308', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1106', N'P65', N'NV483', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1107', N'P65', N'NV309', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1108', N'P65', N'NV484', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1109', N'P66', N'NV310', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT111', N'P250', N'NV393', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1110', N'P66', N'NV485', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1111', N'P66', N'NV311', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1112', N'P66', N'NV486', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1113', N'P66', N'NV312', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1114', N'P66', N'NV487', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1115', N'P68', N'NV313', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1116', N'P68', N'NV485', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1117', N'P68', N'NV314', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1118', N'P68', N'NV483', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1119', N'P68', N'NV315', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT112', N'P252', N'NV076', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1120', N'P68', N'NV484', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1121', N'P211', N'NV316', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1122', N'P211', N'NV482', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1123', N'P211', N'NV314', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1124', N'P211', N'NV483', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1125', N'P211', N'NV303', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1126', N'P211', N'NV487', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1127', N'P213', N'NV313', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1128', N'P213', N'NV482', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1129', N'P213', N'NV314', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT113', N'P252', N'NV389', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1130', N'P213', N'NV486', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1131', N'P213', N'NV303', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1132', N'P213', N'NV484', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1133', N'P214', N'NV316', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1134', N'P214', N'NV482', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1135', N'P214', N'NV031', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1136', N'P214', N'NV486', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1137', N'P214', N'NV315', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1138', N'P214', N'NV484', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1139', N'P215', N'NV316', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT114', N'P252', N'NV074', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1140', N'P215', N'NV485', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1141', N'P215', N'NV031', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1142', N'P215', N'NV486', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1143', N'P215', N'NV315', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1144', N'P215', N'NV487', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1145', N'P115', N'NV014', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1146', N'P115', N'NV482', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1147', N'P115', N'NV031', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1148', N'P115', N'NV483', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1149', N'P115', N'NV303', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT115', N'P252', N'NV391', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1150', N'P115', N'NV484', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1151', N'P116', N'NV304', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1152', N'P116', N'NV485', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1153', N'P116', N'NV305', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1154', N'P116', N'NV486', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1155', N'P116', N'NV306', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1156', N'P116', N'NV487', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1157', N'P65', N'NV307', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1158', N'P65', N'NV482', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1159', N'P65', N'NV308', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT116', N'P252', N'NV056', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1160', N'P65', N'NV483', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1161', N'P65', N'NV309', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1162', N'P65', N'NV484', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1163', N'P66', N'NV310', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1164', N'P66', N'NV485', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1165', N'P66', N'NV311', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1166', N'P66', N'NV486', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1167', N'P66', N'NV312', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1168', N'P66', N'NV487', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1169', N'P68', N'NV313', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT117', N'P252', N'NV393', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1170', N'P68', N'NV485', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1171', N'P68', N'NV314', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1172', N'P68', N'NV483', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1173', N'P68', N'NV315', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1174', N'P68', N'NV484', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1175', N'P211', N'NV316', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1176', N'P211', N'NV482', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1177', N'P211', N'NV314', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1178', N'P211', N'NV483', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1179', N'P211', N'NV303', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT118', N'P253', N'NV019', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1180', N'P211', N'NV487', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1181', N'P213', N'NV313', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1182', N'P213', N'NV482', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1183', N'P213', N'NV314', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1184', N'P213', N'NV486', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1185', N'P213', N'NV303', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1186', N'P213', N'NV484', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1187', N'P214', N'NV316', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1188', N'P214', N'NV485', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1189', N'P214', N'NV031', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT119', N'P253', N'NV384', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1190', N'P214', N'NV486', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1191', N'P214', N'NV315', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1192', N'P214', N'NV484', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1193', N'P215', N'NV316', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1194', N'P215', N'NV485', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1195', N'P215', N'NV031', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1196', N'P215', N'NV486', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1197', N'P215', N'NV315', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1198', N'P215', N'NV487', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1199', N'P117', N'NV015', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT120', N'P253', N'NV066', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1200', N'P117', N'NV488', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1201', N'P117', N'NV032', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1202', N'P117', N'NV489', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1203', N'P117', N'NV317', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1204', N'P117', N'NV490', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1205', N'P118', N'NV318', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1206', N'P118', N'NV526', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1207', N'P118', N'NV319', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1208', N'P118', N'NV527', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1209', N'P118', N'NV320', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT121', N'P253', N'NV391', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1210', N'P118', N'NV528', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1211', N'P121', N'NV321', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1212', N'P121', N'NV529', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1213', N'P121', N'NV322', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1214', N'P121', N'NV530', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1215', N'P121', N'NV323', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1216', N'P121', N'NV531', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1217', N'P122', N'NV324', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1218', N'P122', N'NV532', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1219', N'P122', N'NV325', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT122', N'P253', N'NV056', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1220', N'P122', N'NV533', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1221', N'P122', N'NV326', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1222', N'P122', N'NV534', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1223', N'P125', N'NV327', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1224', N'P125', N'NV535', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1225', N'P125', N'NV328', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1226', N'P125', N'NV536', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1227', N'P125', N'NV329', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1228', N'P125', N'NV537', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1229', N'P127', N'NV330', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT123', N'P253', N'NV394', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1230', N'P127', N'NV538', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1231', N'P127', N'NV032', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1232', N'P127', N'NV539', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1233', N'P127', N'NV317', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1234', N'P127', N'NV540', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1235', N'P130', N'NV015', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1236', N'P130', N'NV541', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1237', N'P130', N'NV032', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1238', N'P130', N'NV491', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1239', N'P130', N'NV492', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT124', N'P255', N'NV389', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1240', N'P130', N'NV317', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1241', N'P131', N'NV015', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1242', N'P131', N'NV493', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1243', N'P131', N'NV032', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1244', N'P131', N'NV489', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1245', N'P131', N'NV317', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1246', N'P131', N'NV490', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1247', N'P134', N'NV015', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1248', N'P134', N'NV493', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1249', N'P134', N'NV032', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT125', N'P255', N'NV064', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1250', N'P134', N'NV489', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1251', N'P134', N'NV317', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1252', N'P134', N'NV490', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1253', N'P135', N'NV318', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1254', N'P135', N'NV493', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1255', N'P135', N'NV319', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1256', N'P135', N'NV527', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1257', N'P135', N'NV320', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1258', N'P135', N'NV490', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1259', N'P138', N'NV318', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT126', N'P255', N'NV053', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1260', N'P138', N'NV493', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1261', N'P138', N'NV319', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1262', N'P138', N'NV527', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1263', N'P138', N'NV320', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1264', N'P138', N'NV528', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1265', N'P139', N'NV318', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1266', N'P139', N'NV488', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1267', N'P139', N'NV319', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1268', N'P139', N'NV527', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1269', N'P139', N'NV320', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT127', N'P255', N'NV390', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1270', N'P139', N'NV528', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1271', N'P142', N'NV318', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1272', N'P142', N'NV488', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1273', N'P142', N'NV319', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1274', N'P142', N'NV530', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1275', N'P142', N'NV320', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1276', N'P142', N'NV528', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1277', N'P143', N'NV321', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1278', N'P143', N'NV488', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1279', N'P143', N'NV322', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT128', N'P255', N'NV072', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1280', N'P143', N'NV530', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1281', N'P143', N'NV323', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1282', N'P143', N'NV534', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1283', N'P145', N'NV321', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1284', N'P145', N'NV526', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1285', N'P145', N'NV322', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1286', N'P145', N'NV530', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1287', N'P145', N'NV323', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1288', N'P145', N'NV531', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1289', N'P146', N'NV321', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT129', N'P255', N'NV392', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1290', N'P146', N'NV526', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1291', N'P146', N'NV322', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1292', N'P146', N'NV533', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1293', N'P146', N'NV525', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1294', N'P146', N'NV531', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1295', N'P148', N'NV524', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1296', N'P148', N'NV526', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1297', N'P148', N'NV322', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1298', N'P148', N'NV533', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1299', N'P148', N'NV323', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT130', N'P256', N'NV019', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1300', N'P148', N'NV531', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1301', N'P149', N'NV519', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1302', N'P149', N'NV526', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1303', N'P149', N'NV520', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1304', N'P149', N'NV533', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1305', N'P149', N'NV521', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1306', N'P149', N'NV534', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1307', N'P154', N'NV518', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1308', N'P154', N'NV529', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1309', N'P154', N'NV517', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT131', N'P256', N'NV388', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1310', N'P154', N'NV536', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1311', N'P154', N'NV326', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1312', N'P154', N'NV534', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1313', N'P155', N'NV324', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1314', N'P155', N'NV529', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1315', N'P155', N'NV516', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1316', N'P155', N'NV536', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1317', N'P155', N'NV326', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1318', N'P155', N'NV537', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1319', N'P157', N'NV324', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT132', N'P256', N'NV053', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1320', N'P157', N'NV529', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1321', N'P157', N'NV515', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1322', N'P157', N'NV536', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1323', N'P157', N'NV326', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1324', N'P157', N'NV537', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1325', N'P158', N'NV327', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1326', N'P158', N'NV532', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1327', N'P158', N'NV514', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1328', N'P158', N'NV539', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1329', N'P158', N'NV513', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT133', N'P256', N'NV390', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1330', N'P158', N'NV537', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1331', N'P159', N'NV512', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1332', N'P159', N'NV532', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1333', N'P159', N'NV328', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1334', N'P159', N'NV539', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1335', N'P159', N'NV522', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1336', N'P159', N'NV540', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1337', N'P160', N'NV510', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1338', N'P160', N'NV535', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1339', N'P160', N'NV511', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT134', N'P256', N'NV072', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1340', N'P160', N'NV539', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1341', N'P160', N'NV509', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1342', N'P160', N'NV540', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1343', N'P161', N'NV508', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1344', N'P161', N'NV535', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1345', N'P161', N'NV328', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1346', N'P161', N'NV491', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1347', N'P161', N'NV523', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1348', N'P161', N'NV540', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1349', N'P162', N'NV327', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT135', N'P256', N'NV392', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1350', N'P162', N'NV535', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1351', N'P162', N'NV507', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1352', N'P162', N'NV491', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1353', N'P162', N'NV506', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1354', N'P162', N'NV540', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1355', N'P117', N'NV015', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1356', N'P117', N'NV488', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1357', N'P117', N'NV032', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1358', N'P117', N'NV489', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1359', N'P117', N'NV317', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT136', N'P05', N'NV002', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1360', N'P117', N'NV490', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1361', N'P118', N'NV318', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1362', N'P118', N'NV526', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1363', N'P118', N'NV319', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1364', N'P118', N'NV527', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1365', N'P118', N'NV320', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1366', N'P118', N'NV528', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1367', N'P121', N'NV321', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1368', N'P121', N'NV529', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1369', N'P121', N'NV322', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT137', N'P05', N'NV019', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1370', N'P121', N'NV530', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1371', N'P121', N'NV323', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1372', N'P121', N'NV531', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1373', N'P122', N'NV324', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1374', N'P122', N'NV532', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1375', N'P122', N'NV325', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1376', N'P122', N'NV533', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1377', N'P122', N'NV326', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1378', N'P122', N'NV534', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1379', N'P125', N'NV327', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT138', N'P05', N'NV395', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1380', N'P125', N'NV535', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1381', N'P125', N'NV328', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1382', N'P125', N'NV536', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1383', N'P125', N'NV329', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1384', N'P125', N'NV537', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1385', N'P127', N'NV330', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1386', N'P127', N'NV538', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1387', N'P127', N'NV032', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1388', N'P127', N'NV539', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1389', N'P127', N'NV317', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT139', N'P05', N'NV053', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1390', N'P127', N'NV540', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1391', N'P130', N'NV015', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1392', N'P130', N'NV541', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1393', N'P130', N'NV032', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1394', N'P130', N'NV491', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1395', N'P130', N'NV492', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1396', N'P130', N'NV317', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1397', N'P131', N'NV015', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1398', N'P131', N'NV493', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1399', N'P131', N'NV032', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT140', N'P05', N'NV054', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1400', N'P131', N'NV489', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1401', N'P131', N'NV317', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1402', N'P131', N'NV490', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1403', N'P134', N'NV015', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1404', N'P134', N'NV493', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1405', N'P134', N'NV032', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1406', N'P134', N'NV489', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1407', N'P134', N'NV317', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1408', N'P134', N'NV490', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1409', N'P135', N'NV318', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT141', N'P05', N'NV396', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1410', N'P135', N'NV493', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1411', N'P135', N'NV319', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1412', N'P135', N'NV527', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1413', N'P135', N'NV320', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1414', N'P135', N'NV490', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1415', N'P138', N'NV318', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1416', N'P138', N'NV493', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1417', N'P138', N'NV319', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1418', N'P138', N'NV527', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1419', N'P138', N'NV320', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT142', N'P05', N'NV055', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1420', N'P138', N'NV528', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1421', N'P139', N'NV318', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1422', N'P139', N'NV488', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1423', N'P139', N'NV319', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1424', N'P139', N'NV527', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1425', N'P139', N'NV320', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1426', N'P139', N'NV528', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1427', N'P142', N'NV318', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1428', N'P142', N'NV488', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1429', N'P142', N'NV319', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT143', N'P05', N'NV056', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1430', N'P142', N'NV530', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1431', N'P142', N'NV320', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1432', N'P142', N'NV528', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1433', N'P143', N'NV321', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1434', N'P143', N'NV488', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1435', N'P143', N'NV322', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1436', N'P143', N'NV530', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1437', N'P143', N'NV323', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1438', N'P143', N'NV534', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1439', N'P145', N'NV321', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT144', N'P05', N'NV392', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1440', N'P145', N'NV526', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1441', N'P145', N'NV322', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1442', N'P145', N'NV530', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1443', N'P145', N'NV323', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1444', N'P145', N'NV531', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1445', N'P146', N'NV321', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1446', N'P146', N'NV526', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1447', N'P146', N'NV322', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1448', N'P146', N'NV533', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1449', N'P146', N'NV525', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT145', N'P06', N'NV057', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1450', N'P146', N'NV531', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1451', N'P148', N'NV524', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1452', N'P148', N'NV526', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1453', N'P148', N'NV322', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1454', N'P148', N'NV533', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1455', N'P148', N'NV323', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1456', N'P148', N'NV531', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1457', N'P149', N'NV519', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1458', N'P149', N'NV526', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1459', N'P149', N'NV520', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT146', N'P06', N'NV058', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1460', N'P149', N'NV533', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1461', N'P149', N'NV521', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1462', N'P149', N'NV534', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1463', N'P154', N'NV518', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1464', N'P154', N'NV529', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1465', N'P154', N'NV517', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1466', N'P154', N'NV536', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1467', N'P154', N'NV326', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1468', N'P154', N'NV534', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1469', N'P155', N'NV324', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT147', N'P06', N'NV395', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1470', N'P155', N'NV529', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1471', N'P155', N'NV516', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1472', N'P155', N'NV536', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1473', N'P155', N'NV326', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1474', N'P155', N'NV537', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1475', N'P157', N'NV324', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1476', N'P157', N'NV529', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1477', N'P157', N'NV515', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1478', N'P157', N'NV536', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1479', N'P157', N'NV326', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT148', N'P06', N'NV059', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1480', N'P157', N'NV537', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1481', N'P158', N'NV327', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1482', N'P158', N'NV532', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1483', N'P158', N'NV514', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1484', N'P158', N'NV539', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1485', N'P158', N'NV513', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1486', N'P158', N'NV537', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1487', N'P159', N'NV512', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1488', N'P159', N'NV532', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1489', N'P159', N'NV328', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT149', N'P06', N'NV060', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1490', N'P159', N'NV539', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1491', N'P159', N'NV522', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1492', N'P159', N'NV540', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1493', N'P160', N'NV510', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1494', N'P160', N'NV535', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1495', N'P160', N'NV511', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1496', N'P160', N'NV539', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1497', N'P160', N'NV509', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1498', N'P160', N'NV540', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1499', N'P161', N'NV508', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT150', N'P06', N'NV391', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1500', N'P161', N'NV535', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1501', N'P161', N'NV328', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1502', N'P161', N'NV491', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1503', N'P161', N'NV523', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1504', N'P161', N'NV540', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1505', N'P162', N'NV327', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1506', N'P162', N'NV535', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1507', N'P162', N'NV507', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1508', N'P162', N'NV491', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1509', N'P162', N'NV506', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT151', N'P06', N'NV061', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1510', N'P162', N'NV540', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1511', N'P69', N'NV016', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1512', N'P69', N'NV494', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1513', N'P69', N'NV033', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1514', N'P69', N'NV495', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1515', N'P69', N'NV331', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1516', N'P69', N'NV496', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1517', N'P70', N'NV332', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1518', N'P70', N'NV497', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1519', N'P70', N'NV333', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT152', N'P06', N'NV062', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1520', N'P70', N'NV498', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1521', N'P70', N'NV334', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1522', N'P70', N'NV499', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1523', N'P228', N'NV335', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1524', N'P228', N'NV494', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1525', N'P228', N'NV336', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1526', N'P228', N'NV495', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1527', N'P228', N'NV337', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1528', N'P228', N'NV496', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1529', N'P230', N'NV338', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT153', N'P06', N'NV392', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1530', N'P230', N'NV494', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1531', N'P230', N'NV339', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1532', N'P230', N'NV495', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1533', N'P230', N'NV340', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1534', N'P230', N'NV496', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1535', N'P231', N'NV341', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1536', N'P231', N'NV497', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1537', N'P231', N'NV342', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1538', N'P231', N'NV498', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1539', N'P231', N'NV343', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT154', N'P09', N'NV063', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1540', N'P231', N'NV499', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1541', N'P232', N'NV344', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1542', N'P232', N'NV497', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1543', N'P232', N'NV345', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1544', N'P232', N'NV498', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1545', N'P232', N'NV346', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1546', N'P232', N'NV499', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1547', N'P69', N'NV016', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1548', N'P69', N'NV494', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1549', N'P69', N'NV033', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT155', N'P09', N'NV064', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1550', N'P69', N'NV495', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1551', N'P69', N'NV331', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1552', N'P69', N'NV496', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1553', N'P70', N'NV332', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1554', N'P70', N'NV497', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1555', N'P70', N'NV333', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1556', N'P70', N'NV498', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1557', N'P70', N'NV334', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1558', N'P70', N'NV499', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1559', N'P228', N'NV335', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT156', N'P09', N'NV388', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1560', N'P228', N'NV494', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1561', N'P228', N'NV336', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1562', N'P228', N'NV495', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1563', N'P228', N'NV337', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1564', N'P228', N'NV496', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1565', N'P230', N'NV338', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1566', N'P230', N'NV494', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1567', N'P230', N'NV339', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1568', N'P230', N'NV495', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1569', N'P230', N'NV340', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT157', N'P09', N'NV065', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1570', N'P230', N'NV496', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1571', N'P231', N'NV341', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1572', N'P231', N'NV497', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1573', N'P231', N'NV342', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1574', N'P231', N'NV498', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1575', N'P231', N'NV343', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1576', N'P231', N'NV499', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1577', N'P232', N'NV344', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1578', N'P232', N'NV497', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1579', N'P232', N'NV345', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT158', N'P09', N'NV066', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1580', N'P232', N'NV498', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1581', N'P232', N'NV346', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT1582', N'P232', N'NV499', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT159', N'P09', N'NV394', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT160', N'P09', N'NV067', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT161', N'P09', N'NV068', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT162', N'P09', N'NV393', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT163', N'P10', N'NV070', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT164', N'P10', N'NV388', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT165', N'P10', N'NV071', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT166', N'P10', N'NV394', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT167', N'P10', N'NV072', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT168', N'P10', N'NV393', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT169', N'P250', N'NV073', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT170', N'P250', N'NV384', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT171', N'P250', N'NV074', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT172', N'P250', N'NV391', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT173', N'P250', N'NV075', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT174', N'P250', N'NV393', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT175', N'P252', N'NV076', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT176', N'P252', N'NV389', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT177', N'P252', N'NV074', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT178', N'P252', N'NV391', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT179', N'P252', N'NV056', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT180', N'P252', N'NV393', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT181', N'P253', N'NV019', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT182', N'P253', N'NV384', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT183', N'P253', N'NV066', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT184', N'P253', N'NV391', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT185', N'P253', N'NV056', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT186', N'P253', N'NV394', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT187', N'P255', N'NV389', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT188', N'P255', N'NV064', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT189', N'P255', N'NV053', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT190', N'P255', N'NV390', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT191', N'P255', N'NV072', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT192', N'P255', N'NV392', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT193', N'P256', N'NV019', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT194', N'P256', N'NV388', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT195', N'P256', N'NV053', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT196', N'P256', N'NV390', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT197', N'P256', N'NV072', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT198', N'P256', N'NV392', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT199', N'P11', N'NV003', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT200', N'P11', N'NV020', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT201', N'P11', N'NV397', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT202', N'P11', N'NV077', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT203', N'P11', N'NV078', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT204', N'P11', N'NV398', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT205', N'P11', N'NV079', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT206', N'P11', N'NV080', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT207', N'P11', N'NV399', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT208', N'P12', N'NV081', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT209', N'P12', N'NV082', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT210', N'P12', N'NV400', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT211', N'P12', N'NV083', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT212', N'P12', N'NV084', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT213', N'P12', N'NV401', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT214', N'P12', N'NV085', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT215', N'P12', N'NV086', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT216', N'P12', N'NV402', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT217', N'P262', N'NV087', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT218', N'P262', N'NV397', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT219', N'P262', N'NV088', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT220', N'P262', N'NV401', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT221', N'P262', N'NV089', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT222', N'P262', N'NV399', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT223', N'P264', N'NV087', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT224', N'P264', N'NV400', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT225', N'P264', N'NV090', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT226', N'P264', N'NV398', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT227', N'P264', N'NV091', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT228', N'P264', N'NV399', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT229', N'P265', N'NV092', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT230', N'P265', N'NV397', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT231', N'P265', N'NV093', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT232', N'P265', N'NV401', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT233', N'P265', N'NV094', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT234', N'P265', N'NV402', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT235', N'P268', N'NV092', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT236', N'P268', N'NV400', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT237', N'P268', N'NV095', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT238', N'P268', N'NV398', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT239', N'P268', N'NV096', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT240', N'P268', N'NV402', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT241', N'P11', N'NV003', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT242', N'P11', N'NV020', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT243', N'P11', N'NV397', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT244', N'P11', N'NV077', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT245', N'P11', N'NV078', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT246', N'P11', N'NV398', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT247', N'P11', N'NV079', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT248', N'P11', N'NV080', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT249', N'P11', N'NV399', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT250', N'P12', N'NV081', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT251', N'P12', N'NV082', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT252', N'P12', N'NV400', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT253', N'P12', N'NV083', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT254', N'P12', N'NV084', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT255', N'P12', N'NV401', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT256', N'P12', N'NV085', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT257', N'P12', N'NV086', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT258', N'P12', N'NV402', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT259', N'P262', N'NV087', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT260', N'P262', N'NV397', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT261', N'P262', N'NV088', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT262', N'P262', N'NV401', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT263', N'P262', N'NV089', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT264', N'P262', N'NV399', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT265', N'P264', N'NV087', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT266', N'P264', N'NV400', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT267', N'P264', N'NV090', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT268', N'P264', N'NV398', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT269', N'P264', N'NV091', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT270', N'P264', N'NV399', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT271', N'P265', N'NV092', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT272', N'P265', N'NV397', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT273', N'P265', N'NV093', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT274', N'P265', N'NV401', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT275', N'P265', N'NV094', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT276', N'P265', N'NV402', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT277', N'P268', N'NV092', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT278', N'P268', N'NV400', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT279', N'P268', N'NV095', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT280', N'P268', N'NV398', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT281', N'P268', N'NV096', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT282', N'P268', N'NV402', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT283', N'P274', N'NV005', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT284', N'P274', N'NV412', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT285', N'P274', N'NV022', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT286', N'P274', N'NV413', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT287', N'P274', N'NV118', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT288', N'P274', N'NV414', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT289', N'P276', N'NV119', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT290', N'P276', N'NV415', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT291', N'P276', N'NV120', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT292', N'P276', N'NV416', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT293', N'P276', N'NV121', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT294', N'P276', N'NV417', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT295', N'P277', N'NV122', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT296', N'P277', N'NV412', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT297', N'P277', N'NV123', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT298', N'P277', N'NV413', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT299', N'P277', N'NV124', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT300', N'P277', N'NV414', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT301', N'P278', N'NV125', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT302', N'P278', N'NV415', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT303', N'P278', N'NV126', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT304', N'P278', N'NV416', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT305', N'P278', N'NV127', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT306', N'P278', N'NV417', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT307', N'P274', N'NV005', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT308', N'P274', N'NV412', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT309', N'P274', N'NV022', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT310', N'P274', N'NV413', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT311', N'P274', N'NV118', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT312', N'P274', N'NV414', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT313', N'P276', N'NV119', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT314', N'P276', N'NV415', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT315', N'P276', N'NV120', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT316', N'P276', N'NV416', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT317', N'P276', N'NV121', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT318', N'P276', N'NV417', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT319', N'P277', N'NV122', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT320', N'P277', N'NV412', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT321', N'P277', N'NV123', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT322', N'P277', N'NV413', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT323', N'P277', N'NV124', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT324', N'P277', N'NV414', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT325', N'P278', N'NV125', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT326', N'P278', N'NV415', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT327', N'P278', N'NV126', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT328', N'P278', N'NV416', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT329', N'P278', N'NV127', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT330', N'P278', N'NV417', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT331', N'P25', N'NV006', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT332', N'P25', N'NV023', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT333', N'P25', N'NV418', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT334', N'P25', N'NV138', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT335', N'P25', N'NV139', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT336', N'P25', N'NV419', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT337', N'P25', N'NV140', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT338', N'P25', N'NV141', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT339', N'P25', N'NV420', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT340', N'P26', N'NV142', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT341', N'P26', N'NV421', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT342', N'P26', N'NV143', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT343', N'P26', N'NV422', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT344', N'P26', N'NV144', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT345', N'P26', N'NV423', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT346', N'P27', N'NV145', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT347', N'P27', N'NV146', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT348', N'P27', N'NV424', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT349', N'P27', N'NV147', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT350', N'P27', N'NV148', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT351', N'P27', N'NV425', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT352', N'P27', N'NV149', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT353', N'P27', N'NV150', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT354', N'P27', N'NV426', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT355', N'P28', N'NV151', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT356', N'P28', N'NV421', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT357', N'P28', N'NV152', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT358', N'P28', N'NV425', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT359', N'P28', N'NV153', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT360', N'P28', N'NV420', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT361', N'P286', N'NV154', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT362', N'P286', N'NV418', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT363', N'P286', N'NV155', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT364', N'P286', N'NV425', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT365', N'P286', N'NV156', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT366', N'P286', N'NV420', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT367', N'P288', N'NV157', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT368', N'P288', N'NV421', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT369', N'P288', N'NV158', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT370', N'P288', N'NV422', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT371', N'P288', N'NV159', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT372', N'P288', N'NV423', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT373', N'P289', N'NV160', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT374', N'P289', N'NV424', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT375', N'P289', N'NV161', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT376', N'P289', N'NV419', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT377', N'P289', N'NV159', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT378', N'P289', N'NV423', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT379', N'P290', N'NV154', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT380', N'P290', N'NV421', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT381', N'P290', N'NV155', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT382', N'P290', N'NV422', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT383', N'P290', N'NV156', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT384', N'P290', N'NV423', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT385', N'P25', N'NV006', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT386', N'P25', N'NV023', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT387', N'P25', N'NV418', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT388', N'P25', N'NV138', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT389', N'P25', N'NV139', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT390', N'P25', N'NV419', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT391', N'P25', N'NV140', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT392', N'P25', N'NV141', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT393', N'P25', N'NV420', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT394', N'P26', N'NV142', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT395', N'P26', N'NV421', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT396', N'P26', N'NV143', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT397', N'P26', N'NV422', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT398', N'P26', N'NV144', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT399', N'P26', N'NV423', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT400', N'P27', N'NV145', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT401', N'P27', N'NV146', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT402', N'P27', N'NV424', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT403', N'P27', N'NV147', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT404', N'P27', N'NV148', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT405', N'P27', N'NV425', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT406', N'P27', N'NV149', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT407', N'P27', N'NV150', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT408', N'P27', N'NV426', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT409', N'P28', N'NV151', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT410', N'P28', N'NV421', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT411', N'P28', N'NV152', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT412', N'P28', N'NV425', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT413', N'P28', N'NV153', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT414', N'P28', N'NV420', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT415', N'P286', N'NV154', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT416', N'P286', N'NV418', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT417', N'P286', N'NV155', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT418', N'P286', N'NV425', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT419', N'P286', N'NV156', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT420', N'P286', N'NV420', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT421', N'P288', N'NV157', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT422', N'P288', N'NV421', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT423', N'P288', N'NV158', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT424', N'P288', N'NV422', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT425', N'P288', N'NV159', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT426', N'P288', N'NV423', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT427', N'P289', N'NV160', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT428', N'P289', N'NV424', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT429', N'P289', N'NV161', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT430', N'P289', N'NV419', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT431', N'P289', N'NV159', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT432', N'P289', N'NV423', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT433', N'P290', N'NV154', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT434', N'P290', N'NV421', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT435', N'P290', N'NV155', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT436', N'P290', N'NV422', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT437', N'P290', N'NV156', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT438', N'P290', N'NV423', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT439', N'P32', N'NV007', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT440', N'P32', N'NV024', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT441', N'P32', N'NV427', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT442', N'P32', N'NV162', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT443', N'P32', N'NV163', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT444', N'P32', N'NV428', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT445', N'P32', N'NV164', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT446', N'P32', N'NV165', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT447', N'P32', N'NV429', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT448', N'P34', N'NV166', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT449', N'P34', N'NV167', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT450', N'P34', N'NV430', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT451', N'P34', N'NV168', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT452', N'P34', N'NV169', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT453', N'P34', N'NV431', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT454', N'P34', N'NV170', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT455', N'P34', N'NV171', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT456', N'P34', N'NV432', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT457', N'P218', N'NV172', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT458', N'P218', N'NV430', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT459', N'P218', N'NV173', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT460', N'P218', N'NV431', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT461', N'P218', N'NV174', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT462', N'P218', N'NV432', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT463', N'P220', N'NV175', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT464', N'P220', N'NV430', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT465', N'P220', N'NV176', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT466', N'P220', N'NV431', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT467', N'P220', N'NV177', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT468', N'P220', N'NV432', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT469', N'P221', N'NV178', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT470', N'P221', N'NV427', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT471', N'P221', N'NV179', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT472', N'P221', N'NV428', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT473', N'P221', N'NV180', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT474', N'P221', N'NV429', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT475', N'P223', N'NV181', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT476', N'P223', N'NV427', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT477', N'P223', N'NV179', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT478', N'P223', N'NV428', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT479', N'P223', N'NV175', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT480', N'P223', N'NV429', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT481', N'P37', N'NV008', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT482', N'P37', N'NV025', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT483', N'P37', N'NV434', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT484', N'P37', N'NV182', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT485', N'P37', N'NV183', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT486', N'P37', N'NV435', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT487', N'P37', N'NV184', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT488', N'P37', N'NV185', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT489', N'P37', N'NV436', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT490', N'P35', N'NV186', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT491', N'P35', N'NV187', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT492', N'P35', N'NV437', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT493', N'P35', N'NV188', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT494', N'P35', N'NV189', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT495', N'P35', N'NV438', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT496', N'P35', N'NV190', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT497', N'P35', N'NV191', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT498', N'P35', N'NV436', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT499', N'P36', N'NV192', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT500', N'P36', N'NV434', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT501', N'P36', N'NV193', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT502', N'P36', N'NV435', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT503', N'P36', N'NV194', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT504', N'P36', N'NV436', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT505', N'P311', N'NV195', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT506', N'P311', N'NV437', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT507', N'P311', N'NV182', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT508', N'P311', N'NV438', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT509', N'P311', N'NV185', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT510', N'P311', N'NV436', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT511', N'P313', N'NV008', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT512', N'P313', N'NV437', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT513', N'P313', N'NV183', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT514', N'P313', N'NV435', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT515', N'P313', N'NV433', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT516', N'P313', N'NV185', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT517', N'P314', N'NV195', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT518', N'P314', N'NV437', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT519', N'P314', N'NV183', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT520', N'P314', N'NV438', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT521', N'P314', N'NV191', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT522', N'P314', N'NV433', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT523', N'P315', N'NV195', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT524', N'P315', N'NV433', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT525', N'P315', N'NV183', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT526', N'P315', N'NV435', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT527', N'P315', N'NV191', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT528', N'P315', N'NV436', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT529', N'P37', N'NV008', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT530', N'P37', N'NV025', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT531', N'P37', N'NV434', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT532', N'P37', N'NV182', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT533', N'P37', N'NV183', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT534', N'P37', N'NV435', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT535', N'P37', N'NV184', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT536', N'P37', N'NV185', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT537', N'P37', N'NV436', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT538', N'P35', N'NV186', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT539', N'P35', N'NV187', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT540', N'P35', N'NV437', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT541', N'P35', N'NV188', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT542', N'P35', N'NV189', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT543', N'P35', N'NV438', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT544', N'P35', N'NV190', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT545', N'P35', N'NV191', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT546', N'P35', N'NV436', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT547', N'P36', N'NV192', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT548', N'P36', N'NV434', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT549', N'P36', N'NV193', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT550', N'P36', N'NV435', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT551', N'P36', N'NV194', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT552', N'P36', N'NV436', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT553', N'P311', N'NV195', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT554', N'P311', N'NV437', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT555', N'P311', N'NV182', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT556', N'P311', N'NV438', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT557', N'P311', N'NV185', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT558', N'P311', N'NV436', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT559', N'P313', N'NV008', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT560', N'P313', N'NV437', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT561', N'P313', N'NV183', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT562', N'P313', N'NV435', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT563', N'P313', N'NV433', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT564', N'P313', N'NV185', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT565', N'P314', N'NV195', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT566', N'P314', N'NV437', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT567', N'P314', N'NV183', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT568', N'P314', N'NV438', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT569', N'P314', N'NV191', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT570', N'P314', N'NV433', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT571', N'P315', N'NV195', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT572', N'P315', N'NV433', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT573', N'P315', N'NV183', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT574', N'P315', N'NV435', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT575', N'P315', N'NV191', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT576', N'P315', N'NV436', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT577', N'P165', N'NV009', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT578', N'P165', N'NV439', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT579', N'P165', N'NV196', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT580', N'P165', N'NV440', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT581', N'P165', N'NV197', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT582', N'P165', N'NV441', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT583', N'P39', N'NV026', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT584', N'P39', N'NV442', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT585', N'P39', N'NV198', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT586', N'P39', N'NV443', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT587', N'P39', N'NV199', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT588', N'P39', N'NV445', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT589', N'P40', N'NV200', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT590', N'P40', N'NV201', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT591', N'P40', N'NV446', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT592', N'P40', N'NV202', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT593', N'P40', N'NV203', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT594', N'P40', N'NV447', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT595', N'P40', N'NV204', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT596', N'P40', N'NV205', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT597', N'P40', N'NV448', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT598', N'P41', N'NV206', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT599', N'P41', N'NV439', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT600', N'P41', N'NV207', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT601', N'P41', N'NV440', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT602', N'P41', N'NV208', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT603', N'P41', N'NV448', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT604', N'P42', N'NV209', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT605', N'P42', N'NV439', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT606', N'P42', N'NV210', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT607', N'P42', N'NV443', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT608', N'P42', N'NV211', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT609', N'P42', N'NV445', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT610', N'P323', N'NV212', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT611', N'P323', N'NV446', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT612', N'P323', N'NV213', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT613', N'P323', N'NV440', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT614', N'P323', N'NV214', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT615', N'P323', N'NV441', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT616', N'P325', N'NV215', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT617', N'P325', N'NV446', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT618', N'P325', N'NV216', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT619', N'P325', N'NV443', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT620', N'P325', N'NV214', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT621', N'P325', N'NV441', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT622', N'P326', N'NV212', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT623', N'P326', N'NV442', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT624', N'P326', N'NV213', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT625', N'P326', N'NV447', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT626', N'P326', N'NV214', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT627', N'P326', N'NV448', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT628', N'P327', N'NV215', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT629', N'P327', N'NV442', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT630', N'P327', N'NV216', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT631', N'P327', N'NV443', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT632', N'P327', N'NV214', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT633', N'P327', N'NV445', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT634', N'P165', N'NV009', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT635', N'P165', N'NV439', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT636', N'P165', N'NV196', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT637', N'P165', N'NV440', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT638', N'P165', N'NV197', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT639', N'P165', N'NV441', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT640', N'P39', N'NV026', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT641', N'P39', N'NV442', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT642', N'P39', N'NV198', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT643', N'P39', N'NV443', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT644', N'P39', N'NV199', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT645', N'P39', N'NV445', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT646', N'P40', N'NV200', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT647', N'P40', N'NV201', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT648', N'P40', N'NV446', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT649', N'P40', N'NV202', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT650', N'P40', N'NV203', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT651', N'P40', N'NV447', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT652', N'P40', N'NV204', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT653', N'P40', N'NV205', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT654', N'P40', N'NV448', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT655', N'P41', N'NV206', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT656', N'P41', N'NV439', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT657', N'P41', N'NV207', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT658', N'P41', N'NV440', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT659', N'P41', N'NV208', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT660', N'P41', N'NV448', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT661', N'P42', N'NV209', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT662', N'P42', N'NV439', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT663', N'P42', N'NV210', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT664', N'P42', N'NV443', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT665', N'P42', N'NV211', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT666', N'P42', N'NV445', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT667', N'P323', N'NV212', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT668', N'P323', N'NV446', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT669', N'P323', N'NV213', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT670', N'P323', N'NV440', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT671', N'P323', N'NV214', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT672', N'P323', N'NV441', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT673', N'P325', N'NV215', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT674', N'P325', N'NV446', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT675', N'P325', N'NV216', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT676', N'P325', N'NV443', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT677', N'P325', N'NV214', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT678', N'P325', N'NV441', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT679', N'P326', N'NV212', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT680', N'P326', N'NV442', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT681', N'P326', N'NV213', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT682', N'P326', N'NV447', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT683', N'P326', N'NV214', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT684', N'P326', N'NV448', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT685', N'P327', N'NV215', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT686', N'P327', N'NV442', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT687', N'P327', N'NV216', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT688', N'P327', N'NV443', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT689', N'P327', N'NV214', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT690', N'P327', N'NV445', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT691', N'P166', N'NV010', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT692', N'P166', N'NV027', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT693', N'P166', N'NV449', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT694', N'P166', N'NV217', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT695', N'P166', N'NV218', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT696', N'P166', N'NV450', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT697', N'P166', N'NV219', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT698', N'P166', N'NV220', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT699', N'P166', N'NV451', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT703', N'P45', N'NV223', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT704', N'P45', N'NV224', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT705', N'P45', N'NV453', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT706', N'P45', N'NV225', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT707', N'P45', N'NV226', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT708', N'P45', N'NV454', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT709', N'P47', N'NV227', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT710', N'P47', N'NV236', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT711', N'P47', N'NV455', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT712', N'P47', N'NV228', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT713', N'P47', N'NV237', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT714', N'P47', N'NV456', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT715', N'P47', N'NV229', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT716', N'P47', N'NV457', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT717', N'P46', N'NV230', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT718', N'P46', N'NV449', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT719', N'P46', N'NV231', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT720', N'P46', N'NV450', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT721', N'P46', N'NV232', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT722', N'P46', N'NV451', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT723', N'P177', N'NV233', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT724', N'P177', N'NV449', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT725', N'P177', N'NV234', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT726', N'P177', N'NV450', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT727', N'P177', N'NV235', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT728', N'P177', N'NV451', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT729', N'P180', N'NV221', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT730', N'P180', N'NV455', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT731', N'P180', N'NV217', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT732', N'P180', N'NV456', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT733', N'P180', N'NV220', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT734', N'P180', N'NV453', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT735', N'P181', N'NV010', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT736', N'P181', N'NV455', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT737', N'P181', N'NV217', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT738', N'P181', N'NV453', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT739', N'P181', N'NV226', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT740', N'P181', N'NV454', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT741', N'P182', N'NV221', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT742', N'P182', N'NV449', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT743', N'P182', N'NV224', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT744', N'P182', N'NV456', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT745', N'P182', N'NV452', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT746', N'P182', N'NV454', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT747', N'P166', N'NV010', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT748', N'P166', N'NV027', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT749', N'P166', N'NV449', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT750', N'P166', N'NV217', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT751', N'P166', N'NV218', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT752', N'P166', N'NV450', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT753', N'P166', N'NV219', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT754', N'P166', N'NV220', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT755', N'P166', N'NV451', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT756', N'P45', N'NV221', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT757', N'P45', N'NV222', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT758', N'P45', N'NV452', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT762', N'P45', N'NV225', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT763', N'P45', N'NV226', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT764', N'P45', N'NV454', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT765', N'P47', N'NV227', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT766', N'P47', N'NV236', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT767', N'P47', N'NV455', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT768', N'P47', N'NV228', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT769', N'P47', N'NV237', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT770', N'P47', N'NV456', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT771', N'P47', N'NV229', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT772', N'P47', N'NV457', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT773', N'P46', N'NV230', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT774', N'P46', N'NV449', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT775', N'P46', N'NV231', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT776', N'P46', N'NV450', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT777', N'P46', N'NV232', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT778', N'P46', N'NV451', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT779', N'P177', N'NV233', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT780', N'P177', N'NV449', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT781', N'P177', N'NV234', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT782', N'P177', N'NV450', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT783', N'P177', N'NV235', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT784', N'P177', N'NV451', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT785', N'P180', N'NV221', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT786', N'P180', N'NV455', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT787', N'P180', N'NV217', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT788', N'P180', N'NV456', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT789', N'P180', N'NV220', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT790', N'P180', N'NV453', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT791', N'P181', N'NV010', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT792', N'P181', N'NV455', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT793', N'P181', N'NV217', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT794', N'P181', N'NV453', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT795', N'P181', N'NV226', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT796', N'P181', N'NV454', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT797', N'P182', N'NV221', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT798', N'P182', N'NV449', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT799', N'P182', N'NV224', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT800', N'P182', N'NV456', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT801', N'P182', N'NV452', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT802', N'P182', N'NV454', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT803', N'P51', N'NV011', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT804', N'P51', N'NV028', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT805', N'P51', N'NV459', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT806', N'P51', N'NV238', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT807', N'P51', N'NV239', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT808', N'P51', N'NV460', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT809', N'P51', N'NV240', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT810', N'P51', N'NV241', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT811', N'P51', N'NV461', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT812', N'P52', N'NV242', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT813', N'P52', N'NV462', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT814', N'P52', N'NV243', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT815', N'P52', N'NV463', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT816', N'P52', N'NV244', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT817', N'P52', N'NV464', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT818', N'P55', N'NV245', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT819', N'P55', N'NV246', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT820', N'P55', N'NV465', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT821', N'P55', N'NV247', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT822', N'P55', N'NV248', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT823', N'P55', N'NV466', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT824', N'P55', N'NV249', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT825', N'P55', N'NV250', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT826', N'P55', N'NV461', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT827', N'P187', N'NV251', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT828', N'P187', N'NV459', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT829', N'P187', N'NV252', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT830', N'P187', N'NV460', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT831', N'P187', N'NV253', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT832', N'P187', N'NV461', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT833', N'P189', N'NV254', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT834', N'P189', N'NV465', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT835', N'P189', N'NV255', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT836', N'P189', N'NV466', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT837', N'P189', N'NV256', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT838', N'P189', N'NV464', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT839', N'P191', N'NV257', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT840', N'P191', N'NV462', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT841', N'P191', N'NV258', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT842', N'P191', N'NV466', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT843', N'P191', N'NV256', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT844', N'P191', N'NV464', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT845', N'P192', N'NV257', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT846', N'P192', N'NV462', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT847', N'P192', N'NV258', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT848', N'P192', N'NV460', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT849', N'P192', N'NV253', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT850', N'P192', N'NV461', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT851', N'P51', N'NV011', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT852', N'P51', N'NV028', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT853', N'P51', N'NV459', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT854', N'P51', N'NV238', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT855', N'P51', N'NV239', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT856', N'P51', N'NV460', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT857', N'P51', N'NV240', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT858', N'P51', N'NV241', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT859', N'P51', N'NV461', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT860', N'P52', N'NV242', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT861', N'P52', N'NV462', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT862', N'P52', N'NV243', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT863', N'P52', N'NV463', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT864', N'P52', N'NV244', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT865', N'P52', N'NV464', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT866', N'P55', N'NV245', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT867', N'P55', N'NV246', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT868', N'P55', N'NV465', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT869', N'P55', N'NV247', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT870', N'P55', N'NV248', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT871', N'P55', N'NV466', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT872', N'P55', N'NV249', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT873', N'P55', N'NV250', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT874', N'P55', N'NV461', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT875', N'P187', N'NV251', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT876', N'P187', N'NV459', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT877', N'P187', N'NV252', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT878', N'P187', N'NV460', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT879', N'P187', N'NV253', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT880', N'P187', N'NV461', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT881', N'P189', N'NV254', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT882', N'P189', N'NV465', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT883', N'P189', N'NV255', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT884', N'P189', N'NV466', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT885', N'P189', N'NV256', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT886', N'P189', N'NV464', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT887', N'P191', N'NV257', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT888', N'P191', N'NV462', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT889', N'P191', N'NV258', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT890', N'P191', N'NV466', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT891', N'P191', N'NV256', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT892', N'P191', N'NV464', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT893', N'P192', N'NV257', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT894', N'P192', N'NV462', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT895', N'P192', N'NV258', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT896', N'P192', N'NV460', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT897', N'P192', N'NV253', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT898', N'P192', N'NV461', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT899', N'P57', N'NV012', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT900', N'P57', N'NV029', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT901', N'P57', N'NV467', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT902', N'P57', N'NV259', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT903', N'P57', N'NV260', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT904', N'P57', N'NV468', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT905', N'P57', N'NV261', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT906', N'P57', N'NV262', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT907', N'P57', N'NV469', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT908', N'P58', N'NV263', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT909', N'P58', N'NV264', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT910', N'P58', N'NV470', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT911', N'P58', N'NV265', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT912', N'P58', N'NV266', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT913', N'P58', N'NV471', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT914', N'P58', N'NV267', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT915', N'P58', N'NV268', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT916', N'P58', N'NV472', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT917', N'P196', N'NV269', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT918', N'P196', N'NV467', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT919', N'P196', N'NV270', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT920', N'P196', N'NV468', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT921', N'P196', N'NV271', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT922', N'P196', N'NV469', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT923', N'P198', N'NV272', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT924', N'P198', N'NV467', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT925', N'P198', N'NV273', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT926', N'P198', N'NV468', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT927', N'P198', N'NV274', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT928', N'P198', N'NV469', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT929', N'P199', N'NV275', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT930', N'P199', N'NV470', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT931', N'P199', N'NV276', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT932', N'P199', N'NV471', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT933', N'P199', N'NV277', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT934', N'P199', N'NV472', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT935', N'P201', N'NV278', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT936', N'P201', N'NV470', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT937', N'P201', N'NV276', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT938', N'P201', N'NV471', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT939', N'P201', N'NV277', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT940', N'P201', N'NV472', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT941', N'P57', N'NV012', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT942', N'P57', N'NV029', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT943', N'P57', N'NV467', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT944', N'P57', N'NV259', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT945', N'P57', N'NV260', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT946', N'P57', N'NV468', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT947', N'P57', N'NV261', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT948', N'P57', N'NV262', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT949', N'P57', N'NV469', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT950', N'P58', N'NV263', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT951', N'P58', N'NV264', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT952', N'P58', N'NV470', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT953', N'P58', N'NV265', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT954', N'P58', N'NV266', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT955', N'P58', N'NV471', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT956', N'P58', N'NV267', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT957', N'P58', N'NV268', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT958', N'P58', N'NV472', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT959', N'P196', N'NV269', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT960', N'P196', N'NV467', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT961', N'P196', N'NV270', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT962', N'P196', N'NV468', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT963', N'P196', N'NV271', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT964', N'P196', N'NV469', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT965', N'P198', N'NV272', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT966', N'P198', N'NV467', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT967', N'P198', N'NV273', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT968', N'P198', N'NV468', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT969', N'P198', N'NV274', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT970', N'P198', N'NV469', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT971', N'P199', N'NV275', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT972', N'P199', N'NV470', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT973', N'P199', N'NV276', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT974', N'P199', N'NV471', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT975', N'P199', N'NV277', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT976', N'P199', N'NV472', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT977', N'P201', N'NV278', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT978', N'P201', N'NV470', N'6h-14h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT979', N'P201', N'NV276', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT980', N'P201', N'NV471', N'14h-22h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT981', N'P201', N'NV277', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT982', N'P201', N'NV472', N'22h-6h', CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT983', N'P62', N'NV013', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT984', N'P62', N'NV030', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT985', N'P62', N'NV473', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT986', N'P62', N'NV279', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT987', N'P62', N'NV280', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT988', N'P62', N'NV474', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT989', N'P62', N'NV282', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT990', N'P62', N'NV281', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT991', N'P62', N'NV475', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT992', N'P113', N'NV283', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT993', N'P113', N'NV284', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT994', N'P113', N'NV476', N'6h-14h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT995', N'P113', N'NV285', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT996', N'P113', N'NV286', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT997', N'P113', N'NV477', N'14h-22h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT998', N'P113', N'NV287', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CaTruc] ([MaCT], [MaPhong], [MaNV], [Ca], [NgayTruc]) VALUES (N'CT999', N'P113', N'NV288', N'22h-6h', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT001', N'AMO-MY-CTCDHG-T125', N'LO-20241113-AMO-MY-CTCDHG-T125', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT001', N'ATO-HQ-CTCDHG-B400', N'LO-20241110-ATO-HQ-CTCDHG-B400', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT001', N'IBU-ANH-CTCDPI-T140', N'LO-20240912-IBU-ANH-CTCDPI-T140', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT002', N'AMO-MY-CTCDHG-T125', N'LO-20241113-AMO-MY-CTCDHG-T125', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT002', N'IBU-ANH-CTCDPI-T140', N'LO-20240912-IBU-ANH-CTCDPI-T140', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT002', N'LIS-PHAP-CTCXNKYTD-B500', N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT003', N'AMO-MY-CTCDHG-T125', N'LO-20241113-AMO-MY-CTCDHG-T125', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT003', N'AMO-MY-CTCP-V500', N'LO-20241029-AMO-MY-CTCP-V500', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT004', N'ATO-HQ-CTCDHG-B400', N'LO-20241110-ATO-HQ-CTCDHG-B400', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT004', N'LOS-HK-CTCT-V80', N'LO-20241113-LOS-HK-CTCT-V80', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT004', N'MET-NB-CTCDPHT-T150', N'LO-20241108-MET-NB-CTCDPHT-T150', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT004', N'SIM-CANADA-CTCDPI-T150', N'LO-20241112-SIM-CANADA-CTCDPI-T150', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT005', N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT005', N'MET-NB-CTCDPO-B350', N'LO-20241009-MET-NB-CTCDPO-B350', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT005', N'SIM-CANADA-CTCT-B300', N'LO-20241112-SIM-CANADA-CTCT-B300', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT006', N'ATO-HQ-CTCDHG-B400', N'LO-20241110-ATO-HQ-CTCDHG-B400', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT006', N'LOS-UC-CTTSAVN-B400', N'LO-20241106-LOS-UC-CTTSAVN-B400', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT007', N'AMO-MY-CTCP-V500', N'LO-20241029-AMO-MY-CTCP-V500', 2, N'1 ngày 2 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT007', N'AMO-MY-CTCT-B500', N'LO-20241013-AMO-MY-CTCT-B500', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT008', N'MET-NB-CTCDPHT-T150', N'LO-20241108-MET-NB-CTCDPHT-T150', 2, N'1 ngày 2 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT008', N'MET-TD-CTCDPHT-V500', N'LO-20241101-MET-TD-CTCDPHT-V500', 2, N'1 ngày 1 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT008', N'SIM-ANH-CTCDHG-V80', N'LO-20241108-SIM-ANH-CTCDHG-V80', 4, N'1 ngày 2 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT009', N'AMO-MY-CTCP-V500', N'LO-20241029-AMO-MY-CTCP-V500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT009', N'OME-DUC-CTCP-T140', N'LO-20241101-OME-DUC-CTCP-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT009', N'SIM-DUC-CTCT-V40', N'LO-20241028-SIM-DUC-CTCT-V40', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT010', N'ATO-HQ-CTCT-T150', N'LO-20241113-ATO-HQ-CTCT-T150', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT010', N'ATO-TS-CTCDPHT-V10', N'LO-20241102-ATO-TS-CTCDPHT-V10', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT010', N'LIS-ANH-CTCDPO-V5', N'LO-20241110-LIS-ANH-CTCDPO-V5', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT011', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT011', N'LIS-PHAP-CTCDPT-T130', N'LO-20241104-LIS-PHAP-CTCDPT-T130', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT011', N'OME-DUC-CTCP-T140', N'LO-20241101-OME-DUC-CTCP-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT012', N'OME-PHAP-CTCDPT-V20', N'LO-20241017-OME-PHAP-CTCDPT-V20', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT012', N'SIM-ANH-CTCDHG-V80', N'LO-20241108-SIM-ANH-CTCDHG-V80', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT012', N'SIM-CANADA-CTCDPI-T150', N'LO-20241112-SIM-CANADA-CTCDPI-T150', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT013', N'LIS-ANH-CTCDPT-V40', N'LO-20241023-LIS-ANH-CTCDPT-V40', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT013', N'LIS-PHAP-CTCDPT-T130', N'LO-20241104-LIS-PHAP-CTCDPT-T130', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT013', N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT014', N'LIS-ANH-CTCDPT-V40', N'LO-20241023-LIS-ANH-CTCDPT-V40', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT014', N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT014', N'SIM-CANADA-CTCDPI-T150', N'LO-20241112-SIM-CANADA-CTCDPI-T150', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT015', N'ATO-HQ-CTCT-T150', N'LO-20241113-ATO-HQ-CTCT-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT015', N'ATO-VN-CTCDHG-V40', N'LO-20241105-ATO-VN-CTCDHG-V40', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT016', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT016', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT017', N'ATO-HQ-CTCT-T150', N'LO-20241113-ATO-HQ-CTCT-T150', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT017', N'LOS-UC-CTTSAVN-B400', N'LO-20241106-LOS-UC-CTTSAVN-B400', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT017', N'MET-TL-CTCDPO-V850', N'LO-20241026-MET-TL-CTCDPO-V850', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT018', N'OME-DUC-CTCP-T140', N'LO-20241101-OME-DUC-CTCP-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT018', N'OME-PHAP-CTCDPT-V20', N'LO-20241017-OME-PHAP-CTCDPT-V20', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT018', N'SIM-CANADA-CTCDPI-T150', N'LO-20241112-SIM-CANADA-CTCDPI-T150', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT018', N'SIM-CANADA-CTCT-B300', N'LO-20241112-SIM-CANADA-CTCT-B300', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT019', N'AMO-MY-CTCDHG-T125', N'LO-20241113-AMO-MY-CTCDHG-T125', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT019', N'AMO-VN-CTCDTTBYTBD-V250', N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT019', N'ATO-HQ-CTCDHG-B400', N'LO-20241110-ATO-HQ-CTCDHG-B400', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT020', N'ATO-TS-CTCDPHT-V10', N'LO-20241102-ATO-TS-CTCDPHT-V10', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT020', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT020', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT021', N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT021', N'MET-NB-CTCDPO-B350', N'LO-20241009-MET-NB-CTCDPO-B350', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT021', N'OME-DUC-CTCP-T140', N'LO-20241101-OME-DUC-CTCP-T140', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT022', N'OME-DL-CTCXNKYTD-V20', N'LO-04112024-OME-DL-CTCXNKYTD-V20', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT022', N'OME-PHAP-CTCDPT-V20', N'LO-20241017-OME-PHAP-CTCDPT-V20', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT023', N'AMO-MY-CTCT-B500', N'LO-20241013-AMO-MY-CTCT-B500', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT023', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT023', N'OME-PHAP-CTCDPT-V20', N'LO-20241017-OME-PHAP-CTCDPT-V20', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT023', N'SIM-CANADA-CTCDPI-T150', N'LO-20241112-SIM-CANADA-CTCDPI-T150', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT024', N'IBU-UC-CTCP-V400', N'LO-20241030-IBU-UC-CTCP-V400', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT024', N'LIS-ANH-CTCDPT-V40', N'LO-20241023-LIS-ANH-CTCDPT-V40', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT024', N'LOS-DL-CTCT-V25', N'LO-20241009-LOS-DL-CTCT-V25', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT025', N'ATO-VN-CTCDHG-V40', N'LO-20241105-ATO-VN-CTCDHG-V40', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT025', N'IBU-UC-CTCP-V400', N'LO-20241030-IBU-UC-CTCP-V400', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT025', N'MET-NB-CTCDPHT-T150', N'LO-20241108-MET-NB-CTCDPHT-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT026', N'ATO-HQ-CTCT-T150', N'LO-20241113-ATO-HQ-CTCT-T150', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT026', N'ATO-TS-CTCDPHT-V10', N'LO-20241102-ATO-TS-CTCDPHT-V10', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT026', N'SIM-CANADA-CTCDPI-T150', N'LO-20241112-SIM-CANADA-CTCDPI-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT027', N'ATO-VN-CTCDHG-V40', N'LO-20241105-ATO-VN-CTCDHG-V40', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT027', N'IBU-ANH-CTCDPI-T140', N'LO-20240912-IBU-ANH-CTCDPI-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT028', N'ATO-HQ-CTCT-T150', N'LO-20241113-ATO-HQ-CTCT-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT028', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT028', N'MET-NB-CTCDPO-B350', N'LO-20241009-MET-NB-CTCDPO-B350', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT029', N'OME-DL-CTCXNKYTD-V20', N'LO-04112024-OME-DL-CTCXNKYTD-V20', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT029', N'SIM-CANADA-CTCDPI-T150', N'LO-20241112-SIM-CANADA-CTCDPI-T150', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT030', N'AMO-MY-CTCDHG-T125', N'LO-20241113-AMO-MY-CTCDHG-T125', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT030', N'AMO-MY-CTCP-V500', N'LO-20241029-AMO-MY-CTCP-V500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT030', N'AMO-MY-CTCT-B500', N'LO-20241013-AMO-MY-CTCT-B500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT030', N'SIM-CANADA-CTCDPI-T150', N'LO-20241112-SIM-CANADA-CTCDPI-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT031', N'LOS-DL-CTCT-V25', N'LO-20241009-LOS-DL-CTCT-V25', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT031', N'MET-NB-CTCDPO-B350', N'LO-20241009-MET-NB-CTCDPO-B350', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT031', N'OME-DL-CTCXNKYTD-V20', N'LO-04112024-OME-DL-CTCXNKYTD-V20', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT032', N'AMO-MY-CTCT-B500', N'LO-20241013-AMO-MY-CTCT-B500', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT032', N'ATO-HQ-CTCT-T150', N'LO-20241113-ATO-HQ-CTCT-T150', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT032', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT033', N'AMO-MY-CTCT-B500', N'LO-20241013-AMO-MY-CTCT-B500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT033', N'ATO-HQ-CTCT-T150', N'LO-20241113-ATO-HQ-CTCT-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT034', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT034', N'LIS-PHAP-CTCXNKYTD-B500', N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT034', N'MET-NB-CTCDPO-B350', N'LO-20241009-MET-NB-CTCDPO-B350', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT035', N'LOS-DL-CTCT-V25', N'LO-20241009-LOS-DL-CTCT-V25', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT035', N'MET-NB-CTCDPO-B350', N'LO-20241009-MET-NB-CTCDPO-B350', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT035', N'OME-DL-CTCXNKYTD-V20', N'LO-04112024-OME-DL-CTCXNKYTD-V20', 3, N'1 ngày 3 lần')
GO
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT036', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT036', N'LOS-DL-CTCT-V25', N'LO-20241009-LOS-DL-CTCT-V25', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT037', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT037', N'LIS-ANH-CTCDPO-V5', N'LO-20241110-LIS-ANH-CTCDPO-V5', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT037', N'LOS-HK-CTCT-V80', N'LO-20241113-LOS-HK-CTCT-V80', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT038', N'LIS-ANH-CTCDPO-V5', N'LO-20241110-LIS-ANH-CTCDPO-V5', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT038', N'LOS-HK-CTCT-V80', N'LO-20241113-LOS-HK-CTCT-V80', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT039', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT039', N'MET-NB-CTCDPHT-T150', N'LO-20241108-MET-NB-CTCDPHT-T150', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT039', N'OME-PHAP-CTCDPT-V20', N'LO-20241017-OME-PHAP-CTCDPT-V20', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT040', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT040', N'MET-NB-CTCDPHT-T150', N'LO-20241108-MET-NB-CTCDPHT-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT040', N'OME-PHAP-CTCDPT-V20', N'LO-20241017-OME-PHAP-CTCDPT-V20', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT041', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT041', N'LIS-ANH-CTCDPO-V5', N'LO-20241110-LIS-ANH-CTCDPO-V5', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT042', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT042', N'LIS-ANH-CTCDPO-V5', N'LO-20241110-LIS-ANH-CTCDPO-V5', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT042', N'LOS-UC-CTTSAVN-B400', N'LO-20241106-LOS-UC-CTTSAVN-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT043', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT043', N'LOS-UC-CTTSAVN-B400', N'LO-20241106-LOS-UC-CTTSAVN-B400', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT044', N'LIS-PHAP-CTCDPT-T130', N'LO-20241104-LIS-PHAP-CTCDPT-T130', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT044', N'LOS-UC-CTTSAVN-B400', N'LO-20241106-LOS-UC-CTTSAVN-B400', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT044', N'MET-TL-CTCDPO-V850', N'LO-20241026-MET-TL-CTCDPO-V850', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT045', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT045', N'LIS-PHAP-CTCDPT-T130', N'LO-20241104-LIS-PHAP-CTCDPT-T130', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT045', N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT046', N'ATO-VN-CTCDHG-V40', N'LO-20241105-ATO-VN-CTCDHG-V40', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT046', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT046', N'LIS-ANH-CTCDPO-V5', N'LO-20241110-LIS-ANH-CTCDPO-V5', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT047', N'ATO-VN-CTCDHG-V40', N'LO-20241105-ATO-VN-CTCDHG-V40', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT047', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT047', N'LIS-ANH-CTCDPO-V5', N'LO-20241110-LIS-ANH-CTCDPO-V5', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT048', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT048', N'LIS-ANH-CTCDPT-V40', N'LO-20241023-LIS-ANH-CTCDPT-V40', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT048', N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT049', N'IBU-ANH-CTCDPI-T140', N'LO-20240912-IBU-ANH-CTCDPI-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT049', N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT050', N'ATO-VN-CTCDHG-V40', N'LO-20241105-ATO-VN-CTCDHG-V40', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT050', N'IBU-ANH-CTCDPI-T140', N'LO-20240912-IBU-ANH-CTCDPI-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT050', N'LIS-PHAP-CTCXNKYTD-B500', N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT051', N'ATO-VN-CTCDHG-V40', N'LO-20241105-ATO-VN-CTCDHG-V40', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT051', N'LIS-ANH-CTCDPT-V40', N'LO-20241023-LIS-ANH-CTCDPT-V40', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT051', N'LIS-PHAP-CTCXNKYTD-B500', N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT052', N'ATO-VN-CTCDHG-V40', N'LO-20241105-ATO-VN-CTCDHG-V40', 3, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT052', N'LIS-PHAP-CTCXNKYTD-B500', N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT052', N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT053', N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT053', N'MET-NB-CTCDPHT-T150', N'LO-20241108-MET-NB-CTCDPHT-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT054', N'LOS-HK-CTCT-V80', N'LO-20241113-LOS-HK-CTCT-V80', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT054', N'OME-DL-CTCXNKYTD-V20', N'LO-04112024-OME-DL-CTCXNKYTD-V20', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT054', N'SIM-ANH-CTCDHG-V80', N'LO-20241108-SIM-ANH-CTCDHG-V80', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT055', N'LOS-DL-CTCT-V25', N'LO-20241009-LOS-DL-CTCT-V25', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT055', N'LOS-HK-CTCT-V80', N'LO-20241113-LOS-HK-CTCT-V80', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT056', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT056', N'LOS-DL-CTCT-V25', N'LO-20241009-LOS-DL-CTCT-V25', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT056', N'SIM-ANH-CTCDHG-V80', N'LO-20241108-SIM-ANH-CTCDHG-V80', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT057', N'AMO-MY-CTCDHG-T125', N'LO-20241113-AMO-MY-CTCDHG-T125', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT057', N'ATO-HQ-CTCDHG-B400', N'LO-20241110-ATO-HQ-CTCDHG-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT058', N'AMO-MY-CTCDHG-T125', N'LO-20241113-AMO-MY-CTCDHG-T125', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT058', N'IBU-ANH-CTCDPI-T140', N'LO-20240912-IBU-ANH-CTCDPI-T140', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT058', N'LIS-ANH-CTCDPT-V40', N'LO-20241023-LIS-ANH-CTCDPT-V40', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT059', N'IBU-ANH-CTCDPI-T140', N'LO-20240912-IBU-ANH-CTCDPI-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT059', N'LOS-DL-CTCT-V25', N'LO-20241009-LOS-DL-CTCT-V25', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT060', N'ATO-HQ-CTCDHG-B400', N'LO-20241110-ATO-HQ-CTCDHG-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT060', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT060', N'LOS-DL-CTCT-V25', N'LO-20241009-LOS-DL-CTCT-V25', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT061', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT061', N'LOS-DL-CTCT-V25', N'LO-20241009-LOS-DL-CTCT-V25', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT061', N'LOS-UC-CTTSAVN-B400', N'LO-20241106-LOS-UC-CTTSAVN-B400', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT062', N'AMO-VN-CTCDTTBYTBD-V250', N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT062', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT063', N'ATO-HQ-CTCT-T150', N'LO-20241113-ATO-HQ-CTCT-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT063', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT063', N'OME-PHAP-CTCDPT-V20', N'LO-20241017-OME-PHAP-CTCDPT-V20', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT064', N'OME-PHAP-CTCDPT-V20', N'LO-20241017-OME-PHAP-CTCDPT-V20', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT064', N'SIM-CANADA-CTCDPI-T150', N'LO-20241112-SIM-CANADA-CTCDPI-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT065', N'LIS-PHAP-CTCDPT-T130', N'LO-20241104-LIS-PHAP-CTCDPT-T130', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT065', N'SIM-DUC-CTCT-V40', N'LO-20241028-SIM-DUC-CTCT-V40', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT066', N'LIS-PHAP-CTCDPT-T130', N'LO-20241104-LIS-PHAP-CTCDPT-T130', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT066', N'LOS-DL-CTCT-V25', N'LO-20241009-LOS-DL-CTCT-V25', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT066', N'SIM-DUC-CTCT-V40', N'LO-20241028-SIM-DUC-CTCT-V40', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT067', N'AMO-MY-CTCDHG-T125', N'LO-20241113-AMO-MY-CTCDHG-T125', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT067', N'ATO-TS-CTCDPHT-V10', N'LO-20241102-ATO-TS-CTCDPHT-V10', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT068', N'AMO-MY-CTCDHG-T125', N'LO-20241113-AMO-MY-CTCDHG-T125', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT068', N'IBU-ANH-CTCDPI-T140', N'LO-20240912-IBU-ANH-CTCDPI-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT069', N'ATO-TS-CTCDPHT-V10', N'LO-20241102-ATO-TS-CTCDPHT-V10', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT069', N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT069', N'OME-DL-CTCXNKYTD-V20', N'LO-04112024-OME-DL-CTCXNKYTD-V20', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT070', N'IBU-ANH-CTCDPI-T140', N'LO-20240912-IBU-ANH-CTCDPI-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT070', N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT070', N'OME-DL-CTCXNKYTD-V20', N'LO-04112024-OME-DL-CTCXNKYTD-V20', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT071', N'ATO-VN-CTCDHG-V40', N'LO-20241105-ATO-VN-CTCDHG-V40', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT071', N'LIS-PHAP-CTCXNKYTD-B500', N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT071', N'LOS-UC-CTTSAVN-B400', N'LO-20241106-LOS-UC-CTTSAVN-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT072', N'ATO-VN-CTCDHG-V40', N'LO-20241105-ATO-VN-CTCDHG-V40', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT072', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT072', N'LIS-PHAP-CTCXNKYTD-B500', N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT073', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT073', N'OME-DL-CTCXNKYTD-V20', N'LO-04112024-OME-DL-CTCXNKYTD-V20', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT073', N'SIM-ANH-CTCDHG-V80', N'LO-20241108-SIM-ANH-CTCDHG-V80', 6, N'1 ngày 3 lần')
GO
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT074', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT074', N'LIS-PHAP-CTCXNKYTD-B500', N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT074', N'MET-NB-CTCDPHT-T150', N'LO-20241108-MET-NB-CTCDPHT-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT075', N'ATO-VN-CTCDHG-V40', N'LO-20241105-ATO-VN-CTCDHG-V40', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT075', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT076', N'LIS-PHAP-CTCDPT-T130', N'LO-20241104-LIS-PHAP-CTCDPT-T130', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT076', N'LOS-UC-CTTSAVN-B400', N'LO-20241106-LOS-UC-CTTSAVN-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT076', N'MET-NB-CTCDPHT-T150', N'LO-20241108-MET-NB-CTCDPHT-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT077', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT077', N'LIS-PHAP-CTCDPT-T130', N'LO-20241104-LIS-PHAP-CTCDPT-T130', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT077', N'MET-NB-CTCDPO-B350', N'LO-20241009-MET-NB-CTCDPO-B350', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT078', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT078', N'LIS-ANH-CTCDPO-V5', N'LO-20241110-LIS-ANH-CTCDPO-V5', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT078', N'MET-NB-CTCDPO-B350', N'LO-20241009-MET-NB-CTCDPO-B350', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT079', N'AMO-MY-CTCP-V500', N'LO-20241029-AMO-MY-CTCP-V500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT079', N'ATO-VN-CTCDHG-V40', N'LO-20241105-ATO-VN-CTCDHG-V40', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT079', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT079', N'LOS-DL-CTCT-V25', N'LO-20241009-LOS-DL-CTCT-V25', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT080', N'ATO-HQ-CTCDHG-B400', N'LO-20241110-ATO-HQ-CTCDHG-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT080', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT080', N'LIS-ANH-CTCDPT-V40', N'LO-20241023-LIS-ANH-CTCDPT-V40', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT081', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT081', N'LIS-PHAP-CTCDPT-T130', N'LO-20241104-LIS-PHAP-CTCDPT-T130', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT082', N'AMO-MY-CTCDHG-T125', N'LO-20241113-AMO-MY-CTCDHG-T125', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT082', N'ATO-TS-CTCDPHT-V10', N'LO-20241102-ATO-TS-CTCDPHT-V10', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT082', N'MET-TD-CTCDPHT-V500', N'LO-20241101-MET-TD-CTCDPHT-V500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT083', N'LIS-PHAP-CTCDPT-T130', N'LO-20241104-LIS-PHAP-CTCDPT-T130', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT083', N'MET-TD-CTCDPHT-V500', N'LO-20241101-MET-TD-CTCDPHT-V500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT083', N'OME-DUC-CTCP-T140', N'LO-20241101-OME-DUC-CTCP-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT084', N'ATO-HQ-CTCT-T150', N'LO-20241113-ATO-HQ-CTCT-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT084', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT084', N'LIS-PHAP-CTCDPT-T130', N'LO-20241104-LIS-PHAP-CTCDPT-T130', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT085', N'ATO-HQ-CTCT-T150', N'LO-20241113-ATO-HQ-CTCT-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT085', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT086', N'ATO-HQ-CTCT-T150', N'LO-20241113-ATO-HQ-CTCT-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT086', N'LOS-DL-CTCT-V25', N'LO-20241009-LOS-DL-CTCT-V25', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT086', N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT087', N'IBU-ANH-CTCDPI-T140', N'LO-20240912-IBU-ANH-CTCDPI-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT087', N'LIS-ANH-CTCDPT-V40', N'LO-20241023-LIS-ANH-CTCDPT-V40', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT087', N'OME-DUC-CTCP-T140', N'LO-20241101-OME-DUC-CTCP-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT088', N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT088', N'MET-TD-CTCDPHT-V500', N'LO-20241101-MET-TD-CTCDPHT-V500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT088', N'SIM-CANADA-CTCDPI-T150', N'LO-20241112-SIM-CANADA-CTCDPI-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT089', N'LIS-ANH-CTCDPO-V5', N'LO-20241110-LIS-ANH-CTCDPO-V5', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT089', N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT089', N'OME-PHAP-CTCDPT-V20', N'LO-20241017-OME-PHAP-CTCDPT-V20', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT090', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT090', N'LIS-ANH-CTCDPT-V40', N'LO-20241023-LIS-ANH-CTCDPT-V40', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT091', N'MET-NB-CTCDPHT-T150', N'LO-20241108-MET-NB-CTCDPHT-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT091', N'OME-DL-CTCXNKYTD-V20', N'LO-04112024-OME-DL-CTCXNKYTD-V20', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT092', N'MET-TD-CTCDPHT-V500', N'LO-20241101-MET-TD-CTCDPHT-V500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT092', N'OME-DL-CTCXNKYTD-V20', N'LO-04112024-OME-DL-CTCXNKYTD-V20', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT092', N'SIM-ANH-CTCDHG-V80', N'LO-20241108-SIM-ANH-CTCDHG-V80', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT093', N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT093', N'LIS-ANH-CTCDPO-V5', N'LO-20241110-LIS-ANH-CTCDPO-V5', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT093', N'MET-TD-CTCDPHT-V500', N'LO-20241101-MET-TD-CTCDPHT-V500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT094', N'LIS-ANH-CTCDPO-V5', N'LO-20241110-LIS-ANH-CTCDPO-V5', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT094', N'MET-TD-CTCDPHT-V500', N'LO-20241101-MET-TD-CTCDPHT-V500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT095', N'OME-DUC-CTCP-T140', N'LO-20241101-OME-DUC-CTCP-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT095', N'SIM-ANH-CTCDHG-V80', N'LO-20241108-SIM-ANH-CTCDHG-V80', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT096', N'LIS-ANH-CTCDPO-V5', N'LO-20241110-LIS-ANH-CTCDPO-V5', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT096', N'OME-DUC-CTCP-T140', N'LO-20241101-OME-DUC-CTCP-T140', 9, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT096', N'SIM-ANH-CTCDHG-V80', N'LO-20241108-SIM-ANH-CTCDHG-V80', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT097', N'ATO-HQ-CTCT-T150', N'LO-20241113-ATO-HQ-CTCT-T150', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT097', N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT098', N'AMO-MY-CTCT-B500', N'LO-20241013-AMO-MY-CTCT-B500', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT098', N'LIS-PHAP-CTCDPT-T130', N'LO-20241104-LIS-PHAP-CTCDPT-T130', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT098', N'OME-DUC-CTCP-T140', N'LO-20241101-OME-DUC-CTCP-T140', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT099', N'OME-PHAP-CTCDPT-V20', N'LO-20241017-OME-PHAP-CTCDPT-V20', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT099', N'SIM-ANH-CTCDHG-V80', N'LO-20241108-SIM-ANH-CTCDHG-V80', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT100', N'AMO-VN-CTCDTTBYTBD-V250', N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250', 6, N'1 ngày 3 lần')
INSERT [dbo].[ChiTietDonThuoc] ([MaDonThuoc], [MaThuoc], [MaLo], [SoLuong], [CachDung]) VALUES (N'DT100', N'SIM-CANADA-CTCT-B300', N'LO-20241112-SIM-CANADA-CTCT-B300', 6, N'1 ngày 3 lần')
GO
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB001', N'NV002', N'Cảm cúm', CAST(N'2024-04-13T10:45:00.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB002', N'NV199', N'Đau nửa đầu', CAST(N'2024-05-02T03:00:00.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB003', N'NV145', N'Viêm da dị ứng', CAST(N'2024-04-13T07:23:00.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB004', N'NV166', N'Viêm xoang', CAST(N'2024-05-02T09:12:32.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB005', N'NV077', N'Viêm loét đại tràng', CAST(N'2024-04-13T21:55:21.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB006', N'NV058', N'Chấn thương cơ bắp', CAST(N'2024-05-02T07:55:04.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB007', N'NV007', N'Viêm nướu', CAST(N'2024-04-13T10:24:21.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB008', N'NV065', N'Cường giáp', CAST(N'2024-05-02T16:36:27.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB009', N'NV311', N'Viêm phế quản mãn tính', CAST(N'2024-04-13T18:00:00.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB010', N'NV204', N'Trầm cảm', CAST(N'2024-05-02T00:24:34.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB100', N'NV267', N'Viêm nướu', CAST(N'2024-05-02T23:06:21.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB11', N'NV058', N'Viêm amidan', CAST(N'2024-04-13T09:56:23.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB12', N'NV071', N'Sỏi thận', CAST(N'2024-05-02T17:30:21.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB13', N'NV007', N'Viêm tai giữa', CAST(N'2024-04-13T14:01:30.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB14', N'NV163', N'Viêm tai giữa', CAST(N'2024-05-02T19:00:00.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB15', N'NV190', N'Rối loạn thận', CAST(N'2024-04-13T02:15:34.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB16', N'NV055', N'Nhiễm trùng tiêu hóa', CAST(N'2024-05-02T06:13:03.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB17', N'NV057', N'Covid-19', CAST(N'2024-04-13T08:00:00.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB18', N'NV058', N'Cảm lạnh', CAST(N'2024-05-02T13:45:15.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB19', N'NV198', N'Bệnh nhược cơ', CAST(N'2024-04-13T17:34:31.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB20', N'NV204', N'Rối loạn giấc ngủ', CAST(N'2024-05-02T02:55:23.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB21', N'NV062', N'Ngộ độc thực phẩm', CAST(N'2024-04-13T03:03:12.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB22', N'NV054', N'Trào ngược dạ dày', CAST(N'2024-05-02T18:39:10.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB23', N'NV059', N'Nhiễm trùng đường ruột', CAST(N'2024-04-13T19:36:01.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB24', N'NV203', N'Ngưng thở khi ngủ', CAST(N'2024-05-02T21:59:59.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB25', N'NV143', N'Trầm cảm', CAST(N'2024-04-13T22:01:59.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB26', N'NV201', N'Nốt ruồi viêm', CAST(N'2024-05-02T13:12:08.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB27', N'NV079', N'Trĩ ngoại', CAST(N'2024-04-13T04:50:12.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB28', N'NV231', N'Nhồi máu cơ tim', CAST(N'2024-05-02T22:00:00.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB29', N'NV228', N'Động mạch vành', CAST(N'2024-04-13T22:01:02.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB30', N'NV199', N'Rối loạn giấc ngủ', CAST(N'2024-05-02T23:04:34.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB31', N'NV200', N'Trào ngược dạ dày thực quản', CAST(N'2024-04-13T09:34:45.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB32', N'NV071', N'Suy giáp', CAST(N'2024-05-02T20:30:45.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB33', N'NV241', N'Viêm khớp', CAST(N'2024-04-13T02:45:21.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB34', N'NV206', N'Đột quỵ', CAST(N'2024-05-02T11:32:10.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB35', N'NV151', N'Mụn trứng cá', CAST(N'2024-04-13T07:08:23.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB36', N'NV057', N'Cảm cúm', CAST(N'2024-05-02T11:14:02.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB37', N'NV053', N'Viêm phế quản', CAST(N'2024-04-13T15:50:34.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB38', N'NV058', N'Viêm loét dạ dày', CAST(N'2024-05-02T12:20:04.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB39', N'NV033', N'Rubella', CAST(N'2024-04-13T15:25:30.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB40', N'NV230', N'Hẹp van tim', CAST(N'2024-05-02T11:16:24.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB41', N'NV232', N'Suy tim', CAST(N'2024-04-13T02:00:23.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB42', N'NV334', N'Sốt rét', CAST(N'2024-05-02T03:10:34.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB43', N'NV086', N'Trĩ', CAST(N'2024-04-13T05:34:23.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB44', N'NV024', N'Hen suyễn', CAST(N'2024-05-02T14:34:57.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB45', N'NV206', N'U não', CAST(N'2024-04-13T11:12:40.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB46', N'NV066', N'Đái tháo đường', CAST(N'2024-05-02T15:23:19.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB47', N'NV168', N'Viêm xoang', CAST(N'2024-04-13T16:11:34.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB48', N'NV070', N'Tiểu đường loại I', CAST(N'2024-05-02T07:45:34.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB49', N'NV198', N'Chứng sợ nước', CAST(N'2024-04-13T21:02:12.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB50', N'NV207', N'Chứng sợ nước', CAST(N'2024-05-02T17:02:03.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB51', N'NV259', N'Sâu răng', CAST(N'2024-04-13T16:56:57.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB52', N'NV183', N'Cầu thận', CAST(N'2024-05-02T18:41:39.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB53', N'NV223', N'Động mạch vành', CAST(N'2024-04-13T18:24:20.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB54', N'NV171', N'Viêm xoang', CAST(N'2024-05-02T00:17:12.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB55', N'NV164', N'Viêm xoang', CAST(N'2024-04-13T00:45:34.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB56', N'NV205', N'Rối loạn thần kinh', CAST(N'2024-05-02T01:34:21.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB57', N'NV166', N'Viêm họng', CAST(N'2024-04-13T07:34:21.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB58', N'NV244', N'Nhiễm trùng khớp', CAST(N'2024-05-02T03:45:23.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB59', N'NV230', N'Đột quỵ', CAST(N'2024-04-13T09:14:23.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB60', N'NV082', N'Trĩ', CAST(N'2024-05-02T12:01:02.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB61', N'NV057', N'Cường giáp', CAST(N'2024-04-13T08:15:23.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB62', N'NV085', N'Trĩ', CAST(N'2024-05-02T01:15:16.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB63', N'NV191', N'Tắc mật', CAST(N'2024-04-13T01:45:32.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB64', N'NV035', N'Chảy máu cấp tính', CAST(N'2024-05-02T02:10:34.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB65', N'NV199', N'Tăng động', CAST(N'2024-04-13T02:30:45.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB66', N'NV082', N'Viêm ruột thừa', CAST(N'2024-05-02T08:23:24.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB67', N'NV062', N'Lo âu', CAST(N'2024-04-13T03:16:30.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB68', N'NV002', N'Viêm túi mật', CAST(N'2024-05-02T14:23:20.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB69', N'NV071', N'Hạ đường huyết', CAST(N'2024-04-13T15:17:18.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB70', N'NV053', N'Suy giáp', CAST(N'2024-05-02T15:35:39.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB71', N'NV308', N'Lao phổi', CAST(N'2024-04-13T15:45:00.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB72', N'NV072', N'Rối loạn tuyến yên', CAST(N'2024-05-02T05:23:12.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB73', N'NV246', N'Viêm khớp', CAST(N'2024-04-13T11:17:20.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB74', N'NV060', N'Dị ứng hải sản', CAST(N'2024-05-02T22:56:57.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB75', N'NV038', N'Rối loạn đông máu', CAST(N'2024-04-13T03:34:45.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB76', N'NV198', N'Rối loạn vận động', CAST(N'2024-05-02T16:00:01.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB77', N'NV204', N'Alzheimer', CAST(N'2024-04-13T01:45:32.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB78', N'NV192', N'Bệnh gan', CAST(N'2024-05-02T15:21:34.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB79', N'NV188', N'Rối loạn huyết học', CAST(N'2024-04-13T15:45:50.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB80', N'NV199', N'Động kinh', CAST(N'2024-05-02T02:15:37.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB81', N'NV190', N'Tăng bilirubin máu', CAST(N'2024-04-13T02:12:34.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB82', N'NV199', N'Động kinh', CAST(N'2024-05-02T01:30:45.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB83', N'NV061', N'Cảm cúm', CAST(N'2024-04-13T00:30:23.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB84', N'NV007', N'Viêm mũi dị ứng', CAST(N'2024-05-02T15:19:20.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB85', N'NV192', N'Tiểu đường', CAST(N'2024-04-13T10:05:06.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB86', N'NV168', N'Viêm xoang', CAST(N'2024-05-02T15:25:34.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB87', N'NV236', N'Nhồi máu cơ tim', CAST(N'2024-04-13T15:24:45.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB88', N'NV282', N'Ung thư di căn', CAST(N'2024-05-02T02:26:21.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB89', N'NV198', N'Đau nửa đầu', CAST(N'2024-04-13T15:25:12.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB90', N'NV083', N'Trĩ', CAST(N'2024-05-02T16:55:34.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB91', N'NV198', N'U đại tràng', CAST(N'2024-04-13T15:17:18.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB92', N'NV057', N'Viêm màng não', CAST(N'2024-05-02T10:44:23.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB93', N'NV332', N'Sốt rét', CAST(N'2024-04-13T10:34:21.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB94', N'NV198', N'Nhiễm trùng nào', CAST(N'2024-05-02T16:03:24.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB95', N'NV002', N'Cường giáp', CAST(N'2024-04-13T09:00:34.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB96', N'NV334', N'Viêm đường tiết niệu', CAST(N'2024-05-02T23:12:23.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB97', N'NV062', N'Căng thẳng kéo dài', CAST(N'2024-04-13T00:45:47.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB98', N'NV056', N'Thiếu ngủ', CAST(N'2024-05-02T01:34:45.000' AS DateTime))
INSERT [dbo].[ChuanDoan] ([MaPhieuKB], [MaNV], [ChuanDoan], [NgayChuanDoan]) VALUES (N'PKB99', N'NV036', N'Viêm ruột thừa', CAST(N'2024-04-13T11:05:06.000' AS DateTime))
GO
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV1', N'Trưởng Khoa')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV2', N'Phó Khoa')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV3', N'Bác Sĩ')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV4', N'Y Tá')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV5', N'Quản trị hệ thống')
GO
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN1', N'Chuyên khoa Hồi sức và Chăm sóc cấp cứu', N'K1')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN10', N'Chuyên khoa Nhi Khoa Tim mạch', N'K4')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN11', N'Chuyên khoa Nhi Khoa Tổng Quát', N'K4')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN12', N'Chuyên khoa Phục hồi chức năng Thần kinh', N'K5')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN13', N'Chuyên khoa Phục hồi chức năng Vật lý', N'K5')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN14', N'Chuyên khoa Da Liễu Tổng Quát', N'K6')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN15', N'Chuyên khoa Da Liễu Nội tiết', N'K6')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN16', N'Chuyên khoa Da Liễu Nhi', N'K6')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN17', N'Chuyên khoa Tai', N'K7')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN18', N'Chuyên khoa Mũi-Họng', N'K7')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN19', N'Chuyên khoa Thận Học', N'K8')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN2', N'Chuyên khoa Hồi sức Tim mạch', N'K1')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN20', N'Chuyên khoa Lọc Máu', N'K8')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN21', N'Chuyên khoa Thần Kinh Nội', N'K9')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN22', N'Chuyên khoa Phẫu Thuật Thần Kinh', N'K9')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN23', N'Chuyên khoa Thần Kinh Nhi', N'K9')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN24', N'Chuyên khoa Tim Mạch Nội', N'K10')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN25', N'Chuyên khoa Phẫu Thuật Tim Mạch', N'K10')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN26', N'Chuyên khoa Tim Mạch Can Thiệp', N'K10')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN27', N'Chuyên khoa Chấn Thương', N'K11')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN28', N'Chuyên khoa Chỉnh Hình', N'K11')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN29', N'Chuyên khoa Phẫu Thuật Khớp', N'K11')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN3', N'Chuyên khoa Hồi sức Thần Kinh', N'K1')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN30', N'Chuyên khoa Nha khoa Tổng quát', N'K12')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN31', N'Chuyên khoa Răng hàm mặt Phẫu thuật', N'K12')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN32', N'Chuyên khoa Ung thư Nội', N'K13')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN33', N'Chuyên khoa Ung thư Ngoại', N'K13')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN34', N'Chuyên khoa Xạ Trị Ung Bướu', N'K13')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN35', N'Chuyên khoa Lao', N'K14')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN36', N'Chuyên khoa Bệnh Phổi', N'K14')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN37', N'Chuyên khoa Xét Nghiệm', N'K15')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN38', N'Chuyên khoa Hình Ảnh', N'K15')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN39', N'Chuyên khoa Bệnh Truyền Nhiễm', N'K16')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN4', N'Chuyên khoa Nội Khoa Tổng Quát', N'K2')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN40', N'Chuyên khoa Bệnh Lây Qua Đường Tình Dục', N'K16')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN41', N'Chuyên khoa Sản Khoa', N'K17')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN42', N'Chuyên khoa Phụ Khoa', N'K17')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN43', N'Quản trị hệ thống', N'K18')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN5', N'Chuyên khoa Nội Tim Mạch', N'K2')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN6', N'Chuyên khoa Nội Tiết', N'K2')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN7', N'Chuyên khoa Ngoại Tổng Quát', N'K3')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN8', N'Chuyên khoa Ngoại Thần Kinh', N'K3')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CN9', N'Chuyên khoa Nhi Khoa Hô hấp ', N'K4')
GO
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV001', N'Xét nghiệm ung bướu', 200000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV002', N'Xét nghiệm máu', 50000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV003', N'Chụp X-Quang', 300000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV004', N'Xét nghiệm nước tiểu', 80000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV005', N'Xét nghiệm da liễu', 1500000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV006', N'Chụp cắt lớp CT', 800000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV007', N'Dịch vụ hấp thụ oxy', 1000000, N'K14')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV008', N'Dịch vụ phục hồi chức năng', 2000000, N'K5')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV009', N'Dịch vụ chăm sóc sau phẫu thuật', 3000000, N'K3')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV010', N'Phẫu thuật Tim', 80000000, N'K10')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV011', N'Phẫu thuật Gan', 20000000, N'K3')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV012', N'Phẫu thuật Mắt', 10000000, N'K3')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV013', N'Phẫu thuật Tai mũi họng', 20000000, N'K7')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV014', N'Phẫu thuật Khối u', 50000000, N'K13')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV015', N'Phẫu thuật Cột sống', 40000000, N'K11')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV016', N'Phẫu thuật Lồng ngực', 30000000, N'K3')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV017', N'Phẫu thuật Bụng', 70000000, N'K3')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV018', N'Phẫu thuật Cơ xương khớp', 70000000, N'K11')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV019', N'Phẫu thuật Ung thư', 70000000, N'K13')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV020', N'Phẫu thuật Túi mật', 40000000, N'K3')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV021', N'Phẫu thuật Phổi', 70000000, N'K14')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV022', N'Phẫu thuật Thận', 70000000, N'K8')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV023', N'Phẫu thuật Hậu quả cháy nổ', 10000000, N'K11')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV024', N'Phẫu thuật Sửa chữa gãy xương', 200000, N'K11')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV025', N'Phẫu thuật Nội soi', 20000000, N'K3')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV026', N'Phẫu thuật Hạch', 40000000, N'K13')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV027', N'Phẫu thuật Đại tràng', 50000000, N'K3')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV028', N'Phòng VIP Khoa Hồi Sức Tích Cực', 2000000, N'K1')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV029', N'Phòng 2 Giường Khoa Hồi Sức Tích Cực', 1500000, N'K1')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV030', N'Phòng 3 Giường Khoa Hồi Sức Tích Cực', 1000000, N'K1')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV031', N'Phòng 4 Giường Khoa Hồi Sức Tích Cực', 500000, N'K1')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV032', N'Phòng VIP Khoa Nội', 2000000, N'K2')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV033', N'Phòng 2 Giường Khoa Nội', 1500000, N'K2')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV034', N'Phòng 3 Giường Khoa Nội', 1000000, N'K2')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV035', N'Phòng 4 Giường Khoa Nội', 500000, N'K2')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV036', N'Phòng VIP Khoa Ngoại', 2000000, N'K3')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV037', N'Phòng 2 Giường Khoa Ngoại', 1500000, N'K3')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV038', N'Phòng 3 Giường Khoa Ngoại', 1000000, N'K3')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV039', N'Phòng 4 Giường Khoa Ngoại', 500000, N'K3')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV040', N'Phòng VIP Khoa Nhi', 2000000, N'K4')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV041', N'Phòng 2 Giường Khoa Nhi', 1500000, N'K4')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV042', N'Phòng 3 Giường Khoa Nhi', 1000000, N'K4')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV043', N'Phòng 4 Giường Khoa Nhi', 500000, N'K4')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV044', N'Phòng VIP Khoa Phục Hồi Chức Năng', 2000000, N'K5')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV045', N'Phòng 2 Giường Khoa Phục Hồi Chức Năng', 1500000, N'K5')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV046', N'Phòng 3 Giường Khoa Phục Hồi Chức Năng', 1000000, N'K5')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV047', N'Phòng 4 Giường Khoa Phục Hồi Chức Năng', 500000, N'K5')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV048', N'Phòng VIP Khoa Da Liễu', 2000000, N'K6')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV049', N'Phòng 2 Giường Khoa Da Liễu', 1500000, N'K6')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV050', N'Phòng 3 Giường Khoa Da Liễu', 1000000, N'K6')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV051', N'Phòng 4 Giường Khoa Da Liễu', 500000, N'K6')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV052', N'Phòng VIP Khoa Tai-Mũi-Họng', 2000000, N'K7')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV053', N'Phòng 2 Giường Khoa Tai-Mũi-Họng', 1500000, N'K7')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV054', N'Phòng 3 Giường Khoa Tai-Mũi-Họng', 1000000, N'K7')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV055', N'Phòng 4 Giường Khoa Tai-Mũi-Họng', 500000, N'K7')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV056', N'Phòng VIP Khoa Thận', 2000000, N'K8')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV057', N'Phòng 2 Giường Khoa Thận', 1500000, N'K8')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV058', N'Phòng 3 Giường Khoa Thận', 1000000, N'K8')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV059', N'Phòng 4 Giường Khoa Thận', 500000, N'K8')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV060', N'Phòng VIP Khoa Thần Kinh Học', 2000000, N'K9')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV061', N'Phòng 2 Giường Khoa Thần Kinh Học', 1500000, N'K9')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV062', N'Phòng 3 Giường Khoa Thần Kinh Học', 1000000, N'K9')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV063', N'Phòng 4 Giường Khoa Thần Kinh Học', 500000, N'K9')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV064', N'Phòng VIP Khoa Tim Mạch', 2000000, N'K10')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV065', N'Phòng 2 Giường Khoa Tim Mạch', 1500000, N'K10')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV066', N'Phòng 3 Giường Khoa Tim Mạch', 1000000, N'K10')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV067', N'Phòng 4 Giường Khoa Tim Mạch', 500000, N'K10')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV068', N'Phòng VIP Khoa Chấn Thương Chỉnh Hình', 2000000, N'K11')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV069', N'Phòng 2 Giường Khoa Chấn Thương Chỉnh Hình', 1500000, N'K11')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV070', N'Phòng 3 Giường Khoa Chấn Thương Chỉnh Hình', 1000000, N'K11')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV071', N'Phòng 4 Giường Khoa Chấn Thương Chỉnh Hình', 500000, N'K11')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV072', N'Phòng VIP Khoa Răng Hàm Mặt', 2000000, N'K12')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV073', N'Phòng 2 Giường Khoa Răng Hàm Mặt', 1500000, N'K12')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV074', N'Phòng 3 Giường Khoa Răng Hàm Mặt', 1000000, N'K12')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV075', N'Phòng 4 Giường Khoa Răng Hàm Mặt', 500000, N'K12')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV076', N'Phòng VIP Khoa Ung Bướu', 2000000, N'K13')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV077', N'Phòng 2 Giường Khoa Ung Bướu', 1500000, N'K13')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV078', N'Phòng 3 Giường Khoa Ung Bướu', 1000000, N'K13')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV079', N'Phòng 4 Giường Khoa Ung Bướu', 500000, N'K13')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV080', N'Phòng VIP Khoa Lao Phổi', 2000000, N'K14')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV081', N'Phòng 2 Giường Khoa Lao Phổi', 1500000, N'K14')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV082', N'Phòng 3 Giường Khoa Lao Phổi', 1000000, N'K14')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV083', N'Phòng 4 Giường Khoa Lao Phổi', 500000, N'K14')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV084', N'Phòng VIP Khoa Truyền Nhiễm', 2000000, N'K16')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV085', N'Phòng 2 Giường Khoa Truyền Nhiễm', 1500000, N'K16')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV086', N'Phòng 3 Giường Khoa Truyền Nhiễm', 1000000, N'K16')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV087', N'Phòng 4 Giường Khoa Truyền Nhiễm', 500000, N'K16')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV088', N'Phòng VIP Khoa Phụ Sản', 2000000, N'K17')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV089', N'Phòng 2 Giường Khoa Phụ Sản', 1500000, N'K17')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV090', N'Phòng 3 Giường Khoa Phụ Sản', 1000000, N'K17')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV091', N'Phòng 4 Giường Khoa Phụ Sản', 500000, N'K17')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV092', N'Xét nghiệm đường huyết', 500000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV093', N'Xét nghiệm HbAlc', 400000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV094', N'Xét nghiệm lipid máu', 4500000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV095', N'Xét nghiệm số lượng tiểu cầu', 500000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV096', N'Xét nghiệm huyết học cơ bản', 300000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV097', N'Xét nghiệm chức năng tiêu hóa', 200000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV098', N'Xét nghiệm CRP', 100000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV099', N'Xét nghiệm GeneXpert', 100000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV100', N'Xét nghiệm HPV', 100000, N'K15')
GO
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV101', N'Xét nghiệm máu HCG', 100000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV102', N'Xét nghiệm kháng thuốc sốt rét', 300000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV103', N'Xét nghiệm máu phát hiện kháng thể sán lá gan', 400000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV104', N'Xét nghiệm máu phát hiện kháng thể sán chó', 500000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV105', N'Xét nghiệm máu để kiểm tra mất cân bằng hóa học', 100000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV106', N'Xét nghiệm hormon', 400000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV107', N'Xét nghiệm chức năng gan', 100000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV108', N'Xét nghiệm PCR Đậu mùa khỉ', 100000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV109', N'Xét nghiệm nước tiểu', 100000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV110', N'Xét nghiệm phân tử PCR để chẩn đoán H5N1', 200000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV111', N'Xét nghiệm máu phát hiện virus dại', 200000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV112', N'Xét nghiệm máu tìm kháng thể giun đũa', 200000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV113', N'Chụp cộng hưởng từ tim', 200000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV114', N'Chụp động mạch vành', 200000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV115', N'Chụp PET', 200000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV116', N'Chụp MRI não', 200000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV117', N'Chăm Sóc Sau Khi Sinh', 200000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV118', N'Chăm Sóc Trước Khi Sinh', 200000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV119', N'Nội Soi', 100000, N'K15')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [Gia], [MaKhoa]) VALUES (N'DV120', N'Cấp cứu 24/7', 500000, N'K1')
GO
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT001', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV002', N'PKB001')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT002', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV199', N'PKB002')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT003', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV147', N'PKB003')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT004', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV166', N'PKB004')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT005', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV059', N'PKB005')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT006', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV003', N'PKB006')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT007', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV007', N'PKB007')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT008', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV162', N'PKB008')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT009', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV204', N'PKB009')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT010', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV311', N'PKB010')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT011', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV058', N'PKB11')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT012', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV071', N'PKB12')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT013', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV162', N'PKB13')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT014', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV163', N'PKB14')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT015', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV053', N'PKB15')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT016', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV188', N'PKB16')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT017', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV058', N'PKB17')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT018', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV059', N'PKB18')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT019', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV198', N'PKB19')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT020', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV204', N'PKB20')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT021', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV054', N'PKB21')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT022', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV062', N'PKB22')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT023', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV060', N'PKB23')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT024', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV203', N'PKB24')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT025', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV143', N'PKB25')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT026', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV026', N'PKB26')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT027', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV079', N'PKB27')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT028', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV223', N'PKB28')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT029', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV228', N'PKB29')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT030', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV199', N'PKB30')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT031', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV228', N'PKB31')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT032', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV199', N'PKB32')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT033', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV241', N'PKB33')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT034', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV206', N'PKB34')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT035', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV151', N'PKB35')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT036', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV057', N'PKB36')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT037', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV053', N'PKB37')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT038', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV002', N'PKB38')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT039', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV033', N'PKB39')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT040', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV230', N'PKB40')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT041', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV232', N'PKB41')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT042', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV334', N'PKB42')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT043', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV086', N'PKB43')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT044', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV024', N'PKB44')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT045', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV206', N'PKB45')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT046', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV066', N'PKB46')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT047', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV169', N'PKB47')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT048', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV070', N'PKB48')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT049', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV198', N'PKB49')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT050', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV207', N'PKB50')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT051', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV259', N'PKB51')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT052', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV183', N'PKB52')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT053', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV223', N'PKB53')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT054', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV171', N'PKB54')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT055', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV164', N'PKB55')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT056', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV205', N'PKB56')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT057', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV166', N'PKB57')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT058', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV244', N'PKB58')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT059', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV222', N'PKB59')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT060', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV082', N'PKB60')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT061', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV057', N'PKB61')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT062', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV079', N'PKB62')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT063', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV191', N'PKB63')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT064', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV035', N'PKB64')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT065', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV199', N'PKB65')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT066', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV082', N'PKB66')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT067', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV062', N'PKB67')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT068', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV002', N'PKB68')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT069', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV071', N'PKB69')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT070', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV053', N'PKB70')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT071', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV308', N'PKB71')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT072', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV072', N'PKB72')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT073', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV246', N'PKB73')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT074', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV060', N'PKB74')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT075', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV038', N'PKB75')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT076', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV198', N'PKB76')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT077', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV204', N'PKB77')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT078', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV192', N'PKB78')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT079', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV188', N'PKB79')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT080', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV199', N'PKB80')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT081', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV190', N'PKB81')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT082', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV199', N'PKB82')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT083', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV061', N'PKB83')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT084', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV057', N'PKB84')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT085', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV192', N'PKB85')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT086', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV168', N'PKB86')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT087', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV236', N'PKB87')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT088', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV282', N'PKB88')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT089', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV198', N'PKB89')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT090', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV083', N'PKB90')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT091', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV198', N'PKB91')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT092', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV057', N'PKB92')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT093', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV332', N'PKB93')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT094', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV198', N'PKB94')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT095', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV002', N'PKB95')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT096', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV334', N'PKB96')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT097', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV062', N'PKB97')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT098', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV056', N'PKB98')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT099', CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'NV263', N'PKB99')
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [NgayGioKeDon], [MaNV], [MaPhieuKB]) VALUES (N'DT100', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'NV038', N'PKB100')
GO
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G167.1', 1, N'Bình Thường', N'P167')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G168.1', 1, N'Bình Thường', N'P168')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G169.1', 1, N'Bình Thường', N'P169')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G170.1', 1, N'Bình Thường', N'P170')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G171.1', 1, N'Bình Thường', N'P171')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G171.2', 2, N'Bình Thường', N'P171')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G172.1', 1, N'Bình Thường', N'P172')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G172.2', 2, N'Bình Thường', N'P172')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G172.3', 3, N'Bình Thường', N'P172')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G173.1', 1, N'Bình Thường', N'P173')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G173.2', 2, N'Bình Thường', N'P173')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G173.3', 3, N'Bình Thường', N'P173')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G173.4', 4, N'Bình Thường', N'P173')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G174.1', 1, N'Bình Thường', N'P174')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G174.2', 2, N'Bình Thường', N'P174')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G175.1', 1, N'Bình Thường', N'P175')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G175.2', 2, N'Bình Thường', N'P175')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G175.3', 3, N'Bình Thường', N'P175')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G176.1', 1, N'Bình Thường', N'P176')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G176.2', 2, N'Bình Thường', N'P176')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G176.3', 3, N'Bình Thường', N'P176')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G176.4', 4, N'Bình Thường', N'P176')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G177.1', 1, N'Bình Thường', N'P177')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G178.1', 1, N'Bình Thường', N'P178')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G179.1', 1, N'Bình Thường', N'P179')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G180.1', 1, N'Bình Thường', N'P180')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G180.2', 2, N'Bình Thường', N'P180')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G180.3', 3, N'Bình Thường', N'P180')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G181.1', 1, N'Bình Thường', N'P181')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G181.2', 2, N'Bình Thường', N'P181')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G181.3', 3, N'Bình Thường', N'P181')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G181.4', 4, N'Bình Thường', N'P181')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G182.1', 1, N'Bình Thường', N'P182')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G182.2', 2, N'Bình Thường', N'P182')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G183.1', 1, N'Bình Thường', N'P183')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G183.2', 2, N'Bình Thường', N'P183')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G184.1', 1, N'Bình Thường', N'P184')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G184.2', 2, N'Bình Thường', N'P184')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G184.3', 3, N'Bình Thường', N'P184')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G185.1', 1, N'Bình Thường', N'P185')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G185.2', 2, N'Bình Thường', N'P185')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G185.3', 3, N'Bình Thường', N'P185')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G185.4', 4, N'Bình Thường', N'P185')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G186.1', 1, N'Bình Thường', N'P186')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G186.2', 2, N'Bình Thường', N'P186')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G187.1', 1, N'Bình Thường', N'P187')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G188.1', 1, N'Bình Thường', N'P188')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G189.1', 1, N'Bình Thường', N'P189')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G189.2', 2, N'Bình Thường', N'P189')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G190.1', 1, N'Bình Thường', N'P190')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G190.2', 2, N'Bình Thường', N'P190')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G191.1', 1, N'Bình Thường', N'P191')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G191.2', 2, N'Bình Thường', N'P191')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G191.3', 3, N'Bình Thường', N'P191')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G192.1', 1, N'Bình Thường', N'P192')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G192.2', 2, N'Bình Thường', N'P192')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G192.3', 3, N'Bình Thường', N'P192')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G192.4', 4, N'Bình Thường', N'P192')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G193.1', 1, N'Bình Thường', N'P193')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G193.2', 2, N'Bình Thường', N'P193')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G193.3', 3, N'Bình Thường', N'P193')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G194.1', 1, N'Bình Thường', N'P194')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G194.2', 2, N'Bình Thường', N'P194')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G194.3', 3, N'Bình Thường', N'P194')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G194.4', 4, N'Bình Thường', N'P194')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G196.1', 1, N'Bình Thường', N'P196')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G197.1', 1, N'Bình Thường', N'P197')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G198.1', 1, N'Bình Thường', N'P198')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G198.2', 2, N'Bình Thường', N'P198')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G198.3', 3, N'Bình Thường', N'P198')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G199.1', 1, N'Bình Thường', N'P199')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G199.2', 2, N'Bình Thường', N'P199')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G200.1', 1, N'Bình Thường', N'P200')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G200.2', 2, N'Bình Thường', N'P200')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G200.3', 3, N'Bình Thường', N'P200')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G201.1', 1, N'Bình Thường', N'P201')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G201.2', 2, N'Bình Thường', N'P201')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G201.3', 3, N'Bình Thường', N'P201')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G201.4', 4, N'Bình Thường', N'P201')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G202.1', 1, N'Bình Thường', N'P202')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G202.2', 2, N'Bình Thường', N'P202')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G203.1', 1, N'Bình Thường', N'P203')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G203.2', 2, N'Bình Thường', N'P203')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G203.3', 3, N'Bình Thường', N'P203')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G203.4', 4, N'Bình Thường', N'P203')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G204.1', 1, N'Bình Thường', N'P204')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G205.1', 1, N'Bình Thường', N'P205')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G206.1', 1, N'Bình Thường', N'P206')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G206.2', 2, N'Bình Thường', N'P206')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G206.3', 3, N'Bình Thường', N'P206')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G207.1', 1, N'Bình Thường', N'P207')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G207.2', 2, N'Bình Thường', N'P207')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G208.1', 1, N'Bình Thường', N'P208')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G208.2', 2, N'Bình Thường', N'P208')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G208.3', 3, N'Bình Thường', N'P208')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G209.1', 1, N'Bình Thường', N'P209')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G209.2', 2, N'Bình Thường', N'P209')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G209.3', 3, N'Bình Thường', N'P209')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G209.4', 4, N'Bình Thường', N'P209')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G210.1', 1, N'Bình Thường', N'P210')
GO
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G210.2', 2, N'Bình Thường', N'P210')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G211.1', 1, N'Bình Thường', N'P211')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G212.1', 1, N'Bình Thường', N'P212')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G213.1', 3, N'Bình Thường', N'P213')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G213.2', 1, N'Bình Thường', N'P213')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G213.3', 2, N'Bình Thường', N'P213')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G213.4', 1, N'Bình Thường', N'P213')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G214.1', 1, N'Bình Thường', N'P214')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G214.2', 2, N'Bình Thường', N'P214')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G215.1', 1, N'Bình Thường', N'P215')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G215.2', 2, N'Bình Thường', N'P215')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G215.3', 3, N'Bình Thường', N'P215')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G216.1', 1, N'Bình Thường', N'P216')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G216.2', 2, N'Bình Thường', N'P216')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G216.3', 3, N'Bình Thường', N'P216')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G216.4', 4, N'Bình Thường', N'P216')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G218.1', 1, N'Bình Thường', N'P218')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G219.1', 1, N'Bình Thường', N'P219')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G220.1', 1, N'Bình Thường', N'P220')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G220.2', 2, N'Bình Thường', N'P220')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G220.3', 3, N'Bình Thường', N'P220')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G221.1', 1, N'Bình Thường', N'P221')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G221.2', 2, N'Bình Thường', N'P221')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G222.1', 1, N'Bình Thường', N'P222')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G222.2', 2, N'Bình Thường', N'P222')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G222.3', 3, N'Bình Thường', N'P222')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G223.1', 1, N'Bình Thường', N'P223')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G223.2', 2, N'Bình Thường', N'P223')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G223.3', 3, N'Bình Thường', N'P223')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G223.4', 4, N'Bình Thường', N'P223')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G224.1', 1, N'Bình Thường', N'P224')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G224.2', 2, N'Bình Thường', N'P224')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G225.1', 1, N'Bình Thường', N'P225')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G225.2', 2, N'Bình Thường', N'P225')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G225.3', 3, N'Bình Thường', N'P225')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G226.1', 1, N'Bình Thường', N'P226')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G226.2', 2, N'Bình Thường', N'P226')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G226.3', 3, N'Bình Thường', N'P226')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G226.4', 4, N'Bình Thường', N'P226')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G227.1', 1, N'Bình Thường', N'P227')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G227.2', 2, N'Bình Thường', N'P227')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G228.1', 1, N'Bình Thường', N'P228')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G229.1', 1, N'Bình Thường', N'P229')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G230.1', 1, N'Bình Thường', N'P230')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G230.2', 2, N'Bình Thường', N'P230')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G230.3', 3, N'Bình Thường', N'P230')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G231.1', 1, N'Bình Thường', N'P231')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G231.2', 2, N'Bình Thường', N'P231')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G231.3', 3, N'Bình Thường', N'P231')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G231.4', 4, N'Bình Thường', N'P231')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G232.1', 1, N'Bình Thường', N'P232')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G232.2', 2, N'Bình Thường', N'P232')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G233.1', 3, N'Bình Thường', N'P233')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G234.1', 1, N'Bình Thường', N'P234')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G234.2', 2, N'Bình Thường', N'P234')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G235.1', 1, N'Bình Thường', N'P235')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G235.2', 2, N'Bình Thường', N'P235')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G235.3', 3, N'Bình Thường', N'P235')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G236.1', 1, N'Bình Thường', N'P236')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G236.2', 2, N'Bình Thường', N'P236')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G236.3', 3, N'Bình Thường', N'P236')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G236.4', 4, N'Bình Thường', N'P236')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G237.1', 1, N'Bình Thường', N'P237')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G237.2', 2, N'Bình Thường', N'P237')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G238.1', 1, N'Bình Thường', N'P238')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G239.1', 1, N'Bình Thường', N'P239')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G239.2', 2, N'Bình Thường', N'P239')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G240.1', 1, N'Bình Thường', N'P240')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G240.2', 2, N'Bình Thường', N'P240')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G241.1', 1, N'Bình Thường', N'P241')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G241.2', 2, N'Bình Thường', N'P241')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G241.3', 3, N'Bình Thường', N'P241')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G241.4', 4, N'Bình Thường', N'P241')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G242.1', 1, N'Bình Thường', N'P242')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G243.1', 1, N'Bình Thường', N'P243')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G243.2', 2, N'Bình Thường', N'P243')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G243.3', 3, N'Bình Thường', N'P243')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G243.4', 4, N'Bình Thường', N'P243')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G244.1', 1, N'Bình Thường', N'P244')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G244.2', 2, N'Bình Thường', N'P244')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G245.1', 1, N'Bình Thường', N'P245')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G245.2', 2, N'Bình Thường', N'P245')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G245.3', 3, N'Bình Thường', N'P245')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G246.1', 1, N'Bình Thường', N'P246')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G246.2', 2, N'Bình Thường', N'P246')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G246.3', 3, N'Bình Thường', N'P246')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G246.4', 4, N'Bình Thường', N'P246')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G247.1', 1, N'Bình Thường', N'P247')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G247.2', 2, N'Bình Thường', N'P247')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G248.1', 1, N'Bình Thường', N'P248')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G248.2', 2, N'Bình Thường', N'P248')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G248.3', 3, N'Bình Thường', N'P248')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G249.1', 1, N'Bình Thường', N'P249')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G249.2', 2, N'Bình Thường', N'P249')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G249.3', 3, N'Hư', N'P249')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G249.4', 4, N'Đang Sửa', N'P249')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G250.1', 1, N'Bình Thường', N'P250')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G251.1', 1, N'Bình Thường', N'P251')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G252.1', 1, N'Bình Thường', N'P252')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G252.2', 2, N'Bình Thường', N'P252')
GO
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G252.3', 3, N'Bình Thường', N'P252')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G253.1', 1, N'Bình Thường', N'P253')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G253.2', 2, N'Bình Thường', N'P253')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G253.3', 3, N'Bình Thường', N'P253')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G253.4', 4, N'Bình Thường', N'P253')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G254.1', 1, N'Bình Thường', N'P254')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G254.2', 2, N'Bình Thường', N'P254')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G254.3', 3, N'Bình Thường', N'P254')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G254.4', 4, N'Bình Thường', N'P254')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G255.1', 1, N'Bình Thường', N'P255')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G255.2', 2, N'Bình Thường', N'P255')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G255.3', 3, N'Bình Thường', N'P255')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G256.1', 1, N'Bình Thường', N'P256')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G256.2', 2, N'Bình Thường', N'P256')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G257.1', 1, N'Bình Thường', N'P257')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G257.2', 2, N'Bình Thường', N'P257')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G257.3', 3, N'Bình Thường', N'P257')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G258.1', 1, N'Bình Thường', N'P258')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G258.2', 2, N'Bình Thường', N'P258')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G258.3', 3, N'Bình Thường', N'P258')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G258.4', 4, N'Bình Thường', N'P258')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G259.1', 1, N'Bình Thường', N'P259')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G259.2', 2, N'Bình Thường', N'P259')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G260.1', 1, N'Bình Thường', N'P260')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G260.2', 2, N'Bình Thường', N'P260')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G260.3', 3, N'Bình Thường', N'P260')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G261.1', 1, N'Bình Thường', N'P261')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G261.2', 2, N'Bình Thường', N'P261')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G261.3', 3, N'Bình Thường', N'P261')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G261.4', 4, N'Bình Thường', N'P261')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G262.1', 1, N'Bình Thường', N'P262')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G263.1', 1, N'Bình Thường', N'P263')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G264.1', 1, N'Bình Thường', N'P264')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G264.2', 2, N'Bình Thường', N'P264')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G264.3', 3, N'Bình Thường', N'P264')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G265.1', 1, N'Bình Thường', N'P265')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G265.2', 2, N'Bình Thường', N'P265')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G265.3', 3, N'Bình Thường', N'P265')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G265.4', 4, N'Bình Thường', N'P265')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G266.1', 1, N'Bình Thường', N'P266')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G266.2', 2, N'Bình Thường', N'P266')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G266.3', 3, N'Bình Thường', N'P266')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G266.4', 4, N'Bình Thường', N'P266')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G267.1', 1, N'Bình Thường', N'P267')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G267.2', 2, N'Bình Thường', N'P267')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G267.3', 3, N'Bình Thường', N'P267')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G268.1', 1, N'Bình Thường', N'P268')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G268.2', 2, N'Bình Thường', N'P268')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G269.1', 1, N'Bình Thường', N'P268')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G269.2', 2, N'Bình Thường', N'P269')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G269.3', 3, N'Bình Thường', N'P269')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G270.1', 1, N'Bình Thường', N'P270')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G270.2', 2, N'Bình Thường', N'P270')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G270.3', 3, N'Bình Thường', N'P270')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G270.4', 4, N'Bình Thường', N'P270')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G271.1', 1, N'Bình Thường', N'P271')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G271.2', 2, N'Bình Thường', N'P271')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G272.1', 1, N'Bình Thường', N'P272')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G272.2', 2, N'Bình Thường', N'P272')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G272.3', 3, N'Bình Thường', N'P272')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G273.1', 1, N'Bình Thường', N'P273')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G273.2', 2, N'Bình Thường', N'P273')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G273.3', 3, N'Bình Thường', N'P273')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G273.4', 4, N'Bình Thường', N'P273')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G274.1', 1, N'Bình Thường', N'P274')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G275.1', 1, N'Bình Thường', N'P275')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G276.1', 1, N'Bình Thường', N'P276')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G276.2', 2, N'Bình Thường', N'P276')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G277.1', 1, N'Bình Thường', N'P277')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G277.2', 2, N'Bình Thường', N'P277')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G277.3', 3, N'Bình Thường', N'P277')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G278.1', 1, N'Bình Thường', N'P278')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G278.2', 2, N'Bình Thường', N'P278')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G278.3', 3, N'Bình Thường', N'P278')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G278.4', 4, N'Bình Thường', N'P278')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G279.1', 1, N'Bình Thường', N'P279')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G279.2', 2, N'Bình Thường', N'P279')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G279.3', 3, N'Bình Thường', N'P279')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G279.4', 4, N'Bình Thường', N'P279')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G280.1', 1, N'Bình Thường', N'P280')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G280.2', 2, N'Bình Thường', N'P280')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G281.1', 1, N'Bình Thường', N'P281')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G281.2', 2, N'Bình Thường', N'P281')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G281.3', 3, N'Bình Thường', N'P281')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G282.1', 1, N'Bình Thường', N'P282')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G282.2', 2, N'Bình Thường', N'P282')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G282.3', 3, N'Bình Thường', N'P282')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G282.4', 4, N'Bình Thường', N'P282')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G283.1', 1, N'Bình Thường', N'P283')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G283.2', 2, N'Bình Thường', N'P283')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G284.1', 1, N'Bình Thường', N'P284')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G284.2', 2, N'Bình Thường', N'P284')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G284.3', 3, N'Bình Thường', N'P284')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G285.1', 1, N'Bình Thường', N'P285')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G285.2', 2, N'Bình Thường', N'P285')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G285.3', 3, N'Bình Thường', N'P285')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G285.4', 4, N'Bình Thường', N'P285')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G286.1', 1, N'Bình Thường', N'P286')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G287.1', 1, N'Bình Thường', N'P287')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G288.1', 1, N'Bình Thường', N'P288')
GO
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G288.2', 2, N'Bình Thường', N'P288')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G289.1', 1, N'Bình Thường', N'P289')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G289.2', 2, N'Bình Thường', N'P289')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G289.3', 3, N'Bình Thường', N'P289')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G290.1', 1, N'Bình Thường', N'P290')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G290.2', 2, N'Bình Thường', N'P290')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G290.3', 3, N'Bình Thường', N'P290')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G290.4', 4, N'Bình Thường', N'P290')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G291.1', 1, N'Bình Thường', N'P291')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G291.2', 2, N'Bình Thường', N'P291')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G291.3', 3, N'Bình Thường', N'P291')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G291.4', 4, N'Bình Thường', N'P291')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G292.1', 1, N'Bình Thường', N'P292')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G292.2', 2, N'Bình Thường', N'P292')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G293.1', 1, N'Bình Thường', N'P293')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G293.2', 2, N'Bình Thường', N'P293')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G293.3', 3, N'Bình Thường', N'P293')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G294.1', 1, N'Bình Thường', N'P294')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G294.2', 2, N'Bình Thường', N'P294')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G294.3', 3, N'Bình Thường', N'P294')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G294.4', 4, N'Bình Thường', N'P294')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G295.1', 1, N'Bình Thường', N'P295')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G295.2', 2, N'Bình Thường', N'P295')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G296.1', 1, N'Bình Thường', N'P296')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G296.2', 2, N'Bình Thường', N'P296')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G296.3', 3, N'Bình Thường', N'P296')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G297.1', 1, N'Bình Thường', N'P297')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G297.2', 2, N'Bình Thường', N'P297')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G297.3', 3, N'Bình Thường', N'P297')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G297.4', 4, N'Bình Thường', N'P297')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G299.1', 1, N'Bình Thường', N'P299')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G300.1', 1, N'Bình Thường', N'P300')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G300.2', 2, N'Bình Thường', N'P300')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G301.1', 1, N'Bình Thường', N'P301')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G301.2', 2, N'Bình Thường', N'P301')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G301.3', 3, N'Bình Thường', N'P301')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G302.1', 1, N'Bình Thường', N'P302')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G302.2', 2, N'Bình Thường', N'P302')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G302.3', 3, N'Bình Thường', N'P302')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G302.4', 4, N'Bình Thường', N'P302')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G303.1', 1, N'Bình Thường', N'P303')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G303.2', 2, N'Bình Thường', N'P303')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G303.3', 3, N'Bình Thường', N'P303')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G304.1', 1, N'Bình Thường', N'P304')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G304.2', 2, N'Bình Thường', N'P304')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G305.1', 1, N'Bình Thường', N'P305')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G305.2', 2, N'Bình Thường', N'P305')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G305.3', 3, N'Bình Thường', N'P305')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G306.1', 1, N'Bình Thường', N'P306')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G306.2', 2, N'Bình Thường', N'P306')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G306.3', 3, N'Bình Thường', N'P306')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G306.4', 4, N'Bình Thường', N'P306')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G308.1', 2, N'Bình Thường', N'P308')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G308.2', 3, N'Bình Thường', N'P308')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G309.1', 1, N'Bình Thường', N'P309')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G309.2', 2, N'Bình Thường', N'P309')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G309.3', 3, N'Bình Thường', N'P309')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G310.1', 1, N'Bình Thường', N'P310')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G310.2', 2, N'Bình Thường', N'P310')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G310.3', 3, N'Bình Thường', N'P310')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G310.4', 4, N'Bình Thường', N'P310')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G311.1', 1, N'Bình Thường', N'P311')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G312.1', 1, N'Bình Thường', N'P312')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G313.1', 1, N'Bình Thường', N'P313')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G313.2', 2, N'Bình Thường', N'P313')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G314.1', 1, N'Bình Thường', N'P314')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G314.2', 2, N'Bình Thường', N'P314')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G314.3', 3, N'Bình Thường', N'P314')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G315.1', 1, N'Bình Thường', N'P315')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G315.2', 2, N'Bình Thường', N'P315')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G315.3', 3, N'Bình Thường', N'P315')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G315.4', 4, N'Bình Thường', N'P315')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G316.1', 1, N'Bình Thường', N'P316')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G316.2', 2, N'Bình Thường', N'P316')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G316.3', 3, N'Bình Thường', N'P316')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G317.1', 1, N'Bình Thường', N'P317')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G317.2', 2, N'Bình Thường', N'P317')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G318.1', 1, N'Bình Thường', N'P318')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G318.2', 2, N'Bình Thường', N'P318')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G318.3', 3, N'Bình Thường', N'P318')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G319.1', 1, N'Bình Thường', N'P319')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G319.2', 2, N'Bình Thường', N'P319')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G319.3', 3, N'Bình Thường', N'P319')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G319.4', 4, N'Bình Thường', N'P319')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G320.1', 1, N'Bình Thường', N'P320')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G320.2', 2, N'Bình Thường', N'P320')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G321.1', 1, N'Bình Thường', N'P321')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G321.2', 2, N'Bình Thường', N'P321')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G321.3', 3, N'Bình Thường', N'P321')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G322.1', 1, N'Bình Thường', N'P322')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G322.2', 2, N'Bình Thường', N'P322')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G322.3', 3, N'Bình Thường', N'P322')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G322.4', 4, N'Bình Thường', N'P322')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G323.1', 1, N'Bình Thường', N'P323')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G324.1', 1, N'Bình Thường', N'P324')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G325.1', 1, N'Bình Thường', N'P325')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G325.2', 2, N'Bình Thường', N'P325')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G326.1', 1, N'Bình Thường', N'P326')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G326.2', 2, N'Bình Thường', N'P326')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G326.3', 3, N'Bình Thường', N'P326')
GO
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G327.1', 1, N'Bình Thường', N'P327')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G327.2', 2, N'Bình Thường', N'P327')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G327.3', 3, N'Bình Thường', N'P327')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G327.4', 4, N'Bình Thường', N'P327')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G328.1', 1, N'Bình Thường', N'P328')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G328.2', 2, N'Bình Thường', N'P328')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G328.3', 3, N'Bình Thường', N'P328')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G329.1', 1, N'Bình Thường', N'P329')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G329.2', 2, N'Bình Thường', N'P329')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G330.1', 1, N'Bình Thường', N'P330')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G330.2', 2, N'Bình Thường', N'P330')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G330.3', 3, N'Bình Thường', N'P330')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G331.1', 1, N'Bình Thường', N'P331')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G331.2', 2, N'Bình Thường', N'P331')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G331.3', 3, N'Bình Thường', N'P331')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G331.4', 4, N'Bình Thường', N'P331')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G332.1', 1, N'Bình Thường', N'P332')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G332.2', 2, N'Bình Thường', N'P332')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G333.1', 1, N'Bình Thường', N'P333')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G333.2', 2, N'Bình Thường', N'P333')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G333.3', 3, N'Bình Thường', N'P333')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G334.1', 1, N'Bình Thường', N'P334')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G334.2', 2, N'Bình Thường', N'P334')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G334.3', 3, N'Bình Thường', N'P334')
INSERT [dbo].[GiuongBenh] ([MaGiuong], [SoGiuong], [TrangThai], [MSPhong]) VALUES (N'G334.4', 4, N'Bình Thường', N'P334')
GO
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P05', N'MK001', N'NV002', N'PKB001')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P39', N'MK002', N'NV199', N'PKB002')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P27', N'MK003', N'NV145', N'PKB003')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P34', N'MK004', N'NV166', N'PKB004')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P06', N'MK005', N'NV058', N'PKB006')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P11', N'MK006', N'NV077', N'PKB005')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P09', N'MK007', N'NV065', N'PKB008')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P32', N'MK008', N'NV007', N'PKB007')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P66', N'MK009', N'NV311', N'PKB009')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P40', N'MK010', N'NV204', N'PKB010')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P06', N'MK011', N'NV058', N'PKB11')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P10', N'MK012', N'NV071', N'PKB12')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P32', N'MK013', N'NV007', N'PKB13')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P32', N'MK014', N'NV163', N'PKB14')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P35', N'MK015', N'NV190', N'PKB15')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P05', N'MK016', N'NV055', N'PKB16')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P06', N'MK017', N'NV057', N'PKB17')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P06', N'MK018', N'NV058', N'PKB18')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P39', N'MK019', N'NV198', N'PKB19')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P40', N'MK020', N'NV204', N'PKB20')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P06', N'MK021', N'NV062', N'PKB21')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P05', N'MK022', N'NV054', N'PKB22')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P06', N'MK023', N'NV059', N'PKB23')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P40', N'MK024', N'NV203', N'PKB24')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P26', N'MK025', N'NV143', N'PKB25')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P39', N'MK026', N'NV201', N'PKB26')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P11', N'MK027', N'NV079', N'PKB27')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P46', N'MK028', N'NV231', N'PKB28')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P46', N'MK029', N'NV231', N'PKB29')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P47', N'MK030', N'NV228', N'PKB29')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P39', N'MK031', N'NV199', N'PKB30')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P40', N'MK032', N'NV200', N'PKB31')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P10', N'MK033', N'NV071', N'PKB32')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P51', N'MK034', N'NV241', N'PKB33')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P39', N'MK035', N'NV026', N'PKB34')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P41', N'MK036', N'NV206', N'PKB34')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P28', N'MK037', N'NV151', N'PKB35')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P06', N'MK038', N'NV057', N'PKB36')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P05', N'MK039', N'NV053', N'PKB37')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P05', N'MK040', N'NV058', N'PKB38')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P69', N'MK041', N'NV033', N'PKB39')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P46', N'MK042', N'NV230', N'PKB40')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P46', N'MK043', N'NV232', N'PKB41')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P47', N'MK044', N'NV229', N'PKB41')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P70', N'MK045', N'NV334', N'PKB42')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P12', N'MK046', N'NV086', N'PKB43')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P32', N'MK047', N'NV024', N'PKB44')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P41', N'MK048', N'NV206', N'PKB45')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P09', N'MK049', N'NV066', N'PKB46')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P34', N'MK050', N'NV168', N'PKB47')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P10', N'MK051', N'NV070', N'PKB48')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P39', N'MK052', N'NV198', N'PKB49')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P41', N'MK053', N'NV207', N'PKB50')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P57', N'MK054', N'NV259', N'PKB51')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P37', N'MK055', N'NV183', N'PKB52')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P45', N'MK056', N'NV223', N'PKB53')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P34', N'MK057', N'NV171', N'PKB54')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P32', N'MK058', N'NV164', N'PKB55')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P40', N'MK059', N'NV205', N'PKB56')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P34', N'MK060', N'NV166', N'PKB57')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P52', N'MK061', N'NV244', N'PKB58')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P46', N'MK062', N'NV230', N'PKB59')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P12', N'MK063', N'NV082', N'PKB60')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P06', N'MK064', N'NV057', N'PKB61')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P11', N'MK065', N'NV085', N'PKB62')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P35', N'MK066', N'NV191', N'PKB63')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P01', N'MK067', N'NV035', N'PKB64')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P39', N'MK068', N'NV199', N'PKB65')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P12', N'MK069', N'NV082', N'PKB66')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P06', N'MK070', N'NV062', N'PKB67')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P05', N'MK071', N'NV002', N'PKB68')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P10', N'MK072', N'NV071', N'PKB69')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P05', N'MK073', N'NV053', N'PKB70')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P65', N'MK074', N'NV308', N'PKB71')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P10', N'MK075', N'NV072', N'PKB72')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P55', N'MK076', N'NV246', N'PKB73')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P06', N'MK077', N'NV060', N'PKB74')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P02', N'MK078', N'NV038', N'PKB75')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P39', N'MK079', N'NV198', N'PKB76')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P40', N'MK080', N'NV204', N'PKB77')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P36', N'MK081', N'NV192', N'PKB78')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P35', N'MK082', N'NV188', N'PKB79')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P39', N'MK083', N'NV199', N'PKB80')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P35', N'MK084', N'NV190', N'PKB81')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P39', N'MK085', N'NV199', N'PKB82')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P06', N'MK086', N'NV061', N'PKB83')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P32', N'MK087', N'NV007', N'PKB84')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P36', N'MK088', N'NV192', N'PKB85')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P34', N'MK089', N'NV168', N'PKB86')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P47', N'MK090', N'NV236', N'PKB87')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P62', N'MK091', N'NV282', N'PKB88')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P39', N'MK092', N'NV198', N'PKB89')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P12', N'MK093', N'NV083', N'PKB90')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P39', N'MK094', N'NV198', N'PKB91')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P06', N'MK095', N'NV057', N'PKB92')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P70', N'MK096', N'NV332', N'PKB93')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P39', N'MK097', N'NV198', N'PKB94')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P05', N'MK098', N'NV002', N'PKB95')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P70', N'MK099', N'NV334', N'PKB96')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P06', N'MK100', N'NV062', N'PKB97')
GO
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P05', N'MK101', N'NV056', N'PKB98')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P02', N'MK102', N'NV036', N'PKB99')
INSERT [dbo].[KhamBenh] ([MaPhong], [MaKham], [MaNV], [MaPhieuKB]) VALUES (N'P58', N'MK103', N'NV267', N'PKB100')
GO
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K1', N'Khoa Hồi sức tích cực')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K10', N'Khoa Tim mạch')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K11', N'Khoa Chấn thương chỉnh hình')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K12', N'Khoa Răng hàm mặt')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K13', N'Khoa Ung bướu')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K14', N'Khoa Lao và Phổi')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K15', N'Khoa Cận lâm sàng')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K16', N'Khoa Truyền nhiễm')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K17', N'Khoa Phụ sản')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K18', N'Khoa Công nghệ thông tin')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K2', N'Khoa Nội')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K3', N'Khoa Ngoại')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K4', N'Khoa Nhi')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K5', N'Khoa Phục hồi chức năng')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K6', N'Khoa Da liễu')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K7', N'Khoa Tai Mũi Họng')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K8', N'Khoa Thận học')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'K9', N'Khoa Thần kinh học')
GO
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'AMO-MY-CTCDHG-T125', N'LO-20241113-AMO-MY-CTCDHG-T125', 100)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'AMO-MY-CTCP-V500', N'LO-20241029-AMO-MY-CTCP-V500', 150)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'AMO-MY-CTCT-B500', N'LO-20241013-AMO-MY-CTCT-B500', 500)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250', 100)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'ATO-HQ-CTCDHG-B400', N'LO-20241110-ATO-HQ-CTCDHG-B400', 100)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'ATO-HQ-CTCT-T150', N'LO-20241113-ATO-HQ-CTCT-T150', 600)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'ATO-TS-CTCDPHT-V10', N'LO-20241102-ATO-TS-CTCDPHT-V10', 250)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'ATO-VN-CTCDHG-V40', N'LO-20241105-ATO-VN-CTCDHG-V40 ', 80)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'IBU-ANH-CTCDPI-T140', N'LO-20240912-IBU-ANH-CTCDPI-T140', 100)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'IBU-ANH-CTTS-B400', N'LO-20241012-IBU-ANH-CTTS-B400', 400)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'IBU-NB-CTCXNKYTD-V600', N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 700)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'IBU-UC-CTCP-V400', N'LO-20241030-IBU-UC-CTCP-V400', 90)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'LIS-ANH-CTCDPO-V5', N'LO-20241110-LIS-ANH-CTCDPO-V5', 200)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'LIS-ANH-CTCDPT-V40', N'LO-20241023-LIS-ANH-CTCDPT-V40', 150)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'LIS-PHAP-CTCDPT-T130', N'LO-20241104-LIS-PHAP-CTCDPT-T130', 90)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'LIS-PHAP-CTCXNKYTD-B500', N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500', 80)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'LOS-DL-CTCT-V25', N'LO-20241009-LOS-DL-CTCT-V25', 300)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'LOS-HK-CTCT-V80', N'LO-20241113-LOS-HK-CTCT-V80', 90)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 600)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'LOS-UC-CTTSAVN-B400', N'LO-20241106-LOS-UC-CTTSAVN-B400', 700)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'MET-NB-CTCDPHT-T150', N'LO-20241108-MET-NB-CTCDPHT-T150', 90)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'MET-NB-CTCDPO-B350', N'LO-20241009-MET-NB-CTCDPO-B350', 80)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'MET-TD-CTCDPHT-V500', N'LO-20241101-MET-TD-CTCDPHT-V500', 100)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'MET-TL-CTCDPO-V850', N'LO-20241026-MET-TL-CTCDPO-V850', 300)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'OME-DL-CTCXNKYTD-V20', N'LO-04112024-OME-DL-CTCXNKYTD-V20', 300)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400', 400)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'OME-DUC-CTCP-T140', N'LO-20241101-OME-DUC-CTCP-T140', 100)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'OME-PHAP-CTCDPT-V20', N'LO-20241017-OME-PHAP-CTCDPT-V20', 600)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'SIM-ANH-CTCDHG-V80', N'LO-20241108-SIM-ANH-CTCDHG-V80', 60)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'SIM-CANADA-CTCDPI-T150', N'LO-20241112-SIM-CANADA-CTCDPI-T150', 550)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'SIM-CANADA-CTCT-B300', N'LO-20241112-SIM-CANADA-CTCT-B300', 85)
INSERT [dbo].[KhoThuoc] ([MaThuoc], [MaLo], [SoLuongTrongKho]) VALUES (N'SIM-DUC-CTCT-V40', N'LO-20241028-SIM-DUC-CTCT-V40', 80)
GO
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV001', N'Nguyễn Tấn Điền', N'Nam', CAST(N'1980-12-12' AS Date), N'CV1', N'CN1', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV002', N'Trần Thị Thu Trang', N'Nữ', CAST(N'1989-12-10' AS Date), N'CV1', N'CN4', N'8625290162')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV003', N'Phạm Đình Văn Nam', N'Nam', CAST(N'1988-12-23' AS Date), N'CV1', N'CN7', N'2516816187')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV004', N'Lê Thị Bảo Ngọc', N'Nữ', CAST(N'1987-11-30' AS Date), N'CV1', N'CN9', N'7281861912')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV005', N'Nguyễn Văn Ngân', N'Nam', CAST(N'1980-12-11' AS Date), N'CV1', N'CN12', N'5601827917')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV006', N'Trần Xuân Thịnh', N'Nam', CAST(N'1980-12-09' AS Date), N'CV1', N'CN14', N'2363872626')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV007', N'Hà Thị Thu', N'Nữ', CAST(N'1980-03-01' AS Date), N'CV1', N'CN17', N'4597271621')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV008', N'Nguyễn Văn Đức', N'Nam', CAST(N'1989-10-02' AS Date), N'CV1', N'CN19', N'2364281721')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV009', N'Nguyễn Thị Hồng Nhung', N'Nữ', CAST(N'1981-11-11' AS Date), N'CV1', N'CN21', N'6528126523')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV010', N'Lê Bảo An', N'Nam', CAST(N'1989-12-10' AS Date), N'CV1', N'CN26', N'1365290123')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV011', N'Hoàng Thị Thu Thủy', N'Nữ', CAST(N'1989-10-12' AS Date), N'CV1', N'CN27', N'2675433532')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV012', N'Đỗ Trọng Thắng', N'Nam', CAST(N'1988-02-05' AS Date), N'CV1', N'CN30', N'7542654176')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV013', N'Mai Thị Hải', N'Nữ', CAST(N'1990-12-09' AS Date), N'CV1', N'CN33', N'7625426512')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV014', N'Vũ Thị Tuyết Ly', N'Nữ', CAST(N'1982-10-12' AS Date), N'CV1', N'CN35', N'654328765')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV015', N'Nguyễn Văn Thanh', N'Nam', CAST(N'1991-12-09' AS Date), N'CV1', N'CN37', N'0865386543')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV016', N'Nguyễn Thị Lan Anh', N'Nữ', CAST(N'1981-10-12' AS Date), N'CV1', N'CN39', N'2265726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV017', N'Bùi Quốc Đạt', N'Nam', CAST(N'1981-10-12' AS Date), N'CV1', N'CN41', N'5465768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV018', N'Nguyễn Văn Tùng', N'Nam', CAST(N'1981-02-09' AS Date), N'CV2', N'CN2', N'2543862716')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV019', N'Huỳnh Thị Kim Thy', N'Nữ', CAST(N'1980-05-12' AS Date), N'CV2', N'CN6', N'5435423432')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV020', N'Đỗ Trọng Hiếu', N'Nam', CAST(N'1990-12-02' AS Date), N'CV2', N'CN8', N'3426576543')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV021', N'Đặng Thị Mai Thúy', N'Nữ', CAST(N'1980-12-12' AS Date), N'CV2', N'CN11', N'6432357654')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV022', N'Nguyễn Văn Hậu', N'Nam', CAST(N'1988-10-12' AS Date), N'CV2', N'CN13', N'3464768909')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV023', N'Đỗ Thị Hà', N'Nữ', CAST(N'1990-12-02' AS Date), N'CV2', N'CN16', N'4534876543')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV024', N'Hồ Thị Thanh', N'Nữ', CAST(N'1979-12-12' AS Date), N'CV2', N'CN18', N'0726216372')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV025', N'Đinh Văn Đại', N'Nam', CAST(N'1977-01-12' AS Date), N'CV2', N'CN19', N'1653872615')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV026', N'Vũ Thị Hoa', N'Nữ', CAST(N'1980-12-09' AS Date), N'CV2', N'CN21', N'9765432678')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV027', N'Trần Văn Linh', N'Nữ', CAST(N'1988-12-27' AS Date), N'CV2', N'CN24', N'2546109876')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV028', N'Nguyễn Thị Thùy', N'Nữ', CAST(N'1993-12-24' AS Date), N'CV2', N'CN28', N'6543543212')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV029', N'Lê Văn Hòa', N'Nam', CAST(N'1980-07-06' AS Date), N'CV2', N'CN30', N'6523862612')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV030', N'Phạm Thị Mai', N'Nữ', CAST(N'1989-03-12' AS Date), N'CV2', N'CN33', N'2651975412')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV031', N'Bùi Văn Đức', N'Nam', CAST(N'1980-04-12' AS Date), N'CV2', N'CN36', N'5415087654')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV032', N'Đinh Thị Tuyết Anh', N'Nữ', CAST(N'1980-05-12' AS Date), N'CV2', N'CN38', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV033', N'Lê Văn Long', N'Nam', CAST(N'1994-08-15' AS Date), N'CV2', N'CN39', N'4236793456')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV034', N'Nguyễn Thị Hường', N'Nữ', CAST(N'1981-11-12' AS Date), N'CV2', N'CN42', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV035', N'Hà Văn Tuất', N'Nam', CAST(N'1995-04-25' AS Date), N'CV3', N'CN1', N'5426516254')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV036', N'Võ Thành Lộc', N'Nam', CAST(N'2000-04-28' AS Date), N'CV3', N'CN1', N'8754357891')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV037', N'Phạm Tuấn Thanh', N'Nam', CAST(N'1955-04-25' AS Date), N'CV3', N'CN1', N'8965436764')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV038', N'Nguyễn Quang Hải', N'Nam', CAST(N'1979-06-22' AS Date), N'CV3', N'CN1', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV039', N'Phạm Ngọc Thái', N'Nam', CAST(N'2000-12-03' AS Date), N'CV3', N'CN1', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV040', N'Lưu Thị Khanh', N'Nữ', CAST(N'1999-03-30' AS Date), N'CV3', N'CN1', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV041', N'Lâm Xuân Uyên', N'Nữ', CAST(N'2001-07-21' AS Date), N'CV3', N'CN2', N'5427816589')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV042', N'Trần Đức Anh', N'Nam', CAST(N'1999-04-25' AS Date), N'CV3', N'CN2', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV043', N'Đặng Thị Bé Thu', N'Nữ', CAST(N'1990-08-14' AS Date), N'CV3', N'CN2', N'4356890654')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV044', N'Phan Thanh Tươi', N'Nam', CAST(N'1986-08-19' AS Date), N'CV3', N'CN2', N'3452343423')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV045', N'Nguyễn Thị Thanh Thủy', N'Nữ', CAST(N'1954-04-25' AS Date), N'CV3', N'CN2', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV046', N'Nguyễn Thị Thu Mai', N'Nữ', CAST(N'2000-05-12' AS Date), N'CV3', N'CN2', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV047', N'Vũ Hồng Quang', N'Nam', CAST(N'1998-12-03' AS Date), N'CV3', N'CN3', N'6478943254')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV048', N'Nguyễn Thị Thu Hồng', N'Nữ', CAST(N'1988-08-06' AS Date), N'CV3', N'CN3', N'7625716325')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV049', N'Thạch Minh Huy', N'Nam', CAST(N'1990-08-06' AS Date), N'CV3', N'CN3', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV050', N'Nguyễn Văn Thuận', N'Nam', CAST(N'1991-05-12' AS Date), N'CV3', N'CN3', N'1234234234')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV051', N'Võ Thị Mười Hai', N'Nữ', CAST(N'1980-04-25' AS Date), N'CV3', N'CN3', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV052', N'Huỳnh Thị Chiêu Oanh', N'Nữ', CAST(N'1979-05-12' AS Date), N'CV3', N'CN3', N'5426516252')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV053', N'Nguyễn Đình Phương Thảo', N'Nữ', CAST(N'1970-09-10' AS Date), N'CV3', N'CN4', N'7524615189')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV054', N'Nguyễn Văn Thịnh', N'Nam', CAST(N'2000-04-28' AS Date), N'CV3', N'CN4', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV055', N'Lương Văn Ba', N'Nam', CAST(N'1998-09-17' AS Date), N'CV3', N'CN4', N'7896560876')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV056', N'Bùi Tiến Kiên', N'Nam', CAST(N'1971-05-12' AS Date), N'CV3', N'CN4', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV057', N'Hoàng Minh Chương', N'Nam', CAST(N'1983-08-22' AS Date), N'CV3', N'CN4', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV058', N'Phương Thị Ngọc Đào', N'Nữ', CAST(N'1994-05-12' AS Date), N'CV3', N'CN4', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV059', N'Nguyễn Phạm Minh Tùng', N'Nam', CAST(N'1997-05-12' AS Date), N'CV3', N'CN4', N'5428761523')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV060', N'Phạm Thành Kiên', N'Nam', CAST(N'1969-08-11' AS Date), N'CV3', N'CN4', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV061', N'Nguyễn Xuân Phúc', N'Nam', CAST(N'1976-05-12' AS Date), N'CV3', N'CN4', N'6534905432')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV062', N'Hứa Minh Hải', N'Nam', CAST(N'1990-08-13' AS Date), N'CV3', N'CN4', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV063', N'Nguyễn Thái Bảo', N'Nam', CAST(N'1999-05-12' AS Date), N'CV3', N'CN5', N'1234234234')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV064', N'Nguyễn Thị Vân Anh', N'Nữ', CAST(N'1984-07-13' AS Date), N'CV3', N'CN5', N'1234234234')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV065', N'Hoàng Đức Huy', N'Nam', CAST(N'1999-01-02' AS Date), N'CV3', N'CN5', N'5426171625')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV066', N'Nguyễn Thị Hân', N'Nữ', CAST(N'1999-01-02' AS Date), N'CV3', N'CN5', N'2541626524')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV067', N'Phùng Thị Hằng', N'Nữ', CAST(N'1999-01-02' AS Date), N'CV3', N'CN5', N'0265172615')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV068', N'Hoàng Văn Hoàng', N'Nam', CAST(N'1999-01-02' AS Date), N'CV3', N'CN5', N'6524167162')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV069', N'Lê Văn Thành', N'Nam', CAST(N'1998-01-02' AS Date), N'CV3', N'CN5', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV070', N'Nguyễn Minh Triết', N'Nam', CAST(N'2000-01-02' AS Date), N'CV3', N'CN6', N'2451625162')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV071', N'Tăng Quốc Thịnh', N'Nam', CAST(N'1999-01-02' AS Date), N'CV3', N'CN6', N'5261736980')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV072', N'Ngô Văn Đến', N'Nam', CAST(N'1972-01-02' AS Date), N'CV3', N'CN6', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV073', N'Trần Thị Hoài Thu', N'Nữ', CAST(N'1999-01-02' AS Date), N'CV3', N'CN6', N'5432567894')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV074', N'Nguyễn Mỹ Dung', N'Nữ', CAST(N'1978-01-02' AS Date), N'CV3', N'CN6', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV075', N'Huỳnh Trung Lập', N'Nam', CAST(N'1999-01-02' AS Date), N'CV3', N'CN6', N'5076426152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV076', N'Nguyễn Thanh Liêm', N'Nam', CAST(N'1999-01-02' AS Date), N'CV3', N'CN6', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV077', N'Võ Thành Nhân', N'Nam', CAST(N'1996-03-04' AS Date), N'CV3', N'CN7', N'2516281726')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV078', N'Phạm Nhật An', N'Nam', CAST(N'1999-01-02' AS Date), N'CV3', N'CN7', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV079', N'Phan Quỳnh Lan', N'Nữ', CAST(N'1998-11-19' AS Date), N'CV3', N'CN7', N'6534590765')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV080', N'Huỳnh Trung Lập', N'Nam', CAST(N'1999-01-02' AS Date), N'CV3', N'CN7', N'2516271621')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV081', N'Nguyễn Thị Tân Sinh', N'Nam', CAST(N'1998-01-02' AS Date), N'CV3', N'CN7', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV082', N'Tôn Thất Trí Dũng', N'Nam', CAST(N'1999-01-02' AS Date), N'CV3', N'CN7', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV083', N'Quách Thanh Dung', N'Nam', CAST(N'1977-01-02' AS Date), N'CV3', N'CN7', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV084', N'Ngô Văn Đoàn', N'Nam', CAST(N'1982-04-03' AS Date), N'CV3', N'CN7', N'6537261876')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV085', N'Nguyễn Tất Bình', N'Nam', CAST(N'1988-04-03' AS Date), N'CV3', N'CN7', N'6241568910')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV086', N'Nguyễn Văn Quyết', N'Nam', CAST(N'1996-04-03' AS Date), N'CV3', N'CN7', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV087', N'Đoàn Thị Hồng Hạnh', N'Nữ', CAST(N'2000-04-03' AS Date), N'CV3', N'CN8', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV088', N'Nguyễn Thanh Hưng', N'Nam', CAST(N'1978-04-03' AS Date), N'CV3', N'CN8', N'6726156171')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV089', N'Nguyễn Thanh Hưng', N'Nam', CAST(N'1990-04-03' AS Date), N'CV3', N'CN8', N'6726156171')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV090', N'Thái Bằng', N'Nam', CAST(N'2000-04-03' AS Date), N'CV3', N'CN8', N'5675356876')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV091', N'Trần Thị Linh Chi', N'Nam', CAST(N'1998-04-03' AS Date), N'CV3', N'CN8', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV092', N'Thái Lăng', N'Nam', CAST(N'1972-04-03' AS Date), N'CV3', N'CN8', N'5675356654')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV093', N'Trần Thị Lam', N'Nữ', CAST(N'1985-04-03' AS Date), N'CV3', N'CN8', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV094', N'Nguyễn Thị Hoàng', N'ữ', CAST(N'1981-04-03' AS Date), N'CV3', N'CN8', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV095', N'Trần Hoàng Thùy', N'Nữ', CAST(N'1998-04-03' AS Date), N'CV3', N'CN8', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV096', N'Huỳnh Thoại Lan', N'Nữ', CAST(N'1987-04-03' AS Date), N'CV3', N'CN8', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV097', N'Trần Liên An', N'Nữ', CAST(N'1992-04-03' AS Date), N'CV3', N'CN9', N'5241615271')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV098', N'Phạm Thùy Nhung', N'Nữ', CAST(N'1971-04-03' AS Date), N'CV3', N'CN9', N'1625192837')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV099', N'Bùi Tiến Đạt', N'Nam', CAST(N'2000-06-23' AS Date), N'CV3', N'CN9', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV100', N'Đoàn Trung Hiệp', N'Nam', CAST(N'1977-11-03' AS Date), N'CV3', N'CN9', N'5865487658')
GO
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV101', N'Trần Hữu Tuấn', N'Nam', CAST(N'1977-08-03' AS Date), N'CV3', N'CN9', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV102', N'Khổng Trọng Thắng', N'Nam', CAST(N'1980-09-12' AS Date), N'CV3', N'CN9', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV103', N'Phạm Ngọc Hoa', N'Nam', CAST(N'1999-11-12' AS Date), N'CV3', N'CN9', N'2538279171')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV104', N'Dương Thế Vinh', N'Nam', CAST(N'2000-09-12' AS Date), N'CV3', N'CN10', N'2357917261')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV105', N'Lê Hữu Đồng', N'Nam', CAST(N'1988-09-12' AS Date), N'CV3', N'CN10', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV106', N'Nguyễn Thị Nữ', N'Nữ', CAST(N'2000-09-12' AS Date), N'CV3', N'CN10', N'2653670187')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV107', N'Lê Viết Cường', N'Nam', CAST(N'2000-05-27' AS Date), N'CV3', N'CN10', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV108', N'Cao Thanh Sơn', N'Nam', CAST(N'2000-02-12' AS Date), N'CV3', N'CN10', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV109', N'Vũ Văn Soát', N'Nam', CAST(N'1977-04-03' AS Date), N'CV3', N'CN10', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV110', N'Vũ Đình Toàn', N'Nam', CAST(N'1991-05-12' AS Date), N'CV3', N'CN10', N'2363872626')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV111', N'Vũ Đình Nam', N'Nam', CAST(N'2000-05-12' AS Date), N'CV3', N'CN11', N'2363872622')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV112', N'Lê Thị Hường', N'Nữ', CAST(N'1985-01-12' AS Date), N'CV3', N'CN11', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV113', N'Nguyễn Tiến Quyết', N'Nam', CAST(N'1990-04-12' AS Date), N'CV3', N'CN11', N'0652615261')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV114', N'Nguyễn Ngọc Ánh', N'Nữ', CAST(N'1968-03-13' AS Date), N'CV3', N'CN11', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV115', N'Trương Thị Vân', N'Nữ', CAST(N'2000-01-01' AS Date), N'CV3', N'CN11', N'0365287162')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV116', N'Đặng Quang Hưng', N'Nam', CAST(N'1970-04-10' AS Date), N'CV3', N'CN11', N'4532871623')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV117', N'Lê Thị Hà Châu', N'Nữ', CAST(N'1974-06-28' AS Date), N'CV3', N'CN11', N'4532871624')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV118', N'Hoàng Thanh Thương', N'Nữ', CAST(N'1973-02-11' AS Date), N'CV3', N'CN12', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV119', N'Nguyễn Thị Thu Hiền', N'Nữ', CAST(N'1973-02-11' AS Date), N'CV3', N'CN12', N'0365276152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV120', N'Đinh Thị Thanh Tâm', N'Nữ', CAST(N'1984-08-21' AS Date), N'CV3', N'CN12', N'0654326543')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV121', N'Nguyễn Thị Thu Hà', N'Nữ', CAST(N'1985-10-26' AS Date), N'CV3', N'CN12', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV122', N'Đào Minh Phương', N'Nữ', CAST(N'1985-10-26' AS Date), N'CV3', N'CN12', N'7652541876')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV123', N'Nguyễn Thái Hanh', N'Nam', CAST(N'1976-02-17' AS Date), N'CV3', N'CN12', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV124', N'Đỗ Thị Thanh Thùy', N'Nữ', CAST(N'1990-04-17' AS Date), N'CV3', N'CN12', N'8743564321')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV125', N'Trần Thị Huệ', N'Nữ', CAST(N'1989-07-09' AS Date), N'CV3', N'CN12', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV126', N'Nguyễn Quốc Tuấn', N'Nam', CAST(N'2000-03-01' AS Date), N'CV3', N'CN12', N'0654653245')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV127', N'Huỳnh Duy Anh', N'Nam', CAST(N'1991-03-01' AS Date), N'CV3', N'CN12', N'0167254123')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV128', N'Huỳnh Duy Anh', N'Nam', CAST(N'1989-03-01' AS Date), N'CV3', N'CN13', N'0167254154')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV129', N'Văn Bội Ngọc', N'Nữ', CAST(N'1991-06-19' AS Date), N'CV3', N'CN13', N'0654267876')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV130', N'Vũ Văn Tài', N'Nam', CAST(N'1868-05-10' AS Date), N'CV3', N'CN13', N'0654354323')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV131', N'Hồ Quỳnh Nhung', N'Nữ', CAST(N'1990-06-12' AS Date), N'CV3', N'CN13', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV132', N'Bùi Văn Giang', N'Nam', CAST(N'2000-09-03' AS Date), N'CV3', N'CN13', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV133', N'Ngô Thị Thanh Tú', N'Nữ', CAST(N'1996-12-02' AS Date), N'CV3', N'CN13', N'0543652761')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV134', N'Huỳnh Hoàng Khang', N'Nam', CAST(N'1996-12-02' AS Date), N'CV3', N'CN13', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV135', N'Nguyễn Quỳnh Hoa', N'Nữ', CAST(N'1998-05-08' AS Date), N'CV3', N'CN13', N'9876251542')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV136', N'Đặng Thị Linh', N'Nữ', CAST(N'1999-11-11' AS Date), N'CV3', N'CN13', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV137', N'Đoàn Đức Dũng', N'Nam', CAST(N'1978-04-05' AS Date), N'CV3', N'CN13', N'3876276510')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV138', N'Nguyễn Thị Lam', N'Nữ', CAST(N'1998-05-08' AS Date), N'CV3', N'CN14', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV139', N'Trương Bá Duy', N'Nam', CAST(N'2000-07-06' AS Date), N'CV3', N'CN14', N'0654354321')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV140', N'Trần Thị Nguyệt Thanh', N'Nữ', CAST(N'2000-04-05' AS Date), N'CV3', N'CN14', N'0654765432')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV141', N'Phạm Bá Nha', N'Nam', CAST(N'2000-07-06' AS Date), N'CV3', N'CN14', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV142', N'Vũ Thị Thu Hoài', N'Nữ', CAST(N'2000-07-06' AS Date), N'CV3', N'CN14', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV143', N'Bùi Minh Thanh', N'Nam', CAST(N'1993-06-16' AS Date), N'CV3', N'CN14', N'0652542467')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV144', N'Phạm Anh Vũ', N'Nam', CAST(N'1987-07-06' AS Date), N'CV3', N'CN14', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV145', N'Nguyễn Huy Đức', N'Nam', CAST(N'1990-02-17' AS Date), N'CV3', N'CN14', N'6547875432')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV146', N'Lâm Phước Nguyên', N'Nam', CAST(N'1996-03-02' AS Date), N'CV3', N'CN14', N'3453234567')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV147', N'Bùi Văn Thảo', N'Nam', CAST(N'2000-03-02' AS Date), N'CV3', N'CN14', N'3453234561')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV148', N'Hồ Việt Triều', N'Nam', CAST(N'2000-05-02' AS Date), N'CV3', N'CN15', N'3453234562')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV149', N'Nguyễn Quốc Toản', N'Nam', CAST(N'1999-03-15' AS Date), N'CV3', N'CN15', N'3453234563')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV150', N'Bùi Duy Hưng', N'Nam', CAST(N'1974-03-15' AS Date), N'CV3', N'CN15', N'3453234564')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV151', N'Trương Sơn Lâm', N'Nam', CAST(N'1979-03-15' AS Date), N'CV3', N'CN15', N'3453234565')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV152', N'Tạ Văn Đẹp', N'Nam', CAST(N'1980-11-20' AS Date), N'CV3', N'CN15', N'3453234566')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV153', N'Võ Đức Nguyện', N'Nam', CAST(N'1987-09-01' AS Date), N'CV3', N'CN15', N'3453234567')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV154', N'Bùi Xuân Thắng', N'Nam', CAST(N'1976-08-20' AS Date), N'CV3', N'CN15', N'3453234568')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV155', N'Lê Quang Nhân', N'Nam', CAST(N'2000-11-20' AS Date), N'CV3', N'CN16', N'3453234569')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV156', N'Phạm Thành Sỹ', N'Nam', CAST(N'1975-03-11' AS Date), N'CV3', N'CN16', N'3453234570')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV157', N'Vũ Hồng Quang', N'Nam', CAST(N'1980-11-20' AS Date), N'CV3', N'CN16', N'3453234571')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV158', N'Nguyễn Văn Thuận', N'Nam', CAST(N'1985-11-20' AS Date), N'CV3', N'CN16', N'3453234572')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV159', N'Vũ Xuân Viên', N'Nam', CAST(N'1982-11-20' AS Date), N'CV3', N'CN16', N'3453234573')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV160', N'Lê Vinh Quy', N'Nam', CAST(N'1981-11-20' AS Date), N'CV3', N'CN16', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV161', N'Nguyễn Thanh Liêm', N'Nam', CAST(N'1970-07-13' AS Date), N'CV3', N'CN16', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV162', N'Ngô Thanh Bình', N'Nam', CAST(N'1999-11-20' AS Date), N'CV3', N'CN17', N'3453234574')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV163', N'Nguyễn Sỹ Quang', N'Nam', CAST(N'1987-05-19' AS Date), N'CV3', N'CN17', N'3453234575')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV164', N'Nguyễn Văn Hiểu', N'Nam', CAST(N'1981-09-09' AS Date), N'CV3', N'CN17', N'3453234576')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV165', N'Phan Huy Ngọc', N'Nam', CAST(N'2000-04-28' AS Date), N'CV3', N'CN17', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV166', N'Tô Anh Dũng', N'Nam', CAST(N'2000-05-29' AS Date), N'CV3', N'CN17', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV167', N'Nguyễn Hải Trung', N'Nam', CAST(N'1976-06-16' AS Date), N'CV3', N'CN17', N'3453234577')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV168', N'Nguyễn Hồng Phong', N'Nam', CAST(N'1976-05-19' AS Date), N'CV3', N'CN17', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV169', N'Bùi Quang Bình', N'Nam', CAST(N'1981-10-21' AS Date), N'CV3', N'CN17', N'3453234578')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV170', N'Vũ Thanh Chương', N'Nam', CAST(N'1987-01-02' AS Date), N'CV3', N'CN17', N'3453234579')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV171', N'Huỳnh Việt Hòa', N'Nam', CAST(N'1989-03-08' AS Date), N'CV3', N'CN17', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV172', N'Đỗ Thanh Bình', N'Nam', CAST(N'1999-03-08' AS Date), N'CV3', N'CN18', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV173', N'Lê Hồng Nam', N'Nam', CAST(N'2000-08-12' AS Date), N'CV3', N'CN18', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV174', N'Nguyễn Thanh Trường', N'Nam', CAST(N'1987-11-12' AS Date), N'CV3', N'CN18', N'2546517819')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV175', N'Nguyễn Thế Hùng', N'Nam', CAST(N'1986-04-07' AS Date), N'CV3', N'CN18', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV176', N'Nguyễn Văn Hận', N'Nam', CAST(N'1999-06-12' AS Date), N'CV3', N'CN18', N'8657261789')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV177', N'Nguyễn Hồng Nhật', N'Nam', CAST(N'1987-03-08' AS Date), N'CV3', N'CN18', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV178', N'Đỗ Viết Giang', N'Nam', CAST(N'1988-09-01' AS Date), N'CV3', N'CN18', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV179', N'Thái Hồng Công', N'Nam', CAST(N'1999-03-08' AS Date), N'CV3', N'CN18', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV180', N'Cao Minh Huyền', N'Nam', CAST(N'2000-06-19' AS Date), N'CV3', N'CN18', N'0652765176')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV181', N'Trương Minh Đương', N'Nam', CAST(N'2000-06-19' AS Date), N'CV3', N'CN18', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV182', N'Phạm Quốc Huy', N'Nam', CAST(N'1990-02-15' AS Date), N'CV3', N'CN19', N'3453234580')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV183', N'Trần Minh Tuấn', N'Nam', CAST(N'1992-07-10' AS Date), N'CV3', N'CN19', N'3453234581')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV184', N'Lê Thị Hồng', N'Nữ', CAST(N'1995-09-12' AS Date), N'CV3', N'CN19', N'3453234582')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV185', N'Nguyễn Thị Lan Anh', N'Nữ', CAST(N'1993-03-05' AS Date), N'CV3', N'CN19', N'3453234583')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV186', N'Hoàng Văn Khánh', N'Nam', CAST(N'1988-12-22' AS Date), N'CV3', N'CN19', N'3453234584')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV187', N'Đỗ Quốc Việt', N'Nam', CAST(N'1991-01-19' AS Date), N'CV3', N'CN19', N'3453234585')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV188', N'Bùi Minh Hằng', N'Nữ', CAST(N'1996-11-27' AS Date), N'CV3', N'CN19', N'3453234586')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV189', N'Trần Văn An', N'Nam', CAST(N'1991-04-12' AS Date), N'CV3', N'CN20', N'3453234587')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV190', N'Nguyễn Thị Bích', N'Nữ', CAST(N'1994-06-23' AS Date), N'CV3', N'CN20', N'3453234588')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV191', N'Phạm Thanh Bình', N'Nam', CAST(N'1992-11-30' AS Date), N'CV3', N'CN20', N'3453234589')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV192', N'Hoàng Minh Sơn', N'Nam', CAST(N'1995-08-19' AS Date), N'CV3', N'CN20', N'3453234590')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV193', N'Vũ Thị Mai', N'Nữ', CAST(N'1989-05-10' AS Date), N'CV3', N'CN20', N'3453234591')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV194', N'Lê Thị Thanh', N'Nữ', CAST(N'1996-03-15' AS Date), N'CV3', N'CN20', N'3453234592')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV195', N'Nguyễn Văn Lợi', N'Nam', CAST(N'1990-07-07' AS Date), N'CV3', N'CN20', N'3453234593')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV196', N'Lê Văn Long', N'Nam', CAST(N'1992-09-12' AS Date), N'CV3', N'CN21', N'3453234594')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV197', N'Phạm Minh Hùng', N'Nam', CAST(N'1994-12-05' AS Date), N'CV3', N'CN21', N'3453234595')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV198', N'Nguyễn Thị Tuyết', N'Nữ', CAST(N'1990-01-17' AS Date), N'CV3', N'CN21', N'3453234596')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV199', N'Trần Hoài Nam', N'Nam', CAST(N'1993-04-28' AS Date), N'CV3', N'CN21', N'3453234597')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV200', N'Bùi Thị Kim', N'Nữ', CAST(N'1995-08-19' AS Date), N'CV3', N'CN21', N'3453234598')
GO
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV201', N'Đỗ Quang Huy', N'Nam', CAST(N'1991-11-11' AS Date), N'CV3', N'CN21', N'3453234599')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV202', N'Hoàng Thị Thu', N'Nữ', CAST(N'1996-06-30' AS Date), N'CV3', N'CN21', N'3453234600')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV203', N'Nguyễn Văn Tài', N'Nam', CAST(N'1993-03-21' AS Date), N'CV3', N'CN22', N'3453234601')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV204', N'Lê Minh Tuấn', N'Nam', CAST(N'1990-05-14' AS Date), N'CV3', N'CN22', N'3453234602')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV205', N'Phạm Thị Thảo', N'Nữ', CAST(N'1994-09-27' AS Date), N'CV3', N'CN22', N'3453234603')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV206', N'Hoàng Văn Hùng', N'Nam', CAST(N'1992-12-11' AS Date), N'CV3', N'CN22', N'3453234604')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV207', N'Nguyễn Thị Hồng', N'Nữ', CAST(N'1996-07-20' AS Date), N'CV3', N'CN22', N'3453234605')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV208', N'Phan Văn Nam', N'Nam', CAST(N'1991-02-25' AS Date), N'CV3', N'CN22', N'3453234606')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV209', N'Trần Minh Nguyệt', N'Nữ', CAST(N'1995-11-30' AS Date), N'CV3', N'CN22', N'3453234607')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV210', N'Trần Quốc Bảo', N'Nam', CAST(N'1992-05-18' AS Date), N'CV3', N'CN23', N'3453234608')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV211', N'Nguyễn Minh Phát', N'Nam', CAST(N'1990-08-29' AS Date), N'CV3', N'CN23', N'3453234609')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV212', N'Phạm Thị Thanh', N'Nữ', CAST(N'1994-04-16' AS Date), N'CV3', N'CN23', N'3453234610')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV213', N'Hoàng Văn Tiến', N'Nam', CAST(N'1991-10-13' AS Date), N'CV3', N'CN23', N'3453234611')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV214', N'Nguyễn Thị Vân', N'Nữ', CAST(N'1995-01-05' AS Date), N'CV3', N'CN23', N'3453234612')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV215', N'Bùi Văn Bình', N'Nam', CAST(N'1993-06-09' AS Date), N'CV3', N'CN23', N'3453234613')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV216', N'Đỗ Thị Kim Anh', N'Nữ', CAST(N'1996-03-22' AS Date), N'CV3', N'CN23', N'3453234614')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV217', N'Nguyễn Văn Thắng', N'Nam', CAST(N'1993-07-15' AS Date), N'CV3', N'CN24', N'3453234615')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV218', N'Lê Thị Thu Hà', N'Nữ', CAST(N'1991-09-24' AS Date), N'CV3', N'CN24', N'3453234616')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV219', N'Phạm Quốc Đạt', N'Nam', CAST(N'1995-02-19' AS Date), N'CV3', N'CN24', N'3453234617')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV220', N'Hoàng Thanh Tùng', N'Nam', CAST(N'1992-12-08' AS Date), N'CV3', N'CN24', N'3453234618')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV221', N'Trần Thị Lan', N'Nữ', CAST(N'1996-06-14' AS Date), N'CV3', N'CN24', N'3453234619')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV222', N'Nguyễn Quang Hưng', N'Nam', CAST(N'1990-10-01' AS Date), N'CV3', N'CN24', N'3453234620')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV223', N'Vũ Thị Phương', N'Nữ', CAST(N'1994-03-27' AS Date), N'CV3', N'CN24', N'3453234621')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV224', N'Trần Văn Quý', N'Nam', CAST(N'1992-11-22' AS Date), N'CV3', N'CN25', N'3453234622')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV225', N'Lê Minh Đăng', N'Nam', CAST(N'1993-05-05' AS Date), N'CV3', N'CN25', N'3453234623')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV226', N'Nguyễn Thị Hoa', N'Nữ', CAST(N'1994-08-18' AS Date), N'CV3', N'CN25', N'3453234624')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV227', N'Phạm Quang Hùng', N'Nam', CAST(N'1991-02-28' AS Date), N'CV3', N'CN25', N'3453234625')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV228', N'Hoàng Thị Lan', N'Nữ', CAST(N'1996-04-13' AS Date), N'CV3', N'CN25', N'3453234626')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV229', N'Bùi Văn Lợi', N'Nam', CAST(N'1995-07-06' AS Date), N'CV3', N'CN25', N'3453234627')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV230', N'Phan Thị Mai', N'Nữ', CAST(N'1990-09-17' AS Date), N'CV3', N'CN25', N'3453234628')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV231', N'Nguyễn Văn Kiên', N'Nam', CAST(N'1991-06-17' AS Date), N'CV3', N'CN26', N'3453234629')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV232', N'Phạm Thị Thu Hà', N'Nữ', CAST(N'1993-10-10' AS Date), N'CV3', N'CN26', N'3453234630')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV233', N'Lê Minh Tuấn', N'Nam', CAST(N'1995-09-23' AS Date), N'CV3', N'CN26', N'3453234631')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV234', N'Hoàng Quang Bình', N'Nam', CAST(N'1992-12-04' AS Date), N'CV3', N'CN26', N'3453234632')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV235', N'Nguyễn Thị Thanh Hương', N'Nữ', CAST(N'1990-04-30' AS Date), N'CV3', N'CN26', N'3453234633')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV236', N'Vũ Văn Hùng', N'Nam', CAST(N'1994-07-14' AS Date), N'CV3', N'CN26', N'3453234634')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV237', N'Bùi Thị Lan Anh', N'Nữ', CAST(N'1996-02-22' AS Date), N'CV3', N'CN26', N'3453234635')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV238', N'Trần Văn Minh', N'Nam', CAST(N'1993-03-15' AS Date), N'CV3', N'CN27', N'3453234636')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV239', N'Nguyễn Thị Lan', N'Nữ', CAST(N'1994-09-22' AS Date), N'CV3', N'CN27', N'3453234637')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV240', N'Phạm Văn Hòa', N'Nam', CAST(N'1991-06-01' AS Date), N'CV3', N'CN27', N'3453234638')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV241', N'Hoàng Thị Bích', N'Nữ', CAST(N'1995-11-10' AS Date), N'CV3', N'CN27', N'3453234639')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV242', N'Nguyễn Quốc Duy', N'Nam', CAST(N'1992-05-17' AS Date), N'CV3', N'CN27', N'3453234640')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV243', N'Vũ Thị Thủy', N'Nữ', CAST(N'1996-04-25' AS Date), N'CV3', N'CN27', N'3453234641')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV244', N'Bùi Văn Khoa', N'Nam', CAST(N'1990-12-30' AS Date), N'CV3', N'CN27', N'3453234642')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV245', N'Lê Quốc Huy', N'Nam', CAST(N'1994-07-14' AS Date), N'CV3', N'CN28', N'3453234643')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV246', N'Nguyễn Thị Mai', N'Nữ', CAST(N'1992-05-21' AS Date), N'CV3', N'CN28', N'3453234644')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV247', N'Phạm Văn An', N'Nam', CAST(N'1991-08-03' AS Date), N'CV3', N'CN28', N'3453234645')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV248', N'Trần Thị Kim', N'Nữ', CAST(N'1996-10-30' AS Date), N'CV3', N'CN28', N'3453234646')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV249', N'Hoàng Văn Thành', N'Nam', CAST(N'1990-12-12' AS Date), N'CV3', N'CN28', N'3453234647')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV250', N'Vũ Thị Nhung', N'Nữ', CAST(N'1995-04-26' AS Date), N'CV3', N'CN28', N'3453234648')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV251', N'Bùi Văn Quang', N'Nam', CAST(N'1993-11-08' AS Date), N'CV3', N'CN28', N'3453234649')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV252', N'Nguyễn Văn Phúc', N'Nam', CAST(N'1992-06-20' AS Date), N'CV3', N'CN29', N'3453234650')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV253', N'Phạm Thị Huyền', N'Nữ', CAST(N'1994-03-16' AS Date), N'CV3', N'CN29', N'3453234651')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV254', N'Lê Văn Thiện', N'Nam', CAST(N'1990-05-01' AS Date), N'CV3', N'CN29', N'3453234652')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV255', N'Trần Thị Thu', N'Nữ', CAST(N'1996-08-27' AS Date), N'CV3', N'CN29', N'3453234653')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV256', N'Hoàng Quốc Đạt', N'Nam', CAST(N'1991-11-15' AS Date), N'CV3', N'CN29', N'3453234654')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV257', N'Vũ Văn Tâm', N'Nam', CAST(N'1993-01-09' AS Date), N'CV3', N'CN29', N'3453234655')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV258', N'Bùi Thị Tuyết', N'Nữ', CAST(N'1995-04-22' AS Date), N'CV3', N'CN29', N'3453234656')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV259', N'Nguyễn Văn Lâm', N'Nam', CAST(N'1990-02-14' AS Date), N'CV3', N'CN30', N'3453234657')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV260', N'Phạm Thị Thanh', N'Nữ', CAST(N'1993-05-30' AS Date), N'CV3', N'CN30', N'3453234658')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV261', N'Lê Văn Hùng', N'Nam', CAST(N'1994-08-25' AS Date), N'CV3', N'CN30', N'3453234659')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV262', N'Trần Thị Hòa', N'Nữ', CAST(N'1991-09-12' AS Date), N'CV3', N'CN30', N'3453234660')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV263', N'Hoàng Quốc Tuấn', N'Nam', CAST(N'1992-03-21' AS Date), N'CV3', N'CN30', N'3453234661')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV264', N'Vũ Thị Vân', N'Nữ', CAST(N'1995-07-09' AS Date), N'CV3', N'CN30', N'3453234662')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV265', N'Bùi Văn Long', N'Nam', CAST(N'1990-10-02' AS Date), N'CV3', N'CN30', N'3453234663')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV266', N'Nguyễn Thị Hạnh', N'Nữ', CAST(N'1994-12-11' AS Date), N'CV3', N'CN30', N'3453234664')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV267', N'Phạm Văn Tài', N'Nam', CAST(N'1993-06-05' AS Date), N'CV3', N'CN30', N'3453234665')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV268', N'Lê Thị Bích', N'Nữ', CAST(N'1992-01-17' AS Date), N'CV3', N'CN30', N'3453234666')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV269', N'Nguyễn Văn Tín', N'Nam', CAST(N'1991-05-06' AS Date), N'CV3', N'CN31', N'3453234667')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV270', N'Phạm Thị Kim', N'Nữ', CAST(N'1992-07-23' AS Date), N'CV3', N'CN31', N'3453234668')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV271', N'Lê Văn Khánh', N'Nam', CAST(N'1994-08-14' AS Date), N'CV3', N'CN31', N'3453234669')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV272', N'Trần Thị Lan', N'Nữ', CAST(N'1990-11-19' AS Date), N'CV3', N'CN31', N'3453234670')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV273', N'Hoàng Quốc Bình', N'Nam', CAST(N'1993-02-12' AS Date), N'CV3', N'CN31', N'3453234671')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV274', N'Vũ Thị Ly', N'Nữ', CAST(N'1995-04-21' AS Date), N'CV3', N'CN31', N'3453234672')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV275', N'Bùi Văn Thi', N'Nam', CAST(N'1991-03-05' AS Date), N'CV3', N'CN31', N'3453234673')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV276', N'Nguyễn Thị Ngọc', N'Nữ', CAST(N'1994-10-30' AS Date), N'CV3', N'CN31', N'3453234674')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV277', N'Phạm Văn Hậu', N'Nam', CAST(N'1992-12-26' AS Date), N'CV3', N'CN31', N'3453234675')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV278', N'Lê Thị Bảo', N'Nữ', CAST(N'1990-06-09' AS Date), N'CV3', N'CN31', N'3453234676')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV279', N'Nguyễn Văn Tín', N'Nam', CAST(N'1991-05-06' AS Date), N'CV3', N'CN32', N'3453234667')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV280', N'Phạm Thị Kim', N'Nữ', CAST(N'1992-07-23' AS Date), N'CV3', N'CN32', N'3453234668')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV281', N'Lê Văn Khánh', N'Nam', CAST(N'1994-08-14' AS Date), N'CV3', N'CN32', N'3453234669')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV282', N'Trần Thị Lan', N'Nữ', CAST(N'1990-11-19' AS Date), N'CV3', N'CN32', N'3453234670')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV283', N'Hoàng Quốc Bình', N'Nam', CAST(N'1993-02-12' AS Date), N'CV3', N'CN32', N'3453234671')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV284', N'Vũ Thị Ly', N'Nữ', CAST(N'1995-04-21' AS Date), N'CV3', N'CN32', N'3453234672')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV285', N'Bùi Văn Thi', N'Nam', CAST(N'1991-03-05' AS Date), N'CV3', N'CN32', N'3453234673')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV286', N'Nguyễn Thị Ngọc', N'Nữ', CAST(N'1994-10-30' AS Date), N'CV3', N'CN33', N'3453234674')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV287', N'Phạm Văn Hậu', N'Nam', CAST(N'1992-12-26' AS Date), N'CV3', N'CN33', N'3453234675')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV288', N'Lê Thị Bảo', N'Nữ', CAST(N'1990-06-09' AS Date), N'CV3', N'CN33', N'3453234676')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV289', N'Nguyễn Văn Sáng', N'Nam', CAST(N'1991-04-15' AS Date), N'CV3', N'CN33', N'3453234677')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV290', N'Phạm Thị Lan', N'Nữ', CAST(N'1993-09-24' AS Date), N'CV3', N'CN33', N'3453234678')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV291', N'Lê Văn Phúc', N'Nam', CAST(N'1990-12-05' AS Date), N'CV3', N'CN33', N'3453234679')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV292', N'Trần Thị Duyên', N'Nữ', CAST(N'1995-02-28' AS Date), N'CV3', N'CN33', N'3453234680')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV293', N'Hoàng Quốc Hưng', N'Nam', CAST(N'1994-01-17' AS Date), N'CV3', N'CN33', N'3453234681')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV294', N'Vũ Thị Minh', N'Nữ', CAST(N'1992-08-11' AS Date), N'CV3', N'CN33', N'3453234682')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV295', N'Bùi Văn Hạnh', N'Nam', CAST(N'1996-06-30' AS Date), N'CV3', N'CN33', N'3453234683')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV296', N'Nguyễn Văn Chiến', N'Nam', CAST(N'1991-02-14' AS Date), N'CV3', N'CN34', N'3453234684')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV297', N'Phạm Thị Hạnh', N'Nữ', CAST(N'1994-10-09' AS Date), N'CV3', N'CN34', N'3453234685')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV298', N'Lê Văn Hòa', N'Nam', CAST(N'1992-11-28' AS Date), N'CV3', N'CN34', N'3453234686')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV299', N'Trần Thị Thuý', N'Nữ', CAST(N'1995-03-16' AS Date), N'CV3', N'CN34', N'3453234687')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV300', N'Hoàng Quốc Vương', N'Nam', CAST(N'1990-07-22' AS Date), N'CV3', N'CN34', N'3453234688')
GO
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV301', N'Vũ Thị Dư', N'Nữ', CAST(N'1993-05-05' AS Date), N'CV3', N'CN34', N'3453234689')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV302', N'Bùi Văn An', N'Nam', CAST(N'1996-01-01' AS Date), N'CV3', N'CN34', N'3453234690')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV303', N'Nguyễn Văn Đạt', N'Nam', CAST(N'1994-02-18' AS Date), N'CV3', N'CN35', N'3453234691')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV304', N'Phạm Thị Lợi', N'Nữ', CAST(N'1991-06-11' AS Date), N'CV3', N'CN35', N'3453234692')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV305', N'Lê Văn Khoa', N'Nam', CAST(N'1993-08-21' AS Date), N'CV3', N'CN35', N'3453234693')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV306', N'Trần Thị Hoa', N'Nữ', CAST(N'1995-09-10' AS Date), N'CV3', N'CN35', N'3453234694')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV307', N'Hoàng Quốc Bảo', N'Nam', CAST(N'1990-12-30' AS Date), N'CV3', N'CN35', N'3453234695')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV308', N'Vũ Thị Nghĩa', N'Nữ', CAST(N'1992-05-15' AS Date), N'CV3', N'CN35', N'3453234696')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV309', N'Bùi Văn Sáng', N'Nam', CAST(N'1996-03-25' AS Date), N'CV3', N'CN35', N'3453234697')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV310', N'Nguyễn Văn Hòa', N'Nam', CAST(N'1991-07-14' AS Date), N'CV3', N'CN36', N'3453234698')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV311', N'Phạm Thị Cẩm', N'Nữ', CAST(N'1993-12-02' AS Date), N'CV3', N'CN36', N'3453234699')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV312', N'Lê Văn Khải', N'Nam', CAST(N'1992-08-19' AS Date), N'CV3', N'CN36', N'3453234700')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV313', N'Trần Thị Diễm', N'Nữ', CAST(N'1995-05-27' AS Date), N'CV3', N'CN36', N'3453234701')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV314', N'Hoàng Quốc Tính', N'Nam', CAST(N'1990-11-03' AS Date), N'CV3', N'CN36', N'3453234702')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV315', N'Vũ Thị Xuân', N'Nữ', CAST(N'1994-09-16' AS Date), N'CV3', N'CN36', N'3453234703')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV316', N'Bùi Văn Đăng', N'Nam', CAST(N'1996-10-20' AS Date), N'CV3', N'CN36', N'3453234704')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV317', N'Nguyễn Văn Hiếu', N'Nam', CAST(N'1992-06-13' AS Date), N'CV3', N'CN37', N'3453234705')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV318', N'Phạm Thị Ngọc', N'Nữ', CAST(N'1991-04-25' AS Date), N'CV3', N'CN37', N'3453234706')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV319', N'Lê Văn Thắng', N'Nam', CAST(N'1993-09-20' AS Date), N'CV3', N'CN37', N'3453234707')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV320', N'Trần Thị Mai', N'Nữ', CAST(N'1994-11-08' AS Date), N'CV3', N'CN37', N'3453234708')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV321', N'Hoàng Quốc Định', N'Nam', CAST(N'1990-01-19' AS Date), N'CV3', N'CN37', N'3453234709')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV322', N'Vũ Thị Hương', N'Nữ', CAST(N'1995-07-23' AS Date), N'CV3', N'CN37', N'3453234710')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV323', N'Bùi Văn Hải', N'Nam', CAST(N'1996-02-14' AS Date), N'CV3', N'CN37', N'3453234711')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV324', N'Nguyễn Văn Khoa', N'Nam', CAST(N'1992-08-09' AS Date), N'CV3', N'CN38', N'3453234712')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV325', N'Phạm Thị Phương', N'Nữ', CAST(N'1993-11-15' AS Date), N'CV3', N'CN38', N'3453234713')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV326', N'Lê Văn Minh', N'Nam', CAST(N'1990-10-25' AS Date), N'CV3', N'CN38', N'3453234714')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV327', N'Trần Thị An', N'Nữ', CAST(N'1994-03-10' AS Date), N'CV3', N'CN38', N'3453234715')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV328', N'Hoàng Quốc Vĩ', N'Nam', CAST(N'1991-01-29' AS Date), N'CV3', N'CN38', N'3453234716')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV329', N'Vũ Thị Lan', N'Nữ', CAST(N'1995-04-17' AS Date), N'CV3', N'CN38', N'3453234717')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV330', N'Bùi Văn Long', N'Nam', CAST(N'1996-09-11' AS Date), N'CV3', N'CN38', N'3453234718')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV331', N'Nguyễn Văn Dũng', N'Nam', CAST(N'1991-02-17' AS Date), N'CV3', N'CN39', N'3453234719')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV332', N'Phạm Thị Tâm', N'Nữ', CAST(N'1993-12-01' AS Date), N'CV3', N'CN39', N'3453234720')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV333', N'Lê Văn Toàn', N'Nam', CAST(N'1990-11-20' AS Date), N'CV3', N'CN39', N'3453234721')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV334', N'Trần Thị Ngân', N'Nữ', CAST(N'1992-04-14' AS Date), N'CV3', N'CN39', N'3453234722')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV335', N'Hoàng Quốc Nam', N'Nam', CAST(N'1994-06-27' AS Date), N'CV3', N'CN39', N'3453234723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV336', N'Vũ Thị Thu', N'Nữ', CAST(N'1995-07-15' AS Date), N'CV3', N'CN39', N'3453234724')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV337', N'Bùi Văn Lộc', N'Nam', CAST(N'1996-08-19' AS Date), N'CV3', N'CN39', N'3453234725')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV338', N'Ngô Thị Lài', N'Nữ', CAST(N'1992-05-18' AS Date), N'CV3', N'CN39', N'3453234726')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV339', N'Phan Văn Long', N'Nam', CAST(N'1993-09-06' AS Date), N'CV3', N'CN39', N'3453234727')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV340', N'Đỗ Thị Yến', N'Nữ', CAST(N'1994-01-12' AS Date), N'CV3', N'CN39', N'3453234728')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV341', N'Nguyễn Văn Phúc', N'Nam', CAST(N'1991-02-22' AS Date), N'CV3', N'CN40', N'3453234729')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV342', N'Phạm Thị Nguyệt', N'Nữ', CAST(N'1993-11-13' AS Date), N'CV3', N'CN40', N'3453234730')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV343', N'Lê Văn Bảo', N'Nam', CAST(N'1990-03-10' AS Date), N'CV3', N'CN40', N'3453234731')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV344', N'Trần Thị Linh', N'Nữ', CAST(N'1992-07-19' AS Date), N'CV3', N'CN40', N'3453234732')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV345', N'Hoàng Quốc Hải', N'Nam', CAST(N'1994-01-01' AS Date), N'CV3', N'CN40', N'3453234733')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV346', N'Vũ Thị Nga', N'Nữ', CAST(N'1995-08-21' AS Date), N'CV3', N'CN40', N'3453234734')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV347', N'Bùi Văn Phong', N'Nam', CAST(N'1996-06-06' AS Date), N'CV3', N'CN40', N'3453234735')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV348', N'Ngô Thị Hoa', N'Nữ', CAST(N'1992-09-15' AS Date), N'CV3', N'CN40', N'3453234736')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV349', N'Phan Văn Đăng', N'Nam', CAST(N'1993-05-24' AS Date), N'CV3', N'CN40', N'3453234737')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV350', N'Đỗ Thị Anh', N'Nữ', CAST(N'1994-12-28' AS Date), N'CV3', N'CN40', N'3453234738')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV351', N'Nguyễn Văn Trọng', N'Nam', CAST(N'1991-03-14' AS Date), N'CV3', N'CN41', N'3453234739')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV352', N'Phạm Thị Hạnh', N'Nữ', CAST(N'1993-12-19' AS Date), N'CV3', N'CN41', N'3453234740')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV353', N'Lê Văn Tấn', N'Nam', CAST(N'1990-09-27' AS Date), N'CV3', N'CN41', N'3453234741')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV354', N'Trần Thị Diệu', N'Nữ', CAST(N'1992-04-04' AS Date), N'CV3', N'CN41', N'3453234742')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV355', N'Hoàng Quốc Thành', N'Nam', CAST(N'1994-02-18' AS Date), N'CV3', N'CN41', N'3453234743')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV356', N'Vũ Thị Bình', N'Nữ', CAST(N'1995-06-12' AS Date), N'CV3', N'CN41', N'3453234744')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV357', N'Bùi Văn An', N'Nam', CAST(N'1996-10-25' AS Date), N'CV3', N'CN41', N'3453234745')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV358', N'Ngô Thị Thanh', N'Nữ', CAST(N'1992-11-30' AS Date), N'CV3', N'CN41', N'3453234746')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV359', N'Phan Văn Minh', N'Nam', CAST(N'1993-07-17' AS Date), N'CV3', N'CN41', N'3453234747')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV360', N'Đỗ Thị Lan', N'Nữ', CAST(N'1994-08-22' AS Date), N'CV3', N'CN41', N'3453234748')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV361', N'Nguyễn Văn Hiền', N'Nam', CAST(N'1991-05-14' AS Date), N'CV3', N'CN42', N'3453234749')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV362', N'Phạm Thị Lan', N'Nữ', CAST(N'1993-07-11' AS Date), N'CV3', N'CN42', N'3453234750')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV363', N'Lê Văn Khang', N'Nam', CAST(N'1990-08-29' AS Date), N'CV3', N'CN42', N'3453234751')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV364', N'Trần Thị Vân', N'Nữ', CAST(N'1992-03-03' AS Date), N'CV3', N'CN42', N'3453234752')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV365', N'Hoàng Quốc Hùng', N'Nam', CAST(N'1994-09-15' AS Date), N'CV3', N'CN42', N'3453234753')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV366', N'Vũ Thị Mai', N'Nữ', CAST(N'1995-01-26' AS Date), N'CV3', N'CN42', N'3453234754')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV367', N'Bùi Văn Dương', N'Nam', CAST(N'1996-11-10' AS Date), N'CV3', N'CN42', N'3453234755')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV368', N'Ngô Thị Thu', N'Nữ', CAST(N'1992-10-12' AS Date), N'CV3', N'CN42', N'3453234756')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV369', N'Phan Văn Hoàng', N'Nam', CAST(N'1993-02-19' AS Date), N'CV3', N'CN42', N'3453234757')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV370', N'Đỗ Thị Minh', N'Nữ', CAST(N'1994-04-23' AS Date), N'CV3', N'CN42', N'3453234758')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV371', N'Nguyễn Văn Toàn', N'Nam', CAST(N'1991-06-05' AS Date), N'CV5', N'CN43', N'3453234759')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV372', N'Phạm Thị Hường', N'Nữ', CAST(N'1993-04-12' AS Date), N'CV5', N'CN43', N'3453234760')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV373', N'Lê Văn Phúc', N'Nam', CAST(N'1990-07-23' AS Date), N'CV5', N'CN43', N'3453234761')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV374', N'Trần Thị Hồng', N'Nữ', CAST(N'1992-01-30' AS Date), N'CV5', N'CN43', N'3453234762')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV375', N'Hoàng Quốc Bảo', N'Nam', CAST(N'1994-08-07' AS Date), N'CV5', N'CN43', N'3453234763')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV376', N'Vũ Thị Thu Hà', N'Nữ', CAST(N'1995-11-15' AS Date), N'CV5', N'CN43', N'3453234764')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV377', N'Nguyễn Văn Kiên', N'Nam', CAST(N'1992-09-18' AS Date), N'CV5', N'CN43', N'3453234765')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV378', N'Phạm Thị Hạnh', N'Nữ', CAST(N'1994-02-05' AS Date), N'CV5', N'CN43', N'3453234766')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV379', N'Nguyễn Thị Anh', N'Nữ', CAST(N'1990-01-05' AS Date), N'CV4', N'CN1', N'')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV380', N'Trần Thị Lan', N'Nữ', CAST(N'1990-02-09' AS Date), N'CV4', N'CN1', N'7856312831')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV381', N'Lê Thị Phương', N'Nữ', CAST(N'1990-03-12' AS Date), N'CV4', N'CN1', N'2364288321')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV382', N'Phạm Thị Hằng', N'Nữ', CAST(N'1990-04-01' AS Date), N'CV3', N'CN2', N'0834727141')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV383', N'Nguyễn Văn Ngân', N'Nữ', CAST(N'1990-05-18' AS Date), N'CV4', N'CN2', N'8673296019')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV384', N'Hoàng Thị Linh', N'Nữ', CAST(N'1990-06-23' AS Date), N'CV4', N'CN4', N'4712949012')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV385', N'Đặng Thị Thu', N'Nữ', CAST(N'1990-07-14' AS Date), N'CV4', N'CN3', N'2385901581')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV386', N'Bùi Thị Mai', N'Nữ', CAST(N'1990-08-30' AS Date), N'CV4', N'CN3', N'7280130190')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV387', N'Võ Thị Hà', N'Nữ', CAST(N'1990-09-07' AS Date), N'CV4', N'CN3', N'9872561253')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV388', N'Lý Thị Thanh', N'Nữ', CAST(N'1990-10-25' AS Date), N'CV4', N'CN4', N'8977213675')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV389', N'Vũ Thị Ngọc', N'Nữ', CAST(N'1991-02-11' AS Date), N'CV4', N'CN4', N'6331200443')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV390', N'Nguyễn Thị Minh', N'Nữ', CAST(N'1991-01-15' AS Date), N'CV4', N'CN4', N'8323958091')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV391', N'Trần Thị Tuyết', N'Nữ', CAST(N'1991-04-22' AS Date), N'CV4', N'CN5', N'3083081338')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV392', N'Lê Thị Hồng', N'Nữ', CAST(N'1991-06-27' AS Date), N'CV4', N'CN5', N'6084151323')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV393', N'Phạm Thị Kim', N'Nữ', CAST(N'1991-07-08' AS Date), N'CV4', N'CN5', N'2340238985')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV394', N'Hoàng Thị Phương', N'Nữ', CAST(N'1991-03-04' AS Date), N'CV4', N'CN6', N'8992862165')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV395', N'Đặng Thị Quỳnh', N'Nữ', CAST(N'1991-08-19' AS Date), N'CV4', N'CN6', N'1997021945')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV396', N'Bùi Thị Dung', N'Nữ', CAST(N'1991-09-28' AS Date), N'CV4', N'CN6', N'8126883128')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV397', N'Võ Thị Thủy', N'Nữ', CAST(N'1991-10-06' AS Date), N'CV4', N'CN7', N'7009158038')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV398', N'Lý Thị Bích', N'Nữ', CAST(N'1991-12-02' AS Date), N'CV4', N'CN7', N'7009158027')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV399', N'Vũ Thị Nhung', N'Nữ', CAST(N'1992-01-23' AS Date), N'CV4', N'CN7', N'8126892128')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV400', N'Nguyễn Thị Hạnh', N'Nữ', CAST(N'1992-03-31' AS Date), N'CV4', N'CN8', N'8126990128')
GO
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV401', N'Trần Thị Yến', N'Nữ', CAST(N'1992-04-15' AS Date), N'CV4', N'CN8', N'8126888128')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV402', N'Lê Thị Thúy', N'Nữ', CAST(N'1992-05-10' AS Date), N'CV4', N'CN8', N'8126880028')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV403', N'Phạm Thị Lan Anh', N'Nữ', CAST(N'1992-06-20' AS Date), N'CV4', N'CN9', N'2265726112')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV404', N'Hoàng Thị Khánh', N'Nữ', CAST(N'1992-07-29' AS Date), N'CV4', N'CN9', N'5865328723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV405', N'Đặng Thị Hoa', N'Nữ', CAST(N'1992-08-05' AS Date), N'CV4', N'CN9', N'5465618723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV406', N'Bùi Thị Ánh', N'Nữ', CAST(N'1992-09-12' AS Date), N'CV4', N'CN10', N'4065726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV407', N'Võ Thị Tâm', N'Nữ', CAST(N'1992-10-14' AS Date), N'CV4', N'CN10', N'9065768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV408', N'Lý Thị Diễm', N'Nữ', CAST(N'1992-11-21' AS Date), N'CV4', N'CN10', N'7565768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV409', N'Vũ Thị Xuân', N'Nữ', CAST(N'1993-01-13' AS Date), N'CV4', N'CN11', N'8165726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV410', N'Nguyễn Thị Dương', N'Nữ', CAST(N'1993-02-03' AS Date), N'CV4', N'CN11', N'2965768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV411', N'Trần Thị Mỹ', N'Nữ', CAST(N'1993-03-20' AS Date), N'CV4', N'CN11', N'1565768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV412', N'Lê Thị Mai Anh', N'Nữ', CAST(N'1993-04-25' AS Date), N'CV4', N'CN12', N'1065726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV413', N'Phạm Thị Thảo', N'Nữ', CAST(N'1993-05-11' AS Date), N'CV4', N'CN12', N'1165768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV414', N'Hoàng Thị Thanh', N'Nữ', CAST(N'1993-06-22' AS Date), N'CV4', N'CN12', N'1265768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV415', N'Đặng Thị Như', N'Nữ', CAST(N'1993-07-09' AS Date), N'CV4', N'CN13', N'5165726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV416', N'Bùi Thị Vân', N'Nữ', CAST(N'1993-08-16' AS Date), N'CV4', N'CN13', N'5265768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV417', N'Võ Thị Phượng', N'Nữ', CAST(N'1993-09-27' AS Date), N'CV4', N'CN13', N'5921468723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV418', N'Lý Thị Liên', N'Nữ', CAST(N'1993-10-01' AS Date), N'CV4', N'CN14', N'7065726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV419', N'Vũ Thị Tuyết', N'Nữ', CAST(N'1994-01-24' AS Date), N'CV4', N'CN14', N'7365768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV420', N'Nguyễn Thị Thùy', N'Nữ', CAST(N'1994-02-18' AS Date), N'CV4', N'CN14', N'0965768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV421', N'Nguyễn Ngọc Lan', N'Nữ', CAST(N'1994-03-30' AS Date), N'CV4', N'CN15', N'1065726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV422', N'Trần Hoàng Mai', N'Nữ', CAST(N'1994-04-17' AS Date), N'CV4', N'CN15', N'7895768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV423', N'Lê Bảo Anh', N'Nữ', CAST(N'1994-05-04' AS Date), N'CV4', N'CN15', N'1095768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV424', N'Phạm Hồng Ngọc', N'Nữ', CAST(N'1994-06-21' AS Date), N'CV4', N'CN16', N'1025726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV425', N'Hoàng Minh Châu', N'Nữ', CAST(N'1994-07-12' AS Date), N'CV4', N'CN16', N'1035768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV426', N'Đặng Kim Oanh', N'Nữ', CAST(N'1994-08-15' AS Date), N'CV4', N'CN16', N'1045768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV427', N'Bùi Thanh Hà', N'Nữ', CAST(N'1994-09-03' AS Date), N'CV4', N'CN17', N'2195726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV428', N'Võ Khánh Linh', N'Nữ', CAST(N'1994-10-27' AS Date), N'CV4', N'CN17', N'5461908723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV429', N'Lý Minh Hằng', N'Nữ', CAST(N'1995-01-01' AS Date), N'CV4', N'CN17', N'5462998723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV430', N'Vũ Diễm My', N'Nữ', CAST(N'1995-02-28' AS Date), N'CV4', N'CN18', N'2102726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV431', N'Nguyễn Bảo Trân', N'Nữ', CAST(N'1995-03-22' AS Date), N'CV4', N'CN18', N'5465760113')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV432', N'Trần Quỳnh Anh', N'Nữ', CAST(N'1995-04-05' AS Date), N'CV4', N'CN18', N'5465761003')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV433', N'Lê Mỹ Duyên', N'Nữ', CAST(N'1995-05-13' AS Date), N'CV4', N'CN19', N'2182726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV434', N'Phạm Khánh Vy', N'Nữ', CAST(N'1995-06-17' AS Date), N'CV4', N'CN19', N'5465766723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV435', N'Hoàng Thanh Tú', N'Nữ', CAST(N'1995-07-30' AS Date), N'CV4', N'CN19', N'5465710223')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV436', N'Đặng Mai Anh', N'Nữ', CAST(N'1995-08-11' AS Date), N'CV4', N'CN20', N'2284726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV437', N'Bùi Hương Giang', N'Nữ', CAST(N'1995-09-26' AS Date), N'CV4', N'CN20', N'5437128723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV438', N'Võ Thùy Dung', N'Nữ', CAST(N'1995-10-04' AS Date), N'CV4', N'CN20', N'5469188723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV439', N'Lý Thanh Trúc', N'Nữ', CAST(N'1996-01-10' AS Date), N'CV4', N'CN21', N'2219026152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV440', N'Vũ Ngọc Anh', N'Nữ', CAST(N'1996-02-12' AS Date), N'CV4', N'CN21', N'5465769913')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV441', N'Nguyễn Hồng Diễm', N'Nữ', CAST(N'1996-03-15' AS Date), N'CV4', N'CN21', N'5465762543')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV442', N'Trần Hải Yến', N'Nữ', CAST(N'1996-04-11' AS Date), N'CV4', N'CN22', N'2265152152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV443', N'Lê Hồng Nhung', N'Nữ', CAST(N'1996-05-22' AS Date), N'CV4', N'CN22', N'5465125723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV445', N'Phạm Thảo Nguyên', N'Nữ', CAST(N'1996-06-09' AS Date), N'CV4', N'CN22', N'546992723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV446', N'Hoàng Mai Chi', N'Nữ', CAST(N'1996-07-28' AS Date), N'CV4', N'CN23', N'226592052')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV447', N'Đặng Mỹ Linh', N'Nữ', CAST(N'1996-08-21' AS Date), N'CV4', N'CN23', N'546574723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV448', N'Bùi Quỳnh Trang', N'Nữ', CAST(N'1996-09-17' AS Date), N'CV4', N'CN23', N'546512723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV449', N'Võ Hồng Nhung', N'Nữ', CAST(N'1996-10-30' AS Date), N'CV4', N'CN24', N'2261296152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV450', N'Lý Thu Minh', N'Nữ', CAST(N'1997-01-15' AS Date), N'CV4', N'CN24', N'5461208723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV451', N'Vũ Ngọc Lan', N'Nữ', CAST(N'1997-02-05' AS Date), N'CV4', N'CN24', N'5462898723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV452', N'Nguyễn Diễm Trang', N'Nữ', CAST(N'1997-03-18' AS Date), N'CV4', N'CN25', N'226512852')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV453', N'Trần Khánh An', N'Nữ', CAST(N'1997-04-21' AS Date), N'CV4', N'CN25', N'546510923')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV454', N'Lê Hải Anh', N'Nữ', CAST(N'1997-05-14' AS Date), N'CV4', N'CN25', N'5465288723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV455', N'Phạm Hoài An', N'Nữ', CAST(N'1997-06-30' AS Date), N'CV4', N'CN26', N'2261296152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV456', N'Hoàng Yến Nhi', N'Nữ', CAST(N'1997-07-07' AS Date), N'CV4', N'CN26', N'5465121723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV457', N'Đặng Thanh Hằng', N'Nữ', CAST(N'1997-08-12' AS Date), N'CV4', N'CN26', N'5465122723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV458', N'Bùi Kiều Anh', N'Nữ', CAST(N'1997-09-29' AS Date), N'CV4', N'CN27', N'2261876152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV459', N'Võ Thanh Hương', N'Nữ', CAST(N'1997-10-11' AS Date), N'CV4', N'CN27', N'5465716723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV460', N'Lý Bích Phương', N'Nữ', CAST(N'1998-01-03' AS Date), N'CV4', N'CN27', N'5465709023')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV461', N'Vũ Hoàng Anh', N'Nữ', CAST(N'1998-03-23' AS Date), N'CV4', N'CN28', N'2129826152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV462', N'Nguyễn Ngọc Diệp', N'Nữ', CAST(N'1998-04-14' AS Date), N'CV4', N'CN28', N'0905768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV463', N'Trần Bảo Ngọc', N'Nữ', CAST(N'1998-05-17' AS Date), N'CV4', N'CN28', N'1925768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV464', N'Lê Nhật Linh', N'Nữ', CAST(N'1998-06-26' AS Date), N'CV4', N'CN29', N'2261726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV465', N'Phạm Phương Linh', N'Nữ', CAST(N'1998-07-04' AS Date), N'CV4', N'CN29', N'5419208723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV466', N'Hoàng Ngọc Mai', N'Nữ', CAST(N'1998-08-10' AS Date), N'CV4', N'CN29', N'5465192023')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV467', N'Đặng Minh Ngọc', N'Nữ', CAST(N'1998-09-15' AS Date), N'CV4', N'CN30', N'2262847152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV468', N'Bùi Hải Anh', N'Nữ', CAST(N'1998-10-20' AS Date), N'CV4', N'CN30', N'5419068723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV469', N'Võ Nhật Anh', N'Nữ', CAST(N'1999-01-12' AS Date), N'CV4', N'CN30', N'546888723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV470', N'Lý Tường Vy', N'Nữ', CAST(N'1999-02-22' AS Date), N'CV4', N'CN31', N'2265560152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV471', N'Vũ Bảo Linh', N'Nữ', CAST(N'1999-03-06' AS Date), N'CV4', N'CN31', N'920768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV472', N'Lý Thị Kim Dung', N'Nữ', CAST(N'1999-04-30' AS Date), N'CV4', N'CN31', N'546812723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV473', N'Võ Thị Ánh Tuyết', N'Nữ', CAST(N'1999-05-24' AS Date), N'CV4', N'CN32', N'2262856152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV474', N'Bùi Thị Ngọc Trinh', N'Nữ', CAST(N'1999-06-11' AS Date), N'CV4', N'CN32', N'5465761283')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV475', N'Đặng Thị Hồng Phúc', N'Nữ', CAST(N'1999-07-18' AS Date), N'CV4', N'CN32', N'5465756723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV476', N'Hoàng Thị Tường Vy', N'Nữ', CAST(N'1999-08-23' AS Date), N'CV4', N'CN33', N'2264716152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV477', N'Phạm Thị Phương Hoa', N'Nữ', CAST(N'1999-09-02' AS Date), N'CV4', N'CN33', N'5469858723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV478', N'Lê Thị Mai Chi', N'Nữ', CAST(N'1999-10-09' AS Date), N'CV4', N'CN33', N'5461282723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV479', N'Trần Thị Thanh Loan', N'Nữ', CAST(N'2000-01-01' AS Date), N'CV4', N'CN34', N'2265712942')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV480', N'Nguyễn Thị Bảo Trân', N'Nữ', CAST(N'2000-02-15' AS Date), N'CV4', N'CN34', N'5190768723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV481', N'Trần Thị Lài', N'Nữ', CAST(N'2000-03-03' AS Date), N'CV4', N'CN34', N'5461298723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV482', N'Lê Thị Nhung', N'Nữ', CAST(N'2000-04-20' AS Date), N'CV4', N'CN35', N'1115726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV483', N'Phạm Thị Minh Nguyệt', N'Nữ', CAST(N'2000-05-11' AS Date), N'CV4', N'CN35', N'5465112723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV484', N'Hoàng Thị Hồng Nhung', N'Nữ', CAST(N'2000-06-26' AS Date), N'CV4', N'CN35', N'5465761133')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV485', N'Đặng Thị Minh Thư', N'Nữ', CAST(N'2000-07-12' AS Date), N'CV4', N'CN36', N'2242726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV486', N'Bùi Thị Quỳnh Hoa', N'Nữ', CAST(N'2000-08-31' AS Date), N'CV4', N'CN36', N'5465222723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV487', N'Võ Thị Kiều', N'Nữ', CAST(N'2000-09-08' AS Date), N'CV4', N'CN36', N'5461224723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV488', N'Lý Thị Hằng', N'Nữ', CAST(N'2000-10-25' AS Date), N'CV4', N'CN37', N'2262819152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV489', N'Vũ Thị Ánh Nguyệt', N'Nữ', CAST(N'1990-12-09' AS Date), N'CV4', N'CN37', N'5447568723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV490', N'Nguyễn Thị Kim Oanh', N'Nữ', CAST(N'1991-12-15' AS Date), N'CV4', N'CN37', N'5192468723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV491', N'Trần Thị Thúy Hằng', N'Nữ', CAST(N'1992-11-14' AS Date), N'CV4', N'CN38', N'2299026152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV492', N'Lê Thị Kim Chi', N'Nữ', CAST(N'1993-10-30' AS Date), N'CV4', N'CN38', N'5465248723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV493', N'Phạm Thị Mai Hương', N'Nữ', CAST(N'1994-09-25' AS Date), N'CV4', N'CN38', N'5468278723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV494', N'Hoàng Thị Thanh Thủy', N'Nữ', CAST(N'1995-08-02' AS Date), N'CV4', N'CN39', N'2261006152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV495', N'Đặng Thị Diệu', N'Nữ', CAST(N'1996-07-05' AS Date), N'CV4', N'CN39', N'5465761003')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV496', N'Bùi Thị Ngân', N'Nữ', CAST(N'1997-06-22' AS Date), N'CV4', N'CN39', N'5465761293')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV497', N'Võ Thị Yến Nhi', N'Nữ', CAST(N'1998-05-19' AS Date), N'CV4', N'CN40', N'2995726152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV498', N'Lý Thị Hương', N'Nữ', CAST(N'1999-04-08' AS Date), N'CV4', N'CN40', N'5465120723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV499', N'Vũ Thị Hoài', N'Nữ', CAST(N'1990-03-27' AS Date), N'CV4', N'CN40', N'5465628723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV500', N'Nguyễn Thị Phương Thảo', N'Nữ', CAST(N'1991-05-23' AS Date), N'CV4', N'CN41', N'2200126152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV501', N'Trần Thị Thùy Linh', N'Nữ', CAST(N'1992-06-15' AS Date), N'CV4', N'CN41', N'5400268723')
GO
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV502', N'Lê Thị Thu Hằng', N'Nữ', CAST(N'1993-07-11' AS Date), N'CV4', N'CN41', N'5460068723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV503', N'Phạm Thị Kim Cương', N'Nữ', CAST(N'1994-08-07' AS Date), N'CV4', N'CN42', N'2265819152')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV504', N'Hoàng Thị Ái', N'Nữ', CAST(N'1995-09-29' AS Date), N'CV4', N'CN42', N'5465102723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV505', N'Đặng Thị Bích Liên', N'Nữ', CAST(N'1996-10-16' AS Date), N'CV4', N'CN42', N'5465106723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV506', N'Nguyễn Thị Hoa', N'Nữ', CAST(N'1992-05-15' AS Date), N'CV3', N'CN37', N'3453234713')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV507', N'Phạm Văn Lâm', N'Nam', CAST(N'1990-09-22' AS Date), N'CV3', N'CN37', N'3453234714')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV508', N'Lê Thị Lan', N'Nữ', CAST(N'1993-11-17' AS Date), N'CV3', N'CN37', N'3453234715')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV509', N'Ngô Văn Huy', N'Nam', CAST(N'1995-07-02' AS Date), N'CV3', N'CN37', N'3453234716')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV510', N'Hoàng Thị Minh', N'Nữ', CAST(N'1994-08-09' AS Date), N'CV3', N'CN37', N'3453234717')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV511', N'Bùi Văn Kiên', N'Nam', CAST(N'1996-04-21' AS Date), N'CV3', N'CN37', N'3453234718')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV512', N'Phan Thị Oanh', N'Nữ', CAST(N'1993-12-25' AS Date), N'CV3', N'CN37', N'3453234719')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV513', N'Tạ Văn Long', N'Nam', CAST(N'1991-02-07' AS Date), N'CV3', N'CN37', N'3453234720')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV514', N'Doãn Thị Phượng', N'Nữ', CAST(N'1995-10-30' AS Date), N'CV3', N'CN37', N'3453234721')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV515', N'Nguyễn Văn Bình', N'Nam', CAST(N'1992-01-05' AS Date), N'CV3', N'CN38', N'3453234722')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV516', N'Phạm Thị Hạnh', N'Nữ', CAST(N'1994-03-12' AS Date), N'CV3', N'CN38', N'3453234723')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV517', N'Trần Văn Cường', N'Nam', CAST(N'1990-06-20' AS Date), N'CV3', N'CN38', N'3453234724')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV518', N'Lê Thị Thanh', N'Nữ', CAST(N'1995-07-30' AS Date), N'CV3', N'CN38', N'3453234725')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV519', N'Hoàng Văn Tuấn', N'Nam', CAST(N'1993-10-19' AS Date), N'CV3', N'CN38', N'3453234726')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV520', N'Ngô Thị Vân', N'Nữ', CAST(N'1991-11-24' AS Date), N'CV3', N'CN38', N'3453234727')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV521', N'Bùi Văn Nam', N'Nam', CAST(N'1996-05-15' AS Date), N'CV3', N'CN38', N'3453234728')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV522', N'Phạm Thị Xuân', N'Nữ', CAST(N'1994-09-01' AS Date), N'CV3', N'CN38', N'3453234729')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV523', N'Tạ Văn Sơn', N'Nam', CAST(N'1992-12-08' AS Date), N'CV3', N'CN38', N'3453234730')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV524', N'Lương Thị Mai', N'Nữ', CAST(N'1995-04-05' AS Date), N'CV3', N'CN38', N'3453234731')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV525', N'Trần Văn Dũng', N'Nam', CAST(N'1991-03-10' AS Date), N'CV3', N'CN37', N'3453234712')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV526', N'Nguyễn Văn Phú', N'Nam', CAST(N'1991-07-15' AS Date), N'CV4', N'CN37', N'3453234732')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV527', N'Phạm Thị Liên', N'Nữ', CAST(N'1992-09-23' AS Date), N'CV4', N'CN37', N'3453234733')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV528', N'Lê Văn Hòa', N'Nam', CAST(N'1990-11-18' AS Date), N'CV4', N'CN37', N'3453234734')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV529', N'Trần Thị Ánh', N'Nữ', CAST(N'1995-02-09' AS Date), N'CV4', N'CN37', N'3453234735')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV530', N'Hoàng Văn Quân', N'Nam', CAST(N'1993-05-27' AS Date), N'CV4', N'CN37', N'3453234736')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV531', N'Ngô Thị Nguyệt', N'Nữ', CAST(N'1994-12-03' AS Date), N'CV4', N'CN37', N'3453234737')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV532', N'Bùi Văn Sơn', N'Nam', CAST(N'1991-04-11' AS Date), N'CV4', N'CN37', N'3453234738')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV533', N'Phạm Thị Quỳnh', N'Nữ', CAST(N'1996-06-05' AS Date), N'CV4', N'CN37', N'3453234739')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV534', N'Nguyễn Văn Hải', N'Nam', CAST(N'1991-08-22' AS Date), N'CV4', N'CN38', N'3453234740')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV535', N'Phạm Thị Thanh', N'Nữ', CAST(N'1992-10-17' AS Date), N'CV4', N'CN38', N'3453234741')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV536', N'Lê Văn Minh', N'Nam', CAST(N'1993-12-15' AS Date), N'CV4', N'CN38', N'3453234742')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV537', N'Trần Thị Thu', N'Nữ', CAST(N'1990-03-20' AS Date), N'CV4', N'CN38', N'3453234743')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV538', N'Hoàng Văn Khánh', N'Nam', CAST(N'1995-06-05' AS Date), N'CV4', N'CN38', N'3453234744')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV539', N'Ngô Thị Yến', N'Nữ', CAST(N'1994-07-19' AS Date), N'CV4', N'CN38', N'3453234745')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV540', N'Bùi Văn An', N'Nam', CAST(N'1996-02-24' AS Date), N'CV4', N'CN38', N'3453234746')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgSinh], [MaCV], [MaChuyenNganh], [SDT]) VALUES (N'NV541', N'Phạm Thị Ngân', N'Nữ', CAST(N'1993-09-12' AS Date), N'CV4', N'CN38', N'3453234747')
GO
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G177.1', N'PKB34', NULL, CAST(N'2024-05-02T12:00:00.000' AS DateTime), N'P177', N'NV233', N'Bệnh nhân bị đột quỵ')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G180.1', N'PKB41', NULL, CAST(N'2024-04-13T02:30:12.000' AS DateTime), N'P180', N'NV220', N'Bệnh nhân bị suy tim')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G180.2', N'PKB28', CAST(N'2024-05-06T09:10:32.000' AS DateTime), CAST(N'2024-05-02T22:20:00.000' AS DateTime), N'P180', N'NV220', N'Bệnh nhân bị nhồi máu cơ tim')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G182.1', N'PKB29', NULL, CAST(N'2024-04-13T23:13:20.000' AS DateTime), N'P182', N'NV454', N'Bệnh nhân bị động mạch vành')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G182.2', N'PKB40', NULL, CAST(N'2024-05-02T11:30:21.000' AS DateTime), N'P182', N'NV221', N'Bệnh nhân bị hẹp van tim')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G187.1', N'PKB006', CAST(N'2024-05-10T09:10:32.000' AS DateTime), CAST(N'2024-05-02T08:10:20.000' AS DateTime), N'P187', N'NV251', N'Bệnh nhân bị chấn thương')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G189.1', N'PKB74', NULL, CAST(N'2024-04-13T11:43:05.000' AS DateTime), N'P189', N'NV254', N'Bệnh nhân bị viêm khớp')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G204.1', N'PKB45', NULL, CAST(N'2024-05-02T15:35:29.000' AS DateTime), N'P204', N'NV296', N'Bệnh nhân bị u não')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G211.1', N'PKB71', NULL, CAST(N'2024-04-13T16:10:02.000' AS DateTime), N'P211', N'NV314', N'Bệnh nhân bị lao phổi')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G250.1', N'PKB16', CAST(N'2024-06-08T08:00:00.000' AS DateTime), CAST(N'2024-06-02T06:30:45.000' AS DateTime), N'P250', N'NV073', N'Bệnh nhân bị nhiễm trùng tiêu hóa')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G255.1', N'PKB23', CAST(N'2024-04-20T18:00:00.000' AS DateTime), CAST(N'2024-04-13T18:00:00.000' AS DateTime), N'P255', N'NV053', N'Bệnh nhân bị nhiễm trùng đường ruột')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G255.2', N'PKB67', NULL, CAST(N'2024-05-02T14:45:21.000' AS DateTime), N'P255', N'NV053', N'Bệnh nhân bị viêm túi mật')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G256.1', N'PKB21', CAST(N'2024-04-20T18:00:00.000' AS DateTime), CAST(N'2024-04-13T04:00:00.000' AS DateTime), N'P256', N'NV392', N'Bệnh nhân bị ngộ độc thực phẩn nhẹ')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G256.2', N'PKB22', CAST(N'2024-05-03T14:00:00.000' AS DateTime), CAST(N'2024-05-02T19:01:43.000' AS DateTime), N'P256', N'NV053', N'Bệnh nhân bị trào ngược dạ dày')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G262.1', N'PKB66', NULL, CAST(N'2024-05-02T08:35:20.000' AS DateTime), N'P262', N'NV390', N'Bệnh nhân bị viêm ruột thừa')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G311.1', N'PKB12', CAST(N'2024-05-08T18:35:29.000' AS DateTime), CAST(N'2024-05-02T18:00:00.000' AS DateTime), N'P311', N'NV438', N'Bệnh nhân mắc sỏi thận')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G313.1', N'PKB63', CAST(N'2024-04-29T08:30:12.000' AS DateTime), CAST(N'2024-04-13T03:30:12.000' AS DateTime), N'P313', N'NV433', N'Bệnh nhân bị tắc mật')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G313.1', N'PKB78', NULL, CAST(N'2024-05-02T15:46:34.000' AS DateTime), N'P313', N'NV183', N'Bệnh nhân bị bệnh gan')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G314.1', N'PKB87', NULL, CAST(N'2024-04-13T15:55:12.000' AS DateTime), N'P314', N'NV195', N'Bệnh nhân bị nhồi máu cơ tim')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G323.1', N'PKB56', NULL, CAST(N'2024-05-02T01:50:30.000' AS DateTime), N'P323', N'NV441', N'Bệnh nhân bị rối loạn thần kinh')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G325.1', N'PKB46', CAST(N'2024-04-25T08:30:45.000' AS DateTime), CAST(N'2024-04-13T11:30:45.000' AS DateTime), N'P325', N'NV215', N'Bệnh nhân bị đái tháo đường')
INSERT [dbo].[PhanGiuong] ([MaGiuong], [MaPhieuKB], [NgayTra], [NgayNhan], [MaPhong], [MaNVYeuCau], [GhiChu]) VALUES (N'G326.1', N'PKB91', NULL, CAST(N'2024-04-13T16:00:00.000' AS DateTime), N'P326', N'NV213', N'Bệnh nhân bị u đại tràng')
GO
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB001', 1, N'BN001', N'Ho và sốt', N'Nhịp tim 145/1p, huyết áp 130 mmHg', CAST(N'2024-04-13T09:21:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB002', 1, N'BN001', N'Mệt mỏi và đau đầu', N'Nhịp tim 145/1p, huyết áp 130 mmHg', CAST(N'2024-05-02T22:30:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB003', 2, N'BN002', N'Xuất hiện mảng đỏ, mụn đỏ trên da', N'Nhịp tim 140/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T06:00:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB004', 2, N'BN002', N'Sổ mũi và hắt hơi', N'Nhịp tim 140/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T07:59:01.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB005', 3, N'BN003', N'Có máu đỏ tươi trong phân', N'Nhịp tim 110/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T20:38:06.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB006', 3, N'BN003', N'Nhức mỏi cơ bắp', N'Nhịp tim 110/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T07:21:20.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB007', 4, N'BN004', N'Cảm giác mất vị giác', N'Nh?p tim 110/1p, huy?t áp 90 mmHg', CAST(N'2024-04-13T09:21:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB008', 4, N'BN004', N'Giảm cân không rõ nguyên nhân', N'Nhịp tim 110/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T16:15:30.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB009', 5, N'BN005', N'Ho ra máu', N'Nhịp tim 98/1p, huyết áp 85 mmHg', CAST(N'2024-04-13T17:11:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB010', 5, N'BN005', N'Hay quên', N'Nhịp tim 110/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T23:55:37.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB100', 50, N'BN050', N'Đau bụng bên trái, chóng mặt và vả mồ hôi', NULL, CAST(N'2024-05-02T22:26:38.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB11', 6, N'BN006', N'Sốt đột ngột,đau họng và nôn mửa', N'Nhịp tim 100/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T09:21:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB12', 6, N'BN006', N'Sốt đột ngột,tiểu ra máu', N'Nhịp tim 98/1p, huyết áp 85 mmHg', CAST(N'2024-05-02T17:11:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB13', 7, N'BN007', N'Giảm sức nghe và u tai', N'Nhịp tim 100/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T13:20:45.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB14', 7, N'BN007', N'Giảm sức nghe và u tai', N'Nhịp tim 120/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T17:11:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB15', 8, N'BN008', N'Vàng da,mệt mỏi,chán ăn', N'Nhịp tim 130/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T01:30:20.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB16', 8, N'BN008', N'Chán ăn kèm biểu hiện nôn ói,khó đại tiện hoặc tiêu chảy', N'Nhịp tim 140/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T05:30:38.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB17', 9, N'BN009', N'Ho và sốt', N'Nhịp tim 100/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T07:00:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB18', 9, N'BN009', N'Ho và sốt', N'Nhịp tim 100/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T12:45:20.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB19', 10, N'BN010', N'Yếu,tê hoặc liệt chân tay, khó nuốt', N'Nhịp tim 120/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T17:11:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB20', 10, N'BN010', N'Đá chân và đập tay, khó thức dậy và bối rối nếu bị đánh thức', N'Nhịp tim 140/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T02:05:30.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB21', 11, N'BN011', N'Sốt bị ớn lạnh, đổ mồ hôi, tiêu chảy', N'Huyết áp 120/80 mmHg, Mạch 70 lần/phút, Nhiệt độ 37 độ C', CAST(N'2024-04-13T02:11:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB22', 11, N'BN011', N'Ợ nóng, đau lưng', N'Huyết áp 120/80 mmHg, Mạch 70 lần/phút, Nhiệt độ 37 độ C', CAST(N'2024-05-02T18:15:49.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB23', 12, N'BN012', N'Sốt bị ớn lạnh, đổ mồ hôi, tiêu chảy', NULL, CAST(N'2024-04-13T17:11:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB24', 12, N'BN012', N'Khó ngủ và dễ tỉnh giấc vào ban đêm', N'Huyết áp 110/70 mmHg, Mạch 75 lần/phút, Nhiệt độ 37.5 độ C', CAST(N'2024-05-02T21:02:59.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB25', 13, N'BN013', N'Khó ngủ và dễ tỉnh giấc vào ban đêm', N'Nhịp tim 130/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T21:02:59.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB26', 13, N'BN013', N'Nốt ruồi to ra nhanh chóng', N'Nhịp tim 130/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T12:07:29.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB27', 14, N'BN014', N'Đau khi đi đại tiện', NULL, CAST(N'2024-04-13T03:01:59.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB28', 14, N'BN014', N'Đau thắt ngực', N'Nhịp tim 145/1p, huyết áp 130 mmHg', CAST(N'2024-05-02T21:00:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB29', 15, N'BN015', N'Đau ngực và khó thở, ho kéo dài hơn 3 tuần', NULL, CAST(N'2024-04-13T21:00:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB30', 15, N'BN015', N'Buồn nôn, đau đầu và rối loạn giấc ngủ', N'Nhịp tim 110/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T22:34:40.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB31', 16, N'BN016', N'Buồn nôn, đau đầu và rối loạn giấc ngủ', NULL, CAST(N'2024-04-13T08:09:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB32', 16, N'BN016', N'Mệt mỏi liên tục, thèm ăn và tăng cân', NULL, CAST(N'2024-05-02T20:04:04.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB33', 17, N'BN017', N'Đau khớp dữ dội', N'Huyết áp 120/80 mmHg, Mạch 70 lần/phút, Nhiệt độ 37 độ C', CAST(N'2024-04-13T02:00:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB34', 17, N'BN017', N'Chóng mặt hoặc mất thăng bằng, lú lẫn', N'Huyết áp 120/80 mmHg, Mạch 70 lần/phút, Nhiệt độ 37 độ C', CAST(N'2024-05-02T10:17:18.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB35', 18, N'BN018', N'Nốt mụn sưng đỏ, xung quanh vùng mụn cứng', N'Huyết áp 110/70 mmHg, Mạch 90 lần/phút, Nhiệt độ 38 độ C', CAST(N'2024-04-13T06:23:46.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB36', 18, N'BN018', N'Ho và sốt', N'Huyết áp 110/70 mmHg, Mạch 90 lần/phút, Nhiệt độ 38 độ C', CAST(N'2024-05-02T10:13:35.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB37', 19, N'BN019', N'Ho và sốt', NULL, CAST(N'2024-04-13T14:50:05.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB38', 19, N'BN019', N'Đau dạ dày và hay buồn nôn', N'Nhịp tim 140/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T11:50:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB39', 20, N'BN020', N'Sưng và nổi hạch', NULL, CAST(N'2024-04-13T14:50:05.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB40', 20, N'BN020', N'Đau thắt ngực', N'Nhịp tim 100/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T10:13:35.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB41', 21, N'BN021', N'Khó thở khi hoạt động hoặc nằm xuống', NULL, CAST(N'2024-04-13T01:19:23.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB42', 21, N'BN021', N'Sốt, 2/4 ngày xuất hiện ban ngứa', NULL, CAST(N'2024-05-02T02:46:21.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB43', 22, N'BN022', N'Đi cầu ra máu', N'Huyết áp 110/70 mmHg, Mạch 75 lần/phút, Nhiệt độ 37.5 độ C', CAST(N'2024-04-13T02:31:32.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB44', 22, N'BN022', N'Ho dai dẳng và thở khò khè', N'Huyết áp 110/70 mmHg, Mạch 75 lần/phút, Nhiệt độ 37.5 độ C', CAST(N'2024-05-02T13:57:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB45', 23, N'BN023', N'Co giật hoặc động kinh,mất ý thức từ vài phút đến hàng giờ', NULL, CAST(N'2024-04-13T10:13:35.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB46', 23, N'BN023', N'Sụt cân không rõ nguyên nhân, tính cách thay đổi bất thường', NULL, CAST(N'2024-05-02T14:50:05.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB47', 24, N'BN024', N'Chảy nước mũi, đau họng và khàn giọng', N'Nhịp tim 100/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T15:30:15.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB48', 24, N'BN024', N'Mệt mỏi toàn thân, chán ăn, sút cân', N'Nhịp tim 100/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T07:12:11.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB49', 25, N'BN025', N'Chứng sợ nước và tăng động', NULL, CAST(N'2024-04-13T20:05:06.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB50', 25, N'BN025', N'Chứng sợ nước và tăng động', NULL, CAST(N'2024-05-02T18:09:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB51', 26, N'BN026', N'Đau răng', N'Nhịp tim 110/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T16:00:05.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB52', 26, N'BN026', N'Nước tiểu xuất hiện bọt, ăn mất ngon', N'Nhịp tim 110/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T18:09:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB53', 27, N'BN027', N'Đau tức ngực, xảy ra trong thời gian dài', N'Nhịp tim 140/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T18:09:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB54', 27, N'BN027', N'Nghẹt mũi', NULL, CAST(N'2024-05-02T00:00:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB55', 28, N'BN028', N'Nghẹt mũi', N'Huyết áp 110/70 mmHg, Mạch 75 lần/phút, Nhiệt độ 37.5 độ C', CAST(N'2024-04-13T00:15:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB56', 28, N'BN028', N'Đau đầu thường xuyên, nói khó', N'Huyết áp 110/70 mmHg, Mạch 75 lần/phút, Nhiệt độ 37.5 độ C', CAST(N'2024-05-02T00:35:59.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB57', 29, N'BN029', N'Sốt cao trên 38 độ C, ho, đau họng', NULL, CAST(N'2024-04-13T07:12:11.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB58', 29, N'BN029', N'Đau khớp, sốt và mệt mỏi', NULL, CAST(N'2024-05-02T02:25:20.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB59', 30, N'BN030', N'Đau đầu thường xuyên, nói khó', NULL, CAST(N'2024-04-13T07:48:54.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB60', 30, N'BN030', N'Đi cầu ra máu', NULL, CAST(N'2024-05-02T11:32:09.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB61', 31, N'BN031', N'Đau khớp, sốt và mệt mỏi', N'Huyết áp 110/70 mmHg, Mạch 90 lần/phút, Nhiệt độ 38 độ C', CAST(N'2024-04-13T07:48:54.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB62', 31, N'BN031', N'Có bùi trĩ lòi ra, đi cầu ra máu', N'Nhịp tim 140/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T00:35:59.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB63', 32, N'BN032', N'Vàng da hoặc mắt, đau bụng hoặc chướng bụng', N'Huyết áp 120/80 mmHg, Mạch 70 lần/phút, Nhiệt độ 37 độ C', CAST(N'2024-04-13T00:59:59.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB64', 32, N'BN032', N'Cháy máu không kiểm soát,huyết áp giảm', NULL, CAST(N'2024-05-02T01:13:30.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB65', 33, N'BN033', N'Chứng sợ nước và tăng động', N'Nhịp tim 100/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T01:13:30.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB66', 33, N'BN033', N'Đau bụng bên trái, chóng mặt và vả mồ hôi', N'Huyết áp 110/70 mmHg, Mạch 90 lần/phút, Nhiệt độ 38 độ C', CAST(N'2024-05-02T07:48:54.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB67', 34, N'BN034', N'Sụt cân không rõ nguyên nhân, tính cách thay đổi bất thường', N'Nhịp tim 120/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T03:02:58.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB68', 34, N'BN034', N'Ợ nóng, đau lưng', NULL, CAST(N'2024-05-02T13:47:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB69', 35, N'BN035', N'Cảm thấy ớn lạnh, đổ mồ hôi', NULL, CAST(N'2024-04-13T14:40:27.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB70', 35, N'BN035', N'Cảm thấy ớn lạnh, đổ mồ hôi', NULL, CAST(N'2024-05-02T15:23:18.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB71', 36, N'BN036', N'Ho ra máu và đau ngực', N'Nhịp tim 130/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T15:23:18.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB72', 36, N'BN036', N'Sụt cân không rõ nguyên nhân, tính cách thay đổi bất thường', N'Nhịp tim 80/1p, huyết áp 130 mmHg', CAST(N'2024-05-02T04:10:07.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB73', 37, N'BN037', N'Đau khớp', NULL, CAST(N'2024-04-13T10:21:08.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB74', 37, N'BN037', N'Sốt, 2/4 ngày xuất hiện ban ngứa', NULL, CAST(N'2024-05-02T21:17:29.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB75', 38, N'BN038', N'Cháy máu không kiểm soát,huyết áp giảm', N'Nhịp tim 145/1p, huyết áp 130 mmHg', CAST(N'2024-04-13T03:02:58.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB76', 38, N'BN038', N'Chậm động và mất ổn định tư thế', N'Nhịp tim 120/1p, huyết áp 130 mmHg', CAST(N'2024-05-02T15:23:18.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB77', 39, N'BN039', N'Chậm động và mất ổn định tư thế', N'Nhịp tim 100/1p, huyết áp 130 mmHg', CAST(N'2024-04-13T01:13:30.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB78', 39, N'BN039', N'Ngứa và vàng da', N'Nhịp tim 90/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T13:47:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB79', 40, N'BN040', N'Ngứa và vàng da', NULL, CAST(N'2024-04-13T15:23:18.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB80', 40, N'BN040', N'Động kinh', NULL, CAST(N'2024-05-02T01:01:59.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB81', 41, N'BN041', N'Vàng da', N'Nhịp tim 110/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB82', 41, N'BN041', N'Động kinh', N'Nhịp tim 110/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T01:13:30.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB83', 42, N'BN042', N'Ho và sốt', N'Huyết áp 110/70 mmHg, Mạch 75 lần/phút, Nhiệt độ 37.5 độ C', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB84', 42, N'BN042', N'Chảy nước mũi, đau họng và khàn giọng', N'Nhịp tim 90/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T13:47:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB85', 43, N'BN043', N'Nước tiểu xuất hiện bọt, ăn mất ngon', N'Huyết áp 110/70 mmHg, Mạch 75 lần/phút, Nhiệt độ 37.5 độ C', CAST(N'2024-04-13T09:21:20.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB86', 43, N'BN043', N'Sổ mũi và hắt hơi', NULL, CAST(N'2024-05-02T14:50:05.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB87', 44, N'BN044', N'Đau tức ngực, xảy ra trong thời gian dài', NULL, CAST(N'2024-04-13T13:47:10.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB88', 44, N'BN044', N'Sưng và nổi hạch', NULL, CAST(N'2024-05-02T01:41:20.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB89', 45, N'BN045', N'Đau đầu thường xuyên, nói khó', N'Nhịp tim 140/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T14:50:05.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB90', 45, N'BN045', N'Đau khi đi đại tiện', NULL, CAST(N'2024-05-02T15:35:09.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB91', 46, N'BN046', N'Buồn nôn, đau đầu và rối loạn giấc ngủ', N'Nhịp tim 110/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T14:50:05.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB92', 46, N'BN046', N'Mệt mỏi toàn thân, chán ăn, sút cân', N'Nhịp tim 110/1p, huyết áp 90 mmHg', CAST(N'2024-05-02T10:10:01.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB93', 47, N'BN047', N'Cảm thấy ớn lạnh, đổ mồ hôi', N'Nhịp tim 90/1p, huyết áp 90 mmHg', CAST(N'2024-04-13T10:10:01.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB94', 47, N'BN047', N'Chóng mặt hoặc mất thăng bằng, lú lẫn', NULL, CAST(N'2024-05-02T15:30:30.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB95', 48, N'BN048', N'Mệt mỏi toàn thân, chán ăn, sút cân', NULL, CAST(N'2024-04-13T08:25:31.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB96', 48, N'BN048', N'Cảm thấy ớn lạnh, đổ mồ hôi', NULL, CAST(N'2024-05-02T22:26:38.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB97', 49, N'BN049', N'Nhức mỏi cơ bắp', N'Huyết áp 110/70 mmHg, Mạch 75 lần/phút, Nhiệt độ 37.5 độ C', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB98', 49, N'BN049', N'Nhức mỏi cơ bắp', NULL, CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuKhamBenh] ([MaPhieuKB], [SoPhieu], [MaBN], [TrieuChung], [ThongTinLamSang], [NgayKham]) VALUES (N'PKB99', 50, N'BN050', N'Mất vị giác', N'Huyết áp 120/80 mmHg, Mạch 70 lần/phút, Nhiệt độ 37 độ C', CAST(N'2024-04-13T10:10:01.000' AS DateTime))
GO
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P01', N'Phòng khám hồi sức và chăm sóc cấp cứu 01', N'K1', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P02', N'Phòng khám hồi sức và chăm sóc cấp cứu 02', N'K1', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P03', N'Phòng khám hồi sức tim mạch 01', N'K1', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P04', N'Phòng khám hồi sức tim mạch 02', N'K1', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P05', N'Phòng khám nội khoa tổng quát 01', N'K2', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P06', N'Phòng khám nội khoa tổng quát 02', N'K2', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P07', N'Phòng khám nội tim mạch 01', N'K2', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P08', N'Phòng khám nội tim mạch 02', N'K2', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P09', N'Phòng khám nội tiết 01', N'K2', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P10', N'Phòng khám nội tiết 02', N'K2', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P100', N'Phòng phẫu thuật thần kinh nhi 01', N'K9', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P101', N'Phòng phẫu thuật thần kinh nhi 02', N'K9', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P102', N'Phòng phẫu thuật tim mạch 02', N'K10', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P103', N'Phòng phẫu thuật tim mạch 01', N'K10', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P104', N'Phòng phẫu thuật tim mạch 03', N'K10', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P105', N'Phòng phẫu thuật chấn thương chỉnh hình 02', N'K11', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P106', N'Phòng phẫu thuật chấn thương chỉnh hình 01', N'K11', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P107', N'Phòng phẫu thuật chấn thương chỉnh hình 03', N'K11', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P108', N'Phòng phẫu thuật răng-hàm-mặt 02', N'K12', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P109', N'Phòng phẫu thuật răng-hàm-mặt 01', N'K12', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P11', N'Phòng khám ngoại tổng quát 01', N'K3', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P110', N'Phòng phẫu thuật răng-hàm-mặt 03', N'K12', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P111', N'Phòng phẫu thuật ung thư 02', N'K13', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P112', N'Phòng phẫu thuật ung thư 01', N'K13', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P113', N'Phòng xạ trị ung bướu 02', N'K13', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P114', N'Phòng xạ trị ung bướu 01', N'K13', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P115', N'Phòng nội soi phế quản 02', N'K14', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P116', N'Phòng nội soi phế quản 01', N'K14', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P117', N'Phòng chụp cộng hưởng từ 01', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P118', N'Phòng chụp cộng hưởng từ 02', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P119', N'Phòng chụp cộng hưởng từ 03', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P12', N'Phòng khám ngoại tổng quát 02', N'K3', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P120', N'Phòng chụp cộng hưởng từ 04', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P121', N'Phòng chụp CT 01', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P122', N'Phòng chụp CT 02', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P123', N'Phòng chụp CT 03', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P124', N'Phòng chụp CT 04', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P125', N'Phòng chụp X-Quang 01', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P127', N'Phòng chụp X-Quang 02', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P128', N'Phòng chụp X-Quang 03', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P129', N'Phòng chụp X-Quang 04', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P13', N'Phòng khám ngoại thần kinh 01', N'K3', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P130', N'Phòng nội soi 01', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P131', N'Phòng nội soi 02', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P132', N'Phòng nội soi 03', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P133', N'Phòng nội soi 04', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P134', N'Phòng chụp PET 01', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P135', N'Phòng chụp PET 02', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P136', N'Phòng chụp PET 03', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P137', N'Phòng chụp PET 04', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P138', N'Phòng chụp MRI 01', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P139', N'Phòng chụp MRI 02', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P14', N'Phòng khám ngoại thần kinh 02', N'K3', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P140', N'Phòng chụp MRI 03', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P141', N'Phòng chụp MRI 04', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P142', N'Phòng xét nghiệm PCR 01', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P143', N'Phòng xét nghiệm PCR 02', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P144', N'Phòng xét nghiệm PCR 03', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P145', N'Phòng xét nghiệm lâm sàng 01', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P146', N'Phòng xét nghiệm lâm sàng 02', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P147', N'Phòng xét nghiệm lâm sàng 03', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P148', N'Phòng xét nghiệm sinh học phân tử 01', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P149', N'Phòng xét nghiệm sinh học phân tử 02', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P15', N'Phòng khám nhi khoa hô hấp 01', N'K4', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P150', N'Phòng xét nghiệm sinh học phân tử 03', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P154', N'Phòng xét nghiệm miễn dịch 01', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P155', N'Phòng xét nghiệm miễn dịch 02', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P156', N'Phòng xét nghiệm miễn dịch 03', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P157', N'Phòng xét nghiệm vi sinh vật 01', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P158', N'Phòng xét nghiệm vi sinh vật 02', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P159', N'Phòng xét nghiệm chuyên biệt 01', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P16', N'Phòng khám nhi khoa hô hấp 02', N'K4', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P160', N'Phòng xét nghiệm chuyên biệt 02', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P161', N'Phòng siêu âm 01', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P162', N'Phòng siêu âm 02', N'K15', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P163', N'Phòng đẻ 01', N'K17', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P164', N'Phòng đẻ 02', N'K17', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P165', N'Phòng điện não đồ', N'K9', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P166', N'Phòng điện tâm đồ', N'K10', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P167', N'Phòng hồi sức tích cực-1 giường', N'K1', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P168', N'Phòng hồi sức tích cực-1 giường', N'K1', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P169', N'Phòng hồi sức tích cực-1 giường', N'K1', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P17', N'Phòng khám nhi khoa tim mạch 01', N'K4', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P170', N'Phòng hồi sức tích cực-1 giường', N'K1', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P171', N'Phòng hồi sức tích cực-2 giường', N'K1', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P172', N'Phòng hồi sức tích cực-3 giường', N'K1', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P173', N'Phòng hồi sức tích cực-4 giường', N'K1', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P174', N'Phòng hồi sức tích cực-2 giường', N'K1', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P175', N'Phòng hồi sức tích cực-3 giường', N'K1', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P176', N'Phòng hồi sức tích cực-4 giường', N'K1', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P177', N'Phòng nội trú tim mạch-1 giường', N'K10', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P178', N'Phòng nội trú tim mạch-1 giường', N'K10', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P179', N'Phòng nội trú tim mạch-1 giường', N'K10', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P18', N'Phòng khám nhi khoa tim mạch 02', N'K4', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P180', N'Phòng nội trú tim mạch-3 giường', N'K10', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P181', N'Phòng nội trú tim mạch-4 giường', N'K10', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P182', N'Phòng nội trú tim mạch-2 giường', N'K10', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P183', N'Phòng nội trú tim mạch-2 giường', N'K10', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P184', N'Phòng nội trú tim mạch-3 giường', N'K10', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P185', N'Phòng nội trú tim mạch-4 giường', N'K10', 4, N'Phòng bệnh')
GO
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P186', N'Phòng nội trú tim mạch-2 giường', N'K10', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P187', N'Phòng nội trú khoa chấn thương chỉnh hình-1 giường', N'K11', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P188', N'Phòng nội trú khoa chấn thương chỉnh hình-1 giường', N'K11', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P189', N'Phòng nội trú khoa chấn thương chỉnh hình-2 giường', N'K11', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P19', N'Phòng khám nhi khoa tổng quát 01', N'K4', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P190', N'Phòng nội trú khoa chấn thương chỉnh hình-2 giường', N'K11', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P191', N'Phòng nội trú khoa chấn thương chỉnh hình-3 giường', N'K11', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P192', N'Phòng nội trú khoa chấn thương chỉnh hình-4 giường', N'K11', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P193', N'Phòng nội trú khoa chấn thương chỉnh hình-3 giường', N'K11', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P194', N'Phòng nội trú khoa chấn thương chỉnh hình-4 giường', N'K11', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P196', N'Phòng nội trú răng hàm mặt-1 giường', N'K12', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P197', N'Phòng nội trú răng hàm mặt-1 giường', N'K12', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P198', N'Phòng nội trú răng hàm mặt-3 giường', N'K12', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P199', N'Phòng nội trú răng hàm mặt-2 giường', N'K12', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P20', N'Phòng khám nhi khoa tổng quát 02', N'K4', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P200', N'Phòng nội trú răng hàm mặt-3 giường', N'K12', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P201', N'Phòng nội trú răng hàm mặt-4 giường', N'K12', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P202', N'Phòng nội trú răng hàm mặt-2 giường', N'K12', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P203', N'Phòng nội trú răng hàm mặt-4 giường', N'K12', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P204', N'Phòng nội trú ung bướu-1 giường', N'K13', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P205', N'Phòng nội trú ung bướu-1 giường', N'K13', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P206', N'Phòng nội trú ung bướu-3 giường', N'K13', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P207', N'Phòng nội trú ung bướu-2 giường', N'K13', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P208', N'Phòng nội trú ung bướu-3 giường', N'K13', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P209', N'Phòng nội trú ung bướu-4 giường', N'K13', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P21', N'Phòng khám phục hồi chức năng thần kinh 01', N'K5', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P210', N'Phòng nội trú ung bướu-2 giường', N'K13', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P211', N'Phòng nội trú lao và bệnh phổi-1 giường', N'K14', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P212', N'Phòng nội trú lao và bệnh phổi-1 giường', N'K14', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P213', N'Phòng nội trú lao và bệnh phổi-4 giường', N'K14', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P214', N'Phòng nội trú lao và bệnh phổi-2 giường', N'K14', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P215', N'Phòng nội trú lao và bệnh phổi-3 giường', N'K14', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P216', N'Phòng nội trú lao và bệnh phổi-4 giường', N'K14', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P217', N'Phòng nội trú lao và bệnh phổi-2 giường', N'K14', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P218', N'Phòng nội trú khoa tai mũi họng-1 giường', N'K7', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P219', N'Phòng nội trú khoa tai mũi họng-1 giường', N'K7', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P22', N'Phòng khám phục hồi chức năng thần kinh 02', N'K5', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P220', N'Phòng nội trú khoa tai mũi họng-3 giường', N'K7', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P221', N'Phòng nội trú khoa tai mũi họng-2 giường', N'K7', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P222', N'Phòng nội trú khoa tai mũi họng-3 giường', N'K7', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P223', N'Phòng nội trú khoa tai mũi họng-4 giường', N'K7', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P224', N'Phòng nội trú khoa tai mũi họng-2 giường', N'K7', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P225', N'Phòng nội trú khoa tai mũi họng-3 giường', N'K7', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P226', N'Phòng nội trú khoa tai mũi họng-4 giường', N'K7', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P227', N'Phòng nội trú khoa tai mũi họng-2 giường', N'K7', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P228', N'Phòng nội trú khoa truyền nhiễm-1 giường', N'K16', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P229', N'Phòng nội trú khoa truyền nhiễm-1 giường', N'K16', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P23', N'Phòng khám phục hồi chức năng vật lý 01', N'K5', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P230', N'Phòng nội trú khoa truyền nhiễm-3 giường', N'K16', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P231', N'Phòng nội trú khoa truyền nhiễm-4 giường', N'K16', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P232', N'Phòng nội trú khoa truyền nhiễm-2 giường', N'K16', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P233', N'Phòng nội trú khoa truyền nhiễm-1 giường', N'K16', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P234', N'Phòng nội trú khoa truyền nhiễm-2 giường', N'K16', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P235', N'Phòng nội trú khoa truyền nhiễm-3 giường', N'K16', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P236', N'Phòng nội trú khoa truyền nhiễm-4 giường', N'K16', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P237', N'Phòng nội trú khoa truyền nhiễm-2 giường', N'K16', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P238', N'Phòng nội trú khoa sản-1 giường', N'K17', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P239', N'Phòng nội trú khoa sản-3 giường', N'K17', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P24', N'Phòng khám phục hồi chức năng vật lý 02', N'K5', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P240', N'Phòng nội trú khoa sản-2 giường', N'K17', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P241', N'Phòng nội trú khoa sản-4 giường', N'K17', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P242', N'Phòng nội trú khoa sản-1 giường', N'K17', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P243', N'Phòng nội trú khoa sản-4 giường', N'K17', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P244', N'Phòng nội trú khoa sản-2 giường', N'K17', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P245', N'Phòng nội trú khoa sản-3 giường', N'K17', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P246', N'Phòng nội trú khoa sản-4 giường', N'K17', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P247', N'Phòng nội trú khoa sản-2 giường', N'K17', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P248', N'Phòng nội trú khoa sản-3 giường', N'K17', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P249', N'Phòng nội trú khoa sản-4 giường', N'K17', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P25', N'Phòng khám da liễu tổng quát 01', N'K6', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P250', N'Phòng nội trú khoa nội-1 giường', N'K2', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P251', N'Phòng nội trú khoa nội-1 giường', N'K2', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P252', N'Phòng nội trú khoa nội-3 giường', N'K2', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P253', N'Phòng nội trú khoa nội-4 giường', N'K2', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P254', N'Phòng nội trú khoa nội-4 giường', N'K2', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P255', N'Phòng nội trú khoa nội-3 giường', N'K2', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P256', N'Phòng nội trú khoa nội-2 giường', N'K2', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P257', N'Phòng nội trú khoa nội-3 giường', N'K2', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P258', N'Phòng nội trú khoa nội-4 giường', N'K2', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P259', N'Phòng nội trú khoa nội-2 giường', N'K2', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P26', N'Phòng khám da liễu tổng quát 02', N'K6', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P260', N'Phòng nội trú khoa nội-3 giường', N'K2', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P261', N'Phòng nội trú khoa nội-4 giường', N'K2', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P262', N'Phòng nội trú khoa ngoại-1 giường', N'K3', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P263', N'Phòng nội trú khoa ngoại-1 giường', N'K3', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P264', N'Phòng nội trú khoa ngoại-3 giường', N'K3', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P265', N'Phòng nội trú khoa ngoại-4 giường', N'K3', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P266', N'Phòng nội trú khoa ngoại-4 giường', N'K3', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P267', N'Phòng nội trú khoa ngoại-3 giường', N'K3', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P268', N'Phòng nội trú khoa ngoại-2 giường', N'K3', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P269', N'Phòng nội trú khoa ngoại-3 giường', N'K3', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P27', N'Phòng khám da liễu nội tiết 02', N'K6', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P270', N'Phòng nội trú khoa ngoại-4 giường', N'K3', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P271', N'Phòng nội trú khoa ngoại-2 giường', N'K3', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P272', N'Phòng nội trú khoa ngoại-3 giường', N'K3', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P273', N'Phòng nội trú khoa ngoại-4 giường', N'K3', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P274', N'Phòng nội trú phục hồi chức năng-1 giường', N'K5', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P275', N'Phòng nội trú phục hồi chức năng-1 giường', N'K5', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P276', N'Phòng nội trú phục hồi chức năng-2 giường', N'K5', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P277', N'Phòng nội trú phục hồi chức năng-3 giường', N'K5', 3, N'Phòng bệnh')
GO
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P278', N'Phòng nội trú phục hồi chức năng-4 giường', N'K5', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P279', N'Phòng nội trú phục hồi chức năng-4 giường', N'K5', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P28', N'Phòng khám da liễu nội tiết 01', N'K6', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P280', N'Phòng nội trú phục hồi chức năng-2 giường', N'K5', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P281', N'Phòng nội trú phục hồi chức năng-3 giường', N'K5', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P282', N'Phòng nội trú phục hồi chức năng-4 giường', N'K5', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P283', N'Phòng nội trú phục hồi chức năng-2 giường', N'K5', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P284', N'Phòng nội trú phục hồi chức năng-3 giường', N'K5', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P285', N'Phòng nội trú phục hồi chức năng-4 giường', N'K5', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P286', N'Phòng nội trú khoa da liễu-1 giường', N'K6', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P287', N'Phòng nội trú khoa da liễu-1 giường', N'K6', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P288', N'Phòng nội trú khoa da liễu-2 giường', N'K6', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P289', N'Phòng nội trú khoa da liễu-3 giường', N'K6', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P29', N'Phòng khám da liễu nhi 02', N'K6', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P290', N'Phòng nội trú khoa da liễu-4 giường', N'K6', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P291', N'Phòng nội trú khoa da liễu-4 giường', N'K6', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P292', N'Phòng nội trú khoa da liễu-2 giường', N'K6', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P293', N'Phòng nội trú khoa da liễu-3 giường', N'K6', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P294', N'Phòng nội trú khoa da liễu-4 giường', N'K6', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P295', N'Phòng nội trú khoa da liễu-2 giường', N'K6', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P296', N'Phòng nội trú khoa da liễu-3 giường', N'K6', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P297', N'Phòng nội trú khoa da liễu-4 giường', N'K6', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P298', N'Phòng nội trú khoa nhi-1 giường', N'K4', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P299', N'Phòng nội trú khoa nhi-1 giường', N'K4', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P30', N'Phòng khám da liễu nhi 01', N'K6', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P300', N'Phòng nội trú khoa nhi-2 giường', N'K4', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P301', N'Phòng nội trú khoa nhi-3 giường', N'K4', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P302', N'Phòng nội trú khoa nhi-4 giường', N'K4', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P303', N'Phòng nội trú khoa nhi-3 giường', N'K4', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P304', N'Phòng nội trú khoa nhi-2 giường', N'K4', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P305', N'Phòng nội trú khoa nhi-3 giường', N'K4', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P306', N'Phòng nội trú khoa nhi-4 giường', N'K4', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P308', N'Phòng nội trú khoa nhi-2 giường', N'K4', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P309', N'Phòng nội trú khoa nhi-3 giường', N'K4', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P31', N'Phòng khám tai 02', N'K7', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P310', N'Phòng nội trú khoa nhi-4 giường', N'K4', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P311', N'Phòng nội trú khoa thận-1 giường', N'K8', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P312', N'Phòng nội trú khoa thận-1 giường', N'K8', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P313', N'Phòng nội trú khoa thận-2 giường', N'K8', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P314', N'Phòng nội trú khoa thận-3 giường', N'K8', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P315', N'Phòng nội trú khoa thận-4 giường', N'K8', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P316', N'Phòng nội trú khoa thận-3 giường', N'K8', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P317', N'Phòng nội trú khoa thận-2 giường', N'K8', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P318', N'Phòng nội trú khoa thận-3 giường', N'K8', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P319', N'Phòng nội trú khoa thận-4 giường', N'K8', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P32', N'Phòng khám mũi-họng 01', N'K7', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P320', N'Phòng nội trú khoa thận-2 giường', N'K8', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P321', N'Phòng nội trú khoa thận-3 giường', N'K8', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P322', N'Phòng nội trú khoa thận-4 giường', N'K8', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P323', N'Phòng nội trú khoa thần kinh học-1 giường', N'K9', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P324', N'Phòng nội trú khoa thần kinh học-1 giường', N'K9', 1, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P325', N'Phòng nội trú khoa thần kinh học-2 giường', N'K9', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P326', N'Phòng nội trú khoa thần kinh học-3 giường', N'K9', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P327', N'Phòng nội trú khoa thần kinh học-4 giường', N'K9', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P328', N'Phòng nội trú khoa thần kinh học-3 giường', N'K9', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P329', N'Phòng nội trú khoa thần kinh học-2 giường', N'K9', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P33', N'Phòng khám tai 02', N'K7', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P330', N'Phòng nội trú khoa thần kinh học-3 giường', N'K9', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P331', N'Phòng nội trú khoa thần kinh học-4 giường', N'K9', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P332', N'Phòng nội trú khoa thần kinh học-2 giường', N'K9', 2, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P333', N'Phòng nội trú khoa thần kinh học-3 giường', N'K9', 3, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P334', N'Phòng nội trú khoa thần kinh học-4 giường', N'K9', 4, N'Phòng bệnh')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P34', N'Phòng khám mũi-họng 02', N'K7', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P35', N'Phòng khám thận học 02', N'K8', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P36', N'Phòng khám thận học 01', N'K8', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P37', N'Phòng khám lọc máu 02', N'K8', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P38', N'Phòng khám lọc máu 01', N'K8', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P39', N'Phòng khám thần kinh nội 02', N'K9', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P40', N'Phòng khám thần kinh nội 01', N'K9', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P41', N'Phòng khám trước và sau phẫu thuật thần kinh 02', N'K9', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P42', N'Phòng khám trước và sau phẫu thuật thần kinh 01', N'K9', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P43', N'Phòng khám trước và sau phẫu thuật thần kinh nhi 02', N'K9', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P44', N'Phòng khám trước và sau phẫu thuật thần kinh nhi 01', N'K9', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P45', N'Phòng khám tim mạch nội 01', N'K10', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P46', N'Phòng khám tim mạch nội 02', N'K10', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P47', N'Phòng khám trước và sau phẫu thuật tim mạch 02', N'K10', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P48', N'Phòng khám trước và sau phẫu thuật tim mạch 01', N'K10', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P49', N'Phòng khám tim mạch can thiệp 02', N'K10', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P50', N'Phòng khám tim mạch can thiệp 01', N'K10', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P51', N'Phòng khám chấn thương 02', N'K11', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P52', N'Phòng khám chấn thương 01', N'K11', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P53', N'Phòng khám chỉnh hình 02', N'K11', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P54', N'Phòng khám chỉnh hình 01', N'K11', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P55', N'Phòng khám trước và sau phẫu thuật khớp 02', N'K11', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P56', N'Phòng khám trước và sau phẫu thuật khớp 01', N'K11', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P57', N'Phòng khám nha khoa tổng quát 02', N'K12', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P58', N'Phòng khám nha khoa tổng quát 01', N'K12', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P59', N'Phòng khám trước và sau phẫu thuật răng-hàm-mặt 02', N'K12', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P60', N'Phòng khám trước và sau phẫu thuật răng-hàm-mặt 01', N'K12', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P61', N'Phòng khám ung thư nội 02', N'K13', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P62', N'Phòng khám ung thư nội 01', N'K13', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P63', N'Phòng khám ung thư ngoại 02', N'K13', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P64', N'Phòng khám ung thư ngoại 01', N'K13', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P65', N'Phòng khám lao 02', N'K14', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P66', N'Phòng khám lao 01', N'K14', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P67', N'Phòng khám bệnh phổi 02', N'K14', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P68', N'Phòng khám bệnh phổi 01', N'K14', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P69', N'Phòng khám bệnh truyền nhiễm 02', N'K16', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P70', N'Phòng khám bệnh truyền nhiễm 01', N'K16', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P71', N'Phòng khám bệnh lây qua đường tình dục 02', N'K16', 0, N'Phòng khám')
GO
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P72', N'Phòng khám bệnh lây qua đường tình dục 01', N'K16', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P73', N'Phòng khám sản khoa 02', N'K17', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P74', N'Phòng khám sản khoa 01', N'K17', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P75', N'Phòng khám phụ khoa 02', N'K17', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P76', N'Phòng khám phụ khoa 01', N'K17', 0, N'Phòng khám')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P77', N'Phòng cấp cứu khẩn cấp 01', N'K1', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P78', N'Phòng cấp cứu khẩn cấp 02', N'K1', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P79', N'Phòng phẫu thuật ngoại tổng quát 01', N'K3', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P80', N'Phòng phẫu thuật thần kinh 01', N'K3', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P81', N'Phòng phẫu thuật thần kinh 02', N'K3', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P82', N'Phòng phẫu thuật nhi hô hấp 02', N'K4', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P83', N'Phòng phẫu thuật nhi hô hấp 01', N'K4', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P84', N'Phòng phẫu thuật nhi hô hấp 03', N'K4', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P85', N'Phòng phẫu thuật nhi tim mạch 02', N'K4', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P86', N'Phòng phẫu thuật nhi tim mạch 01', N'K4', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P87', N'Phòng phẫu thuật nhi tim mạch 03', N'K4', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P88', N'Phòng phẫu thuật nhi tổng quát 02', N'K4', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P89', N'Phòng phẫu thuật nhi tổng quát 01', N'K4', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P90', N'Phòng phẫu thuật nhi tổng quát 03', N'K4', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P91', N'Phòng phẫu thuật tai 02', N'K7', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P92', N'Phòng phẫu thuật tai 01', N'K7', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P93', N'Phòng phẫu thuật mũi-họng 01', N'K7', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P94', N'Phòng phẫu thuật mũi-họng 02', N'K7', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P95', N'Phòng phẫu thuật thận 02', N'K8', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P96', N'Phòng phẫu thuật thận 01', N'K8', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P97', N'Phòng phẫu thuật thận 03', N'K8', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P98', N'Phòng phẫu thuật thần kinh 02', N'K9', 0, N'Phòng chức năng')
INSERT [dbo].[Phong] ([MSPhong], [TenPhong], [MaKhoa], [SoGiuong], [Loai]) VALUES (N'P99', N'Phòng phẫu thuật thần kinh 01', N'K9', 0, N'Phòng chức năng')
GO
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA001', NULL, N'BN001', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA002', N'Có tiền sử bệnh hen suyễn', N'BN002', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA003', NULL, N'BN003', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA004', NULL, N'BN004', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA005', NULL, N'BN005', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA006', NULL, N'BN006', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA007', NULL, N'BN007', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA008', NULL, N'BN008', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA009', NULL, N'BN009', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA010', NULL, N'BN010', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA011', N'Có tiền sử bệnh tim', N'BN011', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA012', NULL, N'BN012', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA013', NULL, N'BN013', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA014', NULL, N'BN014', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA015', NULL, N'BN015', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA016', NULL, N'BN016', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA017', NULL, N'BN017', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA018', NULL, N'BN018', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA019', NULL, N'BN019', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA020', NULL, N'BN020', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA021', N'Có tiền sử bệnh về hô hấp', N'BN021', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA022', NULL, N'BN022', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA023', NULL, N'BN023', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA024', NULL, N'BN024', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA025', NULL, N'BN025', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA026', N'Có tiền sử bệnh tiêu đường', N'BN026', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA027', NULL, N'BN027', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA028', NULL, N'BN028', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA029', NULL, N'BN029', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA030', NULL, N'BN030', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA031', NULL, N'BN031', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA032', NULL, N'BN032', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA033', NULL, N'BN033', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA034', NULL, N'BN034', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA035', NULL, N'BN035', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA036', N'Có tiền sử bệnh hen suyễn', N'BN036', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA037', NULL, N'BN037', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA038', NULL, N'BN038', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA039', NULL, N'BN039', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA040', NULL, N'BN040', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA041', NULL, N'BN041', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA042', N'Có tiền sử đau dạ dày', N'BN042', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA043', NULL, N'BN043', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA044', NULL, N'BN044', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA045', NULL, N'BN045', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA046', NULL, N'BN046', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA047', NULL, N'BN047', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA048', N'Có tiền sử về thận', N'BN048', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA049', NULL, N'BN049', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SoBenhAn] ([MaSoBenhAn], [BenhNen], [MaBN], [NgayLap]) VALUES (N'SBA050', NULL, N'BN050', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV058', N'SDDV001', N'PKB006', N'DV003', CAST(N'2024-05-02T07:40:20.000' AS DateTime), CAST(N'2024-05-02T07:21:20.000' AS DateTime), N'P51', N'NV011', N'Cơ bắp chấn thương')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV058', N'SDDV002', N'PKB006', N'DV068', CAST(N'2024-05-02T08:10:20.000' AS DateTime), CAST(N'2024-05-02T07:21:20.000' AS DateTime), N'P187', N'NV251', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV071', N'SDDV003', N'PKB12', N'DV002', CAST(N'2024-05-02T17:43:10.000' AS DateTime), CAST(N'2024-05-02T17:11:10.000' AS DateTime), N'P154', N'NV517', N'Xuất hiện các tinh thể của canxi oxalat, urat')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV071', N'SDDV004', N'PKB12', N'DV004', CAST(N'2024-05-02T18:00:10.000' AS DateTime), CAST(N'2024-05-02T17:11:10.000' AS DateTime), N'P154', N'NV517', N'Tăng canxi máu')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV055', N'SDDV005', N'PKB16', N'DV004', CAST(N'2024-05-02T17:45:10.000' AS DateTime), CAST(N'2024-05-02T17:11:10.000' AS DateTime), N'P142', N'NV319', N'Phát hiện nhiễm virus tiêu hóa norovirus')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV062', N'SDDV006', N'PKB21', N'DV110', CAST(N'2024-04-13T02:40:10.000' AS DateTime), CAST(N'2024-04-13T02:11:10.000' AS DateTime), N'P142', N'NV319', N'Phát hiện nhiễm virus tiêu hóa norovirus')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV062', N'SDDV007', N'PKB21', N'DV002', CAST(N'2024-04-13T02:50:10.000' AS DateTime), CAST(N'2024-04-13T02:11:10.000' AS DateTime), N'P154', N'NV517', N'Bạch cầu tăng cao')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV054', N'SDDV008', N'PKB22', N'DV110', CAST(N'2024-05-02T18:45:49.000' AS DateTime), CAST(N'2024-05-02T18:15:49.000' AS DateTime), N'P142', N'NV530', N'Phát hiện nhiễm virus tiêu hóa norovirus')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV054', N'SDDV009', N'PKB22', N'DV002', CAST(N'2024-05-02T18:55:49.000' AS DateTime), CAST(N'2024-05-02T18:15:49.000' AS DateTime), N'P154', N'NV536', N'(natri, kali, canxi) mất cân bằng')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV059', N'SDDV010', N'PKB23', N'DV110', CAST(N'2024-04-13T17:40:10.000' AS DateTime), CAST(N'2024-04-13T17:11:10.000' AS DateTime), N'P142', N'NV530', N'Phát hiện vi khuẩn gây nhiễm trùng')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV059', N'SDDV011', N'PKB23', N'DV002', CAST(N'2024-04-13T18:00:10.000' AS DateTime), CAST(N'2024-04-13T17:11:10.000' AS DateTime), N'P154', N'NV536', N'Mất nước, viêm nhiễm')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV231', N'SDDV012', N'PKB28', N'DV113', CAST(N'2024-05-02T21:30:00.000' AS DateTime), CAST(N'2024-05-02T21:00:00.000' AS DateTime), N'P117', N'NV032', N'Co thắt tim')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV231', N'SDDV013', N'PKB28', N'DV114', CAST(N'2024-05-02T21:45:05.000' AS DateTime), CAST(N'2024-05-02T21:00:00.000' AS DateTime), N'P117', N'NV032', N'Động mạch bị tắt nghẽn')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV206', N'SDDV014', N'PKB34', N'DV002', CAST(N'2024-04-13T21:30:01.000' AS DateTime), CAST(N'2024-04-13T21:00:00.000' AS DateTime), N'P146', N'NV322', N'Cholesterol xấu')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV206', N'SDDV015', N'PKB34', N'DV114', CAST(N'2024-04-13T21:55:40.000' AS DateTime), CAST(N'2024-04-13T21:00:00.000' AS DateTime), N'P117', N'NV032', N'Động mạch bị tắt nghẽn')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV206', N'SDDV016', N'PKB34', N'DV113', CAST(N'2024-04-13T22:15:00.000' AS DateTime), CAST(N'2024-04-13T21:00:00.000' AS DateTime), N'P117', N'NV317', N'Co thắt tim')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV231', N'SDDV017', N'PKB29', N'DV002', CAST(N'2024-05-02T10:20:50.000' AS DateTime), CAST(N'2024-05-02T10:17:18.000' AS DateTime), N'P145', N'NV321', N'Máu không bơm được lên tim')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV231', N'SDDV018', N'PKB29', N'DV114', CAST(N'2024-05-02T10:50:18.000' AS DateTime), CAST(N'2024-05-02T10:17:18.000' AS DateTime), N'P118', N'NV318', N'Động mạch tắt nghẽn')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV230', N'SDDV019', N'PKB40', N'DV094', CAST(N'2024-05-02T10:42:35.000' AS DateTime), CAST(N'2024-05-02T10:13:35.000' AS DateTime), N'P145', N'NV321', N'Máu không bơm được lên tim')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV230', N'SDDV020', N'PKB40', N'DV114', CAST(N'2024-05-02T11:10:35.000' AS DateTime), CAST(N'2024-05-02T10:13:35.000' AS DateTime), N'P117', N'NV015', N'Động mạch tắt nghẽn')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV230', N'SDDV021', N'PKB40', N'DV010', CAST(N'2024-05-02T16:25:35.000' AS DateTime), CAST(N'2024-05-02T10:13:35.000' AS DateTime), N'P103', N'NV230', N'Phẫu thuật thành công')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV232', N'SDDV022', N'PKB41', N'DV094', CAST(N'2024-04-13T01:30:23.000' AS DateTime), CAST(N'2024-04-13T01:19:23.000' AS DateTime), N'P145', N'NV323', N'Máu không bơm được lên tim')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV232', N'SDDV023', N'PKB41', N'DV010', CAST(N'2024-04-13T02:15:23.000' AS DateTime), CAST(N'2024-04-13T01:19:23.000' AS DateTime), N'P104', N'NV232', N'Phẫu thuật thành công')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV066', N'SDDV024', N'PKB46', N'DV002', CAST(N'2024-05-02T15:15:05.000' AS DateTime), CAST(N'2024-05-02T14:50:05.000' AS DateTime), N'P145', N'NV530', N'Xuất hiện phần trăm đường trong máu cao')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV066', N'SDDV025', N'PKB46', N'DV004', CAST(N'2024-05-02T15:50:05.000' AS DateTime), CAST(N'2024-05-02T14:50:05.000' AS DateTime), N'P145', N'NV530', N'Xuất hiện cetone trong nước tiểu')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV206', N'SDDV026', N'PKB45', N'DV116', CAST(N'2024-04-13T10:13:35.000' AS DateTime), CAST(N'2024-04-13T10:13:35.000' AS DateTime), N'P138', N'NV318', N'Phát hiện khối u')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV206', N'SDDV027', N'PKB45', N'DV001', CAST(N'2024-04-13T11:13:35.000' AS DateTime), CAST(N'2024-04-13T10:13:35.000' AS DateTime), N'P159', N'NV512', N'Ung thư não giai đoạn đầu')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV206', N'SDDV028', N'PKB45', N'DV014', CAST(N'2024-05-02T09:13:35.000' AS DateTime), CAST(N'2024-04-13T10:13:35.000' AS DateTime), N'P112', N'NV206', N'Phẫu thuật thành công')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV205', N'SDDV029', N'PKB56', N'DV119', CAST(N'2024-05-02T00:50:59.000' AS DateTime), CAST(N'2024-05-02T00:35:59.000' AS DateTime), N'P138', N'NV320', N'Rối loạn thần kinh')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV205', N'SDDV030', N'PKB56', N'DV006', CAST(N'2024-05-02T01:35:59.000' AS DateTime), CAST(N'2024-05-02T00:35:59.000' AS DateTime), N'P121', N'NV323', N'Thiếu máu cục bộ trong não')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV191', N'SDDV031', N'PKB63', N'DV107', CAST(N'2024-04-13T01:15:43.000' AS DateTime), CAST(N'2024-04-13T00:59:59.000' AS DateTime), N'P130', N'NV317', N'Tăng men gan')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV191', N'SDDV032', N'PKB63', N'DV097', CAST(N'2024-04-13T01:48:59.000' AS DateTime), CAST(N'2024-04-13T00:59:59.000' AS DateTime), N'P130', N'NV317', N'Amylase và lipase tăng')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV191', N'SDDV033', N'PKB63', N'DV006', CAST(N'2024-04-13T02:01:59.000' AS DateTime), CAST(N'2024-04-13T00:59:59.000' AS DateTime), N'P121', N'NV323', N'Phát hiện tắc nghẽn túi mật')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV082', N'SDDV034', N'PKB66', N'DV119', CAST(N'2024-05-02T07:58:54.000' AS DateTime), CAST(N'2024-05-02T07:48:54.000' AS DateTime), N'P131', N'NV015', N'Viêm ruột')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV082', N'SDDV035', N'PKB66', N'DV017', CAST(N'2024-05-02T10:30:54.000' AS DateTime), CAST(N'2024-05-02T07:48:54.000' AS DateTime), N'P79', N'NV082', N'Phẫu thuật thành công')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV002', N'SDDV036', N'PKB68', N'DV107', CAST(N'2024-05-02T14:02:10.000' AS DateTime), CAST(N'2024-05-02T13:47:10.000' AS DateTime), N'P130', N'NV032', N'Tăng men gan')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV002', N'SDDV037', N'PKB68', N'DV097', CAST(N'2024-05-02T14:40:10.000' AS DateTime), CAST(N'2024-05-02T13:47:10.000' AS DateTime), N'P130', N'NV032', N'Amylase và lipase tăng')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV002', N'SDDV038', N'PKB68', N'DV006', CAST(N'2024-05-02T15:17:10.000' AS DateTime), CAST(N'2024-05-02T13:47:10.000' AS DateTime), N'P121', N'NV322', N'Phát hiện viêm túi mật')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV308', N'SDDV039', N'PKB71', N'DV003', CAST(N'2024-05-02T08:13:54.000' AS DateTime), CAST(N'2024-05-02T07:48:54.000' AS DateTime), N'P125', N'NV327', N'Bóng mờ ở phổi')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV308', N'SDDV040', N'PKB71', N'DV006', CAST(N'2024-05-02T09:00:54.000' AS DateTime), CAST(N'2024-05-02T07:48:54.000' AS DateTime), N'P121', N'NV321', N'Mô kém thông khí')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV246', N'SDDV041', N'PKB73', N'DV003', CAST(N'2024-04-13T11:05:08.000' AS DateTime), CAST(N'2024-04-13T10:21:08.000' AS DateTime), N'P125', N'NV327', N'Tổn thương xương')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV246', N'SDDV042', N'PKB73', N'DV006', CAST(N'2024-04-13T11:55:08.000' AS DateTime), CAST(N'2024-04-13T10:21:08.000' AS DateTime), N'P121', N'NV321', N'Mô mềm xung quanh khớp bị phù nề')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV192', N'SDDV043', N'PKB78', N'DV107', CAST(N'2024-04-13T11:05:08.000' AS DateTime), CAST(N'2024-04-13T10:21:08.000' AS DateTime), N'P130', N'NV541', N'Gan có vấn đề')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV192', N'SDDV044', N'PKB78', N'DV006', CAST(N'2024-04-13T11:55:08.000' AS DateTime), CAST(N'2024-04-13T10:21:08.000' AS DateTime), N'P121', N'NV529', N'Có dấu hiệu xơ gan')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV236', N'SDDV045', N'PKB87', N'DV010', CAST(N'2024-05-02T10:05:08.000' AS DateTime), CAST(N'2024-04-13T13:47:10.000' AS DateTime), N'P103', N'NV236', N'Phẫu thuật thành công')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV236', N'SDDV046', N'PKB87', N'DV006', CAST(N'2024-04-13T13:55:08.000' AS DateTime), CAST(N'2024-04-13T13:47:10.000' AS DateTime), N'P121', N'NV529', N'Máu bơm quá nhanh lên tim')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV198', N'SDDV047', N'PKB91', N'DV119', CAST(N'2024-04-13T15:25:05.000' AS DateTime), CAST(N'2024-04-13T14:50:05.000' AS DateTime), N'P130', N'NV032', N'Đại tràng có khối u')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV198', N'SDDV048', N'PKB91', N'DV006', CAST(N'2024-04-13T15:55:05.000' AS DateTime), CAST(N'2024-04-13T14:50:05.000' AS DateTime), N'P121', N'NV530', N'Kích thước khối u nhỏ')
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV071', N'SDDV049', N'PKB12', N'DV056', CAST(N'2024-05-02T18:00:00.000' AS DateTime), CAST(N'2024-05-02T17:35:29.000' AS DateTime), N'P311', N'NV438', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV055', N'SDDV050', N'PKB16', N'DV032', CAST(N'2024-06-02T06:30:45.000' AS DateTime), CAST(N'2024-05-02T06:30:45.000' AS DateTime), N'P250', N'NV073', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV054', N'SDDV051', N'PKB22', N'DV033', CAST(N'2024-05-02T19:01:43.000' AS DateTime), CAST(N'2924-05-02T18:45:31.000' AS DateTime), N'P256', N'NV053', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV062', N'SDDV052', N'PKB21', N'DV033', CAST(N'2024-04-13T04:00:00.000' AS DateTime), CAST(N'2024-04-13T03:10:23.000' AS DateTime), N'P256', N'NV392', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV059', N'SDDV053', N'PKB23', N'DV034', CAST(N'2024-04-13T18:00:00.000' AS DateTime), CAST(N'2024-04-13T19:45:32.000' AS DateTime), N'P255', N'NV053', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV231', N'SDDV054', N'PKB28', N'DV064', CAST(N'2024-05-02T22:20:00.000' AS DateTime), CAST(N'2024-05-02T22:15:34.000' AS DateTime), N'P180', N'NV220', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV228', N'SDDV055', N'PKB29', N'DV065', CAST(N'2024-04-13T23:13:20.000' AS DateTime), CAST(N'2024-04-13T22:15:20.000' AS DateTime), N'P182', N'NV454', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV206', N'SDDV056', N'PKB34', N'DV060', CAST(N'2024-05-02T12:00:00.000' AS DateTime), CAST(N'2024-05-02T11:45:30.000' AS DateTime), N'P177', N'NV233', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV230', N'SDDV057', N'PKB40', N'DV065', CAST(N'2024-05-02T11:30:21.000' AS DateTime), CAST(N'2024-05-02T11:20:30.000' AS DateTime), N'P182', N'NV221', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV232', N'SDDV058', N'PKB41', N'DV066', CAST(N'2024-04-13T02:30:12.000' AS DateTime), CAST(N'2024-04-13T02:15:00.000' AS DateTime), N'P180', N'NV220', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV066', N'SDDV059', N'PKB46', N'DV034', CAST(N'2024-05-02T15:35:29.000' AS DateTime), CAST(N'2024-05-02T15:27:30.000' AS DateTime), N'P204', N'NV296', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV206', N'SDDV060', N'PKB45', N'DV061', CAST(N'2024-04-13T11:30:45.000' AS DateTime), CAST(N'2024-04-13T11:18:20.000' AS DateTime), N'P325', N'NV215', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV205', N'SDDV061', N'PKB56', N'DV061', CAST(N'2024-05-02T01:50:30.000' AS DateTime), CAST(N'2024-05-02T01:45:23.000' AS DateTime), N'P323', N'NV441', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV191', N'SDDV062', N'PKB63', N'DV057', CAST(N'2024-04-13T03:30:12.000' AS DateTime), CAST(N'2024-04-13T02:00:00.000' AS DateTime), N'P313', N'NV433', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV082', N'SDDV063', N'PKB66', N'DV036', CAST(N'2024-05-02T08:35:20.000' AS DateTime), CAST(N'2024-05-02T08:30:12.000' AS DateTime), N'P262', N'NV087', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV002', N'SDDV064', N'PKB68', N'DV034', CAST(N'2024-05-02T14:45:21.000' AS DateTime), CAST(N'2024-05-02T14:26:34.000' AS DateTime), N'P255', N'NV053', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV308', N'SDDV065', N'PKB71', N'DV080', CAST(N'2024-04-13T16:10:02.000' AS DateTime), CAST(N'2024-04-13T15:50:01.000' AS DateTime), N'P211', N'NV314', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV246', N'SDDV066', N'PKB73', N'DV068', CAST(N'2024-04-13T11:43:05.000' AS DateTime), CAST(N'2024-04-13T11:25:14.000' AS DateTime), N'P189', N'NV254', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV192', N'SDDV067', N'PKB78', N'DV057', CAST(N'2024-05-02T15:46:34.000' AS DateTime), CAST(N'2024-05-02T15:31:05.000' AS DateTime), N'P313', N'NV183', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV236', N'SDDV068', N'PKB87', N'DV058', CAST(N'2024-04-13T15:55:12.000' AS DateTime), CAST(N'2024-04-13T15:31:43.000' AS DateTime), N'P314', N'NV195', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV198', N'SDDV069', N'PKB91', N'DV062', CAST(N'2024-04-13T16:00:00.000' AS DateTime), CAST(N'2024-04-13T15:21:19.000' AS DateTime), N'P326', N'NV213', NULL)
INSERT [dbo].[SuDungDichVu] ([MaNV], [MaSuDungDV], [MaPhieuKB], [MaDV], [NgayThucHien], [NgayYeuCau], [MSPhong], [MaNVThucHien], [KetQua]) VALUES (N'NV055', N'SDDV070', N'PKB16', N'DV002', CAST(N'2024-05-02T18:01:10.000' AS DateTime), CAST(N'2024-05-02T17:11:10.000' AS DateTime), N'P154', N'NV517', N'Bạch cầu tăng cao')
GO
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH001', N'SBA001', N'P39', N'NV443', CAST(N'2024-07-12T00:00:00.000' AS DateTime), N'Đã hủy', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH002', N'SBA002', N'P34', N'NV147', CAST(N'2024-06-04T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Tình trạng bệnh đã khỏi hoàn toàn, không còn triệu chứng.')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH003', N'SBA003', N'P06', NULL, CAST(N'2024-05-10T00:00:00.000' AS DateTime), N'Chưa hoàn thành', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH005', N'SBA005', N'P66', N'NV312', CAST(N'2024-05-01T00:00:00.000' AS DateTime), N'Đã hủy', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH006', N'SBA005', N'P40', NULL, CAST(N'2024-08-25T00:00:00.000' AS DateTime), N'Chưa hoàn thành', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH007', N'SBA008', N'P05', N'NV186', CAST(N'2024-06-12T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Các triệu chứng đã giảm đáng kể, không còn biểu hiện nặng.')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH008', N'SBA010', N'P39', N'NV199', CAST(N'2024-05-01T00:00:00.000' AS DateTime), N'Đã hủy', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH009', N'SBA010', N'P40', N'NV296', CAST(N'2024-09-12T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Các triệu chứng đã giảm đáng kể, không còn biểu hiện nặng')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH010', N'SBA011', N'P05', NULL, CAST(N'2024-07-12T00:00:00.000' AS DateTime), N'Chưa hoàn thành', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH011', N'SBA012', N'P06', N'NV062', CAST(N'2024-04-29T00:00:00.000' AS DateTime), N'Đã hủy', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH012', N'SBA012', N'P40', N'NV205', CAST(N'2024-10-11T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Bệnh nhân đã đạt được hồi phục hoàn toàn, không cần điều trị tiếp tục.')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH013', N'SBA013', N'P26', NULL, CAST(N'2024-05-05T00:00:00.000' AS DateTime), N'Chưa hoàn thành', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH014', N'SBA013', N'P39', N'NV199', CAST(N'2024-06-19T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Các triệu chứng đã giảm đáng kể, không còn biểu hiện nặng.')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH015', N'SBA014', N'P46', NULL, CAST(N'2024-06-12T00:00:00.000' AS DateTime), N'Chưa hoàn thành', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH016', N'SBA015', N'P39', N'NV231', CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Bệnh nhân đã đạt được hồi phục hoàn toàn, không cần điều trị tiếp tục.')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH017', N'SBA016', N'P10', N'NV071', CAST(N'2024-05-15T00:00:00.000' AS DateTime), N'Đã hủy', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH018', N'SBA017', N'P51', N'NV028', CAST(N'2024-04-23T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Các triệu chứng đã giảm đáng kể, không còn biểu hiện nặng')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH019', N'SBA017', N'P41', NULL, CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'Chưa hoàn thành', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH020', N'SBA020', N'P46', NULL, CAST(N'2024-05-19T00:00:00.000' AS DateTime), N'Chưa hoàn thành', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH021', N'SBA021', N'P70', N'NV334', CAST(N'2024-05-06T00:00:00.000' AS DateTime), N'Đã hủy', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH022', N'SBA022', N'P32', N'NV085', CAST(N'2024-05-28T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Các triệu chứng đã giảm đáng kể, không còn biểu hiện nặng.')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH023', N'SBA023', N'P09', N'NV068', CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Bệnh nhân đã đạt được hồi phục hoàn toàn, không cần điều trị tiếp tục.')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH024', N'SBA026', N'P37', N'NV008', CAST(N'2024-06-02T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Tình trạng bệnh đã khỏi hoàn toàn, không còn triệu chứng')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH025', N'SBA027', N'P34', N'NV171', CAST(N'2024-05-21T00:00:00.000' AS DateTime), N'Đã hủy', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH026', N'SBA028', N'P40', N'NV205', CAST(N'2024-06-01T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Tình trạng bệnh đã khỏi hoàn toàn, không còn triệu chứng')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH027', N'SBA029', N'P52', N'NV171', CAST(N'2024-05-20T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Bệnh nhân đã đạt được hồi phục hoàn toàn, không cần điều trị tiếp tục.')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH028', N'SBA031', N'P11', N'NV077', CAST(N'2024-07-07T00:00:00.000' AS DateTime), N'Đã hủy', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH029', N'SBA032', N'P01', N'NV187', CAST(N'2024-05-16T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Các triệu chứng đã giảm đáng kể, không còn biểu hiện nặng.')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH030', N'SBA034', N'P05', N'NV061', CAST(N'2024-05-08T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Bệnh nhân đã đạt được hồi phục hoàn toàn, không cần điều trị tiếp tục.')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH031', N'SBA036', N'P65', N'NV484', CAST(N'2024-04-20T00:00:00.000' AS DateTime), N'Đã hủy', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH032', N'SBA038', N'P39', N'NV199', CAST(N'2024-06-13T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Các triệu chứng đã giảm đáng kể, không còn biểu hiện nặng.')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH033', N'SBA039', N'P36', N'NV194', CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Tình trạng bệnh đã khỏi hoàn toàn, không còn triệu chứng')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH034', N'SBA040', N'P35', N'NV188', CAST(N'2024-04-28T00:00:00.000' AS DateTime), N'Đã hủy', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH035', N'SBA040', N'P39', N'NV026', CAST(N'2024-06-01T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Bệnh nhân đã đạt được hồi phục hoàn toàn, không cần điều trị tiếp tục.')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH036', N'SBA041', N'P35', NULL, CAST(N'2024-04-28T00:00:00.000' AS DateTime), N'Chưa hoàn thành', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH037', N'SBA041', N'P39', N'NV198', CAST(N'2024-06-01T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Các triệu chứng đã giảm đáng kể, không còn biểu hiện nặng.')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH038', N'SBA044', N'P47', N'NV236', CAST(N'2024-04-21T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Bệnh nhân đã đạt được hồi phục hoàn toàn, không cần điều trị tiếp tục.')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH039', N'SBA044', N'P62', N'NV013', CAST(N'2024-06-11T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Tình trạng bệnh đã khỏi hoàn toàn, không còn triệu chứng')
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH040', N'SBA046', N'P06', NULL, CAST(N'2024-05-05T00:00:00.000' AS DateTime), N'Chưa hoàn thành', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH041', N'SBA047', N'P39', N'NV026', CAST(N'2024-06-12T00:00:00.000' AS DateTime), N'Đã hủy', NULL)
INSERT [dbo].[TaiKham] ([MSCuocHen], [MaSoBenhAn], [MSPhong], [MaNVPhuTrach], [NgayTaiKham], [TrangThai], [KetQua]) VALUES (N'CH042', N'SBA050', N'P02', N'NV264', CAST(N'2024-05-20T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Các triệu chứng đã giảm đáng kể, không còn biểu hiện nặng.')
GO
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV001', N'NV001', N'NV001')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV002', N'NV002', N'NV002')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV003', N'NV003', N'NV003')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV004', N'NV004', N'NV004')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV005', N'NV005', N'NV005')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV006', N'NV006', N'NV006')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV007', N'NV007', N'NV007')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV008', N'NV008', N'NV008')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV009', N'NV009', N'NV009')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV010', N'NV010', N'NV010')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV011', N'NV011', N'NV011')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV012', N'NV012', N'NV012')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV013', N'NV013', N'NV013')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV014', N'NV014', N'NV014')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV015', N'NV015', N'NV015')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV016', N'NV016', N'NV016')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV017', N'NV017', N'NV017')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV018', N'NV018', N'NV018')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV019', N'NV019', N'NV019')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV020', N'NV020', N'NV020')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV021', N'NV021', N'NV021')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV022', N'NV022', N'NV022')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV023', N'NV023', N'NV023')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV024', N'NV024', N'NV024')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV025', N'NV025', N'NV025')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV026', N'NV026', N'NV026')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV027', N'NV027', N'NV027')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV028', N'NV028', N'NV028')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV029', N'NV029', N'NV029')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV030', N'NV030', N'NV030')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV031', N'NV031', N'NV031')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV032', N'NV032', N'NV032')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV033', N'NV033', N'NV033')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV034', N'NV034', N'NV034')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV035', N'NV035', N'NV035')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV036', N'NV036', N'NV036')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV037', N'NV037', N'NV037')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV038', N'NV038', N'NV038')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV039', N'NV039', N'NV039')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV040', N'NV040', N'NV040')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV041', N'NV041', N'NV041')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV042', N'NV042', N'NV042')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV043', N'NV043', N'NV043')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV044', N'NV044', N'NV044')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV045', N'NV045', N'NV045')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV046', N'NV046', N'NV046')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV047', N'NV047', N'NV047')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV048', N'NV048', N'NV048')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV049', N'NV049', N'NV049')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV050', N'NV050', N'NV050')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV051', N'NV051', N'NV051')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV052', N'NV052', N'NV052')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV053', N'NV053', N'NV053')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV054', N'NV054', N'NV054')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV055', N'NV055', N'NV055')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV056', N'NV056', N'NV056')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV057', N'NV057', N'NV057')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV058', N'NV058', N'NV058')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV059', N'NV059', N'NV059')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV060', N'NV060', N'NV060')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV061', N'NV061', N'NV061')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV062', N'NV062', N'NV062')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV063', N'NV063', N'NV063')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV064', N'NV064', N'NV064')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV065', N'NV065', N'NV065')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV066', N'NV066', N'NV066')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV067', N'NV067', N'NV067')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV068', N'NV068', N'NV068')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV069', N'NV069', N'NV069')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV070', N'NV070', N'NV070')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV071', N'NV071', N'NV071')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV072', N'NV072', N'NV072')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV073', N'NV073', N'NV073')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV074', N'NV074', N'NV074')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV075', N'NV075', N'NV075')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV076', N'NV076', N'NV076')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV077', N'NV077', N'NV077')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV078', N'NV078', N'NV078')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV079', N'NV079', N'NV079')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV080', N'NV080', N'NV080')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV081', N'NV081', N'NV081')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV082', N'NV082', N'NV082')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV083', N'NV083', N'NV083')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV084', N'NV084', N'NV084')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV085', N'NV085', N'NV085')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV086', N'NV086', N'NV086')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV087', N'NV087', N'NV087')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV088', N'NV088', N'NV088')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV089', N'NV089', N'NV089')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV090', N'NV090', N'NV090')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV091', N'NV091', N'NV091')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV092', N'NV092', N'NV092')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV093', N'NV093', N'NV093')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV094', N'NV094', N'NV094')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV095', N'NV095', N'NV095')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV096', N'NV096', N'NV096')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV097', N'NV097', N'NV097')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV098', N'NV098', N'NV098')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV099', N'NV099', N'NV099')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV100', N'NV100', N'NV100')
GO
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV101', N'NV101', N'NV101')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV102', N'NV102', N'NV102')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV103', N'NV103', N'NV103')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV104', N'NV104', N'NV104')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV105', N'NV105', N'NV105')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV106', N'NV106', N'NV106')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV107', N'NV107', N'NV107')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV108', N'NV108', N'NV108')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV109', N'NV109', N'NV109')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV110', N'NV110', N'NV110')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV111', N'NV111', N'NV111')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV112', N'NV112', N'NV112')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV113', N'NV113', N'NV113')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV114', N'NV114', N'NV114')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV115', N'NV115', N'NV115')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV116', N'NV116', N'NV116')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV117', N'NV117', N'NV117')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV118', N'NV118', N'NV118')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV119', N'NV119', N'NV119')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV120', N'NV120', N'NV120')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV121', N'NV121', N'NV121')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV122', N'NV122', N'NV122')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV123', N'NV123', N'NV123')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV124', N'NV124', N'NV124')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV125', N'NV125', N'NV125')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV126', N'NV126', N'NV126')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV127', N'NV127', N'NV127')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV128', N'NV128', N'NV128')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV129', N'NV129', N'NV129')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV130', N'NV130', N'NV130')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV131', N'NV131', N'NV131')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV132', N'NV132', N'NV132')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV133', N'NV133', N'NV133')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV134', N'NV134', N'NV134')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV135', N'NV135', N'NV135')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV136', N'NV136', N'NV136')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV137', N'NV137', N'NV137')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV138', N'NV138', N'NV138')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV139', N'NV139', N'NV139')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV140', N'NV140', N'NV140')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV141', N'NV141', N'NV141')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV142', N'NV142', N'NV142')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV143', N'NV143', N'NV143')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV144', N'NV144', N'NV144')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV145', N'NV145', N'NV145')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV146', N'NV146', N'NV146')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV147', N'NV147', N'NV147')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV148', N'NV148', N'NV148')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV149', N'NV149', N'NV149')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV150', N'NV150', N'NV150')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV151', N'NV151', N'NV151')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV152', N'NV152', N'NV152')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV153', N'NV153', N'NV153')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV154', N'NV154', N'NV154')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV155', N'NV155', N'NV155')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV156', N'NV156', N'NV156')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV157', N'NV157', N'NV157')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV158', N'NV158', N'NV158')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV159', N'NV159', N'NV159')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV160', N'NV160', N'NV160')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV161', N'NV161', N'NV161')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV162', N'NV162', N'NV162')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV163', N'NV163', N'NV163')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV164', N'NV164', N'NV164')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV165', N'NV165', N'NV165')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV166', N'NV166', N'NV166')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV167', N'NV167', N'NV167')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV168', N'NV168', N'NV168')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV169', N'NV169', N'NV169')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV170', N'NV170', N'NV170')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV171', N'NV171', N'NV171')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV172', N'NV172', N'NV172')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV173', N'NV173', N'NV173')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV174', N'NV174', N'NV174')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV175', N'NV175', N'NV175')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV176', N'NV176', N'NV176')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV177', N'NV177', N'NV177')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV178', N'NV178', N'NV178')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV179', N'NV179', N'NV179')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV180', N'NV180', N'NV180')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV181', N'NV181', N'NV181')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV182', N'NV182', N'NV182')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV183', N'NV183', N'NV183')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV184', N'NV184', N'NV184')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV185', N'NV185', N'NV185')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV186', N'NV186', N'NV186')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV187', N'NV187', N'NV187')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV188', N'NV188', N'NV188')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV189', N'NV189', N'NV189')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV190', N'NV190', N'NV190')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV191', N'NV191', N'NV191')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV192', N'NV192', N'NV192')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV193', N'NV193', N'NV193')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV194', N'NV194', N'NV194')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV195', N'NV195', N'NV195')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV196', N'NV196', N'NV196')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV197', N'NV197', N'NV197')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV198', N'NV198', N'NV198')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV199', N'NV199', N'NV199')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV200', N'NV200', N'NV200')
GO
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV201', N'NV201', N'NV201')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV202', N'NV202', N'NV202')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV203', N'NV203', N'NV203')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV204', N'NV204', N'NV204')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV205', N'NV205', N'NV205')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV206', N'NV206', N'NV206')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV207', N'NV207', N'NV207')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV208', N'NV208', N'NV208')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV209', N'NV209', N'NV209')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV210', N'NV210', N'NV210')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV211', N'NV211', N'NV211')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV212', N'NV212', N'NV212')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV213', N'NV213', N'NV213')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV214', N'NV214', N'NV214')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV215', N'NV215', N'NV215')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV216', N'NV216', N'NV216')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV217', N'NV217', N'NV217')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV218', N'NV218', N'NV218')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV219', N'NV219', N'NV219')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV220', N'NV220', N'NV220')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV221', N'NV221', N'NV221')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV222', N'NV222', N'NV222')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV223', N'NV223', N'NV223')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV224', N'NV224', N'NV224')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV225', N'NV225', N'NV225')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV226', N'NV226', N'NV226')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV227', N'NV227', N'NV227')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV228', N'NV228', N'NV228')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV229', N'NV229', N'NV229')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV230', N'NV230', N'NV230')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV231', N'NV231', N'NV231')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV232', N'NV232', N'NV232')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV233', N'NV233', N'NV233')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV234', N'NV234', N'NV234')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV235', N'NV235', N'NV235')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV236', N'NV236', N'NV236')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV237', N'NV237', N'NV237')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV238', N'NV238', N'NV238')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV239', N'NV239', N'NV239')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV240', N'NV240', N'NV240')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV241', N'NV241', N'NV241')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV242', N'NV242', N'NV242')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV243', N'NV243', N'NV243')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV244', N'NV244', N'NV244')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV245', N'NV245', N'NV245')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV246', N'NV246', N'NV246')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV247', N'NV247', N'NV247')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV248', N'NV248', N'NV248')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV249', N'NV249', N'NV249')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV250', N'NV250', N'NV250')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV251', N'NV251', N'NV251')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV252', N'NV252', N'NV252')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV253', N'NV253', N'NV253')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV254', N'NV254', N'NV254')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV255', N'NV255', N'NV255')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV256', N'NV256', N'NV256')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV257', N'NV257', N'NV257')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV258', N'NV258', N'NV258')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV259', N'NV259', N'NV259')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV260', N'NV260', N'NV260')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV261', N'NV261', N'NV261')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV262', N'NV262', N'NV262')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV263', N'NV263', N'NV263')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV264', N'NV264', N'NV264')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV265', N'NV265', N'NV265')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV266', N'NV266', N'NV266')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV267', N'NV267', N'NV267')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV268', N'NV268', N'NV268')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV269', N'NV269', N'NV269')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV270', N'NV270', N'NV270')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV271', N'NV271', N'NV271')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV272', N'NV272', N'NV272')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV273', N'NV273', N'NV273')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV274', N'NV274', N'NV274')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV275', N'NV275', N'NV275')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV276', N'NV276', N'NV276')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV277', N'NV277', N'NV277')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV278', N'NV278', N'NV278')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV279', N'NV279', N'NV279')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV280', N'NV280', N'NV280')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV281', N'NV281', N'NV281')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV282', N'NV282', N'NV282')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV283', N'NV283', N'NV283')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV284', N'NV284', N'NV284')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV285', N'NV285', N'NV285')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV286', N'NV286', N'NV286')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV287', N'NV287', N'NV287')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV288', N'NV288', N'NV288')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV289', N'NV289', N'NV289')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV290', N'NV290', N'NV290')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV291', N'NV291', N'NV291')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV292', N'NV292', N'NV292')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV293', N'NV293', N'NV293')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV294', N'NV294', N'NV294')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV295', N'NV295', N'NV295')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV296', N'NV296', N'NV296')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV297', N'NV297', N'NV297')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV298', N'NV298', N'NV298')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV299', N'NV299', N'NV299')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV300', N'NV300', N'NV300')
GO
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV301', N'NV301', N'NV301')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV302', N'NV302', N'NV302')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV303', N'NV303', N'NV303')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV304', N'NV304', N'NV304')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV305', N'NV305', N'NV305')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV306', N'NV306', N'NV306')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV307', N'NV307', N'NV307')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV308', N'NV308', N'NV308')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV309', N'NV309', N'NV309')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV310', N'NV310', N'NV310')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV311', N'NV311', N'NV311')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV312', N'NV312', N'NV312')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV313', N'NV313', N'NV313')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV314', N'NV314', N'NV314')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV315', N'NV315', N'NV315')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV316', N'NV316', N'NV316')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV317', N'NV317', N'NV317')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV318', N'NV318', N'NV318')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV319', N'NV319', N'NV319')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV320', N'NV320', N'NV320')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV321', N'NV321', N'NV321')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV322', N'NV322', N'NV322')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV323', N'NV323', N'NV323')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV324', N'NV324', N'NV324')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV325', N'NV325', N'NV325')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV326', N'NV326', N'NV326')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV327', N'NV327', N'NV327')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV328', N'NV328', N'NV328')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV329', N'NV329', N'NV329')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV330', N'NV330', N'NV330')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV331', N'NV331', N'NV331')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV332', N'NV332', N'NV332')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV333', N'NV333', N'NV333')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV334', N'NV334', N'NV334')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV335', N'NV335', N'NV335')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV336', N'NV336', N'NV336')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV337', N'NV337', N'NV337')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV338', N'NV338', N'NV338')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV339', N'NV339', N'NV339')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV340', N'NV340', N'NV340')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV341', N'NV341', N'NV341')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV342', N'NV342', N'NV342')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV343', N'NV343', N'NV343')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV344', N'NV344', N'NV344')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV345', N'NV345', N'NV345')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV346', N'NV346', N'NV346')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV347', N'NV347', N'NV347')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV348', N'NV348', N'NV348')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV349', N'NV349', N'NV349')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV350', N'NV350', N'NV350')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV351', N'NV351', N'NV351')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV352', N'NV352', N'NV352')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV353', N'NV353', N'NV353')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV354', N'NV354', N'NV354')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV355', N'NV355', N'NV355')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV356', N'NV356', N'NV356')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV357', N'NV357', N'NV357')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV358', N'NV358', N'NV358')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV359', N'NV359', N'NV359')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV360', N'NV360', N'NV360')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV361', N'NV361', N'NV361')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV362', N'NV362', N'NV362')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV363', N'NV363', N'NV363')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV364', N'NV364', N'NV364')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV365', N'NV365', N'NV365')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV366', N'NV366', N'NV366')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV367', N'NV367', N'NV367')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV368', N'NV368', N'NV368')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV369', N'NV369', N'NV369')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV370', N'NV370', N'NV370')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV371', N'NV371', N'NV371')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV372', N'NV372', N'NV372')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV373', N'NV373', N'NV373')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV374', N'NV374', N'NV374')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV375', N'NV375', N'NV375')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV376', N'NV376', N'NV376')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV377', N'NV377', N'NV377')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV378', N'NV378', N'NV378')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV379', N'NV379', N'NV379')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV380', N'NV380', N'NV380')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV381', N'NV381', N'NV381')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV382', N'NV382', N'NV382')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV383', N'NV383', N'NV383')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV384', N'NV384', N'NV384')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV385', N'NV385', N'NV385')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV386', N'NV386', N'NV386')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV387', N'NV387', N'NV387')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV388', N'NV388', N'NV388')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV389', N'NV389', N'NV389')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV390', N'NV390', N'NV390')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV391', N'NV391', N'NV391')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV392', N'NV392', N'NV392')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV393', N'NV393', N'NV393')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV394', N'NV394', N'NV394')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV395', N'NV395', N'NV395')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV396', N'NV396', N'NV396')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV397', N'NV397', N'NV397')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV398', N'NV398', N'NV398')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV399', N'NV399', N'NV399')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV400', N'NV400', N'NV400')
GO
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV401', N'NV401', N'NV401')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV402', N'NV402', N'NV402')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV403', N'NV403', N'NV403')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV404', N'NV404', N'NV404')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV405', N'NV405', N'NV405')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV406', N'NV406', N'NV406')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV407', N'NV407', N'NV407')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV408', N'NV408', N'NV408')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV409', N'NV409', N'NV409')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV410', N'NV410', N'NV410')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV411', N'NV411', N'NV411')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV412', N'NV412', N'NV412')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV413', N'NV413', N'NV413')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV414', N'NV414', N'NV414')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV415', N'NV415', N'NV415')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV416', N'NV416', N'NV416')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV417', N'NV417', N'NV417')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV418', N'NV418', N'NV418')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV419', N'NV419', N'NV419')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV420', N'NV420', N'NV420')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV421', N'NV421', N'NV421')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV422', N'NV422', N'NV422')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV423', N'NV423', N'NV423')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV424', N'NV424', N'NV424')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV425', N'NV425', N'NV425')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV426', N'NV426', N'NV426')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV427', N'NV427', N'NV427')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV428', N'NV428', N'NV428')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV429', N'NV429', N'NV429')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV430', N'NV430', N'NV430')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV431', N'NV431', N'NV431')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV432', N'NV432', N'NV432')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV433', N'NV433', N'NV433')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV434', N'NV434', N'NV434')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV435', N'NV435', N'NV435')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV436', N'NV436', N'NV436')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV437', N'NV437', N'NV437')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV438', N'NV438', N'NV438')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV439', N'NV439', N'NV439')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV440', N'NV440', N'NV440')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV441', N'NV441', N'NV441')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV442', N'NV442', N'NV442')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV443', N'NV443', N'NV443')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV445', N'NV445', N'NV445')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV446', N'NV446', N'NV446')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV447', N'NV447', N'NV447')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV448', N'NV448', N'NV448')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV449', N'NV449', N'NV449')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV450', N'NV450', N'NV450')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV451', N'NV451', N'NV451')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV452', N'NV452', N'NV452')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV453', N'NV453', N'NV453')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV454', N'NV454', N'NV454')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV455', N'NV455', N'NV455')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV456', N'NV456', N'NV456')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV457', N'NV457', N'NV457')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV458', N'NV458', N'NV458')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV459', N'NV459', N'NV459')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV460', N'NV460', N'NV460')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV461', N'NV461', N'NV461')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV462', N'NV462', N'NV462')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV463', N'NV463', N'NV463')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV464', N'NV464', N'NV464')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV465', N'NV465', N'NV465')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV466', N'NV466', N'NV466')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV467', N'NV467', N'NV467')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV468', N'NV468', N'NV468')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV469', N'NV469', N'NV469')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV470', N'NV470', N'NV470')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV471', N'NV471', N'NV471')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV472', N'NV472', N'NV472')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV473', N'NV473', N'NV473')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV474', N'NV474', N'NV474')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV475', N'NV475', N'NV475')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV476', N'NV476', N'NV476')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV477', N'NV477', N'NV477')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV478', N'NV478', N'NV478')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV479', N'NV479', N'NV479')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV480', N'NV480', N'NV480')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV481', N'NV481', N'NV481')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV482', N'NV482', N'NV482')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV483', N'NV483', N'NV483')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV484', N'NV484', N'NV484')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV485', N'NV485', N'NV485')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV486', N'NV486', N'NV486')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV487', N'NV487', N'NV487')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV488', N'NV488', N'NV488')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV489', N'NV489', N'NV489')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV490', N'NV490', N'NV490')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV491', N'NV491', N'NV491')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV492', N'NV492', N'NV492')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV493', N'NV493', N'NV493')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV494', N'NV494', N'NV494')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV495', N'NV495', N'NV495')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV496', N'NV496', N'NV496')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV497', N'NV497', N'NV497')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV498', N'NV498', N'NV498')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV499', N'NV499', N'NV499')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV500', N'NV500', N'NV500')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV501', N'NV501', N'NV501')
GO
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV502', N'NV502', N'NV502')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV503', N'NV503', N'NV503')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV504', N'NV504', N'NV504')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [MaNV]) VALUES (N'NV505', N'NV505', N'NV505')
GO
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB006', CAST(N'2024-05-03T08:10:20.000' AS DateTime), N'46', N'121', N'21', N'37.1', N'92', N'5.7', N'Cần theo dõi thêm', N'NV251', N'G187.1', N'TD-PKB006-G187.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB12', CAST(N'2024-05-03T16:23:00.000' AS DateTime), N'43', N'121', N'19', N'36.7', N'80', N'5.9', N'Cần theo dõi thêm', N'NV182', N'G311.1', N'TD-PKB12-G311.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB16', CAST(N'2024-06-03T07:30:45.000' AS DateTime), N'43', N'122', N'16', N'37.0', N'76', N'5.6', N'Cần theo dõi thêm', N'NV073', N'G250.1', N'TD-PKB16-G250.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB21', CAST(N'2024-04-14T07:00:00.000' AS DateTime), N'49', N'119', N'20', N'36.9', N'83', N'5.7', N'Cần theo dõi thêm', N'NV053', N'G256.1', N'TD-PKB21-G256.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB22', CAST(N'2024-05-03T08:01:43.000' AS DateTime), N'50', N'120', N'21', N'37.0', N'87', N'6.0', N'Cần theo dõi thêm', N'NV019', N'G256.2', N'TD-PKB22-G256.2.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB23', CAST(N'2024-04-14T16:00:00.000' AS DateTime), N'54', N'121', N'19', N'36.8', N'82', N'6.2', N'Cần theo dõi thêm', N'NV053', N'G255.1', N'TD-PKB23-G255.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB28', CAST(N'2024-05-03T09:20:00.000' AS DateTime), N'48', N'118', N'19', N'37.0', N'85', N'6.0', N'Cần theo dõi thêm', N'NV221', N'G180.2', N'TD-PKB28-G180.2.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB29', CAST(N'2024-04-14T09:13:20.000' AS DateTime), N'42', N'120', N'22', N'36.6', N'90', N'5.8', N'Cần theo dõi thêm', N'NV449', N'G182.1', N'TD-PKB29-G182.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB34', CAST(N'2024-05-02T13:00:00.000' AS DateTime), N'45', N'120', N'20', N'36.5', N'80', N'5.6', N'Cần theo dõi thêm', N'NV233', N'G177.1', N'TD-PKB34-G177.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB40', CAST(N'2024-05-03T09:30:21.000' AS DateTime), N'43', N'112', N'23', N'36.9', N'88', N'6.1', N'Cần theo dõi thêm', N'NV449', N'G182.2', N'TD-PKB40-G182.2.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB41', CAST(N'2024-04-14T08:30:12.000' AS DateTime), N'52', N'115', N'18', N'36.8', N'78', N'5.4', N'Cần theo dõi thêm', N'NV221', N'G180.1', N'TD-PKB41-G180.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB45', CAST(N'2024-05-03T15:35:29.000' AS DateTime), N'51', N'118', N'20', N'37.2', N'81', N'5.6', N'Cần theo dõi thêm', N'NV296', N'G204.1', N'TD-PKB45-G204.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB46', CAST(N'2024-04-14T07:12:45.000' AS DateTime), N'42', N'120', N'20', N'36.6', N'78', N'5.6', N'Cần theo dõi thêm', N'NV215', N'G325.1', N'TD-PKB46-G325.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB56', CAST(N'2024-05-03T15:50:30.000' AS DateTime), N'41', N'120', N'20', N'37.0', N'85', N'5.7', N'Cần theo dõi thêm', N'NV213', N'G323.1', N'TD-PKB56-G323.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB63', CAST(N'2024-04-14T09:35:12.000' AS DateTime), N'42', N'117', N'20', N'36.8', N'77', N'5.6', N'Cần theo dõi thêm', N'NV008', N'G313.1', N'TD-PKB63-G313.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB66', CAST(N'2024-05-03T08:35:20.000' AS DateTime), N'40', N'110', N'18', N'36.6', N'74', N'5.5', N'Cần theo dõi thêm', N'NV087', N'G262.1', N'TD-PKB66-G262.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB67', CAST(N'2024-05-03T15:45:21.000' AS DateTime), N'65', N'117', N'18', N'36.5', N'79', N'5.8', N'Cần theo dõi thêm', N'NV053', N'G255.2', N'TD-PKB67-G255.2.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB71', CAST(N'2024-04-14T16:10:02.000' AS DateTime), N'55', N'110', N'15', N'36.4', N'70', N'5.5', N'Cần theo dõi thêm', N'NV314', N'G211.1', N'TD-PKB71-G211.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB74', CAST(N'2024-04-14T07:43:05.000' AS DateTime), N'60', N'125', N'20', N'36.7', N'84', N'5.9', N'Cần theo dõi thêm', N'NV254', N'G189.1', N'TD-PKB74-G189.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB78', CAST(N'2024-05-03T15:46:34.000' AS DateTime), N'58', N'116', N'16', N'37.1', N'79', N'6.2', N'Cần theo dõi thêm', N'NV183', N'G313.1', N'TD-PKB78-G313.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB87', CAST(N'2024-04-14T15:55:12.000' AS DateTime), N'65', N'120', N'17', N'36.9', N'82', N'5.8', N'Cần theo dõi thêm', N'NV183', N'G314.1', N'TD-PKB87-G314.1.1')
INSERT [dbo].[TheoDoiDieuTri] ([MaPhieuKB], [NgayTheoDoi], [ChiSoCanNang], [ChiSoHuyetAp], [ChiSoNhipTho], [NhietDo], [MachDap], [DuongHuyet], [YLenh], [MaNV], [MaGiuong], [MaTheoDoi]) VALUES (N'PKB91', CAST(N'2024-04-14T16:00:00.000' AS DateTime), N'49', N'120', N'22', N'36.7', N'80', N'6.0', N'Cần theo dõi thêm', N'NV213', N'G326.1', N'TD-PKB91-G326.1.1')
GO
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'AMO-MY-CTCDHG-T125', N'Amoxicillin', N'Mỹ', N'Công ty CP Dược Hậu Giang', N'Hoạt Động', N'Tiêm', N'Hộp', N'Chai', 1, NULL, N'125 mg/5 mL', 80000000, CAST(N'2024-11-13' AS Date), CAST(N'2026-11-13' AS Date), N'LO-20241113-AMO-MY-CTCDHG-T125', 100, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'AMO-MY-CTCP-V500', N'Amoxicillin', N'Mỹ', N'Công ty CP Pymepharco', N'Hoạt Động', N'Viên nén', N'Hộp', N'Vỉ', 2, 10, N'500 mg', 1200000000, CAST(N'2024-10-29' AS Date), CAST(N'2027-10-29' AS Date), N'LO-20241029-AMO-MY-CTCP-V500', 750, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'AMO-MY-CTCT-B500', N'Amoxicillin', N'Mỹ', N'Công ty CP Traphaco', N'Hoạt Động', N'Bột', N'Hộp', N'Gói', 5, NULL, N'500 mg', 2800000000, CAST(N'2024-10-13' AS Date), CAST(N'2026-10-13' AS Date), N'LO-20241013-AMO-MY-CTCT-B500', 700, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', N'Amoxicillin', N'Việt Nam', N'Công ty CP Dược - Trang thiết bị y tế Bình Định', N'Hoạt Động', N'Viên nén', N'Hộp', N'Vỉ', 2, 10, N'250 mg', 4000000000, CAST(N'2024-11-06' AS Date), CAST(N'2027-11-06' AS Date), N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250', 2500, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'ATO-HQ-CTCDHG-B400', N'Atorvastatin', N'Hàn Quốc', N'Công ty CP Dược Hậu Giang', N'Hoạt Động', N'Bột', N'Hộp', N'Gói', 5, NULL, N'400 mg', 960000000, CAST(N'2024-11-10' AS Date), CAST(N'2026-11-10' AS Date), N'LO-20241110-ATO-HQ-CTCDHG-B400', 200, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'ATO-HQ-CTCT-T150', N'Atorvastatin', N'Hàn Quốc', N'Công ty CP Traphaco', N'Hoạt Động', N'Tiêm', N'Hộp', N'Chai', 2, NULL, N'150 mg/5 mL', 1152000000, CAST(N'2024-11-13' AS Date), CAST(N'2026-11-13' AS Date), N'LO-20241113-ATO-HQ-CTCT-T150', 600, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'ATO-TS-CTCDPHT-V10', N'Atorvastatin', N'Thụy Sĩ', N'Công ty CP Dược phẩm Hà Tây', N'Hoạt Động', N'Viên nén', N'Hộp', N'Lọ', 1, 30, N'10 mg', 100000000, CAST(N'2024-11-02' AS Date), CAST(N'2027-11-02' AS Date), N'LO-20241102-ATO-TS-CTCDPHT-V10', 250, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'ATO-VN-CTCDHG-V40', N'Atorvastatin', N'Việt Nam', N'Công ty CP Dược Hậu Giang', N'Hoạt Động', N'Viên nén', N'Hộp', N'Vỉ', 3, 14, N'40 mg', 96000000, CAST(N'2024-11-05' AS Date), CAST(N'2027-11-05' AS Date), N'LO-20241105-ATO-VN-CTCDHG-V40', 80, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'IBU-ANH-CTCDPI-T140', N'Ibuprofen', N'Anh', N'Công ty CP Dược phẩm Imexpharm', N'Hoạt Động', N'Tiêm', N'Hộp', N'Chai', 1, NULL, N'140 mg/5 mL', 88000000, CAST(N'2023-09-12' AS Date), CAST(N'2024-09-12' AS Date), N'LO-20240912-IBU-ANH-CTCDPI-T140', 100, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'IBU-ANH-CTTS-B400', N'Ibuprofen', N'Anh', N'Công ty TNHH Sanofi Aventis Việt Nam', N'Hoạt Động', N'Bột', N'Hộp', N'Gói', 5, NULL, N'400 mg', 1760000000, CAST(N'2024-10-12' AS Date), CAST(N'2026-10-12' AS Date), N'LO-20241012-IBU-ANH-CTTS-B400', 400, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'IBU-NB-CTCXNKYTD-V600', N'Ibuprofen', N'Nhật Bản', N'Công ty CP xuất nhập khẩu y tế Domesco', N'Hoạt Động', N'Viên nén', N'Hộp', N'Vỉ', 4, 10, N'600 mg', 2800000000, CAST(N'2024-11-02' AS Date), CAST(N'2026-10-02' AS Date), N'LO-20241102-IBU-NB-CTCXNKYTD-V600', 700, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'IBU-UC-CTCP-V400', N'Ibuprofen', N'Úc', N'Công ty CP Pymepharco', N'Hoạt Động', N'Viên nén', N'Hộp', N'Chai', 1, 100, N'400 mg', 90000000, CAST(N'2024-10-30' AS Date), CAST(N'2026-10-30' AS Date), N'LO-20241030-IBU-UC-CTCP-V400', 90, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'LIS-ANH-CTCDPO-V5', N'Lisinopril', N'Anh', N'Công ty CP Dược phẩm OPC', N'Hoạt Động', N'Viên nén', N'Hộp', N'Chai', 1, 35, N'5 mg', 100000000, CAST(N'2024-11-10' AS Date), CAST(N'2027-11-10' AS Date), N'LO-20241110-LIS-ANH-CTCDPO-V5', 200, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'LIS-ANH-CTCDPT-V40', N'Lisinopril', N'Anh', N'Công ty CP Dược phẩm TV.Pharm', N'Hoạt Động', N'Viên nén', N'Hộp', N'Vỉ', 2, 14, N'40 mg', 126000000, CAST(N'2024-10-23' AS Date), CAST(N'2026-10-23' AS Date), N'LO-20241023-LIS-ANH-CTCDPT-V40', 150, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'LIS-PHAP-CTCDPT-T130', N'Lisinopril', N'Pháp', N'Công ty CP Dược phẩm TV.Pharm', N'Hoạt Động', N'Tiêm', N'Hộp', N'Chai', 1, NULL, N'130 mg/5 mL', 58500000, CAST(N'2024-11-04' AS Date), CAST(N'2027-11-04' AS Date), N'LO-20241104-LIS-PHAP-CTCDPT-T130', 90, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'LIS-PHAP-CTCXNKYTD-B500', N'Lisinopril', N'Pháp', N'Công ty CP xuất nhập khẩu y tế Domesco', N'Hoạt Động', N'Bột', N'Hộp', N'Gói', 10, NULL, N'500 mg', 520000000, CAST(N'2024-11-02' AS Date), CAST(N'2027-11-02' AS Date), N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500', 80, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'LOS-DL-CTCT-V25', N'Losartan', N'Đài Loan', N'Công ty CP Traphaco', N'Hoạt Động', N'Viên nén', N'Hộp', N'Vỉ', 4, 10, N'25 mg', 1080000000, CAST(N'2024-10-09' AS Date), CAST(N'2026-10-09' AS Date), N'LO-20241009-LOS-DL-CTCT-V25', 300, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'LOS-HK-CTCT-V80', N'Losartan', N'Hồng Kông', N'Công ty CP Traphaco', N'Hoạt Động', N'Viên nén', N'Hộp', N'Vỉ', 3, 14, N'80 mg', 243000000, CAST(N'2024-11-13' AS Date), CAST(N'2026-11-13' AS Date), N'LO-20241113-LOS-HK-CTCT-V80', 90, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', N'Losartan', N'Úc', N'Công ty CP Dược Trang thiết bị y tế BÌnh Định', N'Hoạt Động', N'Tiêm', N'Hộp', N'Chai', 2, NULL, N'140 mg/5 mL', 204000000, CAST(N'2024-10-01' AS Date), CAST(N'2026-10-01' AS Date), N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140', 600, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'LOS-UC-CTTSAVN-B400', N'Losartan', N'Úc', N'Công ty TNHH Sanofi Aventis Việt Nam', N'Hoạt Động', N'Bột', N'Hộp', N'Gói', 5, NULL, N'400 mg', 595000000, CAST(N'2024-11-06' AS Date), CAST(N'2026-11-06' AS Date), N'LO-20241106-LOS-UC-CTTSAVN-B400', 700, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'MET-NB-CTCDPHT-T150', N'Metformin', N'Nhật Bản', N'Công ty CP Dược phẩm Hà Tây', N'Hoạt Động', N'Tiêm', N'Hộp', N'Chai', 2, NULL, N'150 mg/5 mL', 48000000, CAST(N'2024-11-08' AS Date), CAST(N'2029-11-08' AS Date), N'LO-20241108-MET-NB-CTCDPHT-T150', 100, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'MET-NB-CTCDPO-B350', N'Metformin', N'Nhật Bản', N'Công ty CP Dược phẩm OPC', N'Hoạt Động', N'Bột', N'Hộp', N'Gói', 8, NULL, N'350 mg', 153600000, CAST(N'2024-10-09' AS Date), CAST(N'2029-10-09' AS Date), N'LO-20241009-MET-NB-CTCDPO-B350', 80, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'MET-TD-CTCDPHT-V500', N'Metformin', N'Thụy Điển', N'Công ty CP Dược phẩm Hà Tây', N'Hoạt Động', N'Viên nén', N'Hộp', N'Lọ', 1, 30, N'500 mg', 20000000, CAST(N'2024-11-01' AS Date), CAST(N'2026-11-01' AS Date), N'LO-20241101-MET-TD-CTCDPHT-V500', 100, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'MET-TL-CTCDPO-V850', N'Metformin', N'Thái Lan', N'Công ty CP Dược phẩm OPC', N'Hoạt Động', N'Viên nén', N'Hộp', N'Vỉ', 6, 15, N'850 mg', 360000000, CAST(N'2024-10-26' AS Date), CAST(N'2026-10-26' AS Date), N'LO-20241026-MET-TL-CTCDPO-V850', 300, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'OME-DL-CTCXNKYTD-V20', N'Omeprazole', N'Đài Loan', N'Công ty CP xuất nhập khẩu y tế Domesco', N'Hoạt Động', N'Viên nén', N'Hộp', N'Chai', 1, 30, N'20 mg', 60000000, CAST(N'2024-11-04' AS Date), CAST(N'2026-11-04' AS Date), N'LO-04112024-OME-DL-CTCXNKYTD-V20', 300, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', N'Omeprazole', N'Đức', N'Công ty CP Dược Trang thiết bị y tế Bình Định', N'Hoạt Động', N'Bột', N'Hộp', N'Gói', 5, NULL, N'400 mg', 400000000, CAST(N'2024-10-09' AS Date), CAST(N'2026-10-09' AS Date), N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400', 400, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'OME-DUC-CTCP-T140', N'Omeprazole', N'Đức', N'Công ty CP Pymepharco', N'Hoạt Động', N'Tiêm', N'Hộp', N'Chai', 1, NULL, N'140 mg/5 mL', 20000000, CAST(N'2024-11-01' AS Date), CAST(N'2026-11-01' AS Date), N'LO-20241101-OME-DUC-CTCP-T140', 100, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'OME-PHAP-CTCDPT-V20', N'Omeprazole', N'Pháp', N'Công ty CP Dược phẩm TV.Pharm', N'Hoạt Động', N'Viên nén', N'Hộp', N'Vỉ', 3, 14, N'20 mg', 360000000, CAST(N'2024-10-17' AS Date), CAST(N'2026-10-17' AS Date), N'LO-20241017-OME-PHAP-CTCDPT-V20', 600, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'SIM-ANH-CTCDHG-V80', N'Simvastatin', N'Anh', N'Công ty CP Dược Hậu Giang', N'Hoạt Động', N'Viên nén', N'Hộp', N'Vỉ', 2, 12, N'80 mg', 132000000, CAST(N'2024-11-08' AS Date), CAST(N'2027-11-08' AS Date), N'LO-20241108-SIM-ANH-CTCDHG-V80', 60, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'SIM-CANADA-CTCDPI-T150', N'Simvastatin', N'Canada', N'Công ty CP Dược phẩm Imexpharm', N'Hoạt Động', N'Tiêm', N'Hộp', N'Chai', 1, NULL, N'150 mg/5 mL', 165000000, CAST(N'2024-11-12' AS Date), CAST(N'2027-11-12' AS Date), N'LO-20241112-SIM-CANADA-CTCDPI-T150', 550, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'SIM-CANADA-CTCT-B300', N'Simvastatin', N'Canada', N'Công ty CP Traphaco', N'Hoạt Động', N'Bột', N'Hộp', N'Gói', 10, NULL, N'300 mg', 255000000, CAST(N'2024-11-12' AS Date), CAST(N'2027-11-12' AS Date), N'LO-20241112-SIM-CANADA-CTCT-B300', 85, 10)
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [XuatXu], [NhaCungCap], [TrangThai], [LoaiThuoc], [DonViTinh], [QuyCachDongGoi], [SoLuongDVT], [SoLuongQCDG], [HamLuong], [Gia], [NgaySanXuat], [HSD], [MaLo], [SoLuongNhap], [SoLuongHop]) VALUES (N'SIM-DUC-CTCT-V40', N'Simvastatin', N'Đức', N'Công ty CP Traphaco', N'Hoạt Động', N'Viên nén', N'Hộp', N'Vỉ', 3, 14, N'40 mg', 264000000, CAST(N'2024-10-28' AS Date), CAST(N'2027-10-28' AS Date), N'LO-20241028-SIM-DUC-CTCT-V40', 80, 10)
GO
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCDHG-T125', 10, N'K1', 80000, N'LO-20241113-AMO-MY-CTCDHG-T125')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCDHG-T125', 10, N'K10', 80000, N'LO-20241113-AMO-MY-CTCDHG-T125')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCDHG-T125', 10, N'K2', 80000, N'LO-20241113-AMO-MY-CTCDHG-T125')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCDHG-T125', 10, N'K3', 80000, N'LO-20241113-AMO-MY-CTCDHG-T125')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCDHG-T125', 10, N'K4', 80000, N'LO-20241113-AMO-MY-CTCDHG-T125')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCDHG-T125', 10, N'K5', 80000, N'LO-20241113-AMO-MY-CTCDHG-T125')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCDHG-T125', 10, N'K6', 80000, N'LO-20241113-AMO-MY-CTCDHG-T125')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCDHG-T125', 10, N'K7', 80000, N'LO-20241113-AMO-MY-CTCDHG-T125')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCDHG-T125', 10, N'K8', 80000, N'LO-20241113-AMO-MY-CTCDHG-T125')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCDHG-T125', 10, N'K9', 80000, N'LO-20241113-AMO-MY-CTCDHG-T125')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 20, N'K1', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 10, N'K10', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 10, N'K11', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 25, N'K12', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 15, N'K13', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 10, N'K14', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 10, N'K16', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 10, N'K17', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 30, N'K2', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 15, N'K3', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 10, N'K4', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 10, N'K5', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 10, N'K6', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 15, N'K7', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 10, N'K8', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCP-V500', 20, N'K9', 80000, N'LO-20241029-AMO-MY-CTCP-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCT-B500', 10, N'K1', 80000, N'LO-20241013-AMO-MY-CTCT-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCT-B500', 10, N'K10', 80000, N'LO-20241013-AMO-MY-CTCT-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCT-B500', 10, N'K2', 80000, N'LO-20241013-AMO-MY-CTCT-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCT-B500', 10, N'K3', 80000, N'LO-20241013-AMO-MY-CTCT-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCT-B500', 10, N'K4', 80000, N'LO-20241013-AMO-MY-CTCT-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCT-B500', 10, N'K5', 80000, N'LO-20241013-AMO-MY-CTCT-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCT-B500', 10, N'K6', 80000, N'LO-20241013-AMO-MY-CTCT-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCT-B500', 10, N'K7', 80000, N'LO-20241013-AMO-MY-CTCT-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCT-B500', 10, N'K8', 80000, N'LO-20241013-AMO-MY-CTCT-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-MY-CTCT-B500', 10, N'K9', 80000, N'LO-20241013-AMO-MY-CTCT-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 20, N'K1', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 10, N'K10', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 10, N'K11', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 25, N'K12', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 15, N'K13', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 10, N'K14', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 10, N'K16', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 10, N'K17', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 30, N'K2', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 15, N'K3', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 10, N'K4', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 10, N'K5', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 10, N'K6', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 15, N'K7', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 10, N'K8', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'AMO-VN-CTCDTTBYTBD-V250', 20, N'K9', 80000, N'LO-20241106-AMO-VN-CTCDTTBYTBD-V250')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 10, N'K1', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 10, N'K10', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 10, N'K11', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 20, N'K12', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 15, N'K13', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 10, N'K14', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 10, N'K16', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 10, N'K17', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 10, N'K2', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 10, N'K3', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 10, N'K4', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 10, N'K5', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 10, N'K6', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 10, N'K7', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 10, N'K8', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCDHG-B400', 10, N'K9', 96000, N'LO-20241110-ATO-HQ-CTCDHG-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 10, N'K1', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 10, N'K10', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 10, N'K11', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 20, N'K12', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 15, N'K13', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 10, N'K14', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 10, N'K16', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 10, N'K17', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 10, N'K2', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 10, N'K3', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 10, N'K4', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 10, N'K5', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 10, N'K6', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 10, N'K7', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 10, N'K8', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-HQ-CTCT-T150', 10, N'K9', 96000, N'LO-20241113-ATO-HQ-CTCT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K1', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K10', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K12', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K13', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K14', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K16', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K17', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K2', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K3', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K4', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K5', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K6', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K7', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K8', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-TS-CTCDPHT-V10', 10, N'K9', 40000, N'LO-20241102-ATO-TS-CTCDPHT-V10')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-VN-CTCDHG-V40', 10, N'K1', 40000, N'LO-20241105-ATO-VN-CTCDHG-V40')
GO
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-VN-CTCDHG-V40', 10, N'K10', 40000, N'LO-20241105-ATO-VN-CTCDHG-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-VN-CTCDHG-V40', 10, N'K2', 40000, N'LO-20241105-ATO-VN-CTCDHG-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-VN-CTCDHG-V40', 10, N'K3', 40000, N'LO-20241105-ATO-VN-CTCDHG-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-VN-CTCDHG-V40', 10, N'K4', 40000, N'LO-20241105-ATO-VN-CTCDHG-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-VN-CTCDHG-V40', 10, N'K5', 40000, N'LO-20241105-ATO-VN-CTCDHG-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-VN-CTCDHG-V40', 10, N'K6', 40000, N'LO-20241105-ATO-VN-CTCDHG-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'ATO-VN-CTCDHG-V40', 10, N'K7', 40000, N'LO-20241105-ATO-VN-CTCDHG-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTCDPI-T140', 20, N'K1', 88000, N'LO-20240912-IBU-ANH-CTCDPI-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTCDPI-T140', 10, N'K10', 88000, N'LO-20240912-IBU-ANH-CTCDPI-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTCDPI-T140', 10, N'K2', 88000, N'LO-20240912-IBU-ANH-CTCDPI-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTCDPI-T140', 10, N'K3', 88000, N'LO-20240912-IBU-ANH-CTCDPI-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTCDPI-T140', 10, N'K4', 88000, N'LO-20240912-IBU-ANH-CTCDPI-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTCDPI-T140', 10, N'K5', 88000, N'LO-20240912-IBU-ANH-CTCDPI-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTCDPI-T140', 10, N'K6', 88000, N'LO-20240912-IBU-ANH-CTCDPI-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTCDPI-T140', 10, N'K7', 88000, N'LO-20240912-IBU-ANH-CTCDPI-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTCDPI-T140', 10, N'K8', 88000, N'LO-20240912-IBU-ANH-CTCDPI-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTCDPI-T140', 10, N'K9', 88000, N'LO-20240912-IBU-ANH-CTCDPI-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 20, N'K1', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 10, N'K10', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 10, N'K11', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 20, N'K12', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 15, N'K13', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 10, N'K14', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 10, N'K16', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 10, N'K17', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 15, N'K2', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 10, N'K3', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 10, N'K4', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 15, N'K5', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 10, N'K6', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 10, N'K7', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 30, N'K8', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-ANH-CTTS-B400', 10, N'K9', 88000, N'LO-20241012-IBU-ANH-CTTS-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K1', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K10', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K12', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K13', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K14', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K16', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K17', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K2', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K3', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K4', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K5', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K6', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K7', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K8', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-NB-CTCXNKYTD-V600', 10, N'K9', 100000, N'LO-20241102-IBU-NB-CTCXNKYTD-V600')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-UC-CTCP-V400', 10, N'K1', 100000, N'LO-20241030-IBU-UC-CTCP-V400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-UC-CTCP-V400', 10, N'K10', 100000, N'LO-20241030-IBU-UC-CTCP-V400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-UC-CTCP-V400', 10, N'K2', 100000, N'LO-20241030-IBU-UC-CTCP-V400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-UC-CTCP-V400', 10, N'K4', 100000, N'LO-20241030-IBU-UC-CTCP-V400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-UC-CTCP-V400', 10, N'K5', 100000, N'LO-20241030-IBU-UC-CTCP-V400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-UC-CTCP-V400', 10, N'K6', 100000, N'LO-20241030-IBU-UC-CTCP-V400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-UC-CTCP-V400', 10, N'K7', 100000, N'LO-20241030-IBU-UC-CTCP-V400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-UC-CTCP-V400', 10, N'K8', 100000, N'LO-20241030-IBU-UC-CTCP-V400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'IBU-UC-CTCP-V400', 10, N'K9', 100000, N'LO-20241030-IBU-UC-CTCP-V400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K1', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K10', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K12', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K13', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K14', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K16', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K17', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K2', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K3', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K4', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K5', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K6', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K7', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K8', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPO-V5', 10, N'K9', 42000, N'LO-20241110-LIS-ANH-CTCDPO-V5')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPT-V40', 10, N'K1', 42000, N'LO-20241023-LIS-ANH-CTCDPT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPT-V40', 10, N'K10', 42000, N'LO-20241023-LIS-ANH-CTCDPT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPT-V40', 10, N'K12', 42000, N'LO-20241023-LIS-ANH-CTCDPT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPT-V40', 10, N'K13', 42000, N'LO-20241023-LIS-ANH-CTCDPT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPT-V40', 10, N'K14', 42000, N'LO-20241023-LIS-ANH-CTCDPT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPT-V40', 10, N'K2', 42000, N'LO-20241023-LIS-ANH-CTCDPT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPT-V40', 10, N'K3', 42000, N'LO-20241023-LIS-ANH-CTCDPT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPT-V40', 10, N'K4', 42000, N'LO-20241023-LIS-ANH-CTCDPT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPT-V40', 10, N'K5', 42000, N'LO-20241023-LIS-ANH-CTCDPT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPT-V40', 10, N'K6', 42000, N'LO-20241023-LIS-ANH-CTCDPT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPT-V40', 10, N'K7', 42000, N'LO-20241023-LIS-ANH-CTCDPT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPT-V40', 10, N'K8', 42000, N'LO-20241023-LIS-ANH-CTCDPT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-ANH-CTCDPT-V40', 10, N'K9', 42000, N'LO-20241023-LIS-ANH-CTCDPT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCDPT-T130', 10, N'K1', 65000, N'LO-20241104-LIS-PHAP-CTCDPT-T130')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCDPT-T130', 10, N'K10', 65000, N'LO-20241104-LIS-PHAP-CTCDPT-T130')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCDPT-T130', 10, N'K2', 65000, N'LO-20241104-LIS-PHAP-CTCDPT-T130')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCDPT-T130', 10, N'K4', 65000, N'LO-20241104-LIS-PHAP-CTCDPT-T130')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCDPT-T130', 10, N'K5', 65000, N'LO-20241104-LIS-PHAP-CTCDPT-T130')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCDPT-T130', 10, N'K6', 65000, N'LO-20241104-LIS-PHAP-CTCDPT-T130')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCDPT-T130', 10, N'K7', 65000, N'LO-20241104-LIS-PHAP-CTCDPT-T130')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCDPT-T130', 10, N'K8', 65000, N'LO-20241104-LIS-PHAP-CTCDPT-T130')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCDPT-T130', 10, N'K9', 65000, N'LO-20241104-LIS-PHAP-CTCDPT-T130')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCXNKYTD-B500', 10, N'K1', 65000, N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCXNKYTD-B500', 10, N'K10', 65000, N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCXNKYTD-B500', 10, N'K2', 65000, N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCXNKYTD-B500', 10, N'K4', 65000, N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCXNKYTD-B500', 10, N'K5', 65000, N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCXNKYTD-B500', 10, N'K6', 65000, N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500')
GO
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCXNKYTD-B500', 10, N'K7', 65000, N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LIS-PHAP-CTCXNKYTD-B500', 10, N'K8', 65000, N'LO-20241102-LIS-PHAP-CTCXNKYTD-B500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K1', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K10', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K12', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K13', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K14', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K16', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K17', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K2', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K3', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K4', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K5', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K6', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K7', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K8', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-DL-CTCT-V25', 10, N'K9', 90000, N'LO-20241009-LOS-DL-CTCT-V25')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-HK-CTCT-V80', 10, N'K1', 90000, N'LO-20241113-LOS-HK-CTCT-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-HK-CTCT-V80', 10, N'K10', 90000, N'LO-20241113-LOS-HK-CTCT-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-HK-CTCT-V80', 10, N'K2', 90000, N'LO-20241113-LOS-HK-CTCT-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-HK-CTCT-V80', 10, N'K3', 90000, N'LO-20241113-LOS-HK-CTCT-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-HK-CTCT-V80', 10, N'K4', 90000, N'LO-20241113-LOS-HK-CTCT-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-HK-CTCT-V80', 10, N'K5', 90000, N'LO-20241113-LOS-HK-CTCT-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-HK-CTCT-V80', 10, N'K6', 90000, N'LO-20241113-LOS-HK-CTCT-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-HK-CTCT-V80', 10, N'K7', 90000, N'LO-20241113-LOS-HK-CTCT-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-HK-CTCT-V80', 10, N'K8', 90000, N'LO-20241113-LOS-HK-CTCT-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 20, N'K1', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 10, N'K10', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 10, N'K11', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 25, N'K12', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 15, N'K13', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 10, N'K14', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 10, N'K16', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 10, N'K17', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 30, N'K2', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 15, N'K3', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 10, N'K4', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 10, N'K5', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 10, N'K6', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 15, N'K7', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 10, N'K8', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTCDTTBYTBD-T140', 20, N'K9', 17000, N'LO-20241001-LOS-UC-CTCDTTBYTBD-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 20, N'K1', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 10, N'K10', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 10, N'K11', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 25, N'K12', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 15, N'K13', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 10, N'K14', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 10, N'K16', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 10, N'K17', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 30, N'K2', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 15, N'K3', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 10, N'K4', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 10, N'K5', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 10, N'K6', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 15, N'K7', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 10, N'K8', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'LOS-UC-CTTSAVN-B400', 20, N'K9', 17000, N'LO-20241106-LOS-UC-CTTSAVN-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPHT-T150', 10, N'K1', 24000, N'LO-20241108-MET-NB-CTCDPHT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPHT-T150', 10, N'K10', 24000, N'LO-20241108-MET-NB-CTCDPHT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPHT-T150', 10, N'K2', 24000, N'LO-20241108-MET-NB-CTCDPHT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPHT-T150', 10, N'K4', 24000, N'LO-20241108-MET-NB-CTCDPHT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPHT-T150', 10, N'K5', 24000, N'LO-20241108-MET-NB-CTCDPHT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPHT-T150', 10, N'K6', 24000, N'LO-20241108-MET-NB-CTCDPHT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPHT-T150', 10, N'K7', 24000, N'LO-20241108-MET-NB-CTCDPHT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPHT-T150', 10, N'K8', 24000, N'LO-20241108-MET-NB-CTCDPHT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPHT-T150', 10, N'K9', 24000, N'LO-20241108-MET-NB-CTCDPHT-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPO-B350', 10, N'K1', 24000, N'LO-20241009-MET-NB-CTCDPO-B350')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPO-B350', 10, N'K10', 24000, N'LO-20241009-MET-NB-CTCDPO-B350')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPO-B350', 10, N'K2', 24000, N'LO-20241009-MET-NB-CTCDPO-B350')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPO-B350', 10, N'K4', 24000, N'LO-20241009-MET-NB-CTCDPO-B350')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPO-B350', 10, N'K5', 24000, N'LO-20241009-MET-NB-CTCDPO-B350')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPO-B350', 10, N'K6', 24000, N'LO-20241009-MET-NB-CTCDPO-B350')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPO-B350', 10, N'K7', 24000, N'LO-20241009-MET-NB-CTCDPO-B350')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-NB-CTCDPO-B350', 10, N'K8', 24000, N'LO-20241009-MET-NB-CTCDPO-B350')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TD-CTCDPHT-V500', 10, N'K1', 30000, N'LO-20241101-MET-TD-CTCDPHT-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TD-CTCDPHT-V500', 10, N'K10', 30000, N'LO-20241101-MET-TD-CTCDPHT-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TD-CTCDPHT-V500', 10, N'K2', 30000, N'LO-20241101-MET-TD-CTCDPHT-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TD-CTCDPHT-V500', 10, N'K3', 30000, N'LO-20241101-MET-TD-CTCDPHT-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TD-CTCDPHT-V500', 10, N'K4', 30000, N'LO-20241101-MET-TD-CTCDPHT-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TD-CTCDPHT-V500', 10, N'K5', 30000, N'LO-20241101-MET-TD-CTCDPHT-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TD-CTCDPHT-V500', 10, N'K6', 30000, N'LO-20241101-MET-TD-CTCDPHT-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TD-CTCDPHT-V500', 10, N'K7', 30000, N'LO-20241101-MET-TD-CTCDPHT-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TD-CTCDPHT-V500', 10, N'K8', 30000, N'LO-20241101-MET-TD-CTCDPHT-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TD-CTCDPHT-V500', 10, N'K9', 30000, N'LO-20241101-MET-TD-CTCDPHT-V500')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K1', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K10', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K12', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K13', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K14', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K16', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K17', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K2', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K3', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K4', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K5', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K6', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K7', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K8', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'MET-TL-CTCDPO-V850', 10, N'K9', 30000, N'LO-20241026-MET-TL-CTCDPO-V850')
GO
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K1', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K10', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K12', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K13', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K14', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K16', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K17', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K2', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K3', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K4', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K5', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K6', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K7', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K8', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DL-CTCXNKYTD-V20', 10, N'K9', 20000, N'LO-04112024-OME-DL-CTCXNKYTD-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 20, N'K1', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 25, N'K10', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 15, N'K11', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 10, N'K12', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 12, N'K13', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 10, N'K14', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 10, N'K16', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 10, N'K17', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 15, N'K2', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 30, N'K3', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 10, N'K4', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 15, N'K5', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 10, N'K6', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 10, N'K7', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 30, N'K8', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCDTTBYTBD-B400', 20, N'K9', 20000, N'LO-20241009-OME-DUC-CTCDTTBYTBD-B400')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCP-T140', 20, N'K1', 20000, N'LO-20241101-OME-DUC-CTCP-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCP-T140', 10, N'K10', 20000, N'LO-20241101-OME-DUC-CTCP-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCP-T140', 10, N'K2', 20000, N'LO-20241101-OME-DUC-CTCP-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCP-T140', 10, N'K3', 20000, N'LO-20241101-OME-DUC-CTCP-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCP-T140', 10, N'K4', 20000, N'LO-20241101-OME-DUC-CTCP-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCP-T140', 10, N'K5', 20000, N'LO-20241101-OME-DUC-CTCP-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCP-T140', 10, N'K6', 20000, N'LO-20241101-OME-DUC-CTCP-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCP-T140', 10, N'K7', 20000, N'LO-20241101-OME-DUC-CTCP-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCP-T140', 10, N'K8', 20000, N'LO-20241101-OME-DUC-CTCP-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-DUC-CTCP-T140', 10, N'K9', 20000, N'LO-20241101-OME-DUC-CTCP-T140')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K1', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K10', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K12', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K13', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K14', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K16', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K17', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K2', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K3', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K4', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K5', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K6', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K7', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K8', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'OME-PHAP-CTCDPT-V20', 10, N'K9', 20000, N'LO-20241017-OME-PHAP-CTCDPT-V20')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-ANH-CTCDHG-V80', 10, N'K1', 110000, N'LO-20241108-SIM-ANH-CTCDHG-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-ANH-CTCDHG-V80', 10, N'K10', 110000, N'LO-20241108-SIM-ANH-CTCDHG-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-ANH-CTCDHG-V80', 10, N'K2', 110000, N'LO-20241108-SIM-ANH-CTCDHG-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-ANH-CTCDHG-V80', 10, N'K3', 110000, N'LO-20241108-SIM-ANH-CTCDHG-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-ANH-CTCDHG-V80', 10, N'K4', 110000, N'LO-20241108-SIM-ANH-CTCDHG-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-ANH-CTCDHG-V80', 10, N'K5', 110000, N'LO-20241108-SIM-ANH-CTCDHG-V80')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 20, N'K1', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 10, N'K10', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 10, N'K11', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 25, N'K12', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 15, N'K13', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 10, N'K14', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 10, N'K16', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 10, N'K17', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 30, N'K2', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 15, N'K3', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 10, N'K4', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 10, N'K5', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 10, N'K6', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 15, N'K7', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 10, N'K8', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCDPI-T150', 20, N'K9', 30000, N'LO-20241112-SIM-CANADA-CTCDPI-T150')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCT-B300', 10, N'K1', 30000, N'LO-20241112-SIM-CANADA-CTCT-B300')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCT-B300', 10, N'K10', 30000, N'LO-20241112-SIM-CANADA-CTCT-B300')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCT-B300', 10, N'K2', 30000, N'LO-20241112-SIM-CANADA-CTCT-B300')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCT-B300', 10, N'K4', 30000, N'LO-20241112-SIM-CANADA-CTCT-B300')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCT-B300', 10, N'K5', 30000, N'LO-20241112-SIM-CANADA-CTCT-B300')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCT-B300', 10, N'K6', 30000, N'LO-20241112-SIM-CANADA-CTCT-B300')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCT-B300', 10, N'K7', 30000, N'LO-20241112-SIM-CANADA-CTCT-B300')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-CANADA-CTCT-B300', 10, N'K8', 30000, N'LO-20241112-SIM-CANADA-CTCT-B300')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-DUC-CTCT-V40', 10, N'K1', 110000, N'LO-20241028-SIM-DUC-CTCT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-DUC-CTCT-V40', 10, N'K10', 110000, N'LO-20241028-SIM-DUC-CTCT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-DUC-CTCT-V40', 10, N'K2', 110000, N'LO-20241028-SIM-DUC-CTCT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-DUC-CTCT-V40', 10, N'K3', 110000, N'LO-20241028-SIM-DUC-CTCT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-DUC-CTCT-V40', 10, N'K4', 110000, N'LO-20241028-SIM-DUC-CTCT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-DUC-CTCT-V40', 10, N'K5', 110000, N'LO-20241028-SIM-DUC-CTCT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-DUC-CTCT-V40', 10, N'K6', 110000, N'LO-20241028-SIM-DUC-CTCT-V40')
INSERT [dbo].[ThuocTheoKhoa] ([MaThuoc], [SoLuongThuocCuaKhoa], [MaKhoa], [Gia], [MaLo]) VALUES (N'SIM-DUC-CTCT-V40', 10, N'K7', 110000, N'LO-20241028-SIM-DUC-CTCT-V40')
GO
ALTER TABLE [dbo].[BHYT]  WITH CHECK ADD  CONSTRAINT [FK_BenhNhan_BHYT] FOREIGN KEY([MSBN])
REFERENCES [dbo].[BenhNhan] ([MSBN])
GO
ALTER TABLE [dbo].[BHYT] CHECK CONSTRAINT [FK_BenhNhan_BHYT]
GO
ALTER TABLE [dbo].[CaTruc]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_CaTruc] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[CaTruc] CHECK CONSTRAINT [FK_NhanVien_CaTruc]
GO
ALTER TABLE [dbo].[CaTruc]  WITH CHECK ADD  CONSTRAINT [FK_Phong_CaTruc] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MSPhong])
GO
ALTER TABLE [dbo].[CaTruc] CHECK CONSTRAINT [FK_Phong_CaTruc]
GO
ALTER TABLE [dbo].[ChiTietDonThuoc]  WITH CHECK ADD  CONSTRAINT [FK_DonThuoc_ChiTietDonThuoc] FOREIGN KEY([MaDonThuoc])
REFERENCES [dbo].[DonThuoc] ([MaDonThuoc])
GO
ALTER TABLE [dbo].[ChiTietDonThuoc] CHECK CONSTRAINT [FK_DonThuoc_ChiTietDonThuoc]
GO
ALTER TABLE [dbo].[ChiTietDonThuoc]  WITH CHECK ADD  CONSTRAINT [FK_KhoThuoc_ChiTietDonThuoc] FOREIGN KEY([MaThuoc], [MaLo])
REFERENCES [dbo].[KhoThuoc] ([MaThuoc], [MaLo])
GO
ALTER TABLE [dbo].[ChiTietDonThuoc] CHECK CONSTRAINT [FK_KhoThuoc_ChiTietDonThuoc]
GO
ALTER TABLE [dbo].[ChiTietDonThuoc]  WITH CHECK ADD  CONSTRAINT [FK_Thuoc_ChiTietDonThuoc] FOREIGN KEY([MaThuoc], [MaLo])
REFERENCES [dbo].[Thuoc] ([MaThuoc], [MaLo])
GO
ALTER TABLE [dbo].[ChiTietDonThuoc] CHECK CONSTRAINT [FK_Thuoc_ChiTietDonThuoc]
GO
ALTER TABLE [dbo].[ChuanDoan]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChuanDoan] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[ChuanDoan] CHECK CONSTRAINT [FK_NhanVien_ChuanDoan]
GO
ALTER TABLE [dbo].[ChuanDoan]  WITH CHECK ADD  CONSTRAINT [FK_PhieuKhamBenh_ChuanDoan] FOREIGN KEY([MaPhieuKB])
REFERENCES [dbo].[PhieuKhamBenh] ([MaPhieuKB])
GO
ALTER TABLE [dbo].[ChuanDoan] CHECK CONSTRAINT [FK_PhieuKhamBenh_ChuanDoan]
GO
ALTER TABLE [dbo].[ChuyenNganh]  WITH CHECK ADD  CONSTRAINT [FK_Khoa_ChuyenNganh] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[ChuyenNganh] CHECK CONSTRAINT [FK_Khoa_ChuyenNganh]
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD  CONSTRAINT [FK_Khoa_DichVu] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[DichVu] CHECK CONSTRAINT [FK_Khoa_DichVu]
GO
ALTER TABLE [dbo].[DonThuoc]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_DonThuoc] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[DonThuoc] CHECK CONSTRAINT [FK_NhanVien_DonThuoc]
GO
ALTER TABLE [dbo].[DonThuoc]  WITH CHECK ADD  CONSTRAINT [FK_PhieuKhamBenh_DonThuoc] FOREIGN KEY([MaPhieuKB])
REFERENCES [dbo].[PhieuKhamBenh] ([MaPhieuKB])
GO
ALTER TABLE [dbo].[DonThuoc] CHECK CONSTRAINT [FK_PhieuKhamBenh_DonThuoc]
GO
ALTER TABLE [dbo].[GiuongBenh]  WITH CHECK ADD  CONSTRAINT [FK_Phong_GiuongBenh] FOREIGN KEY([MSPhong])
REFERENCES [dbo].[Phong] ([MSPhong])
GO
ALTER TABLE [dbo].[GiuongBenh] CHECK CONSTRAINT [FK_Phong_GiuongBenh]
GO
ALTER TABLE [dbo].[KhamBenh]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_KhamBenh] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[KhamBenh] CHECK CONSTRAINT [FK_NhanVien_KhamBenh]
GO
ALTER TABLE [dbo].[KhamBenh]  WITH CHECK ADD  CONSTRAINT [FK_PhieuKhamBenh_KhamBenh] FOREIGN KEY([MaPhieuKB])
REFERENCES [dbo].[PhieuKhamBenh] ([MaPhieuKB])
GO
ALTER TABLE [dbo].[KhamBenh] CHECK CONSTRAINT [FK_PhieuKhamBenh_KhamBenh]
GO
ALTER TABLE [dbo].[KhamBenh]  WITH CHECK ADD  CONSTRAINT [FK_Phong_KhamBenh] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MSPhong])
GO
ALTER TABLE [dbo].[KhamBenh] CHECK CONSTRAINT [FK_Phong_KhamBenh]
GO
ALTER TABLE [dbo].[KhoThuoc]  WITH CHECK ADD  CONSTRAINT [FK_Thuoc_KhoThuoc] FOREIGN KEY([MaThuoc], [MaLo])
REFERENCES [dbo].[Thuoc] ([MaThuoc], [MaLo])
GO
ALTER TABLE [dbo].[KhoThuoc] CHECK CONSTRAINT [FK_Thuoc_KhoThuoc]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_ChucVu_NhanVien] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_ChucVu_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_ChuyenNganh_NhanVien] FOREIGN KEY([MaChuyenNganh])
REFERENCES [dbo].[ChuyenNganh] ([MaChuyenNganh])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_ChuyenNganh_NhanVien]
GO
ALTER TABLE [dbo].[PhanGiuong]  WITH CHECK ADD  CONSTRAINT [FK_GiuongBenh_PhanGiuong] FOREIGN KEY([MaGiuong])
REFERENCES [dbo].[GiuongBenh] ([MaGiuong])
GO
ALTER TABLE [dbo].[PhanGiuong] CHECK CONSTRAINT [FK_GiuongBenh_PhanGiuong]
GO
ALTER TABLE [dbo].[PhanGiuong]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhanGiuong] FOREIGN KEY([MaNVYeuCau])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhanGiuong] CHECK CONSTRAINT [FK_NhanVien_PhanGiuong]
GO
ALTER TABLE [dbo].[PhanGiuong]  WITH CHECK ADD  CONSTRAINT [FK_PhieuKhamBenh_PhanGiuong] FOREIGN KEY([MaPhieuKB])
REFERENCES [dbo].[PhieuKhamBenh] ([MaPhieuKB])
GO
ALTER TABLE [dbo].[PhanGiuong] CHECK CONSTRAINT [FK_PhieuKhamBenh_PhanGiuong]
GO
ALTER TABLE [dbo].[PhanGiuong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_PhanGiuong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MSPhong])
GO
ALTER TABLE [dbo].[PhanGiuong] CHECK CONSTRAINT [FK_Phong_PhanGiuong]
GO
ALTER TABLE [dbo].[PhieuKhamBenh]  WITH CHECK ADD  CONSTRAINT [FK_BenhNhan_PhieuKhamBenh] FOREIGN KEY([MaBN])
REFERENCES [dbo].[BenhNhan] ([MSBN])
GO
ALTER TABLE [dbo].[PhieuKhamBenh] CHECK CONSTRAINT [FK_BenhNhan_PhieuKhamBenh]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Khoa_Phong] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Khoa_Phong]
GO
ALTER TABLE [dbo].[SoBenhAn]  WITH CHECK ADD  CONSTRAINT [FK_BenhNhan_SoBenhAn] FOREIGN KEY([MaBN])
REFERENCES [dbo].[BenhNhan] ([MSBN])
GO
ALTER TABLE [dbo].[SoBenhAn] CHECK CONSTRAINT [FK_BenhNhan_SoBenhAn]
GO
ALTER TABLE [dbo].[SuDungDichVu]  WITH CHECK ADD  CONSTRAINT [FK_DichVu_SuDungDichVu] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DichVu] ([MaDV])
GO
ALTER TABLE [dbo].[SuDungDichVu] CHECK CONSTRAINT [FK_DichVu_SuDungDichVu]
GO
ALTER TABLE [dbo].[SuDungDichVu]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_SuDungDichVu_1] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[SuDungDichVu] CHECK CONSTRAINT [FK_NhanVien_SuDungDichVu_1]
GO
ALTER TABLE [dbo].[SuDungDichVu]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_SuDungDichVu_2] FOREIGN KEY([MaNVThucHien])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[SuDungDichVu] CHECK CONSTRAINT [FK_NhanVien_SuDungDichVu_2]
GO
ALTER TABLE [dbo].[SuDungDichVu]  WITH CHECK ADD  CONSTRAINT [FK_PhieuKhamBenh_SuDungDichVu] FOREIGN KEY([MaPhieuKB])
REFERENCES [dbo].[PhieuKhamBenh] ([MaPhieuKB])
GO
ALTER TABLE [dbo].[SuDungDichVu] CHECK CONSTRAINT [FK_PhieuKhamBenh_SuDungDichVu]
GO
ALTER TABLE [dbo].[SuDungDichVu]  WITH CHECK ADD  CONSTRAINT [FK_Phong_SuDungDichVu] FOREIGN KEY([MSPhong])
REFERENCES [dbo].[Phong] ([MSPhong])
GO
ALTER TABLE [dbo].[SuDungDichVu] CHECK CONSTRAINT [FK_Phong_SuDungDichVu]
GO
ALTER TABLE [dbo].[TaiKham]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TaiKham] FOREIGN KEY([MaNVPhuTrach])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[TaiKham] CHECK CONSTRAINT [FK_NhanVien_TaiKham]
GO
ALTER TABLE [dbo].[TaiKham]  WITH CHECK ADD  CONSTRAINT [FK_Phong_TaiKham] FOREIGN KEY([MSPhong])
REFERENCES [dbo].[Phong] ([MSPhong])
GO
ALTER TABLE [dbo].[TaiKham] CHECK CONSTRAINT [FK_Phong_TaiKham]
GO
ALTER TABLE [dbo].[TaiKham]  WITH CHECK ADD  CONSTRAINT [FK_SoBenhAn_TaiKham] FOREIGN KEY([MaSoBenhAn])
REFERENCES [dbo].[SoBenhAn] ([MaSoBenhAn])
GO
ALTER TABLE [dbo].[TaiKham] CHECK CONSTRAINT [FK_SoBenhAn_TaiKham]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TaiKhoan] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_NhanVien_TaiKhoan]
GO
ALTER TABLE [dbo].[TheoDoiDieuTri]  WITH CHECK ADD  CONSTRAINT [FK_GiuongBenh_TheoDoiDieuTri] FOREIGN KEY([MaGiuong])
REFERENCES [dbo].[GiuongBenh] ([MaGiuong])
GO
ALTER TABLE [dbo].[TheoDoiDieuTri] CHECK CONSTRAINT [FK_GiuongBenh_TheoDoiDieuTri]
GO
ALTER TABLE [dbo].[TheoDoiDieuTri]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TheoDoiDieuTri] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[TheoDoiDieuTri] CHECK CONSTRAINT [FK_NhanVien_TheoDoiDieuTri]
GO
ALTER TABLE [dbo].[TheoDoiDieuTri]  WITH CHECK ADD  CONSTRAINT [FK_PhieuKhamBenh_TheoDoiDieuTri] FOREIGN KEY([MaPhieuKB])
REFERENCES [dbo].[PhieuKhamBenh] ([MaPhieuKB])
GO
ALTER TABLE [dbo].[TheoDoiDieuTri] CHECK CONSTRAINT [FK_PhieuKhamBenh_TheoDoiDieuTri]
GO
ALTER TABLE [dbo].[ThuocTheoKhoa]  WITH CHECK ADD  CONSTRAINT [FK_Khoa_ThuocTheoKhoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[ThuocTheoKhoa] CHECK CONSTRAINT [FK_Khoa_ThuocTheoKhoa]
GO
ALTER TABLE [dbo].[ThuocTheoKhoa]  WITH CHECK ADD  CONSTRAINT [FK_ThuocTheoKhoa_Thuoc] FOREIGN KEY([MaThuoc], [MaLo])
REFERENCES [dbo].[Thuoc] ([MaThuoc], [MaLo])
GO
ALTER TABLE [dbo].[ThuocTheoKhoa] CHECK CONSTRAINT [FK_ThuocTheoKhoa_Thuoc]
GO
/****** Object:  StoredProcedure [dbo].[ChiTietDSSDVTheoKhoangTG]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietDSSDVTheoKhoangTG]
@TuNgay DATE, @DenNgay DATE
AS
BEGIN
    -- Kết hợp bảng SuDungDichVu với DichVu, tính toán số lần sử dụng và tổng giá
    SELECT 
        dv.TenDV,                  -- Tên dịch vụ
        COUNT(sd.MaDV) AS SoLanSuDung, -- Số lần sử dụng dịch vụ
        dv.Gia,                   -- Giá mỗi lần sử dụng
        COUNT(sd.MaDV) * dv.Gia AS TongGia -- Tổng tiền
    FROM SuDungDichVu sd
    INNER JOIN DichVu dv ON sd.MaDV = dv.MaDV -- Join bảng
	WHERE CAST(sd.NgayThucHien AS DATE) BETWEEN @TuNgay AND @DenNgay
    GROUP BY dv.TenDV, dv.Gia -- Nhóm theo tên và giá dịch vụ
    ORDER BY dv.TenDV
END
GO
/****** Object:  StoredProcedure [dbo].[ChiTietDSSDVTheoNam]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietDSSDVTheoNam]
 @Nam int
AS
BEGIN
    -- Kết hợp bảng SuDungDichVu với DichVu, tính toán số lần sử dụng và tổng giá
    SELECT 
        dv.TenDV,                  -- Tên dịch vụ
        COUNT(sd.MaDV) AS SoLanSuDung, -- Số lần sử dụng dịch vụ
        dv.Gia,                   -- Giá mỗi lần sử dụng
        COUNT(sd.MaDV) * dv.Gia AS TongGia -- Tổng tiền
    FROM SuDungDichVu sd
    INNER JOIN DichVu dv ON sd.MaDV = dv.MaDV -- Join bảng
	WHERE Year(sd.NgayThucHien) = @Nam
    GROUP BY dv.TenDV, dv.Gia -- Nhóm theo tên và giá dịch vụ
    ORDER BY dv.TenDV
END
GO
/****** Object:  StoredProcedure [dbo].[ChiTietDSSDVTheoNgay]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietDSSDVTheoNgay]
@TuNgay DATE
AS
BEGIN
    -- Kết hợp bảng SuDungDichVu với DichVu, tính toán số lần sử dụng và tổng giá
    SELECT 
        dv.TenDV,                  -- Tên dịch vụ
        COUNT(sd.MaDV) AS SoLanSuDung, -- Số lần sử dụng dịch vụ
        dv.Gia,                   -- Giá mỗi lần sử dụng
        COUNT(sd.MaDV) * dv.Gia AS TongGia -- Tổng tiền
    FROM SuDungDichVu sd
    INNER JOIN DichVu dv ON sd.MaDV = dv.MaDV -- Join bảng
	WHERE CAST(sd.NgayThucHien AS DATE) = @TuNgay
    GROUP BY dv.TenDV, dv.Gia -- Nhóm theo tên và giá dịch vụ
    ORDER BY dv.TenDV
END
GO
/****** Object:  StoredProcedure [dbo].[ChiTietDSSDVTheoTenHoacPhieu]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ChiTietDSSDVTheoTenHoacPhieu]
    @MaPhieuKB NVARCHAR(30)
AS
BEGIN
    -- Lấy danh sách các dịch vụ sử dụng không nhóm
    SELECT 
        pkb.MaPhieuKB,               -- Mã phiếu khám bệnh
        bn.TenBN AS TenBenhNhan,  -- Tên bệnh nhân
		bn.DiaChi,
		bn.SDT,
		bn.NgSinh,
		bn.GioiTinh,
        dv.TenDV,                   -- Tên dịch vụ
        dv.Gia AS GiaDichVu,        -- Giá dịch vụ
        sd.NgayThucHien             -- Ngày thực hiện dịch vụ
    FROM SuDungDichVu sd
    INNER JOIN DichVu dv ON sd.MaDV = dv.MaDV        -- Dịch vụ sử dụng
    INNER JOIN PhieuKhamBenh pkb ON sd.MaPhieuKB = pkb.MaPhieuKB -- Phiếu khám bệnh
    INNER JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN    -- Thông tin bệnh nhân
    WHERE 
        (@MaPhieuKB IS NULL OR pkb.MaPhieuKB = @MaPhieuKB)              -- Lọc theo mã phiếu khám bệnh (nếu có)
    ORDER BY pkb.MaPhieuKB, sd.NgayThucHien; -- Sắp xếp theo phiếu khám và ngày thực hiện
END;

GO
/****** Object:  StoredProcedure [dbo].[ChiTietDSSDVTheoThang]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietDSSDVTheoThang]
 @Thang int,@Nam int
AS
BEGIN
    -- Kết hợp bảng SuDungDichVu với DichVu, tính toán số lần sử dụng và tổng giá
    SELECT 
        dv.TenDV,                  -- Tên dịch vụ
        COUNT(sd.MaDV) AS SoLanSuDung, -- Số lần sử dụng dịch vụ
        dv.Gia,                   -- Giá mỗi lần sử dụng
        COUNT(sd.MaDV) * dv.Gia AS TongGia -- Tổng tiền
    FROM SuDungDichVu sd
    INNER JOIN DichVu dv ON sd.MaDV = dv.MaDV -- Join bảng
	WHERE Month(sd.NgayThucHien) = @Thang and Year(sd.NgayThucHien) = @Nam
    GROUP BY dv.TenDV, dv.Gia -- Nhóm theo tên và giá dịch vụ
    ORDER BY dv.TenDV
END
GO
/****** Object:  StoredProcedure [dbo].[InDonThuoc]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InDonThuoc]
    @MaDonThuoc NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        bn.TenBN,
        bn.GioiTinh,
        bn.NgSinh,
        bhyt.MaSoBHYT,
        cd.ChuanDoan,
        nv.TenNV,
        dt.MaDonThuoc,
        dt.NgayGioKeDon,
        ctdt.CachDung,
        t.TenThuoc,
        ctdt.SoLuong,

        -- Tính tổng tiền đơn thuốc
        CASE 
            WHEN bhyt.MaSoBHYT IS NOT NULL THEN 
                ROUND(
                    SUM(
                        ((t.Gia / NULLIF(t.SoLuongNhap * t.SoLuongHop * t.SoLuongDVT * ISNULL(t.SoLuongQCDG, 1), 0)) * (1 + 0.05)) * ctdt.SoLuong
                    ) OVER () * 0.2, -- Giảm giá 80% cho toàn bộ đơn
                2)
            ELSE
                ROUND(
                    SUM(
                        ((t.Gia / NULLIF(t.SoLuongNhap * t.SoLuongHop * t.SoLuongDVT * ISNULL(t.SoLuongQCDG, 1), 0)) * (1 + 0.05)) * ctdt.SoLuong
                    ) OVER (), -- Không giảm giá
                2)
        END AS TongTienDonThuoc
		
    FROM DonThuoc dt
        JOIN ChiTietDonThuoc ctdt ON dt.MaDonThuoc = ctdt.MaDonThuoc
        JOIN PhieuKhamBenh pkb ON dt.MaPhieuKB = pkb.MaPhieuKB
        JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN
        LEFT JOIN BHYT bhyt ON bn.MSBN = bhyt.MSBN
        JOIN ChuanDoan cd ON pkb.MaPhieuKB = cd.MaPhieuKB
        JOIN NhanVien nv ON dt.MaNV = nv.MaNV
        JOIN Thuoc t ON ctdt.MaThuoc = t.MaThuoc AND ctdt.MaLo = t.MaLo
    WHERE dt.MaDonThuoc = @MaDonThuoc;
END;

GO
/****** Object:  StoredProcedure [dbo].[LayDSBNNoiTruTheoKhoangTG]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LayDSBNNoiTruTheoKhoangTG]
   @TuNgay datetime,@DenNgay datetime
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT
        bn.MSBN AS [MaSoBenhNhan],
        bn.TenBN AS [TenBenhNhan],
        bn.GioiTinh AS [GioiTinh],
        bn.NgSinh AS [NgaySinh],
        pg.NgayNhan AS [NgayNhanGiuong],
        pg.NgayTra AS [NgayTraGiuong],
        CONCAT(p.TenPhong,'-',p.MSPhong) AS [TenPhong],
        gb.MaGiuong AS [MaGiuong],
        sba.BenhNen AS [BenhNen],
		k.TenKhoa AS [MaKhoa],
        -- Trạng thái xuất viện
        CASE 
            WHEN pg.NgayTra IS NOT NULL AND CAST(pg.NgayTra AS DATE) <= CAST(GETDATE() AS DATE) THEN N'Đã xuất viện'
            WHEN pg.NgayTra IS NULL THEN N'Chưa xuất viện'
            ELSE N'Chưa xuất viện'
        END AS [TrangThaiXuatVien],
        -- Tổng số ca nội trú trong ngày
        CONCAT(nv.MaNV,'-',nv.TenNV) AS [MaNhanVien],
        pkb.MaPhieuKB AS [MaSoPhieuKhamBenh]
    FROM 
        BenhNhan bn
        LEFT JOIN SoBenhAn sba ON bn.MSBN = sba.MaBN
        LEFT JOIN PhieuKhamBenh pkb ON bn.MSBN = pkb.MaBN
        LEFT JOIN ChuanDoan cd ON pkb.MaPhieuKB = cd.MaPhieuKB
        LEFT JOIN PhanGiuong pg ON pg.MaPhieuKB = pkb.MaPhieuKB
        LEFT JOIN GiuongBenh gb ON gb.MaGiuong = pg.MaGiuong
        LEFT JOIN Phong p ON p.MSPhong = gb.MSPhong
        LEFT JOIN SuDungDichVu sddv ON pg.MaPhieuKB = sddv.MaPhieuKB
        LEFT JOIN NhanVien nv ON nv.MaNV = pg.MaNVYeuCau
		LEFT JOIN Khoa k on k.MaKhoa = p.MaKhoa
    WHERE 
        CAST(pg.NgayNhan AS date) >= CAST(@TuNgay AS date) and CAST(pg.NgayNhan AS date) <= CAST(@DenNgay AS date)
		AND (sddv.MSPhong IS NULL OR sddv.MSPhong = gb.MSPhong)
    ORDER BY 
        bn.TenBN; -- Sắp xếp theo tên bệnh nhân
END;

GO
/****** Object:  StoredProcedure [dbo].[LayDSBNNoiTruTheoNam]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LayDSBNNoiTruTheoNam]
   @Nam int
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT
        bn.MSBN AS [MaSoBenhNhan],
        bn.TenBN AS [TenBenhNhan],
        bn.GioiTinh AS [GioiTinh],
        bn.NgSinh AS [NgaySinh],
        pg.NgayNhan AS [NgayNhanGiuong],
        pg.NgayTra AS [NgayTraGiuong],
        CONCAT(p.TenPhong,'-',p.MSPhong) AS [TenPhong],
        gb.MaGiuong AS [MaGiuong],
        sba.BenhNen AS [BenhNen],
		k.TenKhoa AS [MaKhoa],
        -- Trạng thái xuất viện
        CASE 
            WHEN pg.NgayTra IS NOT NULL AND CAST(pg.NgayTra AS DATE) <= CAST(GETDATE() AS DATE) THEN N'Đã xuất viện'
            WHEN pg.NgayTra IS NULL THEN N'Chưa xuất viện'
            ELSE N'Chưa xuất viện'
        END AS [TrangThaiXuatVien],
        -- Tổng số ca nội trú trong ngày
        CONCAT(nv.MaNV,'-',nv.TenNV) AS [MaNhanVien],
        pkb.MaPhieuKB AS [MaSoPhieuKhamBenh]
    FROM 
        BenhNhan bn
        LEFT JOIN SoBenhAn sba ON bn.MSBN = sba.MaBN
        LEFT JOIN PhieuKhamBenh pkb ON bn.MSBN = pkb.MaBN
        LEFT JOIN ChuanDoan cd ON pkb.MaPhieuKB = cd.MaPhieuKB
        LEFT JOIN PhanGiuong pg ON pg.MaPhieuKB = pkb.MaPhieuKB
        LEFT JOIN GiuongBenh gb ON gb.MaGiuong = pg.MaGiuong
        LEFT JOIN Phong p ON p.MSPhong = gb.MSPhong
        LEFT JOIN SuDungDichVu sddv ON pg.MaPhieuKB = sddv.MaPhieuKB
        LEFT JOIN NhanVien nv ON nv.MaNV = pg.MaNVYeuCau
		LEFT JOIN Khoa k on k.MaKhoa = p.MaKhoa
    WHERE 
        Year(pg.NgayNhan) = @Nam 
		AND (sddv.MSPhong IS NULL OR sddv.MSPhong = gb.MSPhong)
    ORDER BY 
        bn.TenBN; -- Sắp xếp theo tên bệnh nhân
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDSBNNoiTruTheoNgay]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDSBNNoiTruTheoNgay]
    @Ngay DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT
        bn.MSBN AS [MaSoBenhNhan],
        bn.TenBN AS [TenBenhNhan],
        bn.GioiTinh AS [GioiTinh],
        bn.NgSinh AS [NgaySinh],
        pg.NgayNhan AS [NgayNhanGiuong],
        pg.NgayTra AS [NgayTraGiuong],
        CONCAT(p.TenPhong,'-',p.MSPhong) AS [TenPhong],
        gb.MaGiuong AS [MaGiuong],
        sba.BenhNen AS [BenhNen],
		k.TenKhoa AS [MaKhoa],
        -- Trạng thái xuất viện
        CASE 
            WHEN pg.NgayTra IS NOT NULL AND CAST(pg.NgayTra AS DATE) <= CAST(GETDATE() AS DATE) THEN N'Đã xuất viện'
            WHEN pg.NgayTra IS NULL THEN N'Chưa xuất viện'
            ELSE N'Chưa xuất viện'
        END AS [TrangThaiXuatVien],
        -- Tổng số ca nội trú trong ngày
        CONCAT(nv.MaNV,'-',nv.TenNV) AS [MaNhanVien],
        pkb.MaPhieuKB AS [MaSoPhieuKhamBenh]
    FROM 
        BenhNhan bn
        LEFT JOIN SoBenhAn sba ON bn.MSBN = sba.MaBN
        LEFT JOIN PhieuKhamBenh pkb ON bn.MSBN = pkb.MaBN
        LEFT JOIN ChuanDoan cd ON pkb.MaPhieuKB = cd.MaPhieuKB
        LEFT JOIN PhanGiuong pg ON pg.MaPhieuKB = pkb.MaPhieuKB
        LEFT JOIN GiuongBenh gb ON gb.MaGiuong = pg.MaGiuong
        LEFT JOIN Phong p ON p.MSPhong = gb.MSPhong
        LEFT JOIN SuDungDichVu sddv ON pg.MaPhieuKB = sddv.MaPhieuKB
        LEFT JOIN NhanVien nv ON nv.MaNV = pg.MaNVYeuCau
		LEFT JOIN Khoa k on k.MaKhoa = p.MaKhoa
    WHERE 
        CAST(pg.NgayNhan AS DATE) = CAST(@Ngay AS DATE)
        AND (sddv.MSPhong IS NULL OR sddv.MSPhong = gb.MSPhong)
    ORDER BY 
        bn.TenBN; -- Sắp xếp theo tên bệnh nhân
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDSBNNoiTruTheoThang]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LayDSBNNoiTruTheoThang]
   @Thang int,@Nam int
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT
        bn.MSBN AS [MaSoBenhNhan],
        bn.TenBN AS [TenBenhNhan],
        bn.GioiTinh AS [GioiTinh],
        bn.NgSinh AS [NgaySinh],
        pg.NgayNhan AS [NgayNhanGiuong],
        pg.NgayTra AS [NgayTraGiuong],
        CONCAT(p.TenPhong,'-',p.MSPhong) AS [TenPhong],
        gb.MaGiuong AS [MaGiuong],
        sba.BenhNen AS [BenhNen],
		k.TenKhoa AS [MaKhoa],
        -- Trạng thái xuất viện
        CASE 
            WHEN pg.NgayTra IS NOT NULL AND CAST(pg.NgayTra AS DATE) <= CAST(GETDATE() AS DATE) THEN N'Đã xuất viện'
            WHEN pg.NgayTra IS NULL THEN N'Chưa xuất viện'
            ELSE N'Chưa xuất viện'
        END AS [TrangThaiXuatVien],
        -- Tổng số ca nội trú trong ngày
        CONCAT(nv.MaNV,'-',nv.TenNV) AS [MaNhanVien],
        pkb.MaPhieuKB AS [MaSoPhieuKhamBenh]
    FROM 
        BenhNhan bn
        LEFT JOIN SoBenhAn sba ON bn.MSBN = sba.MaBN
        LEFT JOIN PhieuKhamBenh pkb ON bn.MSBN = pkb.MaBN
        LEFT JOIN ChuanDoan cd ON pkb.MaPhieuKB = cd.MaPhieuKB
        LEFT JOIN PhanGiuong pg ON pg.MaPhieuKB = pkb.MaPhieuKB
        LEFT JOIN GiuongBenh gb ON gb.MaGiuong = pg.MaGiuong
        LEFT JOIN Phong p ON p.MSPhong = gb.MSPhong
        LEFT JOIN SuDungDichVu sddv ON pg.MaPhieuKB = sddv.MaPhieuKB
        LEFT JOIN NhanVien nv ON nv.MaNV = pg.MaNVYeuCau
		LEFT JOIN Khoa k on k.MaKhoa = p.MaKhoa
    WHERE 
        Year(pg.NgayNhan) = @Nam and MONTH(pg.NgayNhan) = @Thang
        AND (sddv.MSPhong IS NULL OR sddv.MSPhong = gb.MSPhong)
    ORDER BY 
        bn.TenBN; -- Sắp xếp theo tên bệnh nhân
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDSTheoDoiDieuTri]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDSTheoDoiDieuTri]
    @TuNgay DATETIME, -- Ngày bắt đầu
    @DenNgay DATETIME -- Ngày kết thúc
AS
BEGIN
        -- Lấy danh sách theo dõi điều trị trong khoảng thời gian
        SELECT DISTINCT
            td.MaTheoDoi, 
            CONCAT(pkb.MaPhieuKB,'-',bn.TenBN) AS [MaPhieuKB],
            td.NgayTheoDoi, 
            td.ChiSoCanNang, 
            td.ChiSoHuyetAp, 
            td.ChiSoNhipTho, 
            td.NhietDo, 
            td.MachDap, 
            td.DuongHuyet, 
            td.YLenh, 
            CONCAT(nv.MaNV,'-',nv.TenNV) AS [MaNhanVien],
            td.MaGiuong,		
			P.TenPhong as [MaPhong],
			k.TenKhoa AS [MaKhoa]
        FROM 
            TheoDoiDieuTri td
		LEFT JOIN 
			NhanVien nv on td.MaNV = nv.MaNV
		LEFT JOIN
			PhieuKhamBenh pkb on td.MaPhieuKB = pkb.MaPhieuKB
		LEFT JOIN
			BenhNhan bn on bn.MSBN = pkb.MaBN
		LEFT JOIN 
			GiuongBenh gb on gb.MaGiuong = td.MaGiuong
		LEFT JOIN
			Phong p on p.MSPhong = gb.MSPhong
		LEFT JOIN 
			Khoa k on k.MaKhoa = p.MaKhoa
        WHERE 
            td.NgayTheoDoi BETWEEN @TuNgay AND @DenNgay -- Lọc theo khoảng thời gian
        ORDER BY 
            td.NgayTheoDoi ASC; -- Sắp xếp theo ngày theo dõi
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDSThuocGanHetHan]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDSThuocGanHetHan]
    @SoNgay INT = 60 -- Thời gian tính là gần hết hạn, mặc định là 30 ngày
AS
BEGIN
        -- Lấy danh sách thuốc gần hết hạn
        SELECT 
            t.MaThuoc, 
            t.TenThuoc, 
            t.XuatXu, 
            t.NhaCungCap, 
            t.LoaiThuoc, 
            t.DonViTinh, 
            t.QuyCachDongGoi, 
            t.SoLuongDVT, 
            t.HamLuong, 
            t.Gia, 
            t.NgaySanXuat, 
            t.HSD, 
            t.MaLo, 
            k.SoLuongTrongKho
        FROM 
            Thuoc t
        LEFT JOIN 
            KhoThuoc k ON t.MaThuoc = k.MaThuoc AND t.MaLo = k.MaLo
        WHERE 
            t.HSD >= GETDATE() -- Thuốc còn hạn
            AND t.HSD <= DATEADD(DAY, @SoNgay, GETDATE()); -- Thuốc sắp hết hạn trong @SoNgay ngày
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDSThuocHetHan]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDSThuocHetHan] 
AS
BEGIN
        -- Lấy danh sách thuốc đã hết hạn
        SELECT 
            t.MaThuoc, 
            t.TenThuoc, 
            t.XuatXu, 
            t.NhaCungCap, 
            t.LoaiThuoc, 
            t.DonViTinh, 
            t.QuyCachDongGoi, 
            t.SoLuongDVT, 
            t.HamLuong, 
            t.Gia, 
            t.NgaySanXuat, 
            t.HSD, 
            t.MaLo, 
            k.SoLuongTrongKho
        FROM 
            Thuoc t
        LEFT JOIN 
            KhoThuoc k ON t.MaThuoc = k.MaThuoc AND t.MaLo = k.MaLo
        WHERE 
            t.HSD < GETDATE() and t.SoLuongNhap != 0; -- Kiểm tra hạn sử dụng đã qua ngày hiện tại
END

GO
/****** Object:  StoredProcedure [dbo].[ThongKeDSThuocTheoKhoangTGVaDoanhThu]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ThongKeDSThuocTheoKhoangTGVaDoanhThu]
    @TuNgay DATE, -- Ngày bắt đầu
    @DenNgay DATE -- Ngày kết thúc
AS
BEGIN
    SELECT 
        t.TenThuoc, -- Tên thuốc
        SUM(ctdt.SoLuong) AS SoLuong, -- Tổng số lượng thuốc từ ChiTietDonThuoc
        MAX(
            CASE 
                WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                    ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG
                ELSE 
                    ttk.Gia / t.SoLuongDVT
            END
        ) AS DonGia, -- Đơn giá cao nhất trong các lô
        SUM(
            ctdt.SoLuong * (
                CASE 
                    WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                        ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG
                    ELSE 
                        ttk.Gia / t.SoLuongDVT
                END
            )
        ) AS ThanhTien -- Tổng tiền chính xác theo từng lô
    FROM ChiTietDonThuoc ctdt
    JOIN DonThuoc dt ON ctdt.MaDonThuoc = dt.MaDonThuoc -- Kết nối đơn thuốc
    JOIN Thuoc t ON ctdt.MaThuoc = t.MaThuoc AND ctdt.MaLo = t.MaLo -- Kết nối thuốc
    JOIN (
        -- Lọc ra giá duy nhất từ bảng ThuocTheoKhoa để tránh nhân số lượng
        SELECT DISTINCT MaThuoc, MaLo, Gia
        FROM ThuocTheoKhoa
    ) ttk ON t.MaThuoc = ttk.MaThuoc AND ctdt.MaLo = ttk.MaLo
    WHERE dt.NgayGioKeDon >= @TuNgay -- Lọc ngày bắt đầu
      AND dt.NgayGioKeDon <= @DenNgay -- Lọc ngày kết thúc
    GROUP BY t.TenThuoc; -- Nhóm chỉ theo tên thuốc
END;

GO
/****** Object:  StoredProcedure [dbo].[ThongKeDSThuocTheoNamVaDoanhThu]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThongKeDSThuocTheoNamVaDoanhThu]
    @Nam INT -- Năm cần thống kê
AS
BEGIN
    SELECT 
        t.TenThuoc, -- Tên thuốc
        SUM(ctdt.SoLuong) AS SoLuong, -- Tổng số lượng thuốc từ ChiTietDonThuoc
        MAX(
            CASE 
                WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                    ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG
                ELSE 
                    ttk.Gia / t.SoLuongDVT
            END
        ) AS DonGia, -- Đơn giá cao nhất trong các lô
        SUM(
            ctdt.SoLuong * (
                CASE 
                    WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                        ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG
                    ELSE 
                        ttk.Gia / t.SoLuongDVT
                END
            )
        ) AS ThanhTien -- Tổng tiền chính xác theo từng lô
    FROM ChiTietDonThuoc ctdt
    JOIN DonThuoc dt ON ctdt.MaDonThuoc = dt.MaDonThuoc -- Kết nối đơn thuốc
    JOIN Thuoc t ON ctdt.MaThuoc = t.MaThuoc AND ctdt.MaLo = t.MaLo -- Kết nối thuốc
    JOIN (
        -- Lọc ra giá duy nhất từ bảng ThuocTheoKhoa để tránh nhân số lượng
        SELECT DISTINCT MaThuoc, MaLo, Gia
        FROM ThuocTheoKhoa
    ) ttk ON t.MaThuoc = ttk.MaThuoc AND ctdt.MaLo = ttk.MaLo
    WHERE YEAR(dt.NgayGioKeDon) = @Nam -- Lọc theo năm
    GROUP BY t.TenThuoc; -- Nhóm chỉ theo tên thuốc
END;
GO
/****** Object:  StoredProcedure [dbo].[ThongKeDSThuocTheoNgayVaDoanhThu]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThongKeDSThuocTheoNgayVaDoanhThu]
    @TuNgay DATE
AS
BEGIN
    SELECT 
        t.TenThuoc, -- Tên thuốc
        SUM(ctdt.SoLuong) AS SoLuong, -- Tổng số lượng thuốc từ ChiTietDonThuoc
        MAX(
            CASE 
                WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                    ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG
                ELSE 
                    ttk.Gia / t.SoLuongDVT
            END
        ) AS DonGia, -- Đơn giá cao nhất trong các lô (nếu cần để hiển thị)
        SUM(
            ctdt.SoLuong * (
                CASE 
                    WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                        ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG
                    ELSE 
                        ttk.Gia / t.SoLuongDVT
                END
            )
        ) AS ThanhTien -- Tổng tiền chính xác theo từng lô
    FROM ChiTietDonThuoc ctdt
    JOIN DonThuoc dt ON ctdt.MaDonThuoc = dt.MaDonThuoc -- Kết nối đơn thuốc
    JOIN Thuoc t ON ctdt.MaThuoc = t.MaThuoc AND ctdt.MaLo = t.MaLo -- Kết nối thuốc
    JOIN (
        -- Lọc ra giá duy nhất từ bảng ThuocTheoKhoa để tránh nhân số lượng
        SELECT DISTINCT MaThuoc, MaLo, Gia
        FROM ThuocTheoKhoa
    ) ttk ON t.MaThuoc = ttk.MaThuoc AND ctdt.MaLo = ttk.MaLo
    WHERE CAST(dt.NgayGioKeDon AS DATE) = @TuNgay -- Lọc theo ngày kê đơn
    GROUP BY t.TenThuoc; -- Nhóm chỉ theo tên thuốc
END;

GO
/****** Object:  StoredProcedure [dbo].[ThongKeDSThuocTheoThangVaDoanhThu]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ThongKeDSThuocTheoThangVaDoanhThu]
    @Thang INT, -- Tháng cần thống kê
    @Nam INT -- Năm cần thống kê
AS
BEGIN
    SELECT 
        t.TenThuoc, -- Tên thuốc
        SUM(ctdt.SoLuong) AS SoLuong, -- Tổng số lượng thuốc từ ChiTietDonThuoc
        MAX(
            CASE 
                WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                    ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG
                ELSE 
                    ttk.Gia / t.SoLuongDVT
            END
        ) AS DonGia, -- Đơn giá cao nhất trong các lô
        SUM(
            ctdt.SoLuong * (
                CASE 
                    WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                        ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG
                    ELSE 
                        ttk.Gia / t.SoLuongDVT
                END
            )
        ) AS ThanhTien -- Tổng tiền chính xác theo từng lô
    FROM ChiTietDonThuoc ctdt
    JOIN DonThuoc dt ON ctdt.MaDonThuoc = dt.MaDonThuoc -- Kết nối đơn thuốc
    JOIN Thuoc t ON ctdt.MaThuoc = t.MaThuoc AND ctdt.MaLo = t.MaLo -- Kết nối thuốc
    JOIN (
        -- Lọc ra giá duy nhất từ bảng ThuocTheoKhoa để tránh nhân số lượng
        SELECT DISTINCT MaThuoc, MaLo, Gia
        FROM ThuocTheoKhoa
    ) ttk ON t.MaThuoc = ttk.MaThuoc AND ctdt.MaLo = ttk.MaLo
    WHERE MONTH(dt.NgayGioKeDon) = @Thang -- Lọc theo tháng
      AND YEAR(dt.NgayGioKeDon) = @Nam -- Lọc theo năm
    GROUP BY t.TenThuoc; -- Nhóm chỉ theo tên thuốc
END;
GO
/****** Object:  StoredProcedure [dbo].[TinhDoanhThuTongSuDungDVTheoKhoangTG]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhDoanhThuTongSuDungDVTheoKhoangTG]
    @TuNgay DATE,@DenNgay DATE  -- Thêm tham số ngày vào
AS
BEGIN
    -- Khai báo biến lưu tổng chi phí
    DECLARE @TotalCost FLOAT;
    SET @TotalCost = 0;

    -- Truy vấn tính tổng chi phí dịch vụ của tất cả phiếu khám bệnh theo ngày
    SELECT @TotalCost = SUM(dv.Gia)
    FROM PhieuKhamBenh pkb
    JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN
    LEFT JOIN BHYT bhyt ON bn.MSBN = bhyt.MaSoBHYT 
    JOIN SuDungDichVu sddv ON pkb.MaPhieuKB = sddv.MaPhieuKB  
	join DichVu dv on sddv.MaDV = dv.MaDV
    WHERE CAST(sddv.NgayThucHien AS DATE) BETWEEN @TuNgay AND @DenNgay

    -- Trả về tổng chi phí
    SELECT @TotalCost AS TotalCost;
END
GO
/****** Object:  StoredProcedure [dbo].[TinhDoanhThuTongSuDungDVTheoNam]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhDoanhThuTongSuDungDVTheoNam]
    @Nam int
AS
BEGIN
    -- Khai báo biến lưu tổng chi phí
    DECLARE @TotalCost FLOAT;
    SET @TotalCost = 0;

    -- Truy vấn tính tổng chi phí dịch vụ của tất cả phiếu khám bệnh theo ngày
    SELECT @TotalCost = SUM(dv.Gia)
    FROM PhieuKhamBenh pkb
    JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN
    LEFT JOIN BHYT bhyt ON bn.MSBN = bhyt.MaSoBHYT 
    JOIN SuDungDichVu sddv ON pkb.MaPhieuKB = sddv.MaPhieuKB  
	join DichVu dv on sddv.MaDV = dv.MaDV
    WHERE  Year(sddv.NgayThucHien) = @Nam

    -- Trả về tổng chi phí
    SELECT @TotalCost AS TotalCost;
END
GO
/****** Object:  StoredProcedure [dbo].[TinhDoanhThuTongSuDungDVTheoNgay]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhDoanhThuTongSuDungDVTheoNgay]
    @TuNgay DATE  -- Thêm tham số ngày vào
AS
BEGIN
    -- Khai báo biến lưu tổng chi phí
    DECLARE @TotalCost FLOAT;
    SET @TotalCost = 0;

    -- Truy vấn tính tổng chi phí dịch vụ của tất cả phiếu khám bệnh theo ngày
    SELECT @TotalCost = SUM(dv.Gia)
    FROM PhieuKhamBenh pkb
    JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN
    LEFT JOIN BHYT bhyt ON bn.MSBN = bhyt.MaSoBHYT 
    JOIN SuDungDichVu sddv ON pkb.MaPhieuKB = sddv.MaPhieuKB  
	join DichVu dv on sddv.MaDV = dv.MaDV
    WHERE CAST(sddv.NgayThucHien AS DATE) = @TuNgay -- Lọc theo ngày

    -- Trả về tổng chi phí
    SELECT @TotalCost AS TotalCost;
END
GO
/****** Object:  StoredProcedure [dbo].[TinhDoanhThuTongSuDungDVTheoThang]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhDoanhThuTongSuDungDVTheoThang]
    @Thang int, @Nam int
AS
BEGIN
    -- Khai báo biến lưu tổng chi phí
    DECLARE @TotalCost FLOAT;
    SET @TotalCost = 0;

    -- Truy vấn tính tổng chi phí dịch vụ của tất cả phiếu khám bệnh theo ngày
    SELECT @TotalCost = SUM(dv.Gia)
    FROM PhieuKhamBenh pkb
    JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN
    LEFT JOIN BHYT bhyt ON bn.MSBN = bhyt.MaSoBHYT 
    JOIN SuDungDichVu sddv ON pkb.MaPhieuKB = sddv.MaPhieuKB  
	join DichVu dv on sddv.MaDV = dv.MaDV
    WHERE Month(sddv.NgayThucHien) = @Thang and Year(sddv.NgayThucHien) = @Nam

    -- Trả về tổng chi phí
    SELECT @TotalCost AS TotalCost;
END
GO
/****** Object:  StoredProcedure [dbo].[TinhTienSuDungDVTheoKhoangTG]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhTienSuDungDVTheoKhoangTG]
    @TuNgay DATE,  -- Thêm tham số ngày bắt đầu
    @DenNgay DATE   -- Thêm tham số ngày kết thúc (optional)
AS
BEGIN
    DECLARE @TotalCost FLOAT;
    SET @TotalCost = 0;

    -- Truy vấn tính tổng chi phí dịch vụ cho tất cả phiếu khám bệnh theo khoảng thời gian
    SELECT @TotalCost = SUM(
                            CASE 
                                WHEN bhyt.MaSoBHYT IS NOT NULL THEN 
                                    dv.Gia * 0.8  -- Nếu có BHYT, tính 20% chi phí dịch vụ
                                ELSE 
                                    dv.Gia  -- Nếu không có BHYT, giữ nguyên chi phí dịch vụ
                            END)
    FROM PhieuKhamBenh pkb
    JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN
    LEFT JOIN BHYT bhyt ON bn.MSBN = bhyt.MSBN  -- Kiểm tra mã BHYT của bệnh nhân
    JOIN SuDungDichVu sddv ON pkb.MaPhieuKB = sddv.MaPhieuKB  -- Kết nối với bảng dịch vụ đã sử dụng
    JOIN DichVu dv ON sddv.MaDV = dv.MaDV  -- Kết nối với bảng dịch vụ để lấy giá trị
    WHERE CAST(sddv.NgayThucHien AS DATE) BETWEEN @TuNgay AND @DenNgay -- Lọc theo khoảng thời gian

    -- Trả về tổng chi phí
    SELECT @TotalCost AS TotalCost;
END
GO
/****** Object:  StoredProcedure [dbo].[TinhTienSuDungDVTheoNam]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhTienSuDungDVTheoNam]
   @Nam int
AS
BEGIN
    DECLARE @TotalCost FLOAT;
    SET @TotalCost = 0;

    -- Truy vấn tính tổng chi phí dịch vụ cho tất cả phiếu khám bệnh theo khoảng thời gian
    SELECT @TotalCost = SUM(
                            CASE 
                                WHEN bhyt.MaSoBHYT IS NOT NULL THEN 
                                    dv.Gia * 0.8  -- Nếu có BHYT, tính 20% chi phí dịch vụ
                                ELSE 
                                    dv.Gia  -- Nếu không có BHYT, giữ nguyên chi phí dịch vụ
                            END)
    FROM PhieuKhamBenh pkb
    JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN
    LEFT JOIN BHYT bhyt ON bn.MSBN = bhyt.MSBN  -- Kiểm tra mã BHYT của bệnh nhân
    JOIN SuDungDichVu sddv ON pkb.MaPhieuKB = sddv.MaPhieuKB  -- Kết nối với bảng dịch vụ đã sử dụng
    JOIN DichVu dv ON sddv.MaDV = dv.MaDV  -- Kết nối với bảng dịch vụ để lấy giá trị
    WHERE Year(sddv.NgayThucHien) = @Nam

    -- Trả về tổng chi phí
    SELECT @TotalCost AS TotalCost;
END
GO
/****** Object:  StoredProcedure [dbo].[TinhTienSuDungDVTheoNgay]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhTienSuDungDVTheoNgay]
    @TuNgay DATE  -- Tham số ngày cần tính
AS
BEGIN
    -- Tính tổng chi phí trực tiếp trong SELECT
    SELECT SUM(
        CASE 
            WHEN subquery.MaSoBHYT IS NOT NULL THEN subquery.totalCost * 0.8  -- Nếu có BHYT, giảm 20%
            ELSE subquery.totalCost  -- Nếu không có BHYT, giữ nguyên chi phí
        END
    ) AS TotalCost
    FROM (
        SELECT 
            pkb.MaPhieuKB,
            SUM(dv.Gia) AS totalCost,  -- Tổng tiền dịch vụ cho từng phiếu khám
            bhyt.MaSoBHYT  -- Kiểm tra BHYT
        FROM PhieuKhamBenh pkb
        LEFT JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN
        LEFT JOIN BHYT bhyt ON bn.MSBN = bhyt.MSBN
        JOIN SuDungDichVu sddv ON pkb.MaPhieuKB = sddv.MaPhieuKB
        JOIN DichVu dv ON sddv.MaDV = dv.MaDV
        WHERE CAST(sddv.NgayThucHien AS DATE) = @TuNgay  -- Lọc theo ngày thực hiện dịch vụ
        GROUP BY pkb.MaPhieuKB, bhyt.MaSoBHYT  -- Nhóm theo phiếu khám và BHYT
    ) AS subquery;  -- Tổng hợp kết quả từ truy vấn con
END;
GO
/****** Object:  StoredProcedure [dbo].[TinhTienSuDungDVTheoPhieuVaBenhNhan]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhTienSuDungDVTheoPhieuVaBenhNhan]
    @MaPhieuKB NVARCHAR(30)
AS
BEGIN
    -- Tính tổng tiền dịch vụ theo phiếu khám và lấy thông tin bệnh nhân
    SELECT 
        pkb.MaPhieuKB,                    -- Mã phiếu khám
        bn.TenBN AS TenBenhNhan,          -- Tên bệnh nhân
        SUM(dv.Gia) AS TongTienNiemYet,  -- Tổng tiền niêm yết (chưa giảm BHYT)
        SUM(
            CASE 
                WHEN bhyt.MaSoBHYT IS NOT NULL THEN dv.Gia * 0.8  -- Nếu có BHYT, giảm 20%
                ELSE dv.Gia  -- Nếu không có BHYT, giữ nguyên giá
            END
        ) AS TongTienSauGiamBHYT          -- Tổng tiền sau giảm BHYT
    FROM PhieuKhamBenh pkb
    LEFT JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN  -- Kết nối với thông tin bệnh nhân
    LEFT JOIN BHYT bhyt ON bn.MSBN = bhyt.MSBN  -- Kiểm tra BHYT
    JOIN SuDungDichVu sddv ON pkb.MaPhieuKB = sddv.MaPhieuKB  -- Dịch vụ đã sử dụng
    JOIN DichVu dv ON sddv.MaDV = dv.MaDV  -- Dịch vụ chi tiết
    WHERE 
        (@MaPhieuKB IS NULL OR pkb.MaPhieuKB = @MaPhieuKB) -- Lọc theo mã phiếu (nếu có)
    GROUP BY pkb.MaPhieuKB, bn.TenBN;  
END;
GO
/****** Object:  StoredProcedure [dbo].[TinhTienSuDungDVTheoThang]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhTienSuDungDVTheoThang]
   @Thang int,@Nam int
AS
BEGIN
    DECLARE @TotalCost FLOAT;
    SET @TotalCost = 0;

    -- Truy vấn tính tổng chi phí dịch vụ cho tất cả phiếu khám bệnh theo khoảng thời gian
    SELECT @TotalCost = SUM(
                            CASE 
                                WHEN bhyt.MaSoBHYT IS NOT NULL THEN 
                                    dv.Gia * 0.8  -- Nếu có BHYT, tính 20% chi phí dịch vụ
                                ELSE 
                                    dv.Gia  -- Nếu không có BHYT, giữ nguyên chi phí dịch vụ
                            END)
    FROM PhieuKhamBenh pkb
    JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN
    LEFT JOIN BHYT bhyt ON bn.MSBN = bhyt.MSBN  -- Kiểm tra mã BHYT của bệnh nhân
    JOIN SuDungDichVu sddv ON pkb.MaPhieuKB = sddv.MaPhieuKB  -- Kết nối với bảng dịch vụ đã sử dụng
    JOIN DichVu dv ON sddv.MaDV = dv.MaDV  -- Kết nối với bảng dịch vụ để lấy giá trị
    WHERE Month(sddv.NgayThucHien) = @Thang and Year(sddv.NgayThucHien) = @Nam

    -- Trả về tổng chi phí
    SELECT @TotalCost AS TotalCost;
END
GO
/****** Object:  StoredProcedure [dbo].[TinhTongTienThuocTheoKhoangTG]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhTongTienThuocTheoKhoangTG]
    @TuNgay DATE,
    @DenNgay DATE
AS
BEGIN
    -- Tính tổng tiền thuốc theo khoảng thời gian
    SELECT 
        -- Tổng tiền thuốc chưa giảm BHYT
        SUM(ctdt.SoLuong * 
            CASE 
                WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                    (ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG) 
                ELSE 
                    (ttk.Gia / t.SoLuongDVT) 
            END
        ) AS TongTienThuoc, 
        
        -- Tổng tiền BHYT chi trả (80%)
        SUM(ctdt.SoLuong * 
            CASE 
                WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                    (ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG) * 1.05
                ELSE 
                    (ttk.Gia / t.SoLuongDVT) * 1.05
            END
        ) * 0.8 AS TienBHYTChiTra, 
        
        -- Tổng tiền bệnh nhân chi trả (20%)
        SUM(
            CASE 
                WHEN bhyt.MaSoBHYT IS NOT NULL THEN 
                    ((t.Gia / NULLIF(t.SoLuongNhap * t.SoLuongHop * t.SoLuongDVT * ISNULL(t.SoLuongQCDG, 1), 0)) * 1.05) * ctdt.SoLuong * 0.2
                ELSE 
                    ((t.Gia / NULLIF(t.SoLuongNhap * t.SoLuongHop * t.SoLuongDVT * ISNULL(t.SoLuongQCDG, 1), 0)) * 1.05) * ctdt.SoLuong
            END
        ) AS TienBenhNhanChiTra

    FROM DonThuoc dt
    JOIN ChiTietDonThuoc ctdt ON dt.MaDonThuoc = ctdt.MaDonThuoc -- Kết nối chi tiết đơn thuốc
    JOIN PhieuKhamBenh pkb ON dt.MaPhieuKB = pkb.MaPhieuKB
    LEFT JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN
    LEFT JOIN BHYT bhyt ON bn.MSBN = bhyt.MSBN -- Kết nối BHYT để kiểm tra thẻ BHYT
    JOIN Thuoc t ON ctdt.MaThuoc = t.MaThuoc AND ctdt.MaLo = t.MaLo -- Kết nối thuốc
    JOIN (
        -- Lọc ra giá duy nhất từ bảng ThuocTheoKhoa để tránh nhân số lượng
        SELECT DISTINCT MaThuoc, MaLo, Gia
        FROM ThuocTheoKhoa
    ) ttk ON t.MaThuoc = ttk.MaThuoc AND ctdt.MaLo = ttk.MaLo
    WHERE CAST(dt.NgayGioKeDon AS DATE) BETWEEN @TuNgay AND @DenNgay -- Lọc theo khoảng thời gian
END;
GO
/****** Object:  StoredProcedure [dbo].[TinhTongTienThuocTheoNam]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhTongTienThuocTheoNam]
    @Nam INT
AS
BEGIN
    -- Tính tổng tiền thuốc theo năm
    SELECT 
        -- Tổng tiền thuốc chưa giảm BHYT
        SUM(ctdt.SoLuong * 
            CASE 
                WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                    (ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG) 
                ELSE 
                    (ttk.Gia / t.SoLuongDVT) 
            END
        ) AS TongTienThuoc, 
        
        -- Tổng tiền BHYT chi trả (80%)
        SUM(ctdt.SoLuong * 
            CASE 
                WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                    (ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG) * 1.05
                ELSE 
                    (ttk.Gia / t.SoLuongDVT) * 1.05
            END
        ) * 0.8 AS TienBHYTChiTra, 
        
        -- Tổng tiền bệnh nhân chi trả (20%)
        SUM(
            CASE 
                WHEN bhyt.MaSoBHYT IS NOT NULL THEN 
                    ((t.Gia / NULLIF(t.SoLuongNhap * t.SoLuongHop * t.SoLuongDVT * ISNULL(t.SoLuongQCDG, 1), 0)) * 1.05) * ctdt.SoLuong * 0.2
                ELSE 
                    ((t.Gia / NULLIF(t.SoLuongNhap * t.SoLuongHop * t.SoLuongDVT * ISNULL(t.SoLuongQCDG, 1), 0)) * 1.05) * ctdt.SoLuong
            END
        ) AS TienBenhNhanChiTra

    FROM DonThuoc dt
    JOIN ChiTietDonThuoc ctdt ON dt.MaDonThuoc = ctdt.MaDonThuoc -- Kết nối chi tiết đơn thuốc
    JOIN PhieuKhamBenh pkb ON dt.MaPhieuKB = pkb.MaPhieuKB
    LEFT JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN
    LEFT JOIN BHYT bhyt ON bn.MSBN = bhyt.MSBN -- Kết nối BHYT để kiểm tra thẻ BHYT
    JOIN Thuoc t ON ctdt.MaThuoc = t.MaThuoc AND ctdt.MaLo = t.MaLo -- Kết nối thuốc
    JOIN (
        -- Lọc ra giá duy nhất từ bảng ThuocTheoKhoa để tránh nhân số lượng
        SELECT DISTINCT MaThuoc, MaLo, Gia
        FROM ThuocTheoKhoa
    ) ttk ON t.MaThuoc = ttk.MaThuoc AND ctdt.MaLo = ttk.MaLo
    WHERE YEAR(dt.NgayGioKeDon) = @Nam -- Lọc theo năm
END;
GO
/****** Object:  StoredProcedure [dbo].[TinhTongTienThuocTheoNgay]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TinhTongTienThuocTheoNgay]
    @TuNgay DATE
AS
BEGIN
    -- Tính tổng tiền thuốc theo ngày
    SELECT 
        -- Tổng tiền thuốc chưa giảm BHYT
        SUM(ctdt.SoLuong * 
            CASE 
                WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                    (ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG) 
                ELSE 
                    (ttk.Gia / t.SoLuongDVT) 
            END
        ) AS TongTienThuoc, 
        
        -- Tổng tiền BHYT chi trả (80%)
        SUM(ctdt.SoLuong * 
            CASE 
                WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                    (ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG) * 1.05
                ELSE 
                    (ttk.Gia / t.SoLuongDVT) * 1.05
            END
        ) * 0.8 AS TienBHYTChiTra, 
        
        -- Tổng tiền bệnh nhân chi trả (20%)
        SUM(
            CASE 
                WHEN bhyt.MaSoBHYT IS NOT NULL THEN 
                    ((t.Gia / NULLIF(t.SoLuongNhap * t.SoLuongHop * t.SoLuongDVT * ISNULL(t.SoLuongQCDG, 1), 0)) * 1.05) * ctdt.SoLuong * 0.2
                ELSE 
                    ((t.Gia / NULLIF(t.SoLuongNhap * t.SoLuongHop * t.SoLuongDVT * ISNULL(t.SoLuongQCDG, 1), 0)) * 1.05) * ctdt.SoLuong
            END
        ) AS TienBenhNhanChiTra

    FROM DonThuoc dt
    JOIN ChiTietDonThuoc ctdt ON dt.MaDonThuoc = ctdt.MaDonThuoc -- Kết nối chi tiết đơn thuốc
    JOIN PhieuKhamBenh pkb ON dt.MaPhieuKB = pkb.MaPhieuKB
    LEFT JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN
    LEFT JOIN BHYT bhyt ON bn.MSBN = bhyt.MSBN -- Kết nối BHYT để kiểm tra thẻ BHYT
    JOIN Thuoc t ON ctdt.MaThuoc = t.MaThuoc AND ctdt.MaLo = t.MaLo -- Kết nối thuốc
    JOIN (
        -- Lọc ra giá duy nhất từ bảng ThuocTheoKhoa để tránh nhân số lượng
        SELECT DISTINCT MaThuoc, MaLo, Gia
        FROM ThuocTheoKhoa
    ) ttk ON t.MaThuoc = ttk.MaThuoc AND ctdt.MaLo = ttk.MaLo
    WHERE CAST(dt.NgayGioKeDon AS DATE) = @TuNgay -- Lọc theo ngày kê đơn
END;

GO
/****** Object:  StoredProcedure [dbo].[TinhTongTienThuocTheoThang]    Script Date: 11/22/2024 10:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhTongTienThuocTheoThang]
    @Thang INT,
    @Nam INT
AS
BEGIN
    -- Tính tổng tiền thuốc theo tháng
    SELECT 
        -- Tổng tiền thuốc chưa giảm BHYT
        SUM(ctdt.SoLuong * 
            CASE 
                WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                    (ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG) 
                ELSE 
                    (ttk.Gia / t.SoLuongDVT) 
            END
        ) AS TongTienThuoc, 
        
        -- Tổng tiền BHYT chi trả (80%)
        SUM(ctdt.SoLuong * 
            CASE 
                WHEN t.SoLuongQCDG IS NOT NULL AND t.SoLuongQCDG > 0 THEN 
                    (ttk.Gia / t.SoLuongDVT / t.SoLuongQCDG) * 1.05
                ELSE 
                    (ttk.Gia / t.SoLuongDVT) * 1.05
            END
        ) * 0.8 AS TienBHYTChiTra, 
        
        -- Tổng tiền bệnh nhân chi trả (20%)
        SUM(
            CASE 
                WHEN bhyt.MaSoBHYT IS NOT NULL THEN 
                    ((t.Gia / NULLIF(t.SoLuongNhap * t.SoLuongHop * t.SoLuongDVT * ISNULL(t.SoLuongQCDG, 1), 0)) * 1.05) * ctdt.SoLuong * 0.2
                ELSE 
                    ((t.Gia / NULLIF(t.SoLuongNhap * t.SoLuongHop * t.SoLuongDVT * ISNULL(t.SoLuongQCDG, 1), 0)) * 1.05) * ctdt.SoLuong
            END
        ) AS TienBenhNhanChiTra

    FROM DonThuoc dt
    JOIN ChiTietDonThuoc ctdt ON dt.MaDonThuoc = ctdt.MaDonThuoc -- Kết nối chi tiết đơn thuốc
    JOIN PhieuKhamBenh pkb ON dt.MaPhieuKB = pkb.MaPhieuKB
    LEFT JOIN BenhNhan bn ON pkb.MaBN = bn.MSBN
    LEFT JOIN BHYT bhyt ON bn.MSBN = bhyt.MSBN -- Kết nối BHYT để kiểm tra thẻ BHYT
    JOIN Thuoc t ON ctdt.MaThuoc = t.MaThuoc AND ctdt.MaLo = t.MaLo -- Kết nối thuốc
    JOIN (
        -- Lọc ra giá duy nhất từ bảng ThuocTheoKhoa để tránh nhân số lượng
        SELECT DISTINCT MaThuoc, MaLo, Gia
        FROM ThuocTheoKhoa
    ) ttk ON t.MaThuoc = ttk.MaThuoc AND ctdt.MaLo = ttk.MaLo
    WHERE MONTH(dt.NgayGioKeDon) = @Thang AND YEAR(dt.NgayGioKeDon) = @Nam -- Lọc theo tháng và năm
END;

GO
USE [master]
GO
ALTER DATABASE [QLBV] SET  READ_WRITE 
GO
