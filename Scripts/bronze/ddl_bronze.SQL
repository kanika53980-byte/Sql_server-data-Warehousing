/*
=====================================================================================
DDL Script: Create Bronze Tables
=====================================================================================
Script Purose:
     This script creates  new Tables starting with the name 'bronze',dropping existing
     tables if they already exist.
     Run this script to re-define the DDL Structure of 'bronze' Tables
     */
     

USE mysql;

-- Drop and recreate the 'DataWarehouse' database
     
DROP DATABASE IF EXISTS DataWarehouse;

-- create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
Use Datawarehouse;

DROP TABLE IF EXISTS bronze_crm_cum_info;
CREATE TABLE bronze_crm_cum_info(
Cst_id INT,
Cst_Key VARCHAR(50) ,
Cst_firstname VARCHAR(50) ,
Cst_lastname VARCHAR(50) ,
Cst_marital_status VARCHAR(50) ,
Cst_gndr VARCHAR(50),
Cst_create_date DATE
);


DROP TABLE IF EXISTS bronze_crm_prd_info;
CREATE TABLE bronze_crm_prd_info (
prd_id  INT,
prd_key VARCHAR(50),
prd_nm  VARCHAR(50),
prd_cost INT,
prd_line VARCHAR(50),
prd_start_dt DATETIME,
prd_end_dt DATETIME
);


DROP TABLE IF EXISTS bronze_crm_sales_details;
CREATE TABLE bronze_crm_sales_details (
sls_ord_num VARCHAR(50) ,
sls_prd_key VARCHAR(50) ,
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT
);


DROP TABLE IF EXISTS bronze_erp_loc_a101;
CREATE TABLE bronze_erp_loc_a101 (
cid VARCHAR(50) ,
cntry VARCHAR(50) 
);

DROP TABLE IF EXISTS bronze_erp_cust_az12;
CREATE TABLE bronze_erp_cust_az12 (
cid VARCHAR(50) ,
bdate DATE,
gen VARCHAR(50) 
);



DROP TABLE IF EXISTS bronze_erp_px_cat_g1v2;
CREATE TABLE bronze_erp_px_cat_g1v2 (
id VARCHAR(50) ,
cat VARCHAR(50) ,
subcat VARCHAR(50) ,
maintenance VARCHAR(50) 
);


TRUNCATE TABLE bronze_crm_cum_info;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Data/cust_info.csv'
INTO TABLE bronze_crm_cum_info
FIELDS TERMINATED BY ','
IGNORE 1 Lines
(cst_id,cst_key,cst_firstname,cst_lastname,cst_marital_status,cst_gndr,cst_create_date);


TRUNCATE TABLE bronze_crm_prd_info;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Data/prd_info.csv'
INTO TABLE bronze_crm_prd_info
FIELDS TERMINATED BY ','
IGNORE 1 Lines;


TRUNCATE TABLE bronze_crm_sales_details;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Data/sales_details.csv'
INTO TABLE bronze_crm_sales_details
FIELDS TERMINATED BY ','
IGNORE 1 Lines;


TRUNCATE TABLE bronze_erp_loc_a101;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Data/LOC_A101.csv'
INTO TABLE bronze_erp_loc_a101
FIELDS TERMINATED BY ','
IGNORE 1 Lines;


TRUNCATE TABLE bronze_erp_cust_az12;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Data/CUST_AZ12.csv'
INTO TABLE bronze_erp_cust_az12
FIELDS TERMINATED BY ','
IGNORE 1 Lines;


TRUNCATE TABLE bronze_erp_px_cat_g1v2;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Data/PX_CAT_G1V2.csv'
INTO TABLE bronze_erp_px_cat_g1v2
FIELDS TERMINATED BY ','
IGNORE 1 Lines;

DELIMITER //
CREATE PROCEDURE bronze_crm_cust_info()
BEGIN

DECLARE v_start DATETIME;
DECLARE v_end DATETIME;
DECLARE v_duration INT;
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN 
SELECT 'An error message occured!' AS ErrorMessage;
END;

SELECT '==================================================================================='AS status;
SELECT 'Loading Bronze Layer' AS status;
SELECT '==================================================================================='AS status;

SELECT '-----------------------------------------------------------------------------------'AS status;
SELECT 'Loading CRM Tables' AS status;
SELECT '-----------------------------------------------------------------------------------'AS status;

SET v_start = NOW();
SELECT '>> Truncating Table: bronze_crm_cum_info'AS status;
SELECT '>> Insert Data into: bronze_crm_cum_info'AS status;
SELECT * FROM bronze_crm_cum_info;
SET v_end = NOW();
SET v_duration = TIMESTAMPDIFF (SECOND, v_start, v_end);
SELECT 'bronze_crm_cum_info' AS TableName, V_start AS StartTime,
v_end AS ENDTIME, v_duration AS DurationSecond;

SET v_start = NOW();
SELECT '>> Truncating Table: bronze_crm_prd_info'AS status;
SELECT '>> Insert Data into: bronze_crm_prd_info'AS status;
SELECT * FROM bronze_crm_prd_info;
SET v_end = NOW();
SET v_duration = TIMESTAMPDIFF (SECOND, v_start, v_end);
SELECT 'bronze_crm_prd_info' AS TableName, V_start AS StartTime,
v_end AS ENDTIME, v_duration AS DurationSecond;

SET v_start = NOW();
SELECT '>> Truncating Table: bronze_crm_sales_details'AS status;
SELECT '>> Insert Data into: bronze_crm_sales_details'AS status;
SELECT * FROM bronze_crm_sales_details;
SET v_end = NOW();
SET v_duration = TIMESTAMPDIFF (SECOND, v_start, v_end);
SELECT 'bronze_crm_sales_details' AS TableName, V_start AS StartTime,
v_end AS ENDTIME, v_duration AS DurationSecond;

SET v_start = NOW();
SELECT '-----------------------------------------------------------------------------------'AS status;
SELECT 'Loading ERP Tables' AS status;
SELECT '-----------------------------------------------------------------------------------'AS status;

SET v_start = NOW();
SELECT '>> Truncating Table: bronze_erp_loc_a101'AS status;
SELECT '>> Inserting Data into: bronze_erp_loc_a101'AS status;
SELECT * FROM bronze_erp_loc_a101;
SET v_end = NOW();
SET v_duration = TIMESTAMPDIFF (SECOND, v_start, v_end);
SELECT 'bronze_erp_loc_a101' AS TableName, V_start AS StartTime,
v_end AS ENDTIME, v_duration AS DurationSecond;

SET v_start = NOW();
SELECT '>> Truncating Table: bronze_erp_cust_az12'AS status;
SELECT '>> Inserting Data into: bronze_erp_cust_az12'AS status;
SELECT * FROM bronze_erp_cust_az12;
SET v_end = NOW();
SET v_duration = TIMESTAMPDIFF (SECOND, v_start, v_end);
SELECT 'bronze_erp_cust_az12' AS TableName, V_start AS StartTime,
v_end AS ENDTIME, v_duration AS DurationSecond;


SET v_start = NOW();
SELECT '>> Truncating Table: bronze_erp_px_cat_g1v2'AS status;
SELECT '>> Inserting Data into: bronze_erp_px_cat_g1v2'AS status;
SELECT * FROM bronze_erp_px_cat_g1v2;
SET v_end = NOW();
SET v_duration = TIMESTAMPDIFF (SECOND, v_start, v_end);
SELECT 'bronze_erp_px_cat_g1v2' AS TableName, V_start AS StartTime,
v_end AS ENDTIME, v_duration AS DurationSecond;

END //

DELIMITER ;

CALL bronze_crm_cust_info;

