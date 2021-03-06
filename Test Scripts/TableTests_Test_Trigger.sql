USE [SocalCodeCamp_CustomerOrderTracking]
GO
/****** Object:  StoredProcedure [TableTests].[test trigger]    Script Date: 12/3/2017 9:50:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [TableTests].[test trigger]
as
begin
	EXEC tSQLt.FakeTable 'dbo.Customer'
	EXEC tSQLt.FakeTable 'dbo.CustomerLog'
	EXEC tSQLt.ApplyTrigger 'dbo.Customer','LogCustomer'
	
	Insert into dbo.Customer (FirstName,LastName,Country)
		Values('Henry','James','US')
	
	Select CustomerId into #actual from dbo.CustomerLog
	Select Id as CustomerId into #expected from dbo.Customer 

	EXEC tSQLt.AssertEqualsTable '#expected','#actual','Trigger failed to log customer'

end

