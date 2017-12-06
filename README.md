# Database Unit Testing With tSQLt
 
 ### Setting Up The Test Database
 1. Clone or download the repo
 2. Create a new database.
 3. Install the database inside the /Sample Database/Sample Test Database.sql
 
 ### Install Test Framework
1. Download the latest tSQLt install scripts from tsqlt.org.
2. Unzip the file.
3. In SQL Management Studio, select the database that will be used for testing.
4. Execute the following files against the database.
   * SetClrEnabled.sql
     - This will enable Clr for the selected database 
   * tSQLt.class.sql
     - This will install all the tSQLt functions for testing
    
 ### How To Use The Test Scripts
 The test scripts located in /Test Scripts folder demonstrate some of the test features in tSQLt.  Please refer to the tSQLt User Guide for more details on the tSQLt test functions used in the examples.
 1. Open a test script in SQL Management Studio.
 2. Create the test class used by the test script. The test script name would look something like the following:
 ALTER procedure [FunctionTests].[test function fake return value]
 In this case, 'FunctionTest' is the test class so create it by executing the following:
 - EXEC tSQLt.NewTestClass 'FunctionTest'
 3. Update the script to say 'CREATE' instead of 'ALTER'
 4. Execute the script to create the test procedure in the test database base.
 5. Execute the  following command to execute the test script(s).
 - EXEC tSQLt.RunAll
