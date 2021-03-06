USE [SocalCodeCamp_CustomerOrderTracking]
GO
/****** Object:  StoredProcedure [StoredProcedureTests].[test stored procedure spy]    Script Date: 12/3/2017 9:51:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec tsqlt.NewTestClass 'StoredProcedureTests'

ALTER procedure [StoredProcedureTests].[test stored procedure spy]
as
begin

	EXEC tsqlt.SpyProcedure 'dbo.CreateLogRecord'

	EXEC tSQLt.FakeTable 'dbo.Customer'
	EXEC tSQLt.FakeTable 'dbo.Order'
	Insert into dbo.Customer (Id,FirstName,LastName,Country) values (1,'John','Margo','Germany')
	Insert into dbo.[Order] (OrderNumber,OrderDate,CustomerId,TotalAmount) values (400,'2/23/2017',1,350.00)

	declare @orderTotal decimal(12,2)
	EXEC dbo.GetTotalOrderCost 400, @totalCost = @orderTotal OUTPUT
	
	IF NOT EXISTS(select 1 from dbo.CreateLogRecord_SpyProcedureLog)
	begin
		Exec tsqlt.Fail 'CreateSomeRecord was not called'
	end
end

--exec tsqlt.runall