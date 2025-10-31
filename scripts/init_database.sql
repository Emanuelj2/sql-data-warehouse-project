/*
Script pourpose:
	* This script creates the 'DataWarehouse' after checking if it already exist.
	  if database exist, it is droped and recreated.
  * This script creates three schemas 'bronze' , 'silver', and 'gold'
WARNING:
	This script will drop the ENTIRE data base if it exist
*/

USE master;
GO
--DROP AND RECREATE THE 'DATAWAREHOUSE' DATABASE--

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;

GO

--CREATEE THE 'DATAWAREHOUSE' DATABASE--
CREATE DATABASE DataWarehouse;

USE DataWarehouse;

--CREATE THE 3 LAYERS-- 
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
