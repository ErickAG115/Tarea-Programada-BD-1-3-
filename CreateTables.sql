USE [ProyectoBD]
GO

/****** Object:  Table [dbo].[Puesto]    Script Date: 4/5/2022 4:35:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Puesto](
	[ID] [int] NOT NULL,
	[Nombre] [char](128) NOT NULL,
	[SalarioXHora] [money] NOT NULL,
)
GO

CREATE TABLE [dbo].[Obrero](
	[ID] [int] NOT NULL,
	[Nombre] [char](128) NOT NULL,
	[IdTipoDocIdentidad] [int] NOT NULL,
	[Puesto] [char](128) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[IdDepartamento] [int] NOT NULL,
 CONSTRAINT [PK_Obrero] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Obrero]  WITH CHECK ADD  CONSTRAINT [FK_Obrero_Departamentos] FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamentos] ([ID])
GO

ALTER TABLE [dbo].[Obrero] CHECK CONSTRAINT [FK_Obrero_Departamentos]
GO

ALTER TABLE [dbo].[Obrero]  WITH CHECK ADD  CONSTRAINT [FK_Obrero_Puesto] FOREIGN KEY([Puesto])
REFERENCES [dbo].[Puesto] ([Nombre])
GO

ALTER TABLE [dbo].[Obrero] CHECK CONSTRAINT [FK_Obrero_Puesto]
GO

ALTER TABLE [dbo].[Obrero]  WITH CHECK ADD  CONSTRAINT [FK_Obrero_TipoDocIdentidad] FOREIGN KEY([IdTipoDocIdentidad])
REFERENCES [dbo].[TipoDocIdentidad] ([ID])
GO

ALTER TABLE [dbo].[Obrero] CHECK CONSTRAINT [FK_Obrero_TipoDocIdentidad]
GO

CREATE TABLE [dbo].[Departamentos](
	[ID] [int] NOT NULL,
	[Nombre] [char](128) NOT NULL,
)
GO

CREATE TABLE [dbo].[TipoDocIdentidad](
	[ID] [int] NOT NULL,
	[Nombre] [char](128) NOT NULL,
)
GO


