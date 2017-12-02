CREATE procedure TableTests.[test table metadata]
as
begin

	CREATE TABLE TableTests.Expected(
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[OrderId] [int] NOT NULL,
		[ProductId] [int] NOT NULL,
		[UnitPrice] [decimal](12, 2) NOT NULL DEFAULT ((0)),
		[Quantity] [int] NOT NULL DEFAULT ((1)),
	 CONSTRAINT [PK_ORDERITEM] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	,CONSTRAINT [FK_ORDERITE_REFERENCE_ORDER] FOREIGN KEY([OrderId])
	REFERENCES [dbo].[Order] ([Id])
	,CONSTRAINT [FK_ORDERITE_REFERENCE_PRODUCT] FOREIGN KEY([ProductId])
	REFERENCES [dbo].[Product] ([Id])

	) ON [PRIMARY]


	EXEC tSQLt.AssertResultSetsHaveSameMetaData
	 @expectedCommand = N'Select * from TableTests.Expected',
	 @actualCommand = N'Select * from dbo.OrderItem';
end


