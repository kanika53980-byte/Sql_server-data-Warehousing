/*
=================================================================================== 
Create Database and Schemas 
===================================================================================
Script Purose:
     This script creates a new database named 'DataWarehouse' after checking if it
     already exists, it is dropped and recreated. Additionally, the script sets up
     three tables within the database: 'broze', 'silver', and 'gold'.

Warning:
     Running this script will drop the entire 'DataWarehouse' database if it exists.
     All data in the database will be permanently deleted. Proceed with caution and 
     ensure you have proper backups before running this script.
*/ 
USE mysql;

-- Drop and recreate the 'DataWarehouse' database
     
DROP DATABASE IF EXISTS DataWarehouse;

-- create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
Use Datawarehouse;
CREATE TABLE bronze;
CREATE TABLE silver;
CREATE TABLE gold;
