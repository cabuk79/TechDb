CREATE TABLE [dbo].[MetalPrint]
(
	[MetalCode] NVARCHAR(450) NOT NULL,
	[PrintCode] NVARCHAR(450) NOT NULL,
	CONSTRAINT [PK_MetalPrint] PRIMARY KEY (MetalCode, PrintCode),
	FOREIGN KEY (MetalCode) REFERENCES MetalComponents(Code),
	FOREIGN KEY (PrintCode) REFERENCES Prints(Code)
)
