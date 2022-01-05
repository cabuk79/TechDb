CREATE TABLE [dbo].[AssemblyComponents]
(
	[Code] NVARCHAR(450) NOT NULL PRIMARY KEY,
	[Descrption] NVARCHAR(MAX) NULL,
	[MetalId] NVARCHAR(450) FOREIGN KEY REFERENCES MetalComponents(Code),
	[PlasticId] NVARCHAR(5) FOREIGN KEY REFERENCES PlasticComponent(Code),
	[WeightId] NVARCHAR(10) FOREIGN KEY REFERENCES WeightComponents(Code)
)
