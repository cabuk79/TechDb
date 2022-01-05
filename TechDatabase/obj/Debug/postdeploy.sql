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
