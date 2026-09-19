/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
  This script creates tables in the 'bronze' schema, dropping existing tables
  if they already exist.
  Run this script to re-define the DDL structure of 'bronze' tables.
===============================================================================
*/

IF OBJECT_ID ('bronze.annex1', 'U') IS NOT NULL
	DROP TABLE bronze.annex1;
CREATE TABLE bronze.annex1 (
item_code BIGINT,
item_name NVARCHAR(50),
category_code INT,
category_name NVARCHAR(50)
);

IF OBJECT_ID ('bronze.annex2', 'U') IS NOT NULL
	DROP TABLE bronze.annex2;
CREATE TABLE bronze.annex2 (
date_annex2 DATE,
purchase_time TIME,
item_code BIGINT,
quantity_sold FLOAT,
unit_selling_price FLOAT,
sale_or_return NVARCHAR(6),
discount NVARCHAR(3)
);
GO

IF OBJECT_ID ('bronze.annex3', 'U') IS NOT NULL
	DROP TABLE bronze.annex3;
CREATE TABLE bronze.annex3(
date_annex3 DATE,
item_code BIGINT,
wholesale_price FLOAT
);
GO

IF OBJECT_ID ('bronze.annex4', 'U') IS NOT NULL
	DROP TABLE bronze.annex4;
CREATE TABLE bronze.annex4(
item_code BIGINT,
item_name NVARCHAR(50),
loss_rate FLOAT
);
