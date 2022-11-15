USE [master]
GO
/****** Object:  Database [DBToeicAsp]    Script Date: 11/15/2022 4:16:51 PM ******/
CREATE DATABASE [DBToeicAsp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBToeicAsp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBToeicAsp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBToeicAsp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBToeicAsp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBToeicAsp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBToeicAsp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBToeicAsp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBToeicAsp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBToeicAsp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBToeicAsp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBToeicAsp] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBToeicAsp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBToeicAsp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBToeicAsp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBToeicAsp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBToeicAsp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBToeicAsp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBToeicAsp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBToeicAsp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBToeicAsp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBToeicAsp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBToeicAsp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBToeicAsp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBToeicAsp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBToeicAsp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBToeicAsp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBToeicAsp] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DBToeicAsp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBToeicAsp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBToeicAsp] SET  MULTI_USER 
GO
ALTER DATABASE [DBToeicAsp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBToeicAsp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBToeicAsp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBToeicAsp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBToeicAsp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBToeicAsp] SET QUERY_STORE = OFF
GO
USE [DBToeicAsp]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/15/2022 4:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 11/15/2022 4:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[idComment] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NULL,
	[status] [int] NOT NULL,
	[parent] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[idPost] [int] NOT NULL,
	[created] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Comments] PRIMARY KEY CLUSTERED 
(
	[idComment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 11/15/2022 4:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[idCourse] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[image] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[view] [int] NOT NULL,
	[status] [int] NOT NULL,
	[created] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Courses] PRIMARY KEY CLUSTERED 
(
	[idCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distances]    Script Date: 11/15/2022 4:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distances](
	[idDistance] [int] IDENTITY(1,1) NOT NULL,
	[fromPoint] [int] NOT NULL,
	[point] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[status] [int] NOT NULL,
	[created] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Distances] PRIMARY KEY CLUSTERED 
(
	[idDistance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 11/15/2022 4:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[idDocument] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[image] [nvarchar](max) NULL,
	[fileName] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[status] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[created] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Documents] PRIMARY KEY CLUSTERED 
(
	[idDocument] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyTargets]    Script Date: 11/15/2022 4:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyTargets](
	[idMyTarget] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[deadline] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[status] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[idTarget] [int] NOT NULL,
	[created] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.MyTargets] PRIMARY KEY CLUSTERED 
(
	[idMyTarget] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 11/15/2022 4:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[idPost] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[image] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[status] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[created] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED 
(
	[idPost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/15/2022 4:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[idProduct] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[image] [nvarchar](255) NULL,
	[point] [int] NOT NULL,
	[status] [int] NOT NULL,
	[created] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[idProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/15/2022 4:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[idRole] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[idRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Targets]    Script Date: 11/15/2022 4:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Targets](
	[idTarget] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[point] [int] NOT NULL,
	[status] [int] NOT NULL,
	[created] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Targets] PRIMARY KEY CLUSTERED 
(
	[idTarget] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/15/2022 4:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[fullName] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[phoneNumber] [nvarchar](255) NULL,
	[point] [int] NOT NULL,
	[status] [int] NOT NULL,
	[idRole] [int] NOT NULL,
	[created] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202211131529380_new', N'ToeicAspMVC.Migrations.Configuration', 0x1F8B0800000000000400ED1DDB6EE3BAF1BD40FF41D0535BEC89932C0ED006F639D83ABB45704E36419C5DF46DC148B423541757979C0445BFAC0FFDA4FE42295114EF3229C9B29C0DF665436A8643CE85C31972FCBFFFFC77FEF373143A4F30CD82245EB86727A7AE03632FF18378B3708B7CFDC39FDD9F7FFAFDEFE61FFDE8D9F94ABE7B5F7E8720E36CE13EE6F9F66236CBBC471881EC240ABC34C992757EE225D10CF8C9ECFCF4F42FB3B3B31944285C84CB71E677459C0711ACFE407F2E93D883DBBC00E175E2C330ABDB51CFAAC2EA7C0611CCB6C0830BF73E8181F721DB5E7F5D9EE0AF5DE743180044C90A866BD701719CE42047745E7CC9E02A4F9378B3DAA20610DEBF6C21FA6E0DC20CD6F45FD0CF4DA7727A5E4E654601092AAFC8F224B24478F6BE5E9B9908DE6985DD66EDD0EA7D44AB9CBF94B3AE5670E12E93288271EE3AE25817CB302DBF53ADEF490DF5CE61FADE35C28064A6FCF7CE5916615EA47011C3224F41F8CEB92D1EC2C0FB05BEDC27FF80F1222EC290250F1188FAB806D4749B265B98E62F77705D131DF80DD9331E7C26C237D032289EDD559CBF3F779DCF8814F010C24616989558E5490AFF066398821CFAB720CF618A5879E5C36A3525228421BD24CE990191FC2155729D6BF0FC2B8C37F9E3C245FF759D4FC133F4494B4DC49738409A8780F2B480BBC6C910B945B66B5EED38B62035589B761C818FB42CED8BE336C97AD2E1A5B0E4D7F0EBFE193C059B4A34841131CD7730AC3AB3C7608B4DD049D9F1AD163CC4A14F6912DD25610DD1747CBB07E90696B34E54BDABA4483D0B6A301714D4941D4A6AB80E891ABE5745CD7C46ED4BABD5C10B6565724A90C3D91B4CB0BDB13191E2E12C0DFA26842DF27EFEE38F46F26EABAC11D8B40D3B8C793B26333A84091CDF7C5193D0DD8411B3A03661C4A40C63C24ADCB2FDAA5AD5C60B77F5B25C98222BCB55821CCE726182ED2D9789000F67B9901B1B84E35BAE35FABCFCDFF8236F4196FD96A46DEABDAF911F93187E2EA207CADF1E83EF182B09FA7A93C398E3D208BC2A736CE8C389E658EDE19952749978859E24D2FB0D9B0E4A12D7215966BED7D6C9BD7EC1F8D424915E8924AE432289EFB525A9DE96BAEC5A4A76F11B9A291558E21544941DD5C4382268ABB41A4C57AFAD9330DA72FB246087DB4229E1F6DB28851D6B2B8D0FB29F8D7306580721DCB15FBF1D368E6377D3BAF686DB88682AD59B4C274345CCBFA5A1226087335494707B4345615FB7A1F221F0C3207E3321C3876CCD04686A868850AD3045B517C8F898D41A897D92DB247D3058FCD6D0AB152DA4DAE7ED64213BD9C7435BC7EEB6F1FBB08C1339AC8F6F01DACF90564640D439AD95E8A476F84C67A57425C8E1540E136CAF7026E19AA353B75643AF96BD9D677551DE14C7F84E92B64478335B59C34087BC148089EE72270043BE3289B33CA3EFCDE3CEBC34D8E20B2C7B76869F02F8DB6BDDC2CC036D019A44ECD9AA2F013B60A0AD21BC43A0AD811D4B89D7C820DFF6F7990670BBC6D4B057A01F881ABFF0AC2FA060A803DE41216477B8864240DF36B85793D41C57893E6459E205956C30692E9A81E449FD18FB4EEBED104C32B95782A8465A136C919EA0A117EE9934771D42FE645E216CEE77F238FF24E144BA05CBDB8E010897C8EB46DA8AF82A2B62107BC116846DF311802CEE90950BDE0C21F65CC22D8C4B856B9B7ABFB19B210493B26B6DE6334620DAE584CF54EBD8AA495B53B6E25897B99C68EE328E2527CAF998F14A7563C74A4E9453EF37F60872C2E77D746CD52481285B69C275175F754815B262267C9D044539F64882A25CCCC90B8A1490D3B1551F9DA39C25CC36372CFAC03FC54A93697B312EBA8999B14E1D07B7121CDD1AF4256004E9E193273A266B32295D38AC433AAE99518E3D9299512EE6E4CD0C7359ABD5C7106E6EF5F45884DBCBED7EF290BE0A378D311D156EC693970A2622AFE3A32A3C4FF988531BE652A1BA98D72E630349853C0D33E6A8723E565221CFB8DFC0834B053E2123981C41C094B8257558A86C87CFAAE8129A531D60CAEAA3B7C8F412EF0AE6CD0D1272BD979EC9C5C38B24373C8A2DBE6C2AC12BDF3389C0054E3C49C0CA270522B04FEF0A4B08B4172A4524114DBA4A48B4979D4424B9168521821409960A5C99DD949958A696D43C54A6ABA485AC03DBCA85D405CC2539C00140A52868C28A8CF0533CC22B20E61BE53321511777C5851AB21BC995D4795724884141F5478C98F2733398B770DD5E9E774B94C320CEC1105D2B5DCBBCD5918DFDCC5BB88C29CFBBE5D46E706E678866EC45CBDCD527F55DCBD761E2F2AD0F79EEED0751B3A328437A63A75AE6AF3D7C327818A3D97B1984AB66F21AB41CA70C0E5426541B1CA1F6C07FF6A98646DB1567835DA7037B3DE7CF03BBEC638789B2574CE489EADCDD5D0E2F4368BD7BB64C54E1E2F6E028C96034FE59D3379FE1E22175C37CA6A93232BF06DB6D106F98AA23758BB3C22547963FACEC6B714418C7CCE3D652F4269B91F224051B28F49637737CF82948B3FC12E4E001940EC4D28FA4CF446F54E31E90D1048753E615711A0840F97FDEEF95CB8328FCF61AFC139A5AF945354BC8305B0BE994955F4008527D3D8F651216512C358B82A7C7D5DCD86631358DE67848768F4543DACCB190521C2C16D2668E851C96F9C5511FA0DBB0E003038F459D546A595F92B1E4D69734CA78E633415CA4A39D2497829110E5DC480BB61ABB6EA502D5DAD8CBBF1A6CBF6CA9AB46B048EA260B01C199778E10DC74ACEA378CE21C89C8179A1DDE4AE4551EA081C8ABC1F6CB96BADC008BA46E32C7416B07B06868AB8DA527B500785B4F5A2D30B16FFB39646C87053E7CD585C3849BC657471C6DE1F9AE0EF9E9B11C893AD2B3704F956C026DF66AA907D5B388C6F57836E9E27D6DD86249B5624BB51A624FA20F8E39256F5ADF76B72350A7A8254063A54E4DC8D95E9DF4A07A16D10837CF265DE4BB0D5B7F75A20F67592CB4F5FB56057AAB81C763CFA92351AA7C1895EAAC50F6EA341483FAABD274DCAA2311361C43EC296A95B3682F686AB0FDFAA9E62276208690AC66EF40619502ED12275403B6850971B6558C12AA72B0C3B0669F7E29F7E287DF8F990E737CF8DD1C8B08B7BCD923F501ADC9C9F73DA091047E87039A16B4E580D6DC17100E689A7B046DD898E76FDCD988368FBB210EAD12DF954037F743FA86BDEBCB241D22DF3AC896E037B9B922C4BFD5175ADA704DC3A8BFB9854AA99512BAE227CDE8754BF37793D0AD93A9BB7F4B42CAAEE24F5C072DD053E09799D5D54B96C3E8A4FCE064F5CF701906D5B1957C700DE2600DB31CBFF674CF4FCFCE859FA398CE4F43CCB2CC0F15C968AE108422213BFEAF34545AB0F34DAAED0B4ABE4257FC0452EF11A47F88C0F31F5964F6CFA22B727BFDF442170C7C15AF405969F32AF6E1F3C2FD570572E15CFDFD1B867AE7DCA4487A2F9C53E7DF3D7FADC17C605CD3BFC7C0C21B580B0EDAFD544127E91FE23703F622F7DCCF049035931F4AF7797CDD4B97A6A59707D3AA11845BF1066AC4B2F27B116EAE92FC60C22D168A1F0CB158077E38C472997713DCD60510BAA8D4104AC9960833574A5C0E6DDA4AA9CEBC1EA258F55E1434DE871A0DB7F98825A6DF76B2A3D8C9D4F9D543144E3E1EA5114B21BF89FA1047218534180D4DCAE34E5BCFFA68D95005788F47C326E0298D2013728674CCFAB0539506DB5AAB1D236CC3943C9DEA221A7A7A036C855205C55E3B185B87F4D5EABD3A037988629F7B115FA9BE67A7A86E5F04434BE65148963219387E9DCC576C158F24CE33BCACF52964D9AB70A590D11AA956E558B529F54F3E6D869B5439CA5EC59CC6E7B6E6F99569F07E8FDC9E7C51C9DEDC1603A796952827CFEF9677441363B86571C89EB520C5D8DF78C51FC7ABF5D8F2E8C56EC4C91477ECADEE8760FB98EA6EC9F2E91769ECC56D23CFEF08B96CE11E4EBFE062AF1A8B4622326059C5B12A295A48D3818B27CA556D445EF1F5EC1A579A1EF244271BDFDC5CB8FE4382788B8F894B5D6534113F567109396E5661BE55966312D162B992D0E26615DA2FCAE247225AEA694AA869970AFDA5AEE89A3404DDDDA42168976A886B6D35327108ED006DE84D9163F99650E36615E23B55D92A851CE228BA420C71875A0AEB9290BBD8DA443965B6365D4AB6D29291BBE49C04BC6451273D4A696FCA490AF8F75F3492AB0DA68923288EE10C90F656F261AB4272346A36DCB1263658D947FB8989B68C2F46D17F6A7B29ECC811AB3D01A90E100C9CFE12CAE1CA36DAF36FDF531BA830A3DDA48C0CCFE18A2F72A4693C39CBE90F5360517E77833CC702414738268F3CD62CD85014738433861EE73336DF5CC5EB84B8AE0245E413217B700D73E02387F2439A076BE0E5A81B6D8A59F53B595F4158A04F3E460FD0BF8A6F8A7C5BE468CA307A08B95F372B5DE0B6F1AB2A923CCDF39B2A5D970D3105446680A6006FE2BF1641E837747F525C38D0A0287DEB3A7F55F2322FF3589B9706D3E744ACDEA143542F5F7324B887D13644C8B29B78059E6017DA90E8FD0A37C07B21CFA7F4487633825FF6F96500362988B21A0785477F2219F6A3E79FFE0F2E70CAB8F0980000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([idCourse], [name], [image], [description], [view], [status], [created]) VALUES (2, N'ĐẦU RA 450 - 550+ TOEIC', N'638041247919178013images (1).jpg', N'<ul>
	<li>Mất gốc lấy lại căn bản, tạo cảm hứng</li>
	<li>Trải qua 3 kh&oacute;a học: Basic TOEIC, Pre TOEIC v&agrave; TOEIC A</li>
	<li>Đạt 450 - 500 điểm sau 5,5 th&aacute;ng</li>
	<li>Học lại MIỄN PH&Iacute; nếu học vi&ecirc;n kh&ocirc;ng đạt điểm đầu ra</li>
</ul>
', 12, 1, N'11/14/2022 11:06:06 PM')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Distances] ON 

INSERT [dbo].[Distances] ([idDistance], [fromPoint], [point], [description], [status], [created]) VALUES (2, 250, 500, N'<p style="text-align:justify"><span style="font-size:16px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><strong>Người mất gốc hoặc mới bắt đầu học TOEIC c&oacute; thể tự học từ con số 0 đến 500+ điểm TOEIC trong thời gian 2 - 3 th&aacute;ng kh&ocirc;ng? H&atilde;y đọc b&agrave;i viết dưới đ&acirc;y để t&igrave;m cho m&igrave;nh c&acirc;u trả lời nh&eacute;!</strong></span></span></span></span></p>

<div id="content_menu" style="border:1px solid #cccccc; margin-bottom:10px; padding:10px; text-align:justify">
<div class="menu_content" style="padding:0px">
<p><span style="font-size:14px"><span style="background-color:#f3f7fa"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><strong><span style="font-size:18px"><strong>Nội dung:</strong></span></strong></span></span></span></span></p>

<p><span style="font-size:14px"><span style="background-color:#f3f7fa"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><a class="menu_content_scroll" href="https://www.anhngumshoa.com/tin-tuc/lo-trinh-luyen-thi-toeic-hoc-toeic-muc-tieu-250-500-34805.html#h2title_0" style="box-sizing:border-box; padding:0px; text-decoration:none; color:darkred; transition:all 0.5s ease 0s; font-size:16px; font-weight:bold">&nbsp;I. TỔNG QUAN LỘ TR&Igrave;NH &Ocirc;N THI TOEIC TẠI NH&Agrave;</a></span></span></span></span></p>

<p><span style="font-size:14px"><span style="background-color:#f3f7fa"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><a class="menu_content_scroll" href="https://www.anhngumshoa.com/tin-tuc/lo-trinh-luyen-thi-toeic-hoc-toeic-muc-tieu-250-500-34805.html#h2title_1" style="box-sizing:border-box; padding:0px; text-decoration:none; color:darkred; transition:all 0.5s ease 0s; font-size:16px; font-weight:bold">II. LỘ TR&Igrave;NH TỰ HỌC V&Agrave; &Ocirc;N THI TOEIC TẠI NH&Agrave;&nbsp;TỪ MẤT GỐC ĐẾN 500 TOEIC</a></span></span></span></span></p>

<p><span style="font-size:14px"><span style="background-color:#f3f7fa"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><a class="menu_content_scroll" href="https://www.anhngumshoa.com/tin-tuc/lo-trinh-luyen-thi-toeic-hoc-toeic-muc-tieu-250-500-34805.html#h2title_2" style="box-sizing:border-box; padding:0px; text-decoration:none; color:darkred; transition:all 0.5s ease 0s; font-size:16px; font-weight:bold">III. B&Iacute; QUYẾT LUYỆN THI TOEIC TẠI NH&Agrave;</a></span></span></span></span></p>
</div>
</div>

<ul>
	<li><strong>&nbsp;Mất gốc học TOEIC như thế n&agrave;o?</strong></li>
	<li style="text-align:justify"><strong>N&ecirc;n bắt đầu học TOEIC từ đầu?</strong></li>
	<li style="text-align:justify"><strong>C&oacute; thể đạt được 500 TOEIC trong v&ograve;ng 2 - 3 th&aacute;ng kh&ocirc;ng?</strong></li>
</ul>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-size:14px">Đ&acirc;y l&agrave; những&nbsp;c&acirc;u hỏi bạn n&agrave;o mới &ocirc;n thi TOEIC tại nh&agrave;&nbsp;đều thắc mắc. C&acirc;u trả lời của c&ocirc; l&agrave; c&aacute;c bạn&nbsp;mất gốc ho&agrave;n to&agrave;n c&oacute; thể học TOEIC v&agrave; điều quan trọng đầu ti&ecirc;n c&aacute;c bạn&nbsp;h&atilde;y x&acirc;y dựng lộ tr&igrave;nh học &ocirc;n thi toeic tại nh&agrave; một c&aacute;ch&nbsp;khoa học, c&ugrave;ng với niềm đam m&ecirc; quyết t&acirc;m th&igrave; chắc chắn sẽ đạt được mục ti&ecirc;u như mong muốn.</span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff">V&agrave; b&acirc;y giờ ch&uacute;ng ta sẽ bắt tay v&agrave;o t&igrave;m hiểu lộ tr&igrave;nh tự học v&agrave; &ocirc;n thi toeic tại nh&agrave;&nbsp;mục ti&ecirc;u 500 nh&eacute;:</span></span></span></span></p>

<h2 style="text-align:justify"><span style="font-size:26px"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="color:#000000"><span style="background-color:#ffffff"><span style="font-size:20px"><strong><span style="color:#ff0000"><a id="Tổng quan về lộ trình" name="Tổng quan về lộ trình"></a>&nbsp;I. TỔNG QUAN LỘ TR&Igrave;NH &Ocirc;N THI TOEIC TẠI NH&Agrave;</span></strong></span></span></span></span></span></h2>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-size:14px">Mục ti&ecirc;u 200 - 500 TOEIC l&agrave; điểm mơ ước của c&aacute;c bạn&nbsp;<strong>&ldquo;<em>Beginners</em>&rdquo;</strong>. Đ&acirc;y l&agrave; giai đoạn đầu ti&ecirc;n khi c&aacute;c bạn bắt đầu học v&agrave; tiếp x&uacute;c với TOEIC, định h&igrave;nh hiểu được&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/cau-truc-de-thi-toeic-2019-full-7-phan-reading-listening-34842.html" rel="dofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff"><strong>cấu tr&uacute;c b&agrave;i thi TOEIC</strong></span></a>&nbsp;như thế n&agrave;o? C&oacute; thể n&oacute;i thời điểm bắt đầu lu&ocirc;n kh&oacute; khăn v&agrave; ho&agrave;n to&agrave;n rất dễ nản nhất, nếu kh&ocirc;ng quyết t&acirc;m c&aacute;c bạn sẽ dễ bỏ cuộc.&nbsp;</span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-size:14px"><span style="font-family:arial,helvetica,sans-serif">Ch&iacute;nh v&igrave; vậy, khi x&acirc;y dựng lộ tr&igrave;nh tự học TOEIC online cho những bạn bắt đầu, c&ocirc; đ&atilde; phải nghi&ecirc;n cứu rất kỹ, bởi rất nhiều bạn&nbsp;ngữ ph&aacute;p c&ograve;n yếu, vốn từ vựng kh&ocirc;ng nhiều, lại lười nghe.</span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff">Trong lộ tr&igrave;nh n&agrave;y, c&ocirc; đ&atilde; thiết kế th&agrave;nh 3 phần cụ thể:</span></span></span></span></p>

<ul>
	<li style="text-align:justify"><strong>Phần 1 -&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/toeic-listening-37628.html" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">TOEIC LISTENING</span></a></strong>: bao gồm 12 b&agrave;i học chia nhỏ theo từng Topic trong phần thi nghe&nbsp;</li>
	<li style="text-align:justify"><strong>Phần 2 -&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/toeic-reading-37630.html" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">TOEIC READING</span></a>:</strong>&nbsp;gồm 14 b&agrave;i học Ngữ ph&aacute;p cơ bản k&egrave;m theo c&aacute;c t&agrave;i liệu học Từ vựng TOEIC kinh điển</li>
	<li style="text-align:justify"><strong>Phần 3 -&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/thi-thu-toeic-online-nhu-that-mien-phi-co-diem-ngay-37347.html" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">LUYỆN ĐỀ</span>:</a></strong>&nbsp;tổng hợp c&aacute;c đề thi s&aacute;t nhất, mới nhất với đề thi TOEIC h&agrave;ng th&aacute;ng</li>
</ul>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-size:14px"><span style="font-family:arial,helvetica,sans-serif">C&ocirc; hi vọng&nbsp;lộ</span><strong>&nbsp;</strong><span style="font-family:arial,helvetica,sans-serif">tr&igrave;nh tự học TOEIC từ 200 - 500 m&agrave; c&ocirc; đ&atilde; x&acirc;y dựng sẽ gi&uacute;p c&aacute;c bạn&nbsp;ho&agrave;n to&agrave;n c&oacute; thể y&ecirc;n t&acirc;m tự học TOEIC tại nh&agrave; để đạt được kết quả tốt!</span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-size:14px"><span style="font-family:arial,helvetica,sans-serif">Để hỗ trợ học hiệu quả&nbsp;c&aacute;c bạn&nbsp;c&oacute; thể học kết hợp&nbsp;<strong><a href="https://www.anhngumshoa.com/tin-tuc/tai-lieu-toeic-can-thiet-cho-level-0-ndash-550-toeic-37108.html" rel="dofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff"><span style="background-color:#ffff00">BỘ T&Agrave;I LIỆU LUYỆN THI TOEIC LEVEL 0 + 550</span></span></a></strong>&nbsp;c&ugrave;ng với&nbsp;</span><strong><a href="https://www.anhngumshoa.com/tin-tuc/tat-tan-tat-1001-kenh-tu-hoc-toeic-online-mien-phi-37056.html" rel="dofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff"><span style="background-color:#ffff00">Tất tần tật &quot;NGUỒN T&Agrave;I LIỆU&quot; học TOEIC ONLINE miễn ph&iacute;</span></span></a>&nbsp;</strong><span style="background-color:#ffffff">c&ocirc; đ&atilde; bi&ecirc;n soạn sẵn.</span></span></span></span></span></span></p>

<div style="border-radius:8px; border:2px solid #1f7def; max-width:700px; padding:0px; text-align:justify">
<h3 style="text-align:center"><span style="font-size:17px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-size:32px"><span style="background-color:#1f7def"><span style="font-family:inherit"><strong><span style="color:#ffffff">GỢI &Yacute;</span></strong></span></span></span></span></span></span></span></h3>

<div style="padding:15px">
<p style="text-align:center"><span style="font-size:17px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-size:16px"><span style="color:#383838"><span style="font-family:arial,helvetica,sans-serif"><strong>Lộ tr&igrave;nh TOEIC mục ti&ecirc;u 450-550+ tại Anh Ngữ Ms Hoa</strong>&nbsp;sẽ gi&uacute;p bạn chinh phục&nbsp;TOEIC nhanh ch&oacute;ng&nbsp;v&agrave; dễ d&agrave;ng hơn chỉ từ 2- 4&nbsp;th&aacute;ng!</span></span></span></span></span></span></span></p>
</div>

<div style="margin-bottom:15px; padding:0px; text-align:center"><span style="font-size:17px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><a href="https://www.anhngumshoa.com/tin-tuc/khoa-hoc-toeic-450-500-cho-nguoi-mat-goc-tai-anh-ngu-ms-hoa-37381.html" rel="nofollow" style="box-sizing:border-box; padding:10px 25px; text-decoration:none; color:#ffffff; transition:all 0.5s ease 0s; background:#ff0000; display:inline-block; border-radius:35px; font-size:18px; line-height:1.5" target="_blank">T&igrave;m hiểu th&ecirc;m tại đ&acirc;y</a></span></span></span></span></div>
</div>

<h2 style="text-align:justify"><span style="font-size:26px"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="color:#000000"><span style="background-color:#ffffff"><span style="font-size:20px"><strong><span style="color:#ff0000"><a id="Lộ trình tự học TOEIC cho người mới bắt đầu" name="Lộ trình tự học TOEIC cho người mới bắt đầu"></a>II. LỘ TR&Igrave;NH TỰ HỌC V&Agrave; &Ocirc;N THI TOEIC TẠI NH&Agrave;&nbsp;TỪ MẤT GỐC ĐẾN 500 TOEIC</span></strong></span></span></span></span></span></h2>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-size:14px"><span style="font-family:arial,helvetica,sans-serif"><span style="color:#000000">Lộ tr&igrave;nh học TOEIC cho người bắt đầu được chia ra 2 kỹ năng Reading v&agrave; Listening:</span></span></span></span></span></span></span></p>

<h3 style="text-align:justify"><span style="font-size:20px"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="color:#222222"><span style="background-color:#ffffff"><span style="font-size:18px"><strong><span style="font-family:arial,helvetica,sans-serif">1. &Ocirc;N THI TOEIC TẠI NH&Agrave; - TOEIC LISTENING</span></strong></span></span></span></span></span></h3>

<div style="padding:0px; text-align:justify">
<p><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-size:16px"><span style="font-size:14px"><span style="font-family:arial,helvetica,sans-serif">Gồm 10 b&agrave;i l&iacute; thuy&ecirc;t v&agrave; luyện tập 4 dạng b&agrave;i trong thể thức thi. Từng dạng b&agrave;i sẽ c&oacute; những kĩ năng nghe ri&ecirc;ng biệt để gi&uacute;p bạn nghe hiểu dễ d&agrave;ng.&nbsp;</span></span></span></span></span></span></span></p>

<p><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff">C&aacute;c bạn c&oacute; thể r&egrave;n luyện v&agrave; cải thiện kỹ năng nghe của m&igrave;nh bằng rất nhiều c&aacute;ch, v&iacute; dụ như theo d&otilde;i c&aacute;c gameshow th&uacute; vị của c&aacute;c k&ecirc;nh truyền h&igrave;nh nổi tiếng sử dụng bằng tiếng anh của nước ngo&agrave;i, hoặc xem một bộ phim tiếng Anh c&oacute; k&egrave;m phụ đề tiếng Anh để kiểm tra xem bản th&acirc;n m&igrave;nh đ&atilde; nghe đ&uacute;ng hay kh&ocirc;ng,...</span></span></span></span></p>

<p><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff">Ngo&agrave;i ra c&aacute;c bạn cũng c&oacute; thể luyện nghe bằng c&aacute;c mẩu truyện tiếng Anh, n&oacute; sẽ hỗ trợ rất hữu &iacute;ch cho kỹ năng nghe n&oacute;i chung v&agrave; số điểm trong b&agrave;i thi nghe TOEIC của bạn n&oacute;i ri&ecirc;ng.</span></span></span></span></p>

<p><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff">Khi luyện nghe, c&aacute;c bạn c&oacute; thể vừa nghe vừa ch&eacute;p lại lời hội thoại m&agrave; bạn vừa nghe được để đối chiếu với đ&aacute;p &aacute;n nh&eacute;. Đ&acirc;y l&agrave; một trong những c&aacute;ch luyện nghe được nhiều &quot;cao thủ&quot; TOEIC khuy&ecirc;n &aacute;p dụng v&igrave; hiệu quả n&oacute; mang lại l&agrave; rất tuyệt vời.</span></span></span></span></p>
</div>

<div style="padding:0px; text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-size:14px"><span style="font-family:arial,helvetica,sans-serif">Với từng b&agrave;i học dưới&nbsp;c&aacute;c bạn&nbsp;h&atilde;y click v&agrave;o link dưới đ&acirc;y học nhớ l&agrave;m b&agrave;i tập đầy đủ sau mỗi b&agrave;i học nh&eacute;:</span></span></span></span></span></span></div>

<div style="padding:0px; text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff">&nbsp;</span></span></span></span></div>

<ul>
	<li><strong><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:14px"><em><u>Unit 1</u>:&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/unit-1-ky-nang-luyen-nghe-tranh-vat-trong-part-1-picture-description-34851.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">Pictures &ndash; (things)- Nghe Tranh về vật</span></a></em></span></span></strong></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 2</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:<a href="https://www.anhngumshoa.com/tin-tuc/unit-2-ky-nang-nghe-tranh-ve-nguoi-trong-part-1-picture-description-34853.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">&nbsp;Pictures- (People) - Nghe Tranh về người</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 3.1</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif"><a href="https://www.anhngumshoa.com/tin-tuc/unit-3-ky-nang-nghe-cau-hoi-where-trong-part-2-question-response-34852.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank">:</a>&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/unit-3-ky-nang-nghe-cau-hoi-where-trong-part-2-question-response-34852.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">Question response &ndash; What, when, Where, who</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 3.2</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/unit-4-ky-nang-nghe-cau-hoi-when-trong-part-2-question-response-34854.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">Question response &ndash;when</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 3.3</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:<a href="https://www.anhngumshoa.com/tin-tuc/unit-3-ky-nang-nghe-cau-hoi-where-trong-part-2-question-response-34852.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">&nbsp;Question response &ndash; Where</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 3.4</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:<a href="https://www.anhngumshoa.com/tin-tuc/unit-6-ky-nang-nghe-cau-hoi-who-trong-part-2-question-response-34856.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">&nbsp;Question response &ndash;who</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 4.1</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:<a href="https://www.anhngumshoa.com/tin-tuc/unit-7-ky-nang-nghe-cau-hoi-how-trong-part-2-question-response-34914.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">&nbsp;Question response &ndash; How</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 4.2</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:<a href="https://www.anhngumshoa.com/tin-tuc/unit-8-ky-nang-nghe-cau-hoi-why-trong-part-2-question-response-34915.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">&nbsp;Question response &ndash; Why</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 4.3</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/unit-11-ky-nang-nghe-cau-hoi-lua-chon-choice-question-trong-part-2-question-response-34918.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">Question response &ndash; Choice question</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 5.1</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:<a href="https://www.anhngumshoa.com/tin-tuc/unit-12-ky-nang-nghe-cau-hoi-statement-question-trong-part-2-question-response-34919.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">&nbsp;Question response &ndash; Statement,</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 5.2</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/unit-9-ky-nang-nghe-cau-hoi-yes-no-trong-part-2-question-response-listening-toeic-34916.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">Question response &ndash; Yes, No question</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 6</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/unit-13-mot-so-diem-can-luu-y-khi-luyen-nghe-toeic-part-3-short-conversation-34920.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">Short conversation &ndash; Listen to one-two questions</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 7</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:<a href="https://www.anhngumshoa.com/tin-tuc/unit-13-mot-so-diem-can-luu-y-khi-luyen-nghe-toeic-part-3-short-conversation-34920.html-25" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">&nbsp;Short conversation &ndash; Listen to three questions</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 8</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/unit-19-meo-lam-bai-nghe-chu-de-work-announcements-thong-bao-trong-cong-viec-ndash-part-4-short-talk-34969.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">Short talk-&nbsp;Work announcements</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 9</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:<a href="https://www.anhngumshoa.com/tin-tuc/unit-17-meo-lam-bai-nghe-chu-de-news-ndash-short-talk-34967.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">&nbsp;Short talk-&nbsp;News</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 10</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/unit-15-meo-lam-bai-nghe-chu-de-public-announcements-thong-bao-ndash-short-talk-34965.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">Short talk-&nbsp;Public Announcements&nbsp;</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 11</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/unit-15-meo-lam-bai-nghe-chu-de-public-announcements-thong-bao-ndash-short-talk-34965.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">Short talk -&nbsp;Advertisements, Radio Broadcasts</span></a></span></strong></em></span></li>
	<li><span style="font-size:14px"><em><u><strong><span style="font-family:arial,helvetica,sans-serif">Unit 12</span></strong></u><strong><span style="font-family:arial,helvetica,sans-serif">:&nbsp;<span style="color:#0000ff">Short talk - Report</span></span></strong></em></span></li>
</ul>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-size:14px"><span style="font-family:arial,helvetica,sans-serif">Ngo&agrave;i ra, c&aacute;c bạn&nbsp;sẽ cần download th&ecirc;m một số t&agrave;i liệu TOEIC kh&aacute;c để n&acirc;ng cao kỹ năng listening cho người bắt&nbsp;đầu như:&nbsp;<strong>Big Step 1</strong>,&nbsp;<strong>Starter TOEIC</strong>,...</span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:14px">Để cải thiện kỹ năng listening&nbsp;</span></span>một việc v&ocirc; c&ugrave;ng quan trọng m&agrave; c&ocirc; nghĩ c&aacute;c&nbsp;bạn&nbsp;cần l&agrave;m đ&oacute; ch&iacute;nh l&agrave; việc &ldquo;<strong>tắm ng&ocirc;n ngữ</strong>&rdquo; bằng việc nghe tiếng Anh thật nhiều qua c&aacute;c đoạn speech, radio của TED, BBC, CNN&hellip;.&nbsp;Ngo&agrave;i ra, bạn c&oacute; thể nghe nhạc, xem phim, xem show truyền h&igrave;nh Anh - Mỹ luyện cho bạn cả kỹ năng nghe v&agrave; n&oacute;i tiếng Anh&nbsp;chuẩn&nbsp;hơn rất nhiều.&nbsp;</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff">Ngo&agrave;i ra, bạn c&oacute; thể lựa chọn một trong những website sau để luyện nghe phương ph&aacute;p ghi ch&eacute;p ch&iacute;nh tải&nbsp;<strong>Listen a minute</strong>,&nbsp;<strong>Spotlight</strong>,&nbsp;<strong>VOICETUBE</strong>,...</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-size:14px">Sau khi tự tin hơn&nbsp;với kỹ năng Listening, c&aacute;c em bắt đầu luyện đề thi TOEIC Listening theo từng part d&agrave;nh ri&ecirc;ng cho level 250 - 500.</span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><strong>Để l&agrave;m được b&agrave;i thi, bạn cần đăng k&yacute; t&agrave;i khoản tr&ecirc;n website.</strong>&nbsp;Nếu chưa c&oacute;, c&aacute;c bạn c&oacute; thể đăng k&yacute; miễn ph&iacute;&nbsp;<span style="font-size:18px"><a href="https://www.anhngumshoa.com/dang-ky.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><span style="color:#0000ff"><strong>TẠI Đ&Acirc;Y</strong></span></a></span>&nbsp;nh&eacute;!</span></span></span></span></p>

<p style="text-align:center"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-size:18px"><strong>B&agrave;i luyện tập TOEIC Listening part 1 - 4</strong></span></span></span></span></span></p>

<p style="text-align:center"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><a href="https://www.anhngumshoa.com/test/level-250-500-c3421.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><img src="https://www.anhngumshoa.com/uploads/images/userfiles/2019/04/08/button.png" style="border:0px; box-sizing:border-box; height:49px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:200px" /></a></span></span></span></span></p>

<h3 style="text-align:center"><span style="font-size:20px"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="color:#222222"><span style="background-color:#ffffff"><a href="https://www.anhngumshoa.com/dang-ky-tu-van.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><img alt="" src="https://www.anhngumshoa.com/uploads/images/userfiles/untitled21.gif" style="border:0px; box-sizing:border-box; height:165px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:700px" /></a></span></span></span></span></h3>

<h3 style="text-align:justify"><span style="font-size:20px"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="color:#222222"><span style="background-color:#ffffff"><span style="font-size:18px"><strong>2. TOEIC READING</strong></span></span></span></span></span></h3>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff">Để n&acirc;ng cao kỹ năng n&agrave;y,&nbsp;c&aacute;c bạn sẽ cần phải tăng cường v&agrave; l&agrave;m gi&agrave;u vốn từ vựng cũng như ngữ ph&aacute;p của m&igrave;nh để c&oacute; thể l&agrave;m b&agrave;i thi đọc tốt hơn. Tuy nhi&ecirc;n c&aacute;c bạn đừng hiểu lầm v&agrave; qu&aacute; đặt nặng vấn đề l&agrave; sẽ phải hiểu 100% nội dung của b&agrave;i đọc trong kỳ thi TOEIC th&igrave; mới c&oacute; thể đạt được số điểm cao nh&eacute;!</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff">Thực ra trong kỳ thi TOEIC, số điểm của phần đọc cao hay thấp l&agrave; do bạn c&oacute; hiểu được ngữ cảnh của đoạn văn hay kh&ocirc;ng, để từ đ&oacute; chắt lọc những th&ocirc;ng tin m&igrave;nh cần nắm bắt để trả lời c&acirc;u hỏi một c&aacute;ch ch&iacute;nh x&aacute;c nhất. Do đ&oacute;, c&aacute;c bạn phải luyện khả năng đọc nhanh đoạn văn v&agrave; kỹ năng chọn từ kh&oacute;a ch&iacute;nh trong b&agrave;i đọc ch&iacute;nh x&aacute;c để l&agrave;m cơ sở trả lời c&aacute;c c&acirc;u hỏi của đề đưa ra.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff">Mỗi ng&agrave;y, c&aacute;c bạn n&ecirc;n bỏ ra &iacute;t nhất 30 ph&uacute;t để đọc c&aacute;c c&aacute;c email mẫu, b&agrave;i b&aacute;o tiếng Anh, đoạn văn, bảng quảng c&aacute;o,... nhằm t&iacute;ch trữ c&aacute;c ngữ ph&aacute;p v&agrave; từ vựng d&ugrave;ng trong m&ocirc;i trường quốc tế để chuẩn bị tốt nhất cho b&agrave;i thi đọc TOEIC nh&eacute;.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff">B&ecirc;n cạnh đ&oacute;, c&aacute;c bạn cũng n&ecirc;n mang b&ecirc;n m&igrave;nh một quyển sổ tay để ghi lại những ngữ ph&aacute;p hay v&agrave; k&egrave;m c&aacute;c v&iacute; dụ minh họa khi bạn bắt gặp trong qu&aacute; tr&igrave;nh tự học TOEIC, từ đ&oacute; l&agrave;m c&oacute; cơ sở để xem lại cũng như r&uacute;t kinh nghiệm để tiến bộ hơn mỗi ng&agrave;y.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff">C&aacute;c điểm ngữ ph&aacute;p, từ vựng hay n&agrave;y sẽ gi&uacute;p cho c&aacute;c bạn c&oacute; được điểm số tốt hơn ở c&aacute;c phần thi kiểm tra từ vựng v&agrave; ngữ ph&aacute;p đấy nh&eacute;.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff">&Ocirc;n thi toeic tại nh&agrave; với kỹ năng TOEIC Reading&nbsp;ở giai đoạn d&agrave;nh cho c&aacute;c bạn mới&nbsp;bắt đầu sẽ học tập trung về ngữ ph&aacute;p v&agrave; từ vựng tiếng Anh để c&oacute; kiến thức nền tảng được tốt nhất. V<span style="font-size:14px"><span style="font-family:arial,helvetica,sans-serif">&igrave; vậy c&aacute;c em h&atilde;y học thật chăm chỉ v&agrave; kh&ocirc;ng được bỏ qua b&agrave;i học n&agrave;o nh&eacute;!</span></span></span></span></span></span></p>

<h4 style="text-align:justify"><span style="font-size:15px"><span style="color:#007ec6"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff">➤&nbsp;<span style="font-size:16px"><em><strong>Ngữ ph&aacute;p</strong></em></span></span></span></span></span></h4>

<p style="text-align:justify"><span style="font-size:14px"><span style="color:#222222"><span style="font-family:roboto,&quot;segoe ui&quot;,Arial,Segoe,&quot;dejavu sans&quot;,&quot;trebuchet ms&quot;,Verdana,sans-serif"><span style="background-color:#ffffff"><span style="font-size:14px"><span style="font-family:arial,helvetica,sans-serif">Gồm 14 b&agrave;i ri&ecirc;ng biệt, tổng hợp lại những chủ điểm ngữ ph&aacute;p, kiến thức về c&aacute;c th&igrave; tiếng anh&nbsp;cần thiết v&agrave; quan trọng&nbsp;được ứng dụng cụ thể trong cơ cấu đề thi TOEIC. Trong mỗi b&agrave;i học ngữ ph&aacute;p c&ocirc; chia sẻ cụ thể kiến thức c&ugrave;ng b&agrave;i luyện tập để bạn học hiệu quả hơn.</span></span></span></span></span></span></p>

<ul>
	<li style="text-align:justify"><strong><span style="font-family:arial,helvetica,sans-serif"><em><u>Unit 1</u>:&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/unit-1-thi-hien-tai-don-va-thi-hien-tai-tiep-dien-34828.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s" target="_blank"><span style="color:#0000ff">Hiện tại đơn &amp; hiện tại tiếp diễn</span></a></em></span></strong></li>
	<li style="text-align:justify"><span style="font-size:14px"><strong><span style="font-family:arial,helvetica,sans-serif"><em><u>Unit 2</u>:&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/unit-2-thi-hien-tai-hoan-thanh-va-thi-hien-tai-hoan-thanh-tiep-dien-34829.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><span style="color:#0000ff">Th&igrave; hiện tại ho&agrave;n th&agrave;nh v&agrave; hiện tại ho&agrave;n th&agrave;nh tiếp diễn</span></a></em></span></strong></span></li>
	<li style="text-align:justify"><span style="font-size:14px"><strong><span style="font-family:arial,helvetica,sans-serif"><em><u>Unit 3</u>:<a href="https://www.anhngumshoa.com/tin-tuc/unit-3-thi-qua-khu-don-va-thi-qua-khu-tiep-dien-the-past-simple-and-the-past-continuous-34845.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><span style="color:#0000ff">&nbsp;Th&igrave; qu&aacute; khứ đơn v&agrave; qu&aacute; khứ tiếp diễn</span></a></em></span></strong></span></li>
	<li style="text-align:justify"><span style="font-size:14px"><strong><span style="font-family:arial,helvetica,sans-serif"><em><u>Unit 4</u>:<a href="https://www.anhngumshoa.com/tin-tuc/unit-4-thi-qua-khu-hoan-thanh-thi-qua-khu-hoan-thanh-tiep-dien-the-past-perfect-the-past-perfect-continuous-34846.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><span style="color:#0000ff">&nbsp;Th&igrave; qu&aacute; khứ ho&agrave;n th&agrave;nh v&agrave; qu&aacute; khứ ho&agrave;n th&agrave;nh tiếp diễn</span></a></em></span></strong></span></li>
	<li style="text-align:justify"><span style="font-size:14px"><strong><span style="font-family:arial,helvetica,sans-serif"><em><u>Unit 5</u>:<a href="https://www.anhngumshoa.com/tin-tuc/unit-5-thi-tuong-lai-don-tuong-lai-gan-the-future-simple-the-near-future-34847.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><span style="color:#0000ff">&nbsp;Th&igrave; tương lai đơn v&agrave; tương lai gần</span></a></em></span></strong></span></li>
	<li style="text-align:justify"><span style="font-size:14px"><strong><span style="font-family:arial,helvetica,sans-serif"><em><u>Unit 6</u>:<a href="https://www.anhngumshoa.com/tin-tuc/unit-6-thi-tuong-lai-tiep-dien-thi-tuong-lai-hoan-thanh-the-future-continuous-the-future-perfect-34848.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><span style="color:#0000ff">&nbsp;Th&igrave; tương lai tiếp diễn v&agrave; tương lai ho&agrave;n th&agrave;nh</span></a></em></span></strong></span></li>
	<li style="text-align:justify"><span style="font-size:14px"><strong><span style="font-family:arial,helvetica,sans-serif"><em><u>Unit 7</u>:<a href="https://www.anhngumshoa.com/tin-tuc/unit-8-chuc-nang-vi-tri-cua-adj-tinh-tu-va-adv-trang-tu-34871.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><span style="color:#0000ff">&nbsp;Adj &ndash; adv vị tr&iacute;, chức năng</span></a></em></span></strong></span></li>
	<li style="text-align:justify"><span style="font-size:14px"><strong><span style="font-family:arial,helvetica,sans-serif"><em><u>Unit 8</u>:<a href="https://www.anhngumshoa.com/tin-tuc/unit-9-dang-so-sanh-cua-tinh-tu-adj-va-trang-tu-adv-34874.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><span style="color:#0000ff">&nbsp;Adj &ndash; adv comparision</span></a></em></span></strong></span></li>
	<li style="text-align:justify"><span style="font-size:14px"><strong><span style="font-family:arial,helvetica,sans-serif"><em><u>Unit 9</u>:&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/unit-10-gerund-danh-dong-tu-va-to-infinitive-dong-tu-nguyen-the-34875.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><span style="color:#0000ff">Gerund &ndash; Infinitive</span></a></em></span></strong></span></li>
	<li style="text-align:justify"><span style="font-size:14px"><strong><span style="font-family:arial,helvetica,sans-serif"><em><u>Unit 10</u>:<a href="https://www.anhngumshoa.com/tin-tuc/unit-11-menh-de-quan-he-relative-clauses-cach-dung-va-bai-tap-34877.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><span style="color:#0000ff">&nbsp;Relative Clause &ndash; Mệnh đề quan hệ</span></a></em></span></strong></span></li>
	<li style="text-align:justify"><span style="font-size:14px"><strong><span style="font-family:arial,helvetica,sans-serif"><em><u>Unit 11</u>:<a href="https://www.anhngumshoa.com/tin-tuc/unit-12-bi-dong-passive-voice-34835.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><span style="color:#0000ff">&nbsp;Bị động</span></a></em></span></strong></span></li>
	<li style="text-align:justify"><span style="font-size:14px"><strong><span style="font-family:arial,helvetica,sans-serif"><em><u>Unit 12</u>:&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/unit-13-indefinite-pronouns-dai-tu-khong-xac-dinh-34849.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><span style="color:#0000ff">Đại từ kh&ocirc;ng x&aacute;c định &ndash; Indefinite pronouns</span></a></em></span></strong></span></li>
	<li style="text-align:justify"><span style="font-size:14px"><strong><span style="font-family:arial,helvetica,sans-serif"><em><u>Unit 13</u>:&nbsp;<a href="https://www.anhngumshoa.com/tin-tuc/unit-7-bo-sung-them-kien-thuc-ve-lien-tu-conjunction-34931.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><span style="color:#0000ff">Conjunctions</span></a></em></span></strong></span></li>
	<li style="text-align:justify"><span style="font-size:14px"><strong><span style="font-family:arial,helvetica,sans-serif"><em><u>Unit 14</u>:<a href="https://www.anhngumshoa.com/tin-tuc/unit-8-mot-so-loai-cau-dieu-kien-34932.html" rel="nofollow" style="box-sizing:border-box; padding:0px; text-decoration:none; color:#337ab7; transition:all 0.5s ease 0s"><span style="color:#0000ff">&nbsp;C&acirc;u điều kiện &ndash; Conditional sentences</span></a></em></span></strong></span></li>
</ul>
', 1, N'11/14/2022 11:40:24 PM')
SET IDENTITY_INSERT [dbo].[Distances] OFF
GO
SET IDENTITY_INSERT [dbo].[Documents] ON 

INSERT [dbo].[Documents] ([idDocument], [name], [image], [fileName], [content], [status], [idUser], [created]) VALUES (1, N'TỰ HỌC TOEIC 0-900+', N'6380410749974909051570436984284.jpg', NULL, N'<h1>TRỌN BỘ T&Agrave;I LIỆU TỰ HỌC TOEIC 0-900+ (FILE PDF + VIDEO B&Agrave;I GIẢNG + AUDIO)</h1>

<p>Mục lục [<a href="javascript:void(0);" onclick="toc_collapse(this);">Ẩn</a>]</p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#nam-tron-ngu-phaacutep-tieng-anh-trong-tam-tay-1">1. Nắm trọn ngữ ph&aacute;p tiếng Anh trong tầm tay</a></p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#tron-bo-ngu-phaacutep-trong-diem-trong-bagravei-thi-toeic-2">2. Trọn bộ ngữ ph&aacute;p trọng điểm trong b&agrave;i thi Toeic</a></p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#9-phuong-phaacutep-am-tron-3000-tu-vung-3">3. 9 phương ph&aacute;p ẵm trọn 3000 từ vựng</a></p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#tuyet-chiecircu-chinh-phuc-ky-nang-noacutei-viet-trong-toeic-4">4. Tuyệt chi&ecirc;u chinh phục kỹ năng n&oacute;i viết trong Toeic</a></p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#tron-bo-tu-vung-listening-theo-chu-de-5">5. Trọn bộ từ vựng listening theo chủ đề</a></p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#13-buoc-ha-guc-toeic-500-6">6. 13 bước hạ gục Toeic 500+</a></p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#28-ngagravey-ha-guc-toeic-500-7">7. 28 ng&agrave;y hạ gục Toeic 500+</a></p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#phaacute-dao-toeic-900-tu-mat-goc-trong-30-ngagravey-8">8. Ph&aacute; đảo Toeic 900+ từ mất gốc trong 30 ng&agrave;y</a></p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#thagravenh-thao-part-1-chi-5s-moi-cacircu-9">9. Th&agrave;nh thạo Part 1 chỉ 5s mỗi c&acirc;u</a></p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#giai-matilde-part-5-toeic-theo-format-moi-10">10. Giải m&atilde; part 5 Toeic theo format mới</a></p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#chien-thuat-cocircng-phaacute-cap-toc-part-7-toeic-format-moi-11">11. Chiến thuật c&ocirc;ng ph&aacute; cấp tốc part 7 TOEIC format mới</a></p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#10-de-part-12-coacute-dich-nghia-vagrave-daacutep-aacuten-12">12. 10 đề part 1+2 c&oacute; dịch nghĩa v&agrave; đ&aacute;p &aacute;n</a></p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#10-de-part-34-coacute-dich-nghia-vagrave-daacutep-aacuten-13">13. 10 đề part 3+4 c&oacute; dịch nghĩa v&agrave; đ&aacute;p &aacute;n</a></p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#video-giai-chi-tiet-part-56-14">14. Video giải chi tiết part 5+6</a></p>

<p><a href="https://anhnguathena.vn/tron-bo-tai-lieu-tu-hoc-toeic-0-900-file-pdf--video-bai-giang--audio-id888#video-giai-chi-tiet-part-7-15">15. Video giải chi tiết Part 7</a></p>

<p>Nhằm gi&uacute;p những bạn kh&ocirc;ng c&oacute; điều kiện đến trung t&acirc;m, hoặc c&oacute; th&ecirc;m t&agrave;i liệu tự học Toeic tại nh&agrave;, Athena tổng hợp trọn bộ t&agrave;i liệu tự học Toeic, bao gồm cả những t&agrave;i liệu trung t&acirc;m bi&ecirc;n soạn độc quyền. Đặc biệt, t&agrave;i liệu n&agrave;y sẽ đầy đủ về cả file PDF, file VIDEO, file AUDIO ph&ugrave; hợp cho cả những bạn mới bắt đầu học, hoặc đ&atilde; c&oacute; nền tảng v&agrave; muốn chinh phục 900+ Toeic.</p>

<p>&nbsp;</p>

<h1><strong>T&Agrave;I LIỆU HỌC TỪ VỰNG V&Agrave; NGỮ PH&Aacute;P</strong></h1>

<ul>
	<li>
	<h2><strong>Nắm trọn ngữ ph&aacute;p tiếng Anh trong tầm tay</strong></h2>
	</li>
</ul>

<p>T&agrave;i liệu cung cấp tổng quan to&agrave;n bộ kiến thức ngữ ph&aacute;p trong trong tiếng Anh, gi&uacute;p c&aacute;c bạn hệ thống được to&agrave;n bộ kiến thức tiếng Anh một c&aacute;ch tổng quan nhất. T&agrave;i liệu l&ecirc;n tới 221 trang.</p>

<p><img alt="" src="https://static.anhnguathena.vn/anhngu//img.media/2021/01/1.PNG" style="height:490px; width:396px" /></p>

<p><strong>Link Download:&nbsp;<a href="https://drive.google.com/file/d/18DnFl1oQzh4xmkL27DZh4cwuPd8igB6Y/view">Tại đ&acirc;y</a></strong></p>

<p>&nbsp;</p>

<ul>
	<li>
	<h2><strong>Trọn bộ ngữ ph&aacute;p trọng điểm trong b&agrave;i thi Toeic</strong></h2>
	</li>
	<li>T&agrave;i liệu cung cấp những kiến thức ngữ ph&aacute;p trọng điểm trong b&agrave;i thi Toeic. Đặc biệt, với những bạn mới bắt đầu học Toeic v&agrave; chưa c&oacute; kiến thức căn bản.&nbsp;<img alt="" src="https://static.anhnguathena.vn/anhngu//img.media/2021/01/2.PNG" style="height:550px; width:392px" /></li>
</ul>

<p><strong>Link Download:&nbsp;<a href="https://drive.google.com/file/d/1F4N7gEV1c-Ijso9dQk6_5l76_ZtO4OUt/view?pli=1">Tại đ&acirc;y</a></strong></p>

<p>&nbsp;</p>

<ul>
	<li>
	<h2><strong>9 phương ph&aacute;p ẵm trọn 3000 từ vựng</strong></h2>
	</li>
</ul>

<p>T&agrave;i liệu cung cấp 9 phương ph&aacute;p học từ vựng hiệu quả, đồng thời cung cấp 3000 từ vựng nền tảng nhất khi bắt đầu học tiếng Anh.</p>

<p><img alt="" src="https://static.anhnguathena.vn/anhngu//img.media/2021/01/3.PNG" style="height:564px; width:396px" /></p>

<p><strong>Link Download:&nbsp;<a href="https://drive.google.com/file/d/1y97FsIPmw2OW-FWqjhP6-xj0DCFFIGXu/view">Tại đ&acirc;y</a></strong></p>

<p>&nbsp;</p>

<h1><strong>T&Agrave;I LIỆU HỌC TOEIC THEO TỪNG KỸ NĂNG</strong></h1>

<p>&nbsp;</p>

<ul>
	<li>
	<h2><strong>Tuyệt chi&ecirc;u chinh phục kỹ năng n&oacute;i viết trong Toeic</strong></h2>
	</li>
</ul>

<p>Cung cấp kiến thức, phương ph&aacute;p l&agrave;m b&agrave;i để chinh phục kỹ năng n&oacute;i, viết trong b&agrave;i thi Toeic.</p>

<p><img alt="" src="https://static.anhnguathena.vn/anhngu//img.media/2021/01/4%20%281%29.PNG" style="height:563px; width:395px" /></p>

<p><strong>Link Download:&nbsp;<a href="https://drive.google.com/file/d/16B-KeK4w8ZMXP5ixJljWGp9b35p71ORO/view">Tại đ&acirc;y</a></strong></p>

<p>&nbsp;</p>

<ul>
	<li>
	<h2><strong>Trọn bộ từ vựng listening theo chủ đề</strong></h2>
	</li>
</ul>

<p>T&agrave;i liệu sẽ cung cấp cho c&aacute;c kiến những từ vựng thường xuất hiện trong b&agrave;i thi listening theo từng chủ đề, nhằm gi&uacute;p c&aacute;c bạn hệ thống được từ vựng v&agrave; c&oacute; được nền tảng từ vựng tổng quan nhất.</p>

<p><img alt="" src="https://static.anhnguathena.vn/anhngu//img.media/2021/01/5.PNG" style="height:561px; width:396px" /></p>

<p><strong>Link Download:&nbsp;<a href="https://drive.google.com/file/d/1GvK_NkQ8nHWXtuo9mYkjUpD--DT1GoS4/view">Tại đ&acirc;y</a></strong></p>

<p>&nbsp;</p>

<h1><strong>T&Agrave;I LIỆU HỌC TOEIC THEO LỘ TR&Igrave;NH</strong></h1>

<p>&nbsp;</p>

<ul>
	<li>
	<h2><strong>13 bước hạ gục Toeic 500+</strong></h2>
	</li>
</ul>

<p>T&agrave;i liệu hướng dẫn cho bạn c&aacute;c bước để bắt đầu học Toeic th&igrave; con số 0 để c&oacute; thể chinh phục Toeic 500+.</p>

<p><img alt="" src="https://static.anhnguathena.vn/anhngu//img.media/2021/01/6.PNG" style="height:560px; width:401px" /></p>

<p><strong>Link Download:&nbsp;<a href="https://drive.google.com/file/d/1ri8ndyYgLMA2z1m8D4u-foxB-2PqS4kY/view">Tại đ&acirc;y&nbsp;</a></strong></p>

<p>&nbsp;</p>

<ul>
	<li>
	<h2><strong>28 ng&agrave;y hạ gục Toeic 500+</strong></h2>
	</li>
</ul>

<p>D&agrave;nh cho những bạn c&oacute; mục ti&ecirc;u chinh phục 500+ Toeic trong 1 th&aacute;ng, t&agrave;i liệu đ&atilde; chia nội dung học theo từng ng&agrave;y, để bạn c&oacute; thể chủ động kế hoạch học tập theo từng ng&agrave;y.</p>

<p><img alt="" src="https://static.anhnguathena.vn/anhngu//img.media/2021/01/7.PNG" style="height:565px; width:395px" /></p>

<p><strong>Link Download:&nbsp;<a href="https://drive.google.com/file/d/1HrNiMQ-kSmhL3fGC_hvTEfVfluJWql8h/view">Tại đ&acirc;y&nbsp;</a></strong></p>

<ul>
	<li>
	<h2><strong>Ph&aacute; đảo Toeic 900+ từ mất gốc trong 30 ng&agrave;y</strong></h2>
	</li>
</ul>

<p>T&agrave;i liệu cung cấp kế hoạch chinh phục Toeic trong 30 d&agrave;nh cho những bạn muốn chinh phục Toeic 900+, t&agrave;i liệu ph&ugrave; hợp cho những bạn đ&atilde; c&oacute; kiến thức nền, muốn chinh phục Toeic trong thời gian ngắn.</p>

<p><img alt="" src="https://static.anhnguathena.vn/anhngu//img.media/2021/01/8.PNG" style="height:564px; width:397px" /></p>

<p><strong>Link Download:&nbsp;<a href="https://drive.google.com/file/d/1ImWvjQnNwevdWCZay15rJZcTUWSUjysj/view">Tại đ&acirc;y&nbsp;</a></strong></p>

<p>&nbsp;</p>

<h1><strong>T&Agrave;I LIỆU HỌC TOEIC THEO TỪNG PART</strong></h1>

<ul>
	<li>
	<h2><strong>Th&agrave;nh thạo Part 1 chỉ 5s mỗi c&acirc;u</strong></h2>
	</li>
</ul>

<p>T&agrave;i liệu sẽ hướng dẫn c&aacute;ch chinh phục part trong thời gian ngắn nhất, t&agrave;i liệu c&oacute; đ&aacute;p &aacute;n v&agrave; dịch chi tiết cho từng c&acirc;u.</p>

<p><img alt="" src="https://static.anhnguathena.vn/anhngu//img.media/2021/01/11.PNG" style="height:561px; width:397px" /></p>

<p>&nbsp;</p>

<p><strong>Link Download:&nbsp;<a href="https://drive.google.com/file/d/1fs6LaGSw5QRNPpcUjeTJSifE8DWBNRyz/view">Tại đ&acirc;y&nbsp;</a></strong></p>

<p>&nbsp;</p>

<ul>
	<li>
	<h2><strong>Giải m&atilde; part 5 Toeic theo format mới</strong></h2>
	</li>
</ul>

<p>T&agrave;i liệu cung cấp c&aacute;c dạng b&agrave;i trong part 5, c&aacute;c bẫy, mẹo v&agrave; c&aacute;c cụm từ thường gặp.</p>

<p><img alt="" src="https://static.anhnguathena.vn/anhngu//img.media/2021/01/9.PNG" style="height:517px; width:396px" /></p>

<p><strong>Link Download:&nbsp;<a href="https://drive.google.com/file/d/1CqrmoQbMnz5mfsU99JP77_fzl5arET18/view">Tại đ&acirc;y&nbsp;</a></strong></p>

<p>&nbsp;</p>

<ul>
	<li>
	<h2><strong>Chiến thuật c&ocirc;ng ph&aacute; cấp tốc part 7 TOEIC format mới</strong></h2>
	</li>
</ul>

<p>T&agrave;i liệu cung cấp những kiến thức nền tảng trong Toeic, l&agrave;m quen với c&aacute;c phương ph&aacute;p, c&aacute;c dạng b&agrave;i v&agrave; chinh phục c&aacute;c từ vựng trong Toeic part 7.</p>

<p><img alt="" src="https://static.anhnguathena.vn/anhngu//img.media/2021/01/10.PNG" style="height:565px; width:399px" /></p>

<p><strong>Link Download:&nbsp;<a href="https://drive.google.com/file/d/1TABIgLv4Il-D2u9ySfYOyJiVoqAzb9oR/view">Tại đ&acirc;y</a></strong></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<h1><strong>GIẢI CHI TIẾT ĐỀ THI</strong></h1>

<ul>
	<li><strong>Giải chi tiết 10 đề đọc hay nhất format mới</strong></li>
</ul>

<p><strong>Link Download:&nbsp;<a href="https://drive.google.com/file/d/1lf7uxkVEsBmw9VXlaY_cCQF2VW75TkHf/view">Tại đ&acirc;y</a></strong></p>

<p>&nbsp;</p>

<ul>
	<li>
	<h2><strong>10 đề part 1+2 c&oacute; dịch nghĩa v&agrave; đ&aacute;p &aacute;n</strong></h2>
	</li>
</ul>

<p><strong>Link Download file PDF:&nbsp;<a href="https://drive.google.com/file/d/1xfZNFBBS1vDglCktoFjmzqdOTZbtsI8A/view?fbclid=IwAR1wCiyog5qPuccP54NK3zu711wfDzeiVZXD-wRpY4FOh8E11kr5JNHsUhY">Tại đ&acirc;y&nbsp;</a></strong></p>

<p><strong>Link Download file AUDIO:&nbsp;<a href="https://drive.google.com/drive/folders/1j_hjki4LXqXtw0TFToMj3SIRQbhBGebN?fbclid=IwAR1SnTyhUCDEwEuK9BoUCz-aL2QiLsGU6YUTAdTnk-k6RTt012N_zYMkXJ4">Tại đ&acirc;y</a></strong></p>

<p>&nbsp;</p>

<ul>
	<li>
	<h2><strong>10 đề part 3+4 c&oacute; dịch nghĩa v&agrave; đ&aacute;p &aacute;n</strong></h2>
	</li>
</ul>

<p><strong>Link Download file PDF:&nbsp;<a href="https://drive.google.com/file/d/1fq8GZP0Jm1b89BUwao5j_e12zJvFO8YD/view?fbclid=IwAR1SnTyhUCDEwEuK9BoUCz-aL2QiLsGU6YUTAdTnk-k6RTt012N_zYMkXJ4">Tại đ&acirc;y&nbsp;</a></strong></p>

<p><strong>Link Download file AUDIO:&nbsp;<a href="https://drive.google.com/drive/folders/1j_hjki4LXqXtw0TFToMj3SIRQbhBGebN?fbclid=IwAR1dnrZq7Hsh_p7Wrn_alVsPjThX5PHUnQr-FX4hai1blqnPZWw36Pl1o14">Tại đ&acirc;y</a></strong></p>

<p>&nbsp;</p>

<ul>
	<li>
	<h2><strong>Video giải chi tiết part 5+6</strong></h2>
	</li>
</ul>

<p><strong>Link Download Part 5:&nbsp;<a href="https://drive.google.com/file/d/1O_CEmMgUSTBMK-ZNBbC8yL0QuSjEdE2f/view?fbclid=IwAR0e2yGM2PMfoTqmxShOL1RQyOkCrtuNaehrPcINRnHj_2TncxGA8uOIJAA">Tại đ&acirc;y</a></strong></p>

<p><strong>Link Download Part 6:&nbsp;<a href="https://drive.google.com/file/d/1DeFX9UgPC9c80Hd1oQrkormnOsp1wzRp/view?fbclid=IwAR1IVpVo7PvS472CamNPqO0lO1zGQ31ctcxnL-EMMgkQ1WRv3IIb2AJ8lvc">Tại đ&acirc;y</a></strong></p>

<p>&nbsp;</p>

<ul>
	<li>
	<h2><strong>Video giải chi tiết Part 7</strong></h2>
	</li>
</ul>

<p><strong>Link Download Part 7:&nbsp;<a href="https://drive.google.com/drive/folders/1GH7RHKia-1Vw7T0x9G4GJpM3byxk2edl?fbclid=IwAR0i4TRNJ1PZfhP-0ATK056Be6wiF91oEVYWHD0qvsOar9bsAOMqZoEUKAY">Tại đ&acirc;y</a></strong></p>

<p>&nbsp;</p>

<p>Tr&ecirc;n đ&acirc;y l&agrave; to&agrave;n bộ t&agrave;i liệu tự học Toeic d&agrave;nh cho cả những bạn mới bắt đầu hoặc đ&atilde; c&oacute; nền tảng muốn chinh phục điểm số tuyệt đối trong Toeic. Nếu c&oacute; bất cứ thắc mắc g&igrave;, c&aacute;c bạn h&atilde;y để lại comment b&ecirc;n dưới, Athena sẽ giải đ&aacute;p cho bạn nh&eacute;.</p>
', 0, 3, N'11/15/2022 11:11:39 AM')
SET IDENTITY_INSERT [dbo].[Documents] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([idPost], [title], [image], [content], [status], [idUser], [created]) VALUES (1, N'Cần tư vấn về phương pháp học Listenning', N'638041211483120593very-easy-toeic1.jpg', N'<p>Cần tư vấn về phương ph&aacute;p học Listenning ạ</p>
', 1, 5, N'11/15/2022 2:59:08 PM')
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([idProduct], [name], [image], [point], [status], [created]) VALUES (2, N'Tai nghe', N'638041183107921837download (8).jpg', 150, 1, N'11/14/2022 11:38:07 PM')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([idRole], [name]) VALUES (1, N'Quản lý')
INSERT [dbo].[Roles] ([idRole], [name]) VALUES (2, N'Giáo viên')
INSERT [dbo].[Roles] ([idRole], [name]) VALUES (3, N'Học viên')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idUser], [email], [fullName], [password], [phoneNumber], [point], [status], [idRole], [created]) VALUES (2, N'admin@gmail.com', N'Quản trị viên', N'123456', N'0394073752', 0, 1, 1, NULL)
INSERT [dbo].[Users] ([idUser], [email], [fullName], [password], [phoneNumber], [point], [status], [idRole], [created]) VALUES (3, N'levanc@gmail.com', N'Lê Văn C', N'123456', N'0394073756', 0, 1, 2, NULL)
INSERT [dbo].[Users] ([idUser], [email], [fullName], [password], [phoneNumber], [point], [status], [idRole], [created]) VALUES (5, N'minhnha@gmail.com', N'Nguyễn Văn Nhã', N'123456', N'0394072546', 0, 1, 3, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_idPost]    Script Date: 11/15/2022 4:16:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_idPost] ON [dbo].[Comments]
(
	[idPost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_idUser]    Script Date: 11/15/2022 4:16:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_idUser] ON [dbo].[Comments]
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_idUser]    Script Date: 11/15/2022 4:16:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_idUser] ON [dbo].[Documents]
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_idTarget]    Script Date: 11/15/2022 4:16:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_idTarget] ON [dbo].[MyTargets]
(
	[idTarget] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_idUser]    Script Date: 11/15/2022 4:16:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_idUser] ON [dbo].[MyTargets]
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_idUser]    Script Date: 11/15/2022 4:16:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_idUser] ON [dbo].[Posts]
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_idRole]    Script Date: 11/15/2022 4:16:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_idRole] ON [dbo].[Users]
(
	[idRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Posts_idPost] FOREIGN KEY([idPost])
REFERENCES [dbo].[Posts] ([idPost])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Posts_idPost]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Users_idUser] FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([idUser])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Users_idUser]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Documents_dbo.Users_idUser] FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([idUser])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_dbo.Documents_dbo.Users_idUser]
GO
ALTER TABLE [dbo].[MyTargets]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MyTargets_dbo.Targets_idTarget] FOREIGN KEY([idTarget])
REFERENCES [dbo].[Targets] ([idTarget])
GO
ALTER TABLE [dbo].[MyTargets] CHECK CONSTRAINT [FK_dbo.MyTargets_dbo.Targets_idTarget]
GO
ALTER TABLE [dbo].[MyTargets]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MyTargets_dbo.Users_idUser] FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([idUser])
GO
ALTER TABLE [dbo].[MyTargets] CHECK CONSTRAINT [FK_dbo.MyTargets_dbo.Users_idUser]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Posts_dbo.Users_idUser] FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([idUser])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_dbo.Posts_dbo.Users_idUser]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_idRole] FOREIGN KEY([idRole])
REFERENCES [dbo].[Roles] ([idRole])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_idRole]
GO
USE [master]
GO
ALTER DATABASE [DBToeicAsp] SET  READ_WRITE 
GO
