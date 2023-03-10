USE [Uspel]
GO
/****** Object:  Table [dbo].[Disciplina]    Script Date: 19.09.2022 22:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disciplina](
	[ИндифДисц] [char](8) NOT NULL,
	[НазвДисц] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Disciplina] PRIMARY KEY CLUSTERED 
(
	[ИндифДисц] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormaObuch]    Script Date: 19.09.2022 22:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormaObuch](
	[КодФормОбуч] [tinyint] NOT NULL,
	[НазвФормОбуч] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FormaObuch] PRIMARY KEY CLUSTERED 
(
	[КодФормОбуч] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 19.09.2022 22:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[КодГр] [varchar](8) NOT NULL,
	[ГодСозд] [smallint] NOT NULL,
	[КодФормОбуч] [tinyint] NOT NULL,
	[КодНапр] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[КодГр] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Institut]    Script Date: 19.09.2022 22:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Institut](
	[КодИнст] [char](7) NOT NULL,
	[Наим] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Institut] PRIMARY KEY CLUSTERED 
(
	[КодИнст] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kafedra]    Script Date: 19.09.2022 22:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kafedra](
	[ИндНомКаф] [char](11) NOT NULL,
	[Название] [varchar](max) NOT NULL,
	[КодИнст] [char](7) NOT NULL,
 CONSTRAINT [PK_Kafedra] PRIMARY KEY CLUSTERED 
(
	[ИндНомКаф] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NaprPodgotovki]    Script Date: 19.09.2022 22:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NaprPodgotovki](
	[КодНапр] [varchar](8) NOT NULL,
	[Направление] [varchar](max) NOT NULL,
	[ИндНомКаф] [char](11) NOT NULL,
 CONSTRAINT [PK_NaprPodgotovki] PRIMARY KEY CLUSTERED 
(
	[КодНапр] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ocenki]    Script Date: 19.09.2022 22:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ocenki](
	[КодОцен] [varchar](13) NOT NULL,
	[Оценка] [varchar](50) NOT NULL,
	[НомЗачКниж] [char](9) NOT NULL,
	[НомВед] [char](9) NOT NULL,
 CONSTRAINT [PK_Ocenki] PRIMARY KEY CLUSTERED 
(
	[КодОцен] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prepodavatel]    Script Date: 19.09.2022 22:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prepodavatel](
	[КодЭкзаменатора] [char](15) NOT NULL,
	[Фамилия] [varchar](max) NOT NULL,
	[Имя] [varchar](max) NOT NULL,
	[Отчество] [varchar](max) NULL,
	[НомТелефона] [char](11) NULL,
	[Должность] [varchar](max) NOT NULL,
	[ИндНомКаф] [char](11) NOT NULL,
 CONSTRAINT [PK_Prepodavatel] PRIMARY KEY CLUSTERED 
(
	[КодЭкзаменатора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 19.09.2022 22:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[НомЗачКниж] [char](9) NOT NULL,
	[Фам] [varchar](100) NOT NULL,
	[Имя] [varchar](100) NOT NULL,
	[Отчество] [varchar](100) NULL,
	[ГодПост] [smallint] NOT NULL,
	[ГодОконч] [smallint] NOT NULL,
	[КодГр] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[НомЗачКниж] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vedomost]    Script Date: 19.09.2022 22:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vedomost](
	[НомВед] [char](9) NOT NULL,
	[Семестр] [tinyint] NOT NULL,
	[УчГод] [char](9) NOT NULL,
	[ДатПров] [date] NOT NULL,
	[СрБалл] [decimal](3, 2) NULL,
	[КодВидКонтр] [tinyint] NOT NULL,
	[ИндифДисц] [char](8) NOT NULL,
	[КодГр] [varchar](8) NOT NULL,
	[КодЭкзаменатора] [char](15) NOT NULL,
 CONSTRAINT [PK_Vedomost] PRIMARY KEY CLUSTERED 
(
	[НомВед] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VidKontrola]    Script Date: 19.09.2022 22:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VidKontrola](
	[КодВидКонтр] [tinyint] NOT NULL,
	[ЗначВидКонтр] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VidKontrola] PRIMARY KEY CLUSTERED 
(
	[КодВидКонтр] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_FormaObuch] FOREIGN KEY([КодФормОбуч])
REFERENCES [dbo].[FormaObuch] ([КодФормОбуч])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_FormaObuch]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_NaprPodgotovki] FOREIGN KEY([КодНапр])
REFERENCES [dbo].[NaprPodgotovki] ([КодНапр])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_NaprPodgotovki]
GO
ALTER TABLE [dbo].[Kafedra]  WITH CHECK ADD  CONSTRAINT [FK_Kafedra_Institut] FOREIGN KEY([КодИнст])
REFERENCES [dbo].[Institut] ([КодИнст])
GO
ALTER TABLE [dbo].[Kafedra] CHECK CONSTRAINT [FK_Kafedra_Institut]
GO
ALTER TABLE [dbo].[NaprPodgotovki]  WITH CHECK ADD  CONSTRAINT [FK_NaprPodgotovki_Kafedra] FOREIGN KEY([ИндНомКаф])
REFERENCES [dbo].[Kafedra] ([ИндНомКаф])
GO
ALTER TABLE [dbo].[NaprPodgotovki] CHECK CONSTRAINT [FK_NaprPodgotovki_Kafedra]
GO
ALTER TABLE [dbo].[Ocenki]  WITH CHECK ADD  CONSTRAINT [FK_Ocenki_Students] FOREIGN KEY([НомЗачКниж])
REFERENCES [dbo].[Students] ([НомЗачКниж])
GO
ALTER TABLE [dbo].[Ocenki] CHECK CONSTRAINT [FK_Ocenki_Students]
GO
ALTER TABLE [dbo].[Ocenki]  WITH CHECK ADD  CONSTRAINT [FK_Ocenki_Vedomost] FOREIGN KEY([НомВед])
REFERENCES [dbo].[Vedomost] ([НомВед])
GO
ALTER TABLE [dbo].[Ocenki] CHECK CONSTRAINT [FK_Ocenki_Vedomost]
GO
ALTER TABLE [dbo].[Prepodavatel]  WITH CHECK ADD  CONSTRAINT [FK_Prepodavatel_Kafedra] FOREIGN KEY([ИндНомКаф])
REFERENCES [dbo].[Kafedra] ([ИндНомКаф])
GO
ALTER TABLE [dbo].[Prepodavatel] CHECK CONSTRAINT [FK_Prepodavatel_Kafedra]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Group] FOREIGN KEY([КодГр])
REFERENCES [dbo].[Group] ([КодГр])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Group]
GO
ALTER TABLE [dbo].[Vedomost]  WITH CHECK ADD  CONSTRAINT [FK_Vedomost_Disciplina] FOREIGN KEY([ИндифДисц])
REFERENCES [dbo].[Disciplina] ([ИндифДисц])
GO
ALTER TABLE [dbo].[Vedomost] CHECK CONSTRAINT [FK_Vedomost_Disciplina]
GO
ALTER TABLE [dbo].[Vedomost]  WITH CHECK ADD  CONSTRAINT [FK_Vedomost_Group] FOREIGN KEY([КодГр])
REFERENCES [dbo].[Group] ([КодГр])
GO
ALTER TABLE [dbo].[Vedomost] CHECK CONSTRAINT [FK_Vedomost_Group]
GO
ALTER TABLE [dbo].[Vedomost]  WITH CHECK ADD  CONSTRAINT [FK_Vedomost_Prepodavatel] FOREIGN KEY([КодЭкзаменатора])
REFERENCES [dbo].[Prepodavatel] ([КодЭкзаменатора])
GO
ALTER TABLE [dbo].[Vedomost] CHECK CONSTRAINT [FK_Vedomost_Prepodavatel]
GO
ALTER TABLE [dbo].[Vedomost]  WITH CHECK ADD  CONSTRAINT [FK_Vedomost_VidKontrola] FOREIGN KEY([КодВидКонтр])
REFERENCES [dbo].[VidKontrola] ([КодВидКонтр])
GO
ALTER TABLE [dbo].[Vedomost] CHECK CONSTRAINT [FK_Vedomost_VidKontrola]
GO
