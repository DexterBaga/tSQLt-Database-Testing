USE [SocalCodeCamp_CustomerOrderTracking]
GO
/****** Object:  StoredProcedure [FunctionTests].[test function return value]    Script Date: 12/3/2017 9:48:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [FunctionTests].[test function return value]
as
begin
	EXEC tSQLt.FakeTable 'dbo.Order'
	
	Insert into dbo.[Order] (OrderDate,CustomerId,TotalAmount) values ('2/23/2017',63,5.00)
	
	declare @expected decimal(12,2) = 100.42
	declare @totalOrder decimal(12,2)
	select @totalOrder = dbo.GetCustomerCurrentYearTotalPurchase(63)


	EXEC tSQLt.AssertEquals @expected, @totalOrder, 'Function failed to get correct total'

end