USE [SocalCodeCamp_CustomerOrderTracking]
GO
/****** Object:  StoredProcedure [TableTests].[xtest trigger_demonstrate_faking_views]    Script Date: 12/3/2017 9:50:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [TableTests].[xtest trigger_demonstrate_faking_views]
as
begin

	
	-- Not used in test, for demonstration purposes only -------
	EXEC tsqlt.FakeTable 'dbo.GetCustomerCurrentYearTotalPurchase'
	Exec('Insert into dbo.GetCustomerCurrentYearTotalPurchase (CustomerId,FirstName,LastName,CurrentTotalYearPurchase)
	  values (1,''John'',''Cornish'',2232.90)')
	--------------------------------------------------------------



end




