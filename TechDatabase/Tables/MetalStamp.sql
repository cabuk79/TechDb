CREATE TABLE [dbo].[MetalStamp]
(
	[MetalCode] NVARCHAR(450) NOT NULL,
	[StampCode] NVARCHAR(450) NOT NULL,
	CONSTRAINT [PK_MetalStamp] PRIMARY KEY (MetalCode, StampCode),
	FOREIGN KEY (MetalCode) REFERENCES MetalComponents(Code),
	FOREIGN KEY (StampCode) REFERENCES Stamps(Code)
)
