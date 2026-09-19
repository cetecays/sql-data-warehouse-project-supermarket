/*
=====================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
=====================================================================================
Script Purpose:
  This stored procedure loads data into the 'bronze' schema from external CSV files.
  It performs the following actions:
  - Truncates the bronze tables before loading data.
  - Uses the 'BULK INSERT' command to load fata from csv FIles to bronze tables.

Parameters:
  None.
  This stored procedure does not accept any parameters or return any values.

Usage Example:
  EXEC bronze.load_bronze;
=====================================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '====================================================='
		PRINT 'Loading Bronze Layer'
		PRINT '====================================================='

		SET @start_time = GETDATE();
		PRINT '-----------------------------------------------------'
		PRINT 'Loading Annex 1'
		PRINT '-----------------------------------------------------'
		TRUNCATE TABLE bronze.annex1;
		BULK INSERT bronze.annex1
		FROM 'C:\Users\yanso\OneDrive\Documents\SQL Projects\Data Warehouse Supermarket Sep 2026\archive\annex1.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>--------------'

		SET @start_time = GETDATE();
		PRINT '-----------------------------------------------------'
		PRINT 'Loading Annex 2'
		PRINT '-----------------------------------------------------'
		TRUNCATE TABLE bronze.annex2;
		BULK INSERT bronze.annex2
		FROM 'C:\Users\yanso\OneDrive\Documents\SQL Projects\Data Warehouse Supermarket Sep 2026\archive\annex2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>--------------'

		SET @start_time = GETDATE();
		PRINT '-----------------------------------------------------'
		PRINT 'Loading Annex 3'
		PRINT '-----------------------------------------------------'
		TRUNCATE TABLE bronze.annex3;
		BULK INSERT bronze.annex3
		FROM 'C:\Users\yanso\OneDrive\Documents\SQL Projects\Data Warehouse Supermarket Sep 2026\archive\annex3.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>--------------'

		SET @start_time = GETDATE();
		PRINT '-----------------------------------------------------'
		PRINT 'Loading Annex 4'
		PRINT '-----------------------------------------------------'
		TRUNCATE TABLE bronze.annex4;
		BULK INSERT bronze.annex4
		FROM 'C:\Users\yanso\OneDrive\Documents\SQL Projects\Data Warehouse Supermarket Sep 2026\archive\annex4.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>--------------'
		SET @batch_end_time = GETDATE();
		PRINT '- Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		END TRY
		BEGIN CATCH
			PRINT '====================================================='
			PRINT 'ERROR OCCURRED WHILE LOADING BRONZE LAYER'
			PRINT 'Error Message' + ERROR_MESSAGE();
			PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
			PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
			PRINT '====================================================='
	END CATCH
END
