﻿/*
Deployment script for ProjectsTechDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "ProjectsTechDB"
:setvar DefaultFilePrefix "ProjectsTechDB"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESSLOCADB\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESSLOCADB\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[WeightComponents]...';


GO
ALTER TABLE [dbo].[WeightComponents] DROP CONSTRAINT [DF__WeightCom__DateA__47DBAE45];


GO
PRINT N'Altering Table [dbo].[Stamps]...';


GO
ALTER TABLE [dbo].[Stamps]
    ADD [DateAdded] DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
        [Updated]   DATETIME NULL;


GO
PRINT N'Altering Table [dbo].[WeightComponents]...';


GO
ALTER TABLE [dbo].[WeightComponents] ALTER COLUMN [Description] NVARCHAR (MAX) NULL;


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[WeightComponents]...';


GO
ALTER TABLE [dbo].[WeightComponents]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [DateAdded];


GO
if not exists (select 1 from dbo.[MetalComponents])
begin
	insert into dbo.[MetalComponents] (Code)
	values
	('SRD6791-P'),
	('SRD6791-PEBGR1'),
	('SRD6791-PDBTREE1'),
	('SRD3604'),
	('SRD3604EBTREE1'),
	('SRD2545-132P121SED'),
	('SRD3604LOPE'),
	('SRD6971-PABSOLUTE')
end

if not exists (select 1 from dbo.[PlasticComponent])
begin
	insert into dbo.[PlasticComponent] (Code)
	values
	('C3000'),
	('C2960');
end

if not exists (select 1 from dbo.[Prints])
begin
	insert into dbo.[Prints] (Code)
	values
	('LOPE'),
	('ABSOLUTE')
end

if not exists (select 1 from dbo.[MetalPrint])
begin
	insert into dbo.[MetalPrint] (MetalCode, PrintCode)
	values
	('SRD3604LOPE', 'LOPE'),
	('SRD6971-PABSOLUTE', 'ABSOLUTE')
end

if not exists (select 1 from dbo.[Stamps])
begin
	insert into dbo.[Stamps] (Code)
	values
	('GR1'),
	('GR2'),
	('TREE1'),
	('TREE2')
end

if not exists (select 1 from dbo.[MetalStamp])
begin
	insert into dbo.[MetalStamp] (MetalCode, StampCode)
	values
	('SRD3604EBTREE1', 'TREE1'),
	('SRD6791-PEBGR1', 'GR1'),
	('SRD6791-PDBTREE1', 'TREE1')
end

if not exists (select 1 from dbo.[AssemblyComponents])
begin
	insert into dbo.[AssemblyComponents] (Code, MetalId, PlasticId)
	values
	('SRD3604EBTREE1C3000', 'SRD3604EBTREE1', 'C3000')
end
GO

GO
PRINT N'Update complete.';


GO
