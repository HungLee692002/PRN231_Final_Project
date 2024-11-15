USE [master]
GO
/****** Object:  Database [PRN231_Final_Project]    Script Date: 7/8/2024 11:03:34 AM ******/
CREATE DATABASE [PRN231_Final_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRN231_Final_Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRN231_Final_Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRN231_Final_Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRN231_Final_Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRN231_Final_Project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN231_Final_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRN231_Final_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRN231_Final_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRN231_Final_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRN231_Final_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRN231_Final_Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET RECOVERY FULL 
GO
ALTER DATABASE [PRN231_Final_Project] SET  MULTI_USER 
GO
ALTER DATABASE [PRN231_Final_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRN231_Final_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRN231_Final_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRN231_Final_Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRN231_Final_Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRN231_Final_Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRN231_Final_Project', N'ON'
GO
ALTER DATABASE [PRN231_Final_Project] SET QUERY_STORE = OFF
GO
USE [PRN231_Final_Project]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/8/2024 11:03:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[dob] [date] NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[create_dt] [datetime] NULL,
	[update_dt] [datetime] NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainQuestion]    Script Date: 7/8/2024 11:03:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainQuestion](
	[main_id] [int] IDENTITY(1,1) NOT NULL,
	[main_content] [nvarchar](255) NULL,
	[is_required] [bit] NULL,
	[type_id] [int] NULL,
	[images] [nvarchar](255) NULL,
	[create_dt] [datetime] NULL,
	[update_dt] [datetime] NULL,
 CONSTRAINT [PK_MainQuestion] PRIMARY KEY CLUSTERED 
(
	[main_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 7/8/2024 11:03:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[menu_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[link] [nvarchar](50) NULL,
	[icon] [nvarchar](50) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuRole]    Script Date: 7/8/2024 11:03:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuRole](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[menu_id] [int] NOT NULL,
 CONSTRAINT [PK_MenuRole] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionAnswer]    Script Date: 7/8/2024 11:03:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionAnswer](
	[id] [int] NOT NULL,
	[quizz_id] [int] NULL,
	[main_id] [int] NOT NULL,
	[sub_id] [int] NOT NULL,
	[create_dt] [datetime] NULL,
	[update_dt] [datetime] NULL,
 CONSTRAINT [PK_QuestionAnswer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionType]    Script Date: 7/8/2024 11:03:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionType](
	[type_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [nvarchar](255) NULL,
	[time_limit] [time](7) NULL,
	[create_dt] [datetime] NULL,
	[update_dt] [datetime] NULL,
 CONSTRAINT [PK_QuestionType] PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizzReport]    Script Date: 7/8/2024 11:03:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizzReport](
	[quizz_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[mark] [int] NULL,
	[time] [int] NULL,
	[create_dt] [datetime] NULL,
	[type_id] [int] NULL,
 CONSTRAINT [PK_QuizzReport] PRIMARY KEY CLUSTERED 
(
	[quizz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/8/2024 11:03:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubQuestion]    Script Date: 7/8/2024 11:03:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubQuestion](
	[sub_id] [int] IDENTITY(1,1) NOT NULL,
	[main_id] [int] NOT NULL,
	[sub_content] [nvarchar](255) NULL,
	[is_answer] [bit] NULL,
	[create_dt] [datetime] NULL,
	[update_dt] [datetime] NULL,
 CONSTRAINT [PK_SubQuestion] PRIMARY KEY CLUSTERED 
(
	[sub_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([user_id], [email], [password], [dob], [first_name], [last_name], [create_dt], [update_dt], [role_id]) VALUES (1, N'hungle692002@gmail.com', N'123', CAST(N'2002-06-09' AS Date), N'Hung', N'Le', CAST(N'2024-07-07T00:00:00.000' AS DateTime), CAST(N'2024-07-07T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Account] ([user_id], [email], [password], [dob], [first_name], [last_name], [create_dt], [update_dt], [role_id]) VALUES (2, N'hungle@gmail.com', N'123', CAST(N'2024-07-01' AS Date), N'Hung', N'Le', CAST(N'2024-07-07T21:53:28.710' AS DateTime), CAST(N'2024-07-07T21:53:28.710' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[MainQuestion] ON 

INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (2, N'Phần của đường bộ được sử dụng cho các phương tiện giao thông qua lại là gì?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (3, N'“Phương tiện tham gia giao thông đường bộ” gồm những loại nào?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (4, N' Sử dụng rượu bia khi lái xe, nếu bị phát hiện thì bị xử lý như thế nào?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (5, N'Bạn đang lái xe phía trước có một xe cứu thương đang phát tín hiệu ưu tiên bạn có được phép vượt hay không?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (6, N'Hành vi sử dụng xe mô tô để kéo, đẩy xe mô tô khác bị hết xăng đến trạm mua xăng có được phép hay không?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (7, N'Biển báo hiệu hình tròn có nền xanh lam có hình vẽ màu trắng là loại biển gì dưới đây?', 1, 1, N'image/A1/6.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (8, N'Bạn đang lái xe trong khu vực đô thị từ 22 giờ đến 5 giờ sáng hôm sau và cần vượt một xe khác, bạn cần báo hiệu như thế nào để đảm bảo an toàn giao thông?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (9, N'Người điều khiển phương tiện tham gia giao thông trong hầm đường bộ ngoài việc phải tuân thủ các quy tắc giao thông còn phải thực hiện những quy định nào dưới đây?', 1, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (10, N'Trên đoạn đường hai chiều không có giải phân cách giữa, người lái xe không được vượt xe khác trong các trường hợp nào dưới đây?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (11, N'Khi điều khiển xe chạy với tốc độ dưới 60 km/h, để đảm bảo khoảng cách an toàn giữa hai xe, người lái xe phải điều khiển xe như thế nào?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (12, N'Để báo hiệu cho xe phía trước biết xe mô tô của bạn muốn vượt, bạn phải có tín hiệu như thế nào dưới đây?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (13, N'Khi điều khiển xe mô tô tay ga xuống đường dốc dài, độ dốc cao, người lái xe cần thực hiện các thao tác nào dưới đây để đảm bảo an toàn?', 1, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (14, N'Tay ga trên xe mô tô hai bánh có tác dụng gì trong các trường hợp dưới đây?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (15, N'Biển nào cấm xe rẽ trái?', 0, 1, N'image/A1/14.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (16, N'Biển nào dưới đây các phương tiện không được phép đi vào?', 0, 1, N'image/A1/15.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (17, N'Biển nào xe mô tô hai bánh không được đi vào?', 0, 1, N'image/A1/16.jpeg', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (18, N'Biển nào báo hiệu nguy hiểm giao nhau với đường sắt?', 0, 1, N'image/A1/17.jpeg', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (19, N'Biển nào báo hiệu “Đường giao nhau” của các tuyến đường cùng cấp?', 0, 1, N'image/A1/18.jpeg', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (20, N'Biển nào chỉ dẫn nơi bắt đầu đoạn đường dành cho người đi bộ?', 1, 1, N'image/A1/19.jpeg', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (21, N'Biển nào dưới đây báo hiệu hết cấm vượt?', 0, 1, N'image/A1/20.jpeg', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (22, N'Vạch kẻ đường nào dưới đây là vạch phân chia hai chiều xe chạy (vạch tim đường), xe không được lấn làn, không được đè lên vạch?', 0, 1, N'image/A1/21.jpeg', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (23, N'Xe nào được quyền đi trước trong trường hợp này?', 0, 1, N'image/A1/22.jpeg', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (24, N'Xe tải kéo mô tô ba bánh như hình này có đúng quy tắc giao thông không?', 0, 1, N'image/A1/23.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (25, N'Theo hướng mũi tên, những hướng nào xe mô tô được phép đi?', 0, 1, N'image/A1/24.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (26, N'Các xe đi theo hướng mũi tên, xe nào vi phạm quy tắc giao thông?', 0, 1, N'image/A1/25.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (27, N'“Làn đường” là gì?', 1, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (28, N'“Người tham gia giao thông đường bộ” gồm những đối tượng nào?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (29, N'Theo Luật phòng chống tác hại của rượu, bia, đối tượng nào dưới đây bị cấm sử dụng rượu bia khi tham gia giao thông?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (30, N'Người điều khiển xe mô tô hai bánh, ba bánh, xe gắn máy có được phép sử dụng xe để kéo hoặc đẩy các phương tiện khác khi tham gia giao thông không?', 1, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (31, N'Hành vi vận chuyển đồ vật cồng kềnh bằng xe mô tô, xe gắn máy khi tham gia giao thông có được phép hay không?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (32, N'Biển báo hiệu hình chữ nhật hoặc hình vuông hoặc hình mũi tên nền xanh lam là loại biển gì dưới đây?', 0, 1, N'image/A1/31.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (33, N'Khi điều khiển xe chạy trên đường biết có xe sau xin vượt nếu đủ điều kiện an toàn người lái xe phải làm gì?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (34, N'Người ngồi trên xe mô tô 2 bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?', 1, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (35, N'Người lái xe mô tô xử lý như thế nào khi cho xe mô tô phía sau vượt?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (36, N'Người lái xe phải giảm tốc độ thấp hơn tốc độ tối đa cho phép đến mức cần thiết, chú ý quan sát và chuẩn bị sẵn sàng những tình huống có thế xảy ra để phòng ngừa tai nạn trong các trường hợp nào dưới đây?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (37, N'Người điều khiển xe mô tô phải giảm tốc độ và hết sức thận trọng khi qua những đoạn đường nào dưới đây?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (38, N'Khi quay đầu xe, người lái xe cần phải quan sát và thực hiện các thao tác nào để đảm bảo an toàn giao thông?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (39, N'Gương chiếu hậu của xe mô tô hai bánh, có tác dụng gì trong các trường hợp dưới đây?', 0, 1, N'', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (40, N'Khi gặp biển nào xe được rẽ trái?', 0, 1, N'image/A1/39.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (41, N'Khi gặp biển nào xe ưu tiên theo luật định vẫn phải dừng lại?', 0, 1, N'image/A1/40.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (42, N'Biển báo nào báo hiệu bắt đầu đoạn đường vào phạm vi khu dân cư, các phương tiện tham gia giao thông phải tuân theo các quy định đi đường được áp dụng ở khu đông dân cư?', 0, 1, N'image/A1/41.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (43, N'Biển nào báo hiệu Đường sắt giao nhau với đường bộ không có rào chắn?', 0, 1, N'image/A1/42.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (44, N'Biển nào báo hiệu “Đường đôi”?', 1, 1, N'image/A1/43.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (45, N'Biển báo này có ý nghĩa gì?', 1, 1, N'image/A1/44.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (46, N'Trong các biển dưới đây biển nào là biển “Hết mọi lệnh cấm”?', 0, 1, N'image/A1/45.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (47, N'Vạch kẻ đường nào dưới đây là vạch phân chia hai chiều xe chạy (vạch tim đường)?', 0, 1, N'image/A1/46.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (48, N'Theo tín hiệu đèn, xe nào được phép đi?', 0, 1, N'image/A1/47.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (49, N'Xe nào được quyền đi trước trong trường hợp này?', 0, 1, N'image/A1/48.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (50, N'Trong trường hợp này, thứ tự xe đi như thế nào là đúng quy tắc giao thông?', 0, 1, N'image/A1/49.png', NULL, NULL)
INSERT [dbo].[MainQuestion] ([main_id], [main_content], [is_required], [type_id], [images], [create_dt], [update_dt]) VALUES (51, N'Các xe đi theo hướng mũi tên, xe nào chấp hành đúng quy tắc giao thông?', 1, 1, N'image/A1/50.png', NULL, NULL)
SET IDENTITY_INSERT [dbo].[MainQuestion] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([menu_id], [name], [link], [icon]) VALUES (1, N'Home', N'/', N'bi-house-door-fill-nav-menu')
INSERT [dbo].[Menu] ([menu_id], [name], [link], [icon]) VALUES (2, N'Question List', N'/List', N'bi-list-ul')
INSERT [dbo].[Menu] ([menu_id], [name], [link], [icon]) VALUES (3, N'Test', N'/Quiz', N'bi-book')
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuRole] ON 

INSERT [dbo].[MenuRole] ([id], [role_id], [menu_id]) VALUES (1, 2, 1)
INSERT [dbo].[MenuRole] ([id], [role_id], [menu_id]) VALUES (2, 2, 2)
INSERT [dbo].[MenuRole] ([id], [role_id], [menu_id]) VALUES (3, 2, 3)
SET IDENTITY_INSERT [dbo].[MenuRole] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionType] ON 

INSERT [dbo].[QuestionType] ([type_id], [type_name], [time_limit], [create_dt], [update_dt]) VALUES (1, N'Moto Bike', CAST(N'20:00:00' AS Time), CAST(N'2024-07-07T23:58:43.613' AS DateTime), CAST(N'2024-07-07T23:58:46.693' AS DateTime))
INSERT [dbo].[QuestionType] ([type_id], [type_name], [time_limit], [create_dt], [update_dt]) VALUES (2, N'Car', CAST(N'20:00:00' AS Time), CAST(N'2024-07-07T23:59:12.103' AS DateTime), CAST(N'2024-07-07T23:59:14.480' AS DateTime))
SET IDENTITY_INSERT [dbo].[QuestionType] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'ADMIN')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'USER')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[SubQuestion] ON 

INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (8, 2, N'1. Phần mặt đường và lề đường.
', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (10, 2, N'2- Phần đường xe chạy.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (11, 2, N'3- Phần đường xe cơ giới.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (12, 3, N'1- Phương tiện giao thông cơ giới đường bộ.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (13, 3, N'2- Phương tiện giao thông thô sơ đường bộ và xe máy chuyên dùng.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (14, 3, N'3- Cả ý 1 và ý 2.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (15, 4, N'1- Chỉ bị nhắc nhở.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (16, 4, N'2- Bị xử phạt hành chính hoặc có thể bị xử lý hình sự tùy theo mức độ vi phạm.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (17, 4, N'3- Không bị xử lý hình sự.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (18, 5, N'1- Không được vượt.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (19, 5, N'2- Được vượt khi đang đi trên cầu.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (20, 5, N'3- Được phép vượt khi đi qua nơi giao nhau có ít phương tiện cùng tham gia giao thông.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (21, 5, N'4- Được vượt khi đảm bảo an toàn.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (22, 6, N'1- Chỉ được kéo nếu đã nhìn thấy trạm xăng.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (23, 6, N'2- Chỉ được thực hiện trên đường vắng phương tiện cùng tham gia giao thông.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (24, 6, N'3- Không được phép.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (25, 7, N'1- Biển báo nguy hiểm.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (26, 7, N'2- Biển báo cấm.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (27, 7, N'3- Biển báo hiệu lệnh phải thi hành.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (28, 7, N'4- Biển báo chỉ dẫn.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (29, 8, N'1- Phải báo hiệu bằng đèn hoặc còi;', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (30, 8, N'2- Chỉ được báo hiệu bằng còi.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (31, 8, N'3- Phải báo hiệu bằng cả còi và đèn.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (32, 8, N'4- Chỉ được báo hiệu bằng đèn.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (33, 9, N'1- Xe cơ giới, xe máy chuyên dùng phải bật đèn; xe thô sơ phải bật đèn hoặc có vật phát sáng báo hiệu; chỉ được dừng xe, đỗ xe ở nơi quy định.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (34, 9, N'2- Xe cơ giới phải bật đèn ngay cả khi đường hầm sáng; phải cho xe chạy trên một làn đường và chỉ chuyển làn ở nơi được phép; được quay đầu xe, lùi xe khi cần thiết.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (35, 9, N'3- Xe máy chuyên dùng phải bật đèn ngay cả khi đường hầm sáng; phải cho xe chạy trên một làn đường và chỉ chuyển làn ở nơi được phép; được quay đầu xe, lùi xe khi cần thiết.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (36, 10, N'1- Xe bị vượt bất ngờ tăng tốc độ và cố tình không nhường đường.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (37, 10, N'2- Xe bị vượt giảm tốc độ và nhường đường.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (38, 10, N'3- Phát hiện có xe đi ngược chiều.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (39, 10, N'4- Cả ý 1 và ý 3.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (40, 11, N'1- Chủ động giữ khoảng cách an toàn phù hợp với xe chạy liền trước xe của mình.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (41, 11, N'2- Đảm bảo khoảng cách an toàn theo mật độ phương tiện, tình hình giao thông thực tế.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (42, 11, N'3- Cả ý 1 và ý 2.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (43, 12, N'1- Ra tín hiệu bằng tay rồi cho xe vượt qua.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (44, 12, N'2- Tăng ga mạnh để gây sự chú ý rồi cho xe vượt qua.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (45, 12, N'3- Bạn phải có tín hiệu bằng đèn hoặc còi.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (46, 13, N'1- Giữ tay ga ở mức độ phù hợp, sử dụng phanh trước và phanh sau để giảm tốc độ.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (47, 13, N'2- Nhả hết tay ga, tắt động cơ, sử dụng phanh trước và phanh sau để giảm tốc độ.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (48, 13, N'3- Sử dụng phanh trước để giảm tốc độ kết hợp với tắt chìa khóa điện của xe.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (49, 14, N'1- Để điều khiển xe chạy về phía trước.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (50, 14, N'2- Để điều tiết công suất động cơ qua đó điều khiển tốc độ của xe.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (51, 14, N'3- Để điều khiển xe chạy lùi.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (52, 14, N'4- Cả ý 1 và ý 2.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (53, 15, N'1- Biển 1.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (54, 15, N'2- Biển 2.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (55, 15, N'3- Cả hai biển.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (56, 16, N'1-Biển 1.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (57, 16, N'2-Biển 2.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (58, 16, N'3-Biển 1 và 2.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (59, 17, N'1-Biển 1.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (60, 17, N'2-Biển 2.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (61, 17, N'3-Biển 3', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (62, 18, N'1-Biển 1 và 2.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (63, 18, N'2-Biển 1 và 3.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (64, 18, N'3-Biển 2 và 3.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (65, 18, N'4-Cả ba biển.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (66, 19, N'1-Biển 1.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (67, 19, N'2-Biển 2.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (68, 19, N'3-Biển 3', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (69, 20, N'1-Biển 1.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (70, 20, N'2-Biển 2.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (71, 20, N'3-Biển 3', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (72, 21, N'1-Biển 1.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (73, 21, N'2-Biển 2.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (74, 21, N'3-Biển 3', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (75, 21, N'4-Biển 2 và 3.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (76, 22, N'1-Vạch 1.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (77, 22, N'2-Vạch 2.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (78, 22, N'3-Vạch 3.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (79, 22, N'4-Cả 3 vạch.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (80, 23, N'1-Mô tô.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (81, 23, N'2-Xe cứu thương.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (82, 24, N'1-Đúng.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (83, 24, N'2-Không đúng.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (84, 25, N'1-Cả ba hướng.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (85, 25, N'2-Hướng 1 và 2.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (86, 25, N'3-Hướng 1 và 3.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (87, 25, N'4-Hướng 2 và 3.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (88, 26, N'1-Xe con, xe tải, xe khách.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (89, 26, N'2-Xe tải, xe khách, xe mô tô.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (90, 26, N'3-Xe khách, xe mô tô, xe con.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (91, 26, N'4-Xe khách, xe mô tô, xe con.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (92, 27, N'1-Là một phần của phần đường xe chạy được chia theo chiều dọc của đường, sử dụng cho xe chạy.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (93, 27, N'2-Là một phần của phần đường xe chạy được chia theo chiều dọc của đường, có bề rộng đủ cho xe chạy an toàn.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (94, 27, N'3-Là đường cho xe ô tô chạy, dừng, đỗ an toàn.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (95, 28, N'1-Người điều khiển, người sử dụng phương tiện tham gia giao thông đường bộ.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (96, 28, N'2-Người điều khiển, dẫn dắt súc vật; người đi bộ trên đường bộ.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (97, 28, N'3-Cả ý 1 và ý 2.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (98, 29, N'1-Người điều khiển: Xe ô tô, xe mô tô, xe đạp, xe gắn máy.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (99, 29, N'2-Người ngồi phía sau người điều khiển xe cơ giới.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (100, 29, N'3-Người đi bộ.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (101, 29, N'4-Cả ý 1 và ý 2.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (102, 30, N'1-Được phép.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (103, 30, N'2-Nếu phương tiện được kéo, đẩy có khối lượng nhỏ hơn phương tiện của mình.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (104, 30, N'3-Tuỳ trường hợp.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (105, 30, N'4-Không được phép.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (106, 31, N'1-Không được vận chuyển.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (107, 31, N'2-Chỉ được vận chuyển khi đã chằng buộc cẩn thận.', 0, NULL, NULL)
GO
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (108, 31, N'3-Chỉ được vận chuyển vật cồng kềnh trên xe máy nếu khoảng cách về nhà ngắn hơn 2 km.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (109, 32, N'1-Biển báo nguy hiểm.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (110, 32, N'2-Biển báo cấm.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (111, 32, N'3-Biển báo hiệu lệnh phải thi hành.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (112, 32, N'4-Biển báo chỉ dẫn.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (113, 33, N'1-Tăng tốc độ và ra hiệu cho xe sau vượt, không được gây trở ngại cho xe sau vượt.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (114, 33, N'2-Người điều khiển phương tiện phía trước phải giảm tốc độ, đi sát về bên phải của phần đường xe chạy cho đến khi xe sau đã vượt qua, không được gây trở ngại cho xe sau vượt.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (115, 33, N'3-Cho xe tránh về bên trái mình và ra hiệu cho xe sau vượt; nếu có chướng ngại vật phía trước hoặc thiếu điều kiện an toàn chưa cho vượt được phải ra hiệu cho xe sau biết; cấm gây trở ngại cho xe xin vượt.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (116, 34, N'1-Khi tham gia giao thông đường bộ.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (117, 34, N'2-Chỉ khi đi trên đường chuyên dùng; đường cao tốc.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (118, 34, N'3-Khi tham gia giao thông trên đường tỉnh lộ hoặc quốc lộ.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (119, 35, N'1-Nếu đủ điều kiện an toàn, người lái xe phải giảm tốc độ, đi sát về bên phải của phần đường xe chạy cho đến khi xe sau đã vượt qua, không được gây trở ngại đối với xe xin vượt.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (120, 35, N'2-Lái xe vào lề đường bên trái và giảm tốc độ để xe phía sau vượt qua, không được gây trở ngại đối với xe xin vượt.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (121, 35, N'3-Nếu đủ điều kiện an toàn, người lái xe phải tăng tốc độ, đi sát về bên phải của phần đường xe chạy cho đến khi xe sau đã vượt qua.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (122, 36, N'1-Gặp biển báo nguy hiểm trên đường.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (123, 36, N'2-Gặp biển chỉ dẫn trên đường.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (124, 36, N'3-Gặp biển báo hết mọi lệnh cấm.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (125, 36, N'4-Gặp biển báo hết hạn chế tốc độ tối đa cho phép.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (126, 37, N'1-Đường ướt, đường có sỏi cát trên nền đường.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (127, 37, N'2-Đường hẹp có nhiều điểm giao cắt từ hai phía.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (128, 37, N'3-Đường đèo dốc, vòng liên tục.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (129, 37, N'4-Tất cả các ý nêu trên.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (130, 38, N'1-Quan sát biển báo hiệu để biết nơi được phép quay đầu; quan sát kỹ địa hình nơi chọn để quay đầu; lựa chọn quỹ đạo quay đầu xe cho thích hợp; quay đầu xe với tốc độ thấp; thường xuyên báo tín hiệu để người, các phương tiện xung quanh được biết; nếu quay', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (131, 38, N'2-Quan sát biển báo hiệu để biết nơi được phép quay đầu; quan sát kỹ địa hình nơi chọn để quay đầu; lựa chọn quỹ đạo quay đầu xe; quay đầu xe với tốc độ tối đa; thường xuyên báo tín hiệu để người, các phương tiện xung quanh được biết; nếu quay đầu xe ở nơ', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (132, 39, N'1-Để quan sát an toàn phía bên trái khi chuẩn bị rẽ trái.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (133, 39, N'2-Để quan sát an toàn phía bên phải khi chuẩn bị rẽ phải.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (134, 39, N'3-Để quan sát an toàn phía sau cả bên trái và bên phải trước khi chuyển hướng.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (135, 39, N'4-Để quan sát an toàn phía trước cả bên trái và bên phải trước khi chuyển hướng.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (136, 40, N'1-Biển 1.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (137, 40, N'2-Biển 2.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (138, 40, N'3-Không biển nào.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (139, 41, N'1-Biển 1.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (140, 41, N'2-Biển 2.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (141, 41, N'3-Cả ba biển.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (142, 42, N'1-Biển 1.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (143, 42, N'2-Biển 2.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (144, 43, N'1-Biển 1 và 2.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (145, 43, N'2-Biển 1 và 3.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (146, 43, N'3-Biển 2 và 3.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (147, 43, N'4-Cả ba biển.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (148, 44, N'1-Biển 1.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (149, 44, N'2-Biển 2.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (150, 44, N'3-Biển 3.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (151, 45, N'1-Báo hiệu đường có ổ gà, lồi lõm.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (152, 45, N'2-Báo hiệu đường có gồ giảm tốc phía trước.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (153, 46, N'1-Biển 1.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (154, 46, N'2-Biển 2', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (155, 46, N'3-Biển 3.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (156, 46, N'4-Cả ba biển', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (157, 47, N'1-Vạch 1.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (158, 47, N'2-Vạch 2.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (159, 47, N'3-Vạch 3.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (160, 47, N'4-Vạch 1 và 3', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (161, 48, N'1-Xe con và xe khách.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (162, 48, N'2-Mô tô.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (163, 49, N'1-Xe con.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (164, 49, N'2-Xe mô tô.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (165, 50, N'1-Xe công an, xe quân sự, xe con + mô tô.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (166, 50, N'2-Xe quân sự, xe công an, xe con + mô tô.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (167, 50, N'3-Xe mô tô + xe con, xe quân sự, xe công an.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (168, 51, N'1-Xe tải, mô tô.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (169, 51, N'2-Xe khách, mô tô.', 1, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (170, 51, N'3-Xe tải, xe con.', 0, NULL, NULL)
INSERT [dbo].[SubQuestion] ([sub_id], [main_id], [sub_content], [is_answer], [create_dt], [update_dt]) VALUES (171, 51, N'4-Mô tô, xe con.', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SubQuestion] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[MainQuestion]  WITH CHECK ADD  CONSTRAINT [FK_MainQuestion_QuestionType] FOREIGN KEY([type_id])
REFERENCES [dbo].[QuestionType] ([type_id])
GO
ALTER TABLE [dbo].[MainQuestion] CHECK CONSTRAINT [FK_MainQuestion_QuestionType]
GO
ALTER TABLE [dbo].[MenuRole]  WITH CHECK ADD  CONSTRAINT [FK_MenuRole_Menu] FOREIGN KEY([menu_id])
REFERENCES [dbo].[Menu] ([menu_id])
GO
ALTER TABLE [dbo].[MenuRole] CHECK CONSTRAINT [FK_MenuRole_Menu]
GO
ALTER TABLE [dbo].[MenuRole]  WITH CHECK ADD  CONSTRAINT [FK_MenuRole_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[MenuRole] CHECK CONSTRAINT [FK_MenuRole_Role]
GO
ALTER TABLE [dbo].[QuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_QuestionAnswer_MainQuestion] FOREIGN KEY([main_id])
REFERENCES [dbo].[MainQuestion] ([main_id])
GO
ALTER TABLE [dbo].[QuestionAnswer] CHECK CONSTRAINT [FK_QuestionAnswer_MainQuestion]
GO
ALTER TABLE [dbo].[QuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_QuestionAnswer_QuizzReport] FOREIGN KEY([quizz_id])
REFERENCES [dbo].[QuizzReport] ([quizz_id])
GO
ALTER TABLE [dbo].[QuestionAnswer] CHECK CONSTRAINT [FK_QuestionAnswer_QuizzReport]
GO
ALTER TABLE [dbo].[QuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_QuestionAnswer_SubQuestion] FOREIGN KEY([sub_id])
REFERENCES [dbo].[SubQuestion] ([sub_id])
GO
ALTER TABLE [dbo].[QuestionAnswer] CHECK CONSTRAINT [FK_QuestionAnswer_SubQuestion]
GO
ALTER TABLE [dbo].[QuizzReport]  WITH CHECK ADD  CONSTRAINT [FK_QuizzReport_Account] FOREIGN KEY([user_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[QuizzReport] CHECK CONSTRAINT [FK_QuizzReport_Account]
GO
ALTER TABLE [dbo].[QuizzReport]  WITH CHECK ADD  CONSTRAINT [FK_QuizzReport_QuestionType] FOREIGN KEY([type_id])
REFERENCES [dbo].[QuestionType] ([type_id])
GO
ALTER TABLE [dbo].[QuizzReport] CHECK CONSTRAINT [FK_QuizzReport_QuestionType]
GO
ALTER TABLE [dbo].[SubQuestion]  WITH CHECK ADD  CONSTRAINT [FK_SubQuestion_MainQuestion] FOREIGN KEY([main_id])
REFERENCES [dbo].[MainQuestion] ([main_id])
GO
ALTER TABLE [dbo].[SubQuestion] CHECK CONSTRAINT [FK_SubQuestion_MainQuestion]
GO
USE [master]
GO
ALTER DATABASE [PRN231_Final_Project] SET  READ_WRITE 
GO
