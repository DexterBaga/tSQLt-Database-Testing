CREATE procedure TableTests.[test unique constraint]
as
begin
	DECLARE @ErrorMessage NVARCHAR(MAX) = '';
	EXEC tSQLt.FakeTable 'dbo.Customer';
	EXEC tSQLt.ApplyConstraint 'dbo.Customer','Unique_First_Last_Phone';

	BEGIN TRY
		insert into dbo.Customer (FirstName,LastName,Phone) values ('John','Doe','123456789');
		insert into dbo.Customer (FirstName,LastName,Phone) values ('John','Doe','123456789');
	END TRY
	BEGIN CATCH
		SET @ErrorMessage = ERROR_MESSAGE()
	END CATCH

	IF(@ErrorMessage = '')
	BEGIN
		EXEC tSQLt.Fail 'Constraint violation expected when inserting duplicate record'
	END
end


