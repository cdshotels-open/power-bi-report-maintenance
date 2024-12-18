USE [master]
GO
/****** Object:  Database [DatasetMaintenance]    Script Date: 22/11/2024 16:46:03 ******/
CREATE DATABASE [DatasetMaintenance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CDSManteinances', FILENAME = N'C:\Users\Asia\Desktop\MSSQL16.SQLEXPRESS\MSSQL\DATA\DatasetMaintenance.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CDSManteinances_log', FILENAME = N'C:\Users\Asia\Desktop\MSSQL16.SQLEXPRESS\MSSQL\DATA\DatasetMaintenance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DatasetMaintenance] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DatasetMaintenance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DatasetMaintenance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET ARITHABORT OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DatasetMaintenance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DatasetMaintenance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DatasetMaintenance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DatasetMaintenance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DatasetMaintenance] SET  MULTI_USER 
GO
ALTER DATABASE [DatasetMaintenance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DatasetMaintenance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DatasetMaintenance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DatasetMaintenance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DatasetMaintenance] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DatasetMaintenance] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DatasetMaintenance] SET QUERY_STORE = ON
GO
ALTER DATABASE [DatasetMaintenance] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DatasetMaintenance]
GO
/****** Object:  Table [dbo].[DimAttività]    Script Date: 22/11/2024 16:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAttività](
	[AttivitàID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](250) NOT NULL,
	[Attività] [nvarchar](max) NOT NULL,
	[Tempo_teorico_svolgimento_Attività] [int] NULL,
	[TipologiaAttività] [nvarchar](250) NOT NULL,
	[Periodicità] [nvarchar](250) NOT NULL,
	[ParentID] [int] NULL,
	[Livello] [int] NOT NULL,
 CONSTRAINT [PK_DimAttività] PRIMARY KEY CLUSTERED 
(
	[AttivitàID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimAzioni]    Script Date: 22/11/2024 16:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAzioni](
	[AzioneID] [int] IDENTITY(1,1) NOT NULL,
	[Azione] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_DimAzioni] PRIMARY KEY CLUSTERED 
(
	[AzioneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEsiti]    Script Date: 22/11/2024 16:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEsiti](
	[EsitoID] [int] IDENTITY(1,1) NOT NULL,
	[Esito] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_DimEsiti] PRIMARY KEY CLUSTERED 
(
	[EsitoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimNumeroInterventi]    Script Date: 22/11/2024 16:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimNumeroInterventi](
	[Numero_InterventoID] [int] IDENTITY(1,1) NOT NULL,
	[Numero_Intervento] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_DimNumeroInterventi] PRIMARY KEY CLUSTERED 
(
	[Numero_InterventoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStatoInterventi]    Script Date: 22/11/2024 16:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStatoInterventi](
	[Stato_InterventoID] [int] IDENTITY(1,1) NOT NULL,
	[Stato_Intervento] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_DimStatoInterventi] PRIMARY KEY CLUSTERED 
(
	[Stato_InterventoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStrutture]    Script Date: 22/11/2024 16:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStrutture](
	[StrutturaID] [int] IDENTITY(1,1) NOT NULL,
	[Struttura] [varchar](250) NOT NULL,
	[Città] [varchar](250) NOT NULL,
	[Regione] [varchar](250) NOT NULL,
 CONSTRAINT [PK_DimStrutture] PRIMARY KEY CLUSTERED 
(
	[StrutturaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimUnitàOrganizzative]    Script Date: 22/11/2024 16:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimUnitàOrganizzative](
	[UnitàOrganizzativaID] [int] IDENTITY(1,1) NOT NULL,
	[UnitàOrganizzativa] [nvarchar](250) NOT NULL,
	[StrutturaID] [int] NOT NULL,
 CONSTRAINT [PK_DimUnitàOrganizzative] PRIMARY KEY CLUSTERED 
(
	[UnitàOrganizzativaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimUsers]    Script Date: 22/11/2024 16:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_DimUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactInterventi]    Script Date: 22/11/2024 16:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactInterventi](
	[InterventoID] [int] IDENTITY(1,1) NOT NULL,
	[IssueID] [int] NOT NULL,
	[DataID] [int] NOT NULL,
	[Ora] [time](7) NOT NULL,
	[UnitàOrganizzativaID] [int] NULL,
	[Zona] [nvarchar](250) NOT NULL,
	[Asset] [nvarchar](250) NOT NULL,
	[Numero_InterventoID] [nvarchar](250) NOT NULL,
	[Grado_di_Urgenza] [int] NOT NULL,
	[AzioneID] [nvarchar](250) NOT NULL,
	[EsitoID] [nvarchar](250) NOT NULL,
	[AttivitàID] [int] NOT NULL,
	[Descrizione_Attività_Svolta] [nvarchar](250) NOT NULL,
	[Durata(minuti)] [int] NOT NULL,
	[Materiali_e_Componenti_Utilizzati] [nvarchar](250) NOT NULL,
	[Rif._DDT] [nvarchar](250) NOT NULL,
	[Ulteriori_Dipendenti_impiegati] [int] NOT NULL,
	[Necessità_di_Ordinare_Componenti] [bit] NOT NULL,
	[Necessità_di_Contattare_Ditte/Fornitori_Specializzati] [bit] NOT NULL,
	[Monitoraggio_Intervento_Ditta_Esterna] [bit] NOT NULL,
	[Ragione_Sociale] [nvarchar](250) NOT NULL,
	[Verifica_e_Collaudo] [bit] NOT NULL,
	[Rif._Fattura] [nvarchar](250) NOT NULL,
	[Rapporto_di_Intervento] [nvarchar](250) NOT NULL,
	[Stato_InterventoID] [nvarchar](250) NOT NULL,
	[Note/Implicazioni] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_FactInterventi] PRIMARY KEY CLUSTERED 
(
	[InterventoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactIssues]    Script Date: 22/11/2024 16:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactIssues](
	[IssueID] [int] IDENTITY(1,1) NOT NULL,
	[Utente_Richiedente] [int] NOT NULL,
	[Utente_Operatore] [int] NOT NULL,
	[Utente_Contabile] [int] NOT NULL,
 CONSTRAINT [PK_FactIssues] PRIMARY KEY CLUSTERED 
(
	[IssueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DimAttività] ON 

INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (1, N'1', N'LEGIONELLOSI e REGISTRI DI AUTOCONTROLLO', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (2, N'1.1', N'Monitoraggio e Controllo della Temperatura dell''Acqua', 10, N'Ordinaria', N'Gionaliera', 1, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (3, N'1.2', N'Sanificazione e Disinfezione degli Impianti Idrici', 30, N'Ordinaria', N'Settimanale', 1, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (4, N'1.3', N'Ispezione e Manutenzione dei Sistemi di Filtrazione e Trattamento dell''Acqua', 70, N'Ordinaria', N'Costante', 1, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (5, N'1.4', N'Controllo e Registrazione dei Parametri Microbiologici dell''Acqua', 80, N'Ordinaria', N'Costante', 1, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (6, N'1.5', N'Compilazione e Aggiornamento dei Registri di Autocontrollo', 90, N'Ordinaria', N'Costante', 1, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (7, N'2', N'SISTEMI DI SICUREZZA E DI EMERGENZA', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (8, N'2.1', N'Verifica e Test dei Sistemi di Allarme SOS in Camere e Bagni', 70, N'Ordinaria', N'Costante', 2, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (9, N'2.2', N'Manutenzione dei Sistemi di Backup e Sicurezza Elettronica', 60, N'Ordinaria', N'Costante', 2, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (10, N'2.3', N'Manutenzione dei Dispositivi di Sicurezza Personale (DPI)', 60, N'Ordinaria', N'Costante', 2, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (11, N'2.4', N'Manutenzione dei Generatori di Emergenza', 60, N'Ordinaria', N'Costante', 2, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (12, N'2.5', N'Controllo dei Sistemi di Sicurezza Perimetrale', 30, N'Ordinaria', N'Costante', 2, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (13, N'3', N'ELIMINAZIONE DELLE BARRIERE ARCHITETTONICHE', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (14, N'3.1', N'Ispezione e Manutenzione delle Rampe e degli Accessi per Disabili', 60, N'Ordinaria', N'Costante', 3, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (15, N'3.2', N'Manutenzione degli Ascensori e delle Piattaforme Elevatrici', 80, N'Ordinaria', N'Costante', 3, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (16, N'3.3', N'Manutenzione delle Scale e dei Corrimano', 70, N'Ordinaria', N'Costante', 3, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (17, N'3.4', N'Manutenzione delle Porte Automatiche e Accessi Sicuri', 70, N'Ordinaria', N'Costante', 3, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (18, N'3.5', N'Controllo degli Accessori per Disabili nelle Camere e nei Bagni', 30, N'Ordinaria', N'Costante', 3, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (19, N'4', N'LOCALI TECNICI', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (20, N'4.1', N'Pulizia e Disinfezione Regolare', 30, N'Ordinaria', N'Costante', 4, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (21, N'4.2', N'Controllo delle Condizioni di Umidità e Ventilazione', 40, N'Ordinaria', N'Costante', 4, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (22, N'4.3', N'Ispezioni Periodiche degli Impianti di Sicurezza', 70, N'Ordinaria', N'Costante', 4, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (23, N'4.4', N'Manutenzione delle Pavimentazioni e delle Superfici', 80, N'Ordinaria', N'Costante', 4, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (24, N'4.5', N'Gestione dei Rifiuti e dei Materiali Pericolosi', 100, N'Ordinaria', N'Costante', 4, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (25, N'5', N'PISCINE e SPA', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (26, N'5.1', N'Controllo e Manutenzione dei Filtri delle Piscine', 60, N'Ordinaria', N'Costante', 5, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (27, N'5.2', N'Monitoraggio dei Livelli di Cloro e pH', 40, N'Ordinaria', N'Costante', 5, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (28, N'5.3', N'Ispezione delle Pompe e dei Sistemi di Filtraggio', 70, N'Ordinaria', N'Costante', 5, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (29, N'5.4', N'Manutenzione delle Vasche e degli Idromassaggi', 120, N'Ordinaria', N'Costante', 5, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (30, N'5.5', N'Controllo dei Sistemi di Sicurezza e di Emergenza', 150, N'Ordinaria', N'Costante', 5, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (31, N'6', N'VERDE', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (32, N'6.1', N'Manutenzione del Verde Esterno', 180, N'Ordinaria', N'Costante', 6, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (33, N'6.2', N'Manutenzione del Verde Interno', 100, N'Ordinaria', N'Costante', 6, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (34, N'6.3', N'Disinfestazione da Roditori', 60, N'Ordinaria', N'Costante', 6, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (35, N'6.4', N'Controllo degli Insetti Striscianti e Volanti', 90, N'Ordinaria', N'Costante', 6, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (36, N'6.5', N'Manutenzione e Gestione dell''Impianto di Irrigazione', 80, N'Ordinaria', N'Costante', 6, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (37, N'7', N'ATTREZZATURE', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (38, N'7.1', N'Ispezione e Pulizia delle Cucine Industriali', 80, N'Ordinaria', N'Costante', 7, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (39, N'7.2', N'Manutenzione delle celle frigorifere', 90, N'Ordinaria', N'Costante', 7, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (40, N'7.3', N'Manutenzione delle Lavastoviglie Industriali', 50, N'Ordinaria', N'Costante', 7, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (41, N'7.4', N'Manutenzione delle Lavatrici Industriali', 90, N'Ordinaria', N'Costante', 7, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (42, N'7.5', N'Manutenzione delle Cappe Aspiranti e dei Filtri', 80, N'Ordinaria', N'Costante', 7, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (43, N'8', N'MEZZI', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (44, N'8.1', N'Ispezione e Manutenzione dei Veicoli Shuttle', 30, N'Ordinaria', N'Costante', 8, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (45, N'8.2', N'Manutenzione dei Carrelli Portabagagli', 40, N'Ordinaria', N'Costante', 8, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (46, N'8.3', N'Manutenzione Golf Car', 70, N'Ordinaria', N'Costante', 8, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (47, N'8.4', N'Controllo e Manutenzione delle Bici', 60, N'Ordinaria', N'Costante', 8, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (48, N'8.5', N'Manutenzione dei Carrelli e Muletti', 100, N'Ordinaria', N'Costante', 8, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (49, N'9', N'STRUTTURE', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (50, N'9.1', N'Ispezione delle Travi e dei Pilastri', 30, N'Ordinaria', N'Costante', 9, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (51, N'9.2', N'Controllo delle Pareti Portanti', 40, N'Ordinaria', N'Costante', 9, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (52, N'9.3', N'Verifica dei Soffitti e dei Solai', 70, N'Ordinaria', N'Costante', 9, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (53, N'9.4', N'Ispezione dei Parapetti e delle Ringhiere', 60, N'Ordinaria', N'Costante', 9, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (54, N'9.5', N'Controllo delle Scale e degli Accessi', 90, N'Ordinaria', N'Costante', 9, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (55, N'10', N'COPERTURE', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (56, N'10.1', N'Ispezione dei Materiali di Copertura', 80, N'Ordinaria', N'Costante', 10, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (57, N'10.2', N'Controllo dei Sistemi di Drenaggio', 90, N'Ordinaria', N'Costante', 10, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (58, N'10.3', N'Verifica delle Guarnizioni e dei Sigillanti', 70, N'Ordinaria', N'Costante', 10, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (59, N'10.4', N'Controllo degli Elementi di Fissaggio', 80, N'Ordinaria', N'Costante', 10, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (60, N'10.5', N'Pulizia della Superficie del Tetto', 80, N'Ordinaria', N'Costante', 10, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (61, N'11', N'SERRAMENTI', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (62, N'11.1', N'Verifica del Funzionamento dei Serramenti', 60, N'Ordinaria', N'Costante', 11, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (63, N'11.2', N'Controllo Guarnizioni e delle Sigillature', 50, N'Ordinaria', N'Costante', 11, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (64, N'11.3', N'Manutenzione Serrature e delle Maniglie', 70, N'Ordinaria', N'Costante', 11, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (65, N'11.4', N'Verifica dei Sistemi di Apertura Automatica', 80, N'Ordinaria', N'Costante', 11, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (66, N'11.5', N'Ispezione Vetri e delle Superfici Trasparenti', 50, N'Ordinaria', N'Costante', 11, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (67, N'12', N'PAVIMENTI ', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (68, N'12.1', N'Pulizia Approfondita', 180, N'Ordinaria', N'Costante', 12, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (69, N'12.2', N'Controllo dello Stato delle Superfici', 100, N'Ordinaria', N'Costante', 12, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (70, N'12.3', N'Manutenzione  Finiture e dei Trattamenti', 60, N'Ordinaria', N'Costante', 12, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (71, N'12.4', N'Verifica dei Sistemi di Drenaggio', 100, N'Ordinaria', N'Costante', 12, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (72, N'12.5', N'Controllo dell''Antiscivolo e Sicurezza', 80, N'Ordinaria', N'Costante', 12, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (73, N'13', N'RIVESTIMENTI', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (74, N'13.1', N'Ispezione Generale dei Rivestimenti', 40, N'Ordinaria', N'Costante', 13, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (75, N'13.2', N'Pulizia Profonda dei Rivestimenti', 100, N'Ordinaria', N'Costante', 13, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (76, N'13.3', N'Controllo delle Giunzioni e delle Finiture', 60, N'Ordinaria', N'Costante', 13, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (77, N'13.4', N'Manutenzione dei Trattamenti Protettivi', 60, N'Ordinaria', N'Costante', 13, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (78, N'13.5', N'Riparazioni e Interventi Preventivi', 80, N'Ordinaria', N'Costante', 13, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (79, N'14', N'SPAZI  COMUNI', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (80, N'14.1', N'Ispezione dei Viali e dei Camminamenti', 90, N'Ordinaria', N'Costante', 14, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (81, N'14.2', N'Manutenzione degli Arredi Esterni', 80, N'Ordinaria', N'Costante', 14, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (82, N'14.3', N'Controllo delle Aree Attrezzate', 60, N'Ordinaria', N'Costante', 14, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (83, N'14.4', N'Manutenzione dei Parcheggi', 75, N'Ordinaria', N'Costante', 14, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (84, N'14.5', N'Controllo dell''Illuminazione e Segnaletica', 70, N'Ordinaria', N'Costante', 14, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (85, N'15', N'IMP.  SCARICO', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (86, N'15.1', N'Ispezione Visiva delle Installazioni', 90, N'Ordinaria', N'Costante', 15, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (87, N'15.2', N'Controllo dei Livelli e delle Pressioni', 75, N'Ordinaria', N'Costante', 15, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (88, N'15.3', N'Manutenzione Preventiva dei Componenti', 60, N'Ordinaria', N'Costante', 15, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (89, N'15.4', N'Verifica delle Pompe di Sollevamento', 75, N'Ordinaria', N'Costante', 15, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (90, N'15.5', N'Verifica Procedure di Emergenza e Sicurezza', 70, N'Ordinaria', N'Costante', 15, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (91, N'16', N'IMP.  IDRICO', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (92, N'16.1', N'Ispezione Serbatoi di Accumulo e Cisterne', 90, N'Ordinaria', N'Costante', 16, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (93, N'16.2', N'Manutenzione Filtri e Sistemi di Addolcitura', 80, N'Ordinaria', N'Costante', 16, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (94, N'16.3', N'Controllo Sistemi di Pressurizzazione', 45, N'Ordinaria', N'Costante', 16, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (95, N'16.4', N'Sanificazione Tubazioni e dei Dispositivi', 75, N'Ordinaria', N'Costante', 16, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (96, N'16.5', N'Manutenzione Rubinetteria e dei Dispositivi', 70, N'Ordinaria', N'Costante', 16, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (97, N'17', N'IMP.  ACS', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (98, N'17.1', N'Controllo delle Caldaie a Gas', 60, N'Ordinaria', N'Costante', 17, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (99, N'17.2', N'Manutenzione dei Bollitori con Resistenza', 60, N'Ordinaria', N'Costante', 17, 2)
GO
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (100, N'3', N'Ispezione e Manutenzione Solare Termico', 55, N'Ordinaria', N'Costante', 17, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (101, N'4', N'Manutenzione delle Pompe di Calore (PDC)', 80, N'Ordinaria', N'Costante', 17, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (102, N'5', N'Controllo dei Sistemi di Controllo', 50, N'Ordinaria', N'Costante', 17, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (103, N'18', N'IMP. GAS', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (104, N'1', N'Ispezione dei Tubi e delle Connessioni', 70, N'Ordinaria', N'Costante', 18, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (105, N'2', N'Controllo dei Dispositivi di Sicurezza', 90, N'Ordinaria', N'Costante', 18, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (106, N'3', N'Test delle Valvole di Sicurezza', 60, N'Ordinaria', N'Costante', 18, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (107, N'4', N'Controllo dei Bruciatori e delle Fiamme', 180, N'Ordinaria', N'Costante', 18, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (108, N'5', N'Monitoraggio delle Emissioni di Gas', 120, N'Ordinaria', N'Costante', 18, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (109, N'19', N'IMP. CLIMA', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (110, N'1', N'Ispezione e Pulizia dei Filtri dell''Aria', 120, N'Ordinaria', N'Costante', 19, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (111, N'2', N'Controllo Ventole e Cinghie di Trasmissione', 120, N'Ordinaria', N'Costante', 19, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (112, N'3', N'Verifica Livelli di Refrigerante e Pressioni', 130, N'Ordinaria', N'Costante', 19, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (113, N'4', N'Controllo Sistemi di Automazione', 120, N'Ordinaria', N'Costante', 19, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (114, N'5', N'Manutenzione Generale e Lubrificazione', 90, N'Ordinaria', N'Costante', 19, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (115, N'20', N'IMP. EL', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (116, N'1', N'Verifica dei Quadri Elettrici', 50, N'Ordinaria', N'Costante', 20, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (117, N'2', N'Test dei Sistemi di Emergenza', 45, N'Ordinaria', N'Costante', 20, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (118, N'3', N'Controllo degli Impianti di Illuminazione', 45, N'Ordinaria', N'Costante', 20, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (119, N'4', N'Manutenzione degli Apparecchi Elettrici', 60, N'Ordinaria', N'Costante', 20, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (120, N'5', N'Test delle Prese e degli Interruttori', 120, N'Ordinaria', N'Costante', 20, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (121, N'21', N'IMP. RETE', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (122, N'1', N'Verifica Copertura e Qualità del Segnale', 90, N'Ordinaria', N'Costante', 21, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (123, N'2', N'Controllo Dispositivi e Punti di Accesso (AP)', 80, N'Ordinaria', N'Costante', 21, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (124, N'3', N'Test delle Connessioni Internet', 50, N'Ordinaria', N'Costante', 21, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (125, N'4', N'Monitoraggio della Sicurezza della Rete', 90, N'Ordinaria', N'Costante', 21, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (126, N'5', N'Backup Ripristino Configurazione di Rete', 120, N'Ordinaria', N'Costante', 21, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (127, N'22', N'DOMOTICA', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (128, N'1', N'Controllo Sistema di Accessi alle Camere', 90, N'Ordinaria', N'Costante', 22, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (129, N'2', N'Monitoraggio dei Consumi di Acqua', 120, N'Ordinaria', N'Costante', 22, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (130, N'3', N'Controllo Dispositivi di Gestione del Clima', 100, N'Ordinaria', N'Costante', 22, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (131, N'4', N'Verifica delle Routine di Automazione', 120, N'Ordinaria', N'Costante', 22, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (132, N'5', N'Test di Sicurezza e Aggiornamenti Software', 180, N'Ordinaria', N'Costante', 22, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (133, N'23', N'IMP.  FV', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (134, N'1', N'Ispezione dei Pannelli Fotovoltaici', 70, N'Ordinaria', N'Costante', 23, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (135, N'2', N'Controllo delle Connessioni elettriche', 90, N'Ordinaria', N'Costante', 23, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (136, N'3', N'Monitoraggio delle Prestazioni', 70, N'Ordinaria', N'Costante', 23, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (137, N'4', N'Manutenzione delle Colonnine di Ricarica', 50, N'Ordinaria', N'Costante', 23, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (138, N'5', N'Test di Sicurezza e Funzionalità', 120, N'Ordinaria', N'Costante', 23, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (139, N'24', N'ASCENSORI', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (140, N'1', N'Ispezione Visiva e Pulizia', 80, N'Ordinaria', N'Costante', 24, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (141, N'2', N'Controllo Porte e dei Sistemi di Chiusura', 60, N'Ordinaria', N'Costante', 24, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (142, N'3', N'Verifica Sistemi di Emergenza e Sicurezza', 70, N'Ordinaria', N'Costante', 24, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (143, N'4', N'Test di Movimentazione e Velocità', 100, N'Ordinaria', N'Costante', 24, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (144, N'5', N'Manutenzione Sistemi di Controllo ', 120, N'Ordinaria', N'Costante', 24, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (145, N'25', N'ANTINCENDIO', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (146, N'1', N'Ispezione Dispositivi Rilevamento Incendi', 50, N'Ordinaria', N'Costante', 26, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (147, N'2', N'Test degli Allarmi Antincendio', 60, N'Ordinaria', N'Costante', 26, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (148, N'3', N'Verifica Vie di Fuga e Uscite di Emergenza', 60, N'Ordinaria', N'Costante', 26, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (149, N'4', N'Manutenzione degli Estintori', 120, N'Ordinaria', N'Costante', 26, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (150, N'5', N'Controllo dei Sistemi di Sprinkler e Idranti', 120, N'Ordinaria', N'Costante', 26, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (151, N'26', N'ARREDI ', NULL, N'Ordinaria', N'Costante', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (152, N'1', N'Ispezione Generale degli Arredi', 40, N'Ordinaria', N'Costante', 27, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (153, N'2', N'Pulizia e Manutenzione degli Arredi', 70, N'Ordinaria', N'Costante', 27, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (154, N'3', N'Controllo delle Ombreggiature', 90, N'Ordinaria', N'Costante', 27, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (155, N'4', N'Manutenzione Decorazioni ', 50, N'Ordinaria', N'Costante', 27, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (156, N'5', N'Controllo Aree Comuni e Spazi Esterni', 35, N'Ordinaria', N'Costante', 27, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (157, N'A', N'ROTTURE/GUASTI IMPROVVISI', NULL, N'Straordinaria', N'Non_Specificato', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (158, N'B', N'DANNEGGIAMENTO DA PARTE DI TERZI', NULL, N'Straordinaria', N'Non_Specificato', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (159, N'D', N'CEDIMENTI STRUTTURALI', NULL, N'Straordinaria', N'Non_Specificato', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (160, N'E', N'EMERGENZE', NULL, N'Straordinaria', N'Non_Specificato', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (161, N'F', N'DANNI DA INCENDIO', NULL, N'Straordinaria', N'Non_Specificato', NULL, 1)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (162, N'A.1', N'Rotture/Guasti imp. SCARICO', 120, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (163, N'A.2', N'Rotture/Guasti imp. IDRAULICI', 120, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (164, N'A.3', N'Rotture/Guasti imp. ACS', 130, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (165, N'A.4', N'Rotture/Guasti imp. GAS', 130, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (166, N'A.5', N'Rotture/Guasti imp. CLIMA', 130, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (167, N'A.6', N'Rotture/Guasti imp. VENTILAZIONE', 90, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (168, N'A.7', N'Rotture/Guasti imp. ELETTRICI', 80, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (169, N'A.8', N'Rotture/Guasti imp. RETE', 75, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (170, N'A.9', N'Rotture/Guasti imp. DOMOTICA', 180, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (171, N'A.10', N'Rotture/Guasti imp. FV', 35, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (172, N'A.11', N'Rotture/Guasti imp. ASCENSORI', 40, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (173, N'A.12', N'Rotture/Guasti imp. ANTOINCENDIO', 100, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (174, N'A.13', N'Rotture/Guasti ARREDI', 45, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (175, N'A.14', N'Rotture/Guasti MEZZI', 50, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (176, N'A.15', N'Rotture/Guasti ATTREZZATURE', 120, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (177, N'A.16', N'Rotture/Guasti SPA', 120, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (178, N'A.17', N'Rotture/Guasti PISCINA', 180, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (179, N'A.18', N'Rotture/Guasti SISTEMI DI SICUREZZA', 180, N'Straordinaria', N'Non_Specificato', 157, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (180, N'B.1', N'Danneggiamento a seguito di INCIDENTE', 120, N'Straordinaria', N'Non_Specificato', 158, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (181, N'B.2', N'Danneggiamento a seguito di VANDALISMI', 120, N'Straordinaria', N'Non_Specificato', 158, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (182, N'C', N'CALAMITà NATURALI', 180, N'Straordinaria', N'Non_Specificato', 158, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (183, N'C.1', N'Danneggiamento per ALLAGAMENTO', 180, N'Straordinaria', N'Non_Specificato', 158, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (184, N'C.2', N'Danneggiamento per TEMPESTE E FULMINI', 180, N'Straordinaria', N'Non_Specificato', 158, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (185, N'D.1', N'Cedimenti strutturali FONDAZIONI', 180, N'Straordinaria', N'Non_Specificato', 159, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (186, N'D.2', N'Cedimenti strutturali MURATURE', 80, N'Straordinaria', N'Non_Specificato', 159, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (187, N'D.3', N'Cedimenti strutturali SOLAI', 50, N'Straordinaria', N'Non_Specificato', 159, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (188, N'D.4', N'Cedimenti TERRENO', 120, N'Straordinaria', N'Non_Specificato', 159, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (189, N'E.1', N'Interruzione adduzione idrica', 90, N'Straordinaria', N'Non_Specificato', 160, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (190, N'E.2', N'Interruzione di corrente', 80, N'Straordinaria', N'Non_Specificato', 160, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (191, N'E.3', N'Incendio', 60, N'Straordinaria', N'Non_Specificato', 160, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (192, N'E.4', N'Sicurezza', 75, N'Straordinaria', N'Non_Specificato', 160, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (193, N'E.5', N'Infestazione', 70, N'Straordinaria', N'Non_Specificato', 160, 2)
INSERT [dbo].[DimAttività] ([AttivitàID], [Code], [Attività], [Tempo_teorico_svolgimento_Attività], [TipologiaAttività], [Periodicità], [ParentID], [Livello]) VALUES (194, N'F.1', N'Riparazioni e ripristini POST-INCENDIO', 180, N'Straordinaria', N'Non_Specificato', 161, 2)
SET IDENTITY_INSERT [dbo].[DimAttività] OFF
GO
SET IDENTITY_INSERT [dbo].[DimAzioni] ON 

INSERT [dbo].[DimAzioni] ([AzioneID], [Azione]) VALUES (1, N'Pianificazione dell''Intervento')
INSERT [dbo].[DimAzioni] ([AzioneID], [Azione]) VALUES (2, N'Esecuzione dell''Intervento')
INSERT [dbo].[DimAzioni] ([AzioneID], [Azione]) VALUES (3, N'Monitoraggio_Intervento_ditta_esterna')
INSERT [dbo].[DimAzioni] ([AzioneID], [Azione]) VALUES (4, N'Test_e_Verifica')
INSERT [dbo].[DimAzioni] ([AzioneID], [Azione]) VALUES (5, N'Altro')
SET IDENTITY_INSERT [dbo].[DimAzioni] OFF
GO
SET IDENTITY_INSERT [dbo].[DimEsiti] ON 

INSERT [dbo].[DimEsiti] ([EsitoID], [Esito]) VALUES (1, N'Positivo')
INSERT [dbo].[DimEsiti] ([EsitoID], [Esito]) VALUES (2, N'Negativo')
INSERT [dbo].[DimEsiti] ([EsitoID], [Esito]) VALUES (3, N'Incompleto')
INSERT [dbo].[DimEsiti] ([EsitoID], [Esito]) VALUES (4, N'Altro')
SET IDENTITY_INSERT [dbo].[DimEsiti] OFF
GO
SET IDENTITY_INSERT [dbo].[DimNumeroInterventi] ON 

INSERT [dbo].[DimNumeroInterventi] ([Numero_InterventoID], [Numero_Intervento]) VALUES (1, N'Primo_Intervento')
INSERT [dbo].[DimNumeroInterventi] ([Numero_InterventoID], [Numero_Intervento]) VALUES (2, N'Secondo_Intervento')
INSERT [dbo].[DimNumeroInterventi] ([Numero_InterventoID], [Numero_Intervento]) VALUES (3, N'Terzo_Intervento')
SET IDENTITY_INSERT [dbo].[DimNumeroInterventi] OFF
GO
SET IDENTITY_INSERT [dbo].[DimStatoInterventi] ON 

INSERT [dbo].[DimStatoInterventi] ([Stato_InterventoID], [Stato_Intervento]) VALUES (1, N'Lavorato/Completato')
INSERT [dbo].[DimStatoInterventi] ([Stato_InterventoID], [Stato_Intervento]) VALUES (2, N'In_Lavorazione')
INSERT [dbo].[DimStatoInterventi] ([Stato_InterventoID], [Stato_Intervento]) VALUES (3, N'Annullato')
INSERT [dbo].[DimStatoInterventi] ([Stato_InterventoID], [Stato_Intervento]) VALUES (4, N'Altro')
SET IDENTITY_INSERT [dbo].[DimStatoInterventi] OFF
GO
SET IDENTITY_INSERT [dbo].[DimStrutture] ON 

INSERT [dbo].[DimStrutture] ([StrutturaID], [Struttura], [Città], [Regione]) VALUES (1, N'Basiliani', N'Otranto', N'Puglia')
INSERT [dbo].[DimStrutture] ([StrutturaID], [Struttura], [Città], [Regione]) VALUES (2, N'Baia Taormina', N'Taormina', N'Sicilia')
INSERT [dbo].[DimStrutture] ([StrutturaID], [Struttura], [Città], [Regione]) VALUES (3, N'CDSHotels Terrasini CittÃ  del Mare', N'Terrasini', N'Sicilia')
INSERT [dbo].[DimStrutture] ([StrutturaID], [Struttura], [Città], [Regione]) VALUES (4, N'Corte di Nettuno', N'Otranto', N'Puglia')
INSERT [dbo].[DimStrutture] ([StrutturaID], [Struttura], [Città], [Regione]) VALUES (5, N'Costa del Salento Village', N'Ugento', N'Puglia')
INSERT [dbo].[DimStrutture] ([StrutturaID], [Struttura], [Città], [Regione]) VALUES (6, N'Grand Hotel Riviera', N'NardÃ²', N'Puglia')
INSERT [dbo].[DimStrutture] ([StrutturaID], [Struttura], [Città], [Regione]) VALUES (7, N'Merenea Suite Hotel', N'Marittima', N'Puglia')
INSERT [dbo].[DimStrutture] ([StrutturaID], [Struttura], [Città], [Regione]) VALUES (8, N'Marelive', N'Specchiolla', N'Puglia')
INSERT [dbo].[DimStrutture] ([StrutturaID], [Struttura], [Città], [Regione]) VALUES (9, N'Pietrablu Resort & SPA', N'Polignano a Mare', N'Puglia')
INSERT [dbo].[DimStrutture] ([StrutturaID], [Struttura], [Città], [Regione]) VALUES (10, N'Porto Giardino', N'Monopoli', N'Puglia')
INSERT [dbo].[DimStrutture] ([StrutturaID], [Struttura], [Città], [Regione]) VALUES (11, N'Relais Masseria Le Cesine', N'Vernole', N'Puglia')
INSERT [dbo].[DimStrutture] ([StrutturaID], [Struttura], [Città], [Regione]) VALUES (12, N'Riva Marina Resort', N'Carovigno', N'Puglia')
SET IDENTITY_INSERT [dbo].[DimStrutture] OFF
GO
SET IDENTITY_INSERT [dbo].[DimUnitàOrganizzative] ON 

INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (1, N'Ingresso principale', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (2, N'Ingresso secondario', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (3, N'Hall', 8)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (4, N'Reception', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (5, N'Uffici', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (6, N'Bar Hall', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (7, N'Scala 1', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (8, N'Scala2', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (9, N'Scala n°', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (10, N'Ascensore 1', 7)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (11, N'Ascensore 2', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (12, N'Cucina', 10)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (13, N'Pasticceria', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (14, N'Plonge', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (15, N'Cella positiva 1 - cucina', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (16, N'Cella negativa 1 - cucina', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (17, N'Cella positiva 1 - Ristorante', 6)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (18, N'Centro Benessere - Zona Massaggi', 6)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (19, N'Centro Benessere - Zona Spogliatoi', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (20, N'Centro Benessere - Zona Umida', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (21, N'Economato', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (22, N'Cella positiva 1 - Economato', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (23, N'Cella negativa 1 - Economato', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (24, N'Lavanderia', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (25, N'Deposito 1 - ', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (26, N'Deposito 2 - ', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (27, N'Deposito 3 - ', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (28, N'Deposito 4 - ', 7)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (29, N'Deposito 5 - ', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (30, N'Deposito n - ', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (31, N'Pozzo Luce - al piano -1', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (32, N'Deposito Organico - cella dell''umido', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (33, N'Lavanderia', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (34, N'Camera 1 - Staff', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (35, N'Camera 2 - Staff', 8)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (36, N'Camera 3 - Staff', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (37, N'Camera 4 - Staff', 6)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (38, N'Camera 5 - Staff', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (39, N'Camera 6 - Staff', 10)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (40, N'Camera 7 - Staff', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (41, N'Bagno camere Staff', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (42, N'Spogliatoio Maschile - Food&Beverage', 10)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (43, N'Spogliatoio Femminile - Food&Beverage', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (44, N'Spogliatoio Femminile - Housekeeping', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (45, N'Locale tecnico 1', 6)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (46, N'Locale tecnico 2', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (47, N'Locale tecnico 3', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (48, N'Locale tecnico 4', 6)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (49, N'Locale tecnico 5', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (50, N'Locale tecnico n', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (51, N'Piscina Grande', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (52, N'Piscina Piccola', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (53, N'WC piscina', 8)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (54, N'Garden Bar ', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (55, N'Palestra', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (56, N'Kids Park', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (57, N'Parcheggio', 7)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (58, N'Ingresso Parcheggio', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (59, N'Aree Comuni', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (60, N'Terrazza - Lastricato solare', 8)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (61, N'Roof Garden', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (62, N'Roof Top', 8)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (63, N'Cucina Roof Garden', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (64, N'Cella Positiva - Cucina Roof Garden', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (65, N'Plonge Roof Garden', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (66, N'Parco', 8)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (67, N'Lido', 7)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (68, N'Cabina Enel', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (69, N'Cabina Trasformatore', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (70, N'Generatore', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (71, N'PDC Galletti 1', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (72, N'PDC Galletti 2', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (73, N'Serbatoio Gas', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (74, N'Riserva idrica', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (75, N'Gruppo di pressurizzazione ', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (76, N'Addolcitore', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (77, N'Imp. Produzione ACS', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (78, N'Imp. Clima - centrale', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (79, N'Allaccio Fogna', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (80, N'Montacarichi Economato', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (81, N'Servbatoio Di raccolta - cinsterna', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (82, N'Sala Rak 1', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (83, N'Sala Rak 2', 7)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (84, N'Sala Rak n', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (85, N'Sala Nereide', 10)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (86, N'Sala Calypso', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (87, N'Bar Sala Calypso', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (88, N'Deposito Bar Sala Calypso', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (89, N'Servizi Sala Calypso', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (90, N'Sala Riviera', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (91, N'Sala Perseide', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (92, N'Sala Kloe', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (93, N'Terrazza Kloe', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (94, N'Giardino d''Inverno', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (95, N'Camera 022', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (96, N'Camera 023', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (97, N'Camera 024', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (98, N'Camera 025', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (99, N'Camera 026', 11)
GO
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (100, N'Camera 101', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (101, N'Camera 102', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (102, N'Camera 103', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (103, N'Camera 104', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (104, N'Camera 105', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (105, N'Camera 106', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (106, N'Camera 107', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (107, N'Camera 108', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (108, N'Camera 109', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (109, N'Camera 110', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (110, N'Camera 111', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (111, N'Camera 112', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (112, N'Camera 113', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (113, N'Camera 114', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (114, N'Camera 115', 7)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (115, N'Camera 116', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (116, N'Camera 117', 10)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (117, N'Camera 118', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (118, N'Camera 119', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (119, N'Camera 120', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (120, N'Camera 121', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (121, N'Camera 122', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (122, N'Camera 123', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (123, N'Camera 124', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (124, N'Camera 125', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (125, N'Camera 126', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (126, N'Camera 127', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (127, N'Camera 128', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (128, N'Camera 129', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (129, N'Camera 130', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (130, N'Camera 131', 10)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (131, N'Camera 132', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (132, N'Camera 133', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (133, N'Camera 134', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (134, N'Camera 135', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (135, N'Camera 136', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (136, N'Camera 137', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (137, N'Camera 204', 7)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (138, N'Camera 205', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (139, N'Camera 206', 10)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (140, N'Camera 207', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (141, N'Camera 208', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (142, N'Camera 209', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (143, N'Camera 210', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (144, N'Camera 211', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (145, N'Camera 212', 6)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (146, N'Camera 213', 7)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (147, N'Camera 214', 7)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (148, N'Camera 215', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (149, N'Camera 216', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (150, N'Camera 217', 8)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (151, N'Camera 218', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (152, N'Camera 219', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (153, N'Camera 220', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (154, N'Camera 221', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (155, N'Camera 222', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (156, N'Camera 223', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (157, N'Camera 224', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (158, N'Camera 225', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (159, N'Camera 226', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (160, N'Camera 227', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (161, N'Camera 228', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (162, N'Camera 229', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (163, N'Camera 230', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (164, N'Camera 231', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (165, N'Camera 232', 8)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (166, N'Camera 233', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (167, N'Camera 234', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (168, N'Camera 235', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (169, N'Camera 236', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (170, N'Camera 237', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (171, N'Camera 304', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (172, N'Camera 305', 7)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (173, N'Camera 306', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (174, N'Camera 307', 10)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (175, N'Camera 308', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (176, N'Camera 309', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (177, N'Camera 310', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (178, N'Camera 311', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (179, N'Camera 312', 6)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (180, N'Camera 313', 6)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (181, N'Camera 314', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (182, N'Camera 315', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (183, N'Camera 316', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (184, N'Camera 317', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (185, N'Camera 318', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (186, N'Camera 319', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (187, N'Camera 320', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (188, N'Camera 321', 4)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (189, N'Camera 322', 11)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (190, N'Camera 323', 12)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (191, N'Camera 324', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (192, N'Camera 325', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (193, N'Camera 326', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (194, N'Camera 327', 8)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (195, N'Camera 328', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (196, N'Camera 329', 3)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (197, N'Camera 330', 5)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (198, N'Camera 331', 6)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (199, N'Camera 332', 6)
GO
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (200, N'Camera 333', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (201, N'Camera 334', 1)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (202, N'Camera 335', 2)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (203, N'Camera 336', 9)
INSERT [dbo].[DimUnitàOrganizzative] ([UnitàOrganizzativaID], [UnitàOrganizzativa], [StrutturaID]) VALUES (204, N'Camera 337', 3)
SET IDENTITY_INSERT [dbo].[DimUnitàOrganizzative] OFF
GO
SET IDENTITY_INSERT [dbo].[DimUsers] ON 

INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (1, N'Rossi M.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (2, N'Verdi G.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (3, N'Neri A.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (4, N'Esposito G.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (5, N'Romano A.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (6, N'Ricci L.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (7, N'Marino M')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (8, N'Giordano L.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (9, N'Mancini P.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (10, N'Rizzo M.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (11, N'Costa G.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (12, N'Dalo M.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (13, N'Rinaldi G.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (14, N'Gentile G.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (15, N'Moretti M.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (16, N'Ferrari F.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (17, N'Fontana G.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (18, N'Amato Z.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (19, N'Barbieri D.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (20, N'Leone G.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (21, N'Longo B.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (22, N'Greco D.')
INSERT [dbo].[DimUsers] ([UserID], [Nome]) VALUES (23, N'Caruso N.')
SET IDENTITY_INSERT [dbo].[DimUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[FactInterventi] ON 

INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (1, 1, 20240701, CAST(N'10:00:00' AS Time), 1, N'Bagno', N'Lavandino', N'Primo_Intervento', 1, N'Pianificazione dell''Intervento', N'Positivo', 13, N'Sostituzione_Filtro', 50, N'Filtro', N'DDT001', 2, 1, 0, 0, N'ABC Srl', 1, N'FATT001', N'RAPP001', N'Lavorato/Completato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (2, 1, 20240701, CAST(N'10:30:00' AS Time), 1, N'Camera', N'Condizionatore', N'Primo_Intervento', 2, N'Esecuzione dell''Intervento', N'Negativo', 24, N'Riparazione_Valvola', 60, N'Valvola', N'DDT002', 3, 1, 0, 0, N'DEF Srl', 0, N'FATT002', N'RAPP002', N'In_Lavorazione', N'Necessario_contattare_fornitore')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (3, 1, 20240702, CAST(N'09:00:00' AS Time), 1, N'Palestra', N'Condizionatore', N'Secondo_Intervento', 5, N'Monitoraggio_Intervento_ditta_esterna', N'Incompleto', 159, N'Sostituzione_Condizionatore', 100, N'Condizionatore', N'DDT003', 1, 0, 1, 1, N'GHI Srl', 1, N'FATT003', N'RAPP003', N'In_Lavorazione', N'Monitoraggio_ditta_esterna')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (4, 1, 20240703, CAST(N'16:00:00' AS Time), 1, N'Hall', N'Tv', N'Primo_Intervento', 3, N'Pianificazione dell''Intervento', N'Positivo', 185, N'Riparazione_Tv', 90, N'Cavo', N'DDT004', 0, 0, 0, 0, N'JKL Srl ', 0, N'FATT004', N'RAPP004', N'Altro', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (5, 1, 20240703, CAST(N'13:00:00' AS Time), 3, N'Bagno', N'Lavandino', N'Terzo_Intervento', 5, N'Esecuzione dell''Intervento', N'Positivo', 98, N'Riparazione_Condizionatore', 110, N'Compressore', N'DDT005', 2, 0, 1, 1, N'MNO Srl', 0, N'FATT005', N'RAPP005', N'Lavorato/Completato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (6, 2, 20240704, CAST(N'10:00:00' AS Time), 3, N'Ristorante', N'Condizionatore', N'Terzo_Intervento', 1, N'Monitoraggio_Intervento_ditta_esterna', N'Positivo', 169, N'Sostituzione_Filtro', 80, N'Filtro', N'DDT006', 3, 0, 1, 1, N'ABC Srl', 1, N'FATT006', N'RAPP006', N'Annullato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (7, 2, 20240704, CAST(N'10:30:00' AS Time), 3, N'Bagno', N'Lavandino', N'Primo_Intervento', 4, N'Test_e_Verifica', N'Positivo', 189, N'Riparazione Valvola', 85, N'Valvola', N'DDT007', 5, 0, 0, 0, N'DEF Srl', 1, N'FATT007', N'RAPP007', N'Lavorato/Completato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (8, 2, 20240705, CAST(N'16:00:00' AS Time), 3, N'Palestra', N'Condizionatore', N'Terzo_Intervento', 4, N'Esecuzione dell''Intervento', N'Positivo', 56, N'Riparazione_Condizionatore', 100, N'Condizionatore', N'DDT008', 1, 0, 0, 0, N'GHI Srl', 1, N'FATT008', N'RAPP008', N'In_Lavorazione', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (9, 2, 20240706, CAST(N'16:00:00' AS Time), 5, N'Ristorante', N'Tv', N'Primo_Intervento', 4, N'Esecuzione dell''Intervento', N'Incompleto', 76, N'Riparazione_Tv', 120, N'Cavo', N'DDT009', 0, 0, 0, 0, N'JKL Srl ', 1, N'FATT009', N'RAPP009', N'In_Lavorazione', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (10, 3, 20240707, CAST(N'13:00:00' AS Time), 5, N'Camera', N'Condizionatore', N'Primo_Intervento', 4, N'Monitoraggio_Intervento_ditta_esterna', N'Positivo', 187, N'Riparazione Compressore', 110, N'Compressore', N'DDT010', 0, 0, 1, 1, N'MNO Srl', 0, N'FATT010', N'RAPP010', N'Altro', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (11, 3, 20240708, CAST(N'10:00:00' AS Time), 5, N'Palestra', N'Condizionatore', N'Secondo_Intervento', 3, N'Test_e_Verifica', N'Negativo', 87, N'Riparazione_Condizionatore', 120, N'Condizionatore', N'DDT011', 6, 1, 0, 0, N'ABC Srl', 1, N'FATT011', N'RAPP011', N'Lavorato/Completato', N'Necessario_contattare_fornitore')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (12, 3, 20240708, CAST(N'10:30:00' AS Time), 7, N'Ristorante', N'Tv', N'Secondo_Intervento', 3, N'Esecuzione dell''Intervento', N'Positivo', 45, N'Riparazione_Tv', 50, N'Cavo', N'DDT012', 0, 1, 1, 1, N'DEF Srl', 1, N'FATT012', N'RAPP012', N'Annullato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (13, 3, 20240709, CAST(N'10:30:00' AS Time), 7, N'Camera', N'Condizionatore', N'Secondo_Intervento', 4, N'Esecuzione dell''Intervento', N'Positivo', 65, N'Riparazione Compressore', 40, N'Compressore', N'DDT013', 5, 0, 1, 1, N'GHI Srl', 1, N'FATT013', N'RAPP013', N'Lavorato/Completato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (14, 4, 20240710, CAST(N'16:00:00' AS Time), 7, N'Palestra', N'Condizionatore', N'Primo_Intervento', 2, N'Monitoraggio_Intervento_ditta_esterna', N'Negativo', 177, N'Riparazione_Condizionatore', 120, N'Condizionatore', N'DDT014', 4, 0, 1, 1, N'JKL Srl ', 1, N'FATT014', N'RAPP014', N'In_Lavorazione', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (15, 4, 20240710, CAST(N'16:00:00' AS Time), 9, N'Ristorante', N'Tv', N'Secondo_Intervento', 4, N'Test_e_Verifica', N'Incompleto', 88, N'Riparazione_Tv', 70, N'Cavo', N'DDT015', 3, 0, 0, 0, N'MNO Srl', 0, N'FATT015', N'RAPP015', N'In_Lavorazione', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (16, 4, 20240710, CAST(N'13:00:00' AS Time), 9, N'Camera', N'Condizionatore', N'Secondo_Intervento', 5, N'Esecuzione dell''Intervento', N'Positivo', 55, N'Riparazione_Condizionatore', 60, N'Compressore', N'DDT016', 6, 0, 1, 1, N'ABC Srl', 1, N'FATT016', N'RAPP016', N'Altro', N'Monitoraggio_ditta_esterna')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (17, 4, 20240711, CAST(N'10:00:00' AS Time), 9, N'Ristorante', N'Condizionatore', N'Secondo_Intervento', 1, N'Esecuzione dell''Intervento', N'Negativo', 22, N'Riparazione_Condizionatore', 70, N'Condizionatore', N'DDT017', 5, 0, 0, 0, N'DEF Srl', 1, N'FATT017', N'RAPP017', N'Lavorato/Completato', N'Nessuna implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (18, 4, 20240712, CAST(N'10:30:00' AS Time), 8, N'Camera', N'Tv', N'Primo_Intervento', 5, N'Monitoraggio_Intervento_ditta_esterna', N'Positivo', 183, N'Riparazione_Tv', 90, N'Cavo', N'DDT018', 4, 0, 1, 1, N'GHI Srl', 1, N'FATT018', N'RAPP018', N'Annullato', N'Necessario_contattare_fornitore')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (19, 5, 20240713, CAST(N'10:30:00' AS Time), 8, N'Ristorante', N'Condizionatore', N'Primo_Intervento', 4, N'Pianificazione dell''Intervento', N'Positivo', 67, N'Riparazione_Condizionatore', 70, N'Compressore', N'DDT019', 3, 0, 0, 0, N'JKL Srl ', 1, N'FATT019', N'RAPP019', N'Lavorato/Completato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (20, 5, 20240714, CAST(N'16:00:00' AS Time), 8, N'Camera', N'Tv', N'Primo_Intervento', 3, N'Esecuzione dell''Intervento', N'Positivo', 87, N'Riparazione_Tv', 90, N'Cavo', N'DDT020', 3, 0, 0, 0, N'MNO Srl', 0, N'FATT020', N'RAPP020', N'In_Lavorazione', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (21, 5, 20240715, CAST(N'16:00:00' AS Time), 8, N'Ristorante', N'Condizionatore', N'Secondo_Intervento', 3, N'Monitoraggio_Intervento_ditta_esterna', N'Negativo', 162, N'Riparazione_Condizionatore', 70, N'Compressore', N'DDT021', 5, 0, 1, 1, N'ABC Srl', 1, N'FATT021', N'RAPP021', N'In_Lavorazione', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (22, 5, 20240716, CAST(N'13:00:00' AS Time), 8, N'Camera', N'Tv', N'Secondo_Intervento', 3, N'Test_e_Verifica', N'Positivo', 21, N'Riparazione_Tv', 50, N'Cavo', N'DDT022', 0, 0, 1, 1, N'DEF Srl', 1, N'FATT022', N'RAPP022', N'Altro', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (23, 6, 20240717, CAST(N'10:00:00' AS Time), 8, N'Ristorante', N'Condizionatore', N'Primo_Intervento', 2, N'Esecuzione dell''Intervento', N'Positivo', 103, N'Riparazione_Condizionatore', 120, N'Compressore', N'DDT023', 4, 1, 0, 0, N'GHI Srl', 1, N'FATT023', N'RAPP023', N'Lavorato/Completato', N'Necessario_contattare_fornitore')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (24, 6, 20240718, CAST(N'10:30:00' AS Time), 8, N'Bagno', N'Lavandino', N'Primo_Intervento', 1, N'Test_e_Verifica', N'Positivo', 105, N'Sostituzione_Filtro', 90, N'Filtro', N'DDT024', 3, 0, 0, 0, N'JKL Srl ', 1, N'FATT024', N'RAPP024', N'Annullato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (25, 6, 20240722, CAST(N'16:00:00' AS Time), 8, N'Camera', N'Tv', N'Primo_Intervento', 2, N'Monitoraggio_Intervento_ditta_esterna', N'Positivo', 168, N'Riparazione_Tv', 90, N'Cavo', N'DDT025', 0, 0, 1, 1, N'MNO Srl', 0, N'FATT025', N'RAPP025', N'Lavorato/Completato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (26, 6, 20240722, CAST(N'16:00:00' AS Time), 4, N'Ristorante', N'Condizionatore', N'Primo_Intervento', 3, N'Test_e_Verifica', N'Negativo', 3, N'Riparazione_Condizionatore', 50, N'Compressore', N'DDT026', 0, 0, 0, 0, N'ABC Srl', 1, N'FATT026', N'RAPP026', N'In_Lavorazione', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (27, 6, 20240725, CAST(N'13:00:00' AS Time), 4, N'Palestra', N'Lavandino', N'Secondo_Intervento', 2, N'Esecuzione dell''Intervento', N'Positivo', 24, N'Sostituzione_Filtro', 50, N'Filtro', N'DDT027', 4, 0, 0, 0, N'DEF Srl', 1, N'FATT027', N'RAPP027', N'In_Lavorazione', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (28, 7, 20240727, CAST(N'10:00:00' AS Time), 4, N'Camera', N'Tv', N'Secondo_Intervento', 1, N'Test_e_Verifica', N'Positivo', 65, N'Riparazione_Tv', 90, N'Cavo', N'DDT028', 5, 0, 0, 0, N'GHI Srl', 1, N'FATT028', N'RAPP028', N'Altro', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (29, 7, 20240727, CAST(N'10:30:00' AS Time), 4, N'Ristorante', N'Condizionatore', N'Primo_Intervento', 3, N'Monitoraggio_Intervento_ditta_esterna', N'Positivo', 190, N'Riparazione_Condizionatore', 80, N'Compressore', N'DDT029', 0, 0, 1, 1, N'JKL Srl ', 1, N'FATT029', N'RAPP029', N'Lavorato/Completato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (30, 7, 20240727, CAST(N'10:30:00' AS Time), 4, N'Palestra', N'Condizionatore', N'Primo_Intervento', 4, N'Pianificazione dell''Intervento', N'Positivo', 32, N'Riparazione_Valvola', 130, N'Valvola', N'DDT030', 0, 0, 0, 0, N'MNO Srl', 0, N'FATT030', N'RAPP030', N'Annullato', N'Monitoraggio_ditta_esterna')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (31, 7, 20240728, CAST(N'16:00:00' AS Time), 2, N'Camera', N'Condizionatore', N'Primo_Intervento', 4, N'Pianificazione dell''Intervento', N'Positivo', 65, N'Riparazione_Condizionatore', 100, N'Compressore', N'DDT031', 0, 0, 0, 0, N'ABC Srl', 1, N'FATT031', N'RAPP031', N'Lavorato/Completato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (32, 7, 20240729, CAST(N'09:00:00' AS Time), 2, N'Ristorante', N'Condizionatore', N'Primo_Intervento', 5, N'Pianificazione dell''Intervento', N'Negativo', 32, N'Riparazione_Valvola', 170, N'Valvola', N'DDT032', 4, 0, 0, 0, N'DEF Srl', 1, N'FATT032', N'RAPP032', N'In_Lavorazione', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (33, 8, 20240730, CAST(N'13:00:00' AS Time), 2, N'Hall', N'Condizionatore', N'Secondo_Intervento', 5, N'Esecuzione dell''Intervento', N'Positivo', 87, N'Riparazione_Condizionatore', 70, N'Compressore', N'DDT033', 0, 0, 0, 0, N'GHI Srl', 1, N'FATT033', N'RAPP033', N'In_Lavorazione', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (34, 8, 20240801, CAST(N'10:00:00' AS Time), 2, N'Camera', N'Condizionatore', N'Terzo_Intervento', 5, N'Pianificazione dell''Intervento', N'Positivo', 43, N'Riparazione_Valvola', 50, N'Valvola', N'DDT034', 3, 0, 1, 1, N'JKL Srl ', 1, N'FATT034', N'RAPP034', N'In_Lavorazione', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (35, 8, 20240702, CAST(N'10:30:00' AS Time), 2, N'Ristorante', N'Condizionatore', N'Secondo_Intervento', 3, N'Esecuzione dell''Intervento', N'Positivo', 12, N'Riparazione_Condizionatore', 120, N'Compressore', N'DDT035', 2, 1, 0, 0, N'MNO Srl', 0, N'FATT035', N'RAPP035', N'Lavorato/Completato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (36, 8, 20240702, CAST(N'16:00:00' AS Time), 2, N'Hall', N'Tv', N'Primo_Intervento', 4, N'Pianificazione dell''Intervento', N'Positivo', 54, N'Riparazione_Tv', 90, N'Cavo', N'DDT036', 1, 0, 0, 0, N'ABC Srl', 1, N'FATT036', N'RAPP036', N'Altro', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (37, 8, 20240703, CAST(N'10:30:00' AS Time), 12, N'Camera', N'Condizionatore', N'Primo_Intervento', 4, N'Esecuzione dell''Intervento', N'Positivo', 56, N'Riparazione_Condizionatore', 90, N'Compressore', N'DDT037', 1, 0, 0, 0, N'DEF Srl', 1, N'FATT037', N'RAPP037', N'Lavorato/Completato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (38, 9, 20240704, CAST(N'16:00:00' AS Time), 12, N'Bagno', N'Lavandino', N'Secondo_Intervento', 3, N'Pianificazione dell''Intervento', N'Incompleto', 23, N'Sostituzione_Filtro', 80, N'Filtro', N'DDT038', 0, 0, 0, 0, N'GHI Srl', 1, N'FATT038', N'RAPP038', N'Lavorato/Completato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (39, 9, 20240705, CAST(N'09:00:00' AS Time), 12, N'Camera', N'Tv', N'Terzo_Intervento', 2, N'Monitoraggio_Intervento_ditta_esterna', N'Positivo', 178, N'Riparazione_Tv', 130, N'Cavo', N'DDT039', 3, 0, 1, 1, N'JKL Srl ', 1, N'FATT039', N'RAPP039', N'In_Lavorazione', N'Necessario_contattare_fornitore')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (40, 9, 20240704, CAST(N'13:00:00' AS Time), 12, N'Camera', N'Condizionatore', N'Secondo_Intervento', 3, N'Test_e_Verifica', N'Positivo', 34, N'Riparazione_Valvola', 90, N'Valvola', N'DDT040', 4, 0, 0, 0, N'MNO Srl', 0, N'FATT040', N'RAPP040', N'Altro', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (41, 9, 20240704, CAST(N'10:00:00' AS Time), 12, N'Hall', N'Condizionatore', N'Terzo_Intervento', 4, N'Test_e_Verifica', N'Positivo', 14, N'Riparazione_Condizionatore', 70, N'Compressore', N'DDT041', 0, 0, 0, 0, N'ABC Srl', 1, N'FATT041', N'RAPP041', N'Lavorato/Completato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (42, 10, 20240705, CAST(N'10:30:00' AS Time), 10, N'Camera', N'Condizionatore', N'Secondo_Intervento', 5, N'Monitoraggio_Intervento_ditta_esterna', N'Incompleto', 179, N'Riparazione_Valvola', 80, N'Valvola', N'DDT042', 0, 1, 1, 1, N'DEF Srl', 1, N'FATT042', N'RAPP042', N'Annullato', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (43, 10, 20240707, CAST(N'16:00:00' AS Time), 10, N'Camera', N'Condizionatore', N'Terzo_Intervento', 5, N'Monitoraggio_Intervento_ditta_esterna', N'Positivo', 189, N'Riparazione_Condizionatore', 80, N'Compressore', N'DDT043', 3, 0, 1, 1, N'GHI Srl', 1, N'FATT043', N'RAPP043', N'Lavorato/Completato', N'Monitoraggio_ditta_esterna')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (44, 10, 20240707, CAST(N'10:30:00' AS Time), 10, N'Camera', N'Tv', N'Secondo_Intervento', 3, N'Test_e_Verifica', N'Negativo', 59, N'Riparazione_Tv', 90, N'Cavo', N'DDT044', 2, 0, 0, 0, N'JKL Srl ', 1, N'FATT044', N'RAPP044', N'In_Lavorazione', N'Nessuna_implicazione')
INSERT [dbo].[FactInterventi] ([InterventoID], [IssueID], [DataID], [Ora], [UnitàOrganizzativaID], [Zona], [Asset], [Numero_InterventoID], [Grado_di_Urgenza], [AzioneID], [EsitoID], [AttivitàID], [Descrizione_Attività_Svolta], [Durata(minuti)], [Materiali_e_Componenti_Utilizzati], [Rif._DDT], [Ulteriori_Dipendenti_impiegati], [Necessità_di_Ordinare_Componenti], [Necessità_di_Contattare_Ditte/Fornitori_Specializzati], [Monitoraggio_Intervento_Ditta_Esterna], [Ragione_Sociale], [Verifica_e_Collaudo], [Rif._Fattura], [Rapporto_di_Intervento], [Stato_InterventoID], [Note/Implicazioni]) VALUES (45, 10, 20240708, CAST(N'16:00:00' AS Time), 10, N'Camera', N'Tv', N'Terzo_Intervento', 2, N'Monitoraggio_Intervento_ditta_esterna', N'Positivo', 45, N'Riparazione_Tv', 120, N'Cavo', N'DDT045', 1, 0, 1, 1, N'MNO Srl', 0, N'FATT045', N'RAPP045', N'In_Lavorazione', N'Nessuna_implicazione')
SET IDENTITY_INSERT [dbo].[FactInterventi] OFF
GO
SET IDENTITY_INSERT [dbo].[FactIssues] ON 

INSERT [dbo].[FactIssues] ([IssueID], [Utente_Richiedente], [Utente_Operatore], [Utente_Contabile]) VALUES (1, 6, 14, 21)
INSERT [dbo].[FactIssues] ([IssueID], [Utente_Richiedente], [Utente_Operatore], [Utente_Contabile]) VALUES (2, 2, 12, 22)
INSERT [dbo].[FactIssues] ([IssueID], [Utente_Richiedente], [Utente_Operatore], [Utente_Contabile]) VALUES (3, 3, 19, 21)
INSERT [dbo].[FactIssues] ([IssueID], [Utente_Richiedente], [Utente_Operatore], [Utente_Contabile]) VALUES (4, 7, 13, 21)
INSERT [dbo].[FactIssues] ([IssueID], [Utente_Richiedente], [Utente_Operatore], [Utente_Contabile]) VALUES (5, 10, 11, 22)
INSERT [dbo].[FactIssues] ([IssueID], [Utente_Richiedente], [Utente_Operatore], [Utente_Contabile]) VALUES (6, 4, 17, 23)
INSERT [dbo].[FactIssues] ([IssueID], [Utente_Richiedente], [Utente_Operatore], [Utente_Contabile]) VALUES (7, 1, 16, 21)
INSERT [dbo].[FactIssues] ([IssueID], [Utente_Richiedente], [Utente_Operatore], [Utente_Contabile]) VALUES (8, 8, 20, 22)
INSERT [dbo].[FactIssues] ([IssueID], [Utente_Richiedente], [Utente_Operatore], [Utente_Contabile]) VALUES (9, 9, 18, 23)
INSERT [dbo].[FactIssues] ([IssueID], [Utente_Richiedente], [Utente_Operatore], [Utente_Contabile]) VALUES (10, 5, 15, 23)
SET IDENTITY_INSERT [dbo].[FactIssues] OFF
GO
USE [master]
GO
ALTER DATABASE [DatasetMaintenance] SET  READ_WRITE 
GO
