USE [master]
GO
/****** Object:  Database [Clinica_Cadastro]    Script Date: 21/01/2020 15:20:34 ******/
CREATE DATABASE [Clinica_Cadastro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Clinica_Cadastro', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Clinica_Cadastro.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Clinica_Cadastro_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Clinica_Cadastro_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Clinica_Cadastro] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Clinica_Cadastro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Clinica_Cadastro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET ARITHABORT OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Clinica_Cadastro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Clinica_Cadastro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Clinica_Cadastro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Clinica_Cadastro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Clinica_Cadastro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Clinica_Cadastro] SET  MULTI_USER 
GO
ALTER DATABASE [Clinica_Cadastro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Clinica_Cadastro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Clinica_Cadastro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Clinica_Cadastro] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Clinica_Cadastro]
GO
/****** Object:  StoredProcedure [dbo].[AlterarCad]    Script Date: 21/01/2020 15:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[AlterarCad]
(  
    @MedicoId int,
	@Nome varchar(50),
	@CRM varchar(10),
	@Telefone varchar(15),
	@Cidade varchar(50),
	@Uf char(2),
	@Especialidade varchar(50)

)	 
as 
begin
 update Cadastro set Nome = @Nome, 
 CRM = @CRM, Telefone = @Telefone,
 Cidade = @Cidade, Uf = Uf,
 Especialidade = @Especialidade
 where MedicoId = @MedicoId

 end
GO
/****** Object:  StoredProcedure [dbo].[AlterarCadastro]    Script Date: 21/01/2020 15:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[AlterarCadastro]
(  
    @MedicoId int,
	@Nome varchar(50),
	@CRM varchar(10),
	@Telefone varchar(15),
	@Cidade varchar(50),
	@Uf char(2),
	@Especialidade varchar(50)

)	 
as 
begin
 update Cadastro set Nome = @Nome, 
 CRM = @CRM, Telefone = @Telefone,
 Cidade = @Cidade, Uf = Uf,
 Especialidade = @Especialidade
 where MedicoId = @MedicoId

 end
GO
/****** Object:  StoredProcedure [dbo].[ExcluirCadastro]    Script Date: 21/01/2020 15:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ExcluirCadastro]
(
    @MedicoId int 
)

as 
begin 
    Delete From Cadastro where MedicoId = @MedicoId
	
	end
GO
/****** Object:  StoredProcedure [dbo].[IncluirCadastro]    Script Date: 21/01/2020 15:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[IncluirCadastro] 
(  
    @Nome varchar(50),
	@CRM varchar(10),
	@Telefone varchar(15),
	@Cidade varchar(50),
	@Uf char(2),
	@Especialidade varchar(50)


)

as
begin
     
	 Insert  Into Cadastro values (@Nome, @CRM, @Telefone, @Cidade, @Uf, @Especialidade)

end
GO
/****** Object:  StoredProcedure [dbo].[ObterCadastro]    Script Date: 21/01/2020 15:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ObterCadastro]
as
begin 
    Select MedicoId, Nome, CRM, Telefone, Cidade, Uf, Especialidade from Cadastro
	end
GO
/****** Object:  Table [dbo].[Cadastro]    Script Date: 21/01/2020 15:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cadastro](
	[MedicoId] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[CRM] [varchar](10) NOT NULL,
	[Telefone] [varchar](15) NOT NULL,
	[Cidade] [varchar](50) NOT NULL,
	[Uf] [char](2) NOT NULL,
	[Especialidade] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cadastro] PRIMARY KEY CLUSTERED 
(
	[MedicoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Especialidades]    Script Date: 21/01/2020 15:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Especialidades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alergologia] [varchar](50) NULL,
	[angiologia] [varchar](50) NULL,
	[buco maxilo] [varchar](50) NULL,
	[cardiologia clínica] [varchar](50) NULL,
	[cardiologia infantil] [varchar](50) NULL,
	[cirugia cabeça e pescoço] [varchar](50) NULL,
	[cirurgia cardíaca] [varchar](50) NULL,
	[cirurgia de torax] [varchar](50) NULL,
	[cirurgia geral] [varchar](50) NULL,
	[cirurgia pediátrica] [varchar](50) NULL,
	[cirurgia plástica] [varchar](50) NULL,
	[cirurcia torácio] [varchar](50) NULL,
	[cirurgia vascular] [varchar](50) NULL,
	[clínica médica] [varchar](50) NULL,
 CONSTRAINT [PK_Especialidades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Clinica_Cadastro] SET  READ_WRITE 
GO
