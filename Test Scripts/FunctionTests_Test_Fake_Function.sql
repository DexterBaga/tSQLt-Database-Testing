USE [SocalCodeCamp_CustomerOrderTracking]
GO
/****** Object:  StoredProcedure [FunctionTests].[test function fake return value]    Script Date: 12/3/2017 9:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [FunctionTests].[test function fake return value]
as
begin
	EXEC tSQLt.FakeTable 'dbo.Order'
	EXEC tSQLt.FakeTable 'dbo.Customer'
	EXEC tSQLt.FakeFunction 'dbo.GetCustomerCurrentYearTotalPurchase','FunctionTests.Fake_GetCustomerCurrentYearTotalPurchase'
	Insert into dbo.Customer (Id,FirstName,LastName) values (1,'John','Margo')
	Insert into dbo.[Order] (OrderDate,CustomerId,TotalAmount) values ('2/23/2017',1,5.00)
	
	select * into FunctionTests.actual from dbo.CustomerOrderReport
	select top(0) * into FunctionTests.expected from dbo.CustomerOrderReport
	insert into FunctionTests.expected (CustomerId,FirstName,LastName,CurrentYearTotalPurchase)
		values(1,'John','Margo',123456.789)

	EXEC tSQLt.AssertEqualsTable 'FunctionTests.expected', 'FunctionTests.actual', 'Report did not return expected data'

end