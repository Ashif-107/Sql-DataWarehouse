/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.
===============================================================================

Also made it a stored procedure to allow for easy execution and management.
*/


create or alter procedure bronze.load_bronze as 
begin

	truncate table bronze.crm_cust_info;

	bulk insert bronze.crm_cust_info
	from 'D:\Ashif\Projects\Data Engineering\sql-dwh\datasets\source_crm\cust_info.csv'
	with (
		firstrow  = 2,
		fieldterminator = ',',
		tablock
	);

	truncate table bronze.crm_prd_info;

	bulk insert bronze.crm_prd_info
	from 'D:\Ashif\Projects\Data Engineering\sql-dwh\datasets\source_crm\prd_info.csv'
	with (
		firstrow  = 2,
		fieldterminator = ',',
		tablock
	);

	truncate table bronze.crm_sales_details;

	bulk insert bronze.crm_sales_details
	from 'D:\Ashif\Projects\Data Engineering\sql-dwh\datasets\source_crm\sales_details.csv'
	with (
		firstrow  = 2,
		fieldterminator = ',',
		tablock
	);


	truncate table bronze.erp_cust_az12;

	bulk insert bronze.erp_cust_az12
	from 'D:\Ashif\Projects\Data Engineering\sql-dwh\datasets\source_erp\CUST_AZ12.csv'
	with (
		firstrow  = 2,
		fieldterminator = ',',
		tablock
	);

	truncate table bronze.erp_loc_a101;

	bulk insert bronze.erp_loc_a101
	from 'D:\Ashif\Projects\Data Engineering\sql-dwh\datasets\source_erp\LOC_A101.csv'
	with (
		firstrow  = 2,
		fieldterminator = ',',
		tablock
	);

	truncate table bronze.erp_px_cat_g1v2;

	bulk insert bronze.erp_px_cat_g1v2
	from 'D:\Ashif\Projects\Data Engineering\sql-dwh\datasets\source_erp\PX_CAT_G1V2.csv'
	with (
		firstrow  = 2,
		fieldterminator = ',',
		tablock
	);

end