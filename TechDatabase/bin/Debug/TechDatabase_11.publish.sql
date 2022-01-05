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
if not exists (select 1 from dbo.[MetalComponents])
begin
	insert into dbo.[MetalComponents] (Code)
	values
	('SRD6791-P'),
	('SRD3604'),
	('SRD2545-132P121SED')
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
	('SRD3604', 'LOPE'),
	('SRD6791-P', 'ABSOLUTE')
end
GO

GO
PRINT N'Update complete.';


GO
