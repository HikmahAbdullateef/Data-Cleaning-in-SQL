# Data Cleaning with SQL

## Project Overview

This project demonstrates a complete SQL data cleaning workflow using a layoffs dataset in MySQL. The objective was to transform raw data into a clean, standardized dataset suitable for analysis by identifying duplicates, standardizing values, handling missing data, converting data types, and removing unnecessary records.

---

## Objectives

- Create a staging table to preserve the original dataset
- Identify and remove duplicate records
- Standardize text values for consistency
- Trim leading and trailing spaces
- Convert text dates into SQL DATE format
- Handle missing and blank values
- Populate missing values using self joins
- Remove rows with insufficient data
- Drop temporary columns after cleaning

---

## SQL Skills Demonstrated

- Common Table Expressions (CTEs)
- Window Functions (`ROW_NUMBER()`)
- `PARTITION BY`
- Data Cleaning
- Data Standardization
- Self Joins
- UPDATE Statements
- DELETE Statements
- ALTER TABLE
- String Functions (`TRIM`, `STR_TO_DATE`)
- Duplicate Detection

---

## Project Workflow

### 1. Create a Staging Table
Created a duplicate table to ensure the original dataset remained unchanged during the cleaning process.

### 2. Remove Duplicates
Used `ROW_NUMBER()` with `PARTITION BY` to identify duplicate rows and delete duplicate records.

### 3. Standardize Data
- Removed extra spaces from company names
- Standardized industry values (e.g., Cryptocurrency → Crypto)
- Cleaned country names by removing trailing punctuation

### 4. Convert Data Types
Converted the `date` column from text to the SQL `DATE` data type using `STR_TO_DATE()`.

### 5. Handle Missing Values
- Replaced blank values with NULL
- Filled missing industries using a self-join
- Removed records where both `total_laid_off` and `percentage_laid_off` were missing

### 6. Final Cleanup
Dropped temporary helper columns used during the cleaning process.

---

## Tools Used

- MySQL
- MySQL Workbench
- GitHub

---

## Dataset

The dataset contains company layoff information including:

- Company
- Location
- Industry
- Total Laid Off
- Percentage Laid Off
- Date
- Funding Raised
- Company Stage
- Country

---

## What I Learned

This project strengthened my understanding of:

- SQL data cleaning best practices
- Window functions
- CTEs
- Data quality improvement
- Preparing datasets for analysis

---

## Author

**Hikmah Abdullateef**

Data Analyst passionate about transforming raw data into meaningful insights using SQL, Excel, Power BI, and Python.

GitHub: https://github.com/HikmahAbdullateef
