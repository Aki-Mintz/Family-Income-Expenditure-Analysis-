-- PROJECT:  Household Income & Expenditure Analysis in the Philippines --

-- OBJECTIVE : To analyze income levels, spending patterns, and household characteristics to understand:
--              Which regions have higher or lower income levels
--              Which expenditure categories consume the largest share of income
--              How demographics (age, occupation, education) influence income and spending

-- DATA COLLECTION PHASE:
--Create the database
CREATE DATABASE FAMILYIncomeDB;


-- Create tables

--Captures all household income, expenditure, and demographic information.
DROP TABLE IF EXISTS FamilyIncomeExpenditure;
CREATE TABLE FamilyIncomeExpenditure (
    Total_Household_Income INT,
    Region VARCHAR(50),
    Staple_Food_Expenditure INT,
    Source_of_Income VARCHAR(50),
    Agricultural_Household_Indicator INT,
    Meat_Expenditure INT,
    Seafood_Expenditure INT,
    Leisure_Expenditure INT,
    Alcohol_Expenditure INT,
    Tobacco_Expenditure INT,
    Medical_Expenditure INT,
    Transportation_Expenditure INT,
    Communication_Expenditure INT,
    Utilities_Expenditure INT,
    Housing_Tax INT,
    Education_Expenditure INT,
    Crop_Farming_Expenditure INT,

    Household_Head_Gender VARCHAR(50),
    Household_Head_Age INT,
    Household_Head_Marital_Status VARCHAR(50),
    Household_Head_Highest_Grade_Completed VARCHAR(500),
    Education_Rank INT,
    Household_Head_Job_Indicator VARCHAR(50),
    Household_Head_Occupation VARCHAR(100),
    Household_Head_Class_of_Worker VARCHAR(100),
    Occupation_Group INT,
	Occupation_Group2 VARCHAR(50),
   

    Total_Number_of_Family_Members INT,
    Members_Age_Less_Than_5 INT,
    Members_Age_5_to_17 INT,
    Total_Number_of_Family_Members_Employed INT,

    House_Floor_Area INT,
    House_Age INT,
    Number_of_Bedrooms INT,
    Tenure_Status VARCHAR(50),
    Electricity INT,
    Main_Source_of_Water_Supply VARCHAR(50),

    Number_of_Television INT,
    Number_of_CD_VCD_DVD INT,
    Number_of_Component_Stereo_Set INT,
    Number_of_Refrigerator_Freezer INT,
    Number_of_Washing_Machine INT,
    Number_of_Airconditioner INT,
    Number_of_Car_Jeep_Van INT,
    Number_of_Landline_Wireless_Telephones INT,
    Number_of_Cellular_Phone INT,
    Number_of_Personal_Computer INT,
    Number_of_Stove_with_Oven_Gas_Range INT,
    Number_of_Motorized_Banca INT,
    Number_of_Motorcycle_Tricycle INT
);


--Tracks listing availability and pricing per date.
DROP TABLE IF EXISTS calendar;
CREATE TABLE calendar (
    listing_id INT,
    date DATE,
    available VARCHAR(5),
    price VARCHAR(250)
);

--Stores property information for housing/real estate analysis.
DROP TABLE if EXISTS listings;
CREATE TABLE listings(
    id INT PRIMARY KEY,
    listing_url VARCHAR(MAX),
    scrape_id VARCHAR(50),
    last_scraped DATE,
    name VARCHAR(MAX),
    summary VARCHAR(MAX),
    space VARCHAR(MAX),
    description VARCHAR(MAX),
    experiences_offered VARCHAR(100),
    neighborhood_overview VARCHAR(MAX),
    notes VARCHAR(MAX),
    transit VARCHAR(MAX),
    thumbnail_url VARCHAR(MAX),
    medium_url VARCHAR(MAX),
    picture_url VARCHAR(MAX),
    xl_picture_url VARCHAR(MAX),
    host_id INT,
    host_url VARCHAR(MAX),
    host_name VARCHAR(100),
    host_since DATE,
    host_location VARCHAR(255),
    host_about VARCHAR(MAX),
    host_response_time VARCHAR(100),
    host_response_rate VARCHAR(20),
    host_acceptance_rate VARCHAR(20),
    host_is_superhost VARCHAR(10),
    host_thumbnail_url VARCHAR(MAX),
    host_picture_url VARCHAR(MAX),
    host_neighbourhood VARCHAR(255),
    host_listings_count INT,
    host_total_listings_count INT,
    host_verifications VARCHAR(MAX),
    host_has_profile_pic VARCHAR(10),
    host_identity_verified VARCHAR(10),
    street VARCHAR(255),
    neighbourhood VARCHAR(255),
    neighbourhood_cleansed VARCHAR(255),
    neighbourhood_group_cleansed VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    zipcode VARCHAR(50),
    market VARCHAR(255),
    smart_location VARCHAR(255),
    country_code VARCHAR(10),
    country VARCHAR(50),
    latitude FLOAT,
    longitude FLOAT,
    is_location_exact VARCHAR(10),
    property_type VARCHAR(100),
    room_type VARCHAR(100),
    accommodates INT,
    bathrooms FLOAT,
    bedrooms FLOAT,
    beds FLOAT,
    bed_type VARCHAR(100),
    amenities VARCHAR(MAX),
    square_feet FLOAT,
    price VARCHAR(50),
    weekly_price VARCHAR(50),
    monthly_price VARCHAR(50),
    security_deposit VARCHAR(50),
    cleaning_fee VARCHAR(50),
    guests_included INT,
    extra_people VARCHAR(50),
    minimum_nights INT,
    maximum_nights INT,
    calendar_updated VARCHAR(100),
    has_availability VARCHAR(10),
    availability_30 INT,
    availability_60 INT,
    availability_90 INT,
    availability_365 INT,
    calendar_last_scraped DATE,
    number_of_reviews INT,
    first_review DATE,
    last_review DATE,
    review_scores_rating FLOAT,
    review_scores_accuracy FLOAT,
    review_scores_cleanliness FLOAT,
    review_scores_checkin FLOAT,
    review_scores_communication FLOAT,
    review_scores_location FLOAT,
    review_scores_value FLOAT,
    requires_license VARCHAR(10),
    license VARCHAR(100),
    jurisdiction_names VARCHAR(255),
    instant_bookable VARCHAR(10),
    cancellation_policy VARCHAR(100),
    require_guest_profile_picture VARCHAR(10),
    require_guest_phone_verification VARCHAR(10),
    calculated_host_listings_count INT,
    reviews_per_month FLOAT
);

-- Contains user feedback data for sentiment and trend analysis.
CREATE TABLE reviews (
    listing_id INT,
    id INT PRIMARY KEY,
    date DATE,
    reviewer_id INT,
    reviewer_name VARCHAR(100),
    comments VARCHAR(MAX)
);

-- Captures global entertainment sales trends for correlation analysis with income and leisure expenditure.
DROP TABLE IF EXISTS vgsales;
CREATE TABLE vgsales (
    Rank INT PRIMARY KEY,
    Name VARCHAR(255),
    Platform VARCHAR(50),
    Year VARCHAR(10),
    Genre VARCHAR(50),
    Publisher VARCHAR(100),
    NA_Sales DECIMAL(10,2),
    EU_Sales DECIMAL(10,2),
    JP_Sales DECIMAL(10,2),
    Other_Sales DECIMAL(10,2),
    Global_Sales DECIMAL(10,2)
);

/* ---------------------------------------------------------------
   DATA PREPARATION PHASE:
   This section demonstrates foundational SQL skills used to inspect,
   validate, and prepare raw data before performing deeper analysis.
   The goal is to ensure that the Family Income and Expenditure dataset
   is accurate, clean, and ready for reporting or visualization.

   Skills Demonstrated:
   • Basic SELECT queries  
   • Filtering with WHERE, AND, OR  
   • Pattern matching with LIKE  
   • NULL checking  
   • Sorting and limiting rows  
   • Using DISTINCT  
   • Basic aggregation (SUM + GROUP BY)

   These are essential steps in any analytics workflow to understand
   the structure, completeness, and quality of the dataset.

------------------------------------------------------------------ */


-- View all records in the dataset
SELECT * FROM FAMILYIncomeDB . . FamilyIncomeExpenditure;

-- Retrieve Region and Income columns
SELECT Region, Total_Household_Income
FROM FAMILYIncomeDB . . FamilyIncomeExpenditure;

-- Filter records for CALABARZON
SELECT *
FROM FAMILYIncomeDB . . FamilyIncomeExpenditure
WHERE Region = 'IVA - CALABARZON';

-- Filter NCR households with a female household head
SELECT * FROM FAMILYIncomeDB . . FamilyIncomeExpenditure 
WHERE Region = 'NCR' AND Household_Head_Gender = 'Female';

-- Find households with income between 20k and 50k
SELECT * FROM FAMILYIncomeDB . . FamilyIncomeExpenditure 
WHERE Total_Household_Income BETWEEN 20000 AND 50000;

-- Search households where wage is part of income source
SELECT * FROM FAMILYIncomeDB . . FamilyIncomeExpenditure 
WHERE Source_of_Income LIKE '%Wage%';

-- Retrieve rows where education expenses exist
SELECT * FROM FAMILYIncomeDB . . FamilyIncomeExpenditure 
WHERE Education_Expenditure IS NOT NULL;

-- Sort household income from highest to lowest
SELECT Region, Total_Household_Income 
FROM FAMILYIncomeDB . . FamilyIncomeExpenditure 
ORDER BY Total_Household_Income DESC;

-- Get list of unique regions
SELECT DISTINCT Region FROM FAMILYIncomeDB . . FamilyIncomeExpenditure;

-- Display first 5 rows
SELECT TOP(5) * FROM FAMILYIncomeDB . . FamilyIncomeExpenditure ;

-- Total household income per region
SELECT Region, SUM(Total_Household_Income) AS TotalIncome
FROM FAMILYIncomeDB . . FamilyIncomeExpenditure
GROUP BY Region;




-- CHECK FOR NULL VALUES PER COLUMN
SELECT 
    SUM(CASE WHEN Total_Household_Income IS NULL THEN 1 END) AS NullIncome,
    SUM(CASE WHEN Household_Head_Gender IS NULL THEN 1 END) AS NullGender
FROM FAMILYIncomeDB..FamilyIncomeExpenditure;

-- CHECK DUPLICATE ROWS BASED ON HH ID (IF EXISTS)
SELECT Household_ID, COUNT(*) AS CountDup
FROM FAMILYIncomeDB..FamilyIncomeExpenditure
GROUP BY Household_ID
HAVING COUNT(*) > 1;

-- Check number of NULL values in important columns
SELECT 
    SUM(CASE WHEN Total_Household_Income IS NULL THEN 1 END) AS NullIncome,
    SUM(CASE WHEN Household_Head_Gender IS NULL THEN 1 END) AS NullGender,
    SUM(CASE WHEN Source_of_Income IS NULL THEN 1 END) AS NullSource
FROM FAMILYIncomeDB..FamilyIncomeExpenditure;

-- Check duplicate rows based on key identifying fields
SELECT 
    Region,
    Total_Household_Income,
    Source_of_Income,
    Household_Head_Gender,
    Household_Head_Age,
    COUNT(*) AS DuplicateCount
FROM FAMILYIncomeDB..FamilyIncomeExpenditure
GROUP BY 
    Region, 
    Total_Household_Income,
    Source_of_Income,
    Household_Head_Gender,
    Household_Head_Age
HAVING COUNT(*) > 1;

--  STANDARDIZE TEXT VALUES (EXAMPLE CLEANING ACTIONS)

-- Trim spaces and convert region names to proper case
UPDATE FAMILYIncomeDB..FamilyIncomeExpenditure
SET Region = UPPER(LTRIM(RTRIM(Region)));

-- Fix inconsistent gender values (if dataset has variations)
UPDATE FAMILYIncomeDB..FamilyIncomeExpenditure
SET Household_Head_Gender = 'Female'
WHERE Household_Head_Gender IN ('female', 'F', 'Fem');

UPDATE FAMILYIncomeDB..FamilyIncomeExpenditure
SET Household_Head_Gender = 'Male'
WHERE Household_Head_Gender IN ('male', 'M', 'Man');

REMOVE FULLY DUPLICATE ROWS (SAFE CLEANING STEP)
-- (Use only if duplicates exist after inspection)
---------------------------------------------------------------
/*
DELETE A
FROM FAMILYIncomeDB..FamilyIncomeExpenditure A
JOIN (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY 
        Region, Total_Household_Income, Source_of_Income,
        Household_Head_Gender, Household_Head_Age
    ORDER BY Household_ID) AS rn
    FROM FAMILYIncomeDB..FamilyIncomeExpenditure
) B
ON A.Household_ID = B.Household_ID
WHERE B.rn > 1;
*/

-- Count how many households fall under each income source
SELECT Source_of_Income, COUNT(*) AS HouseholdCount
FROM FAMILYIncomeDB..FamilyIncomeExpenditure
GROUP BY Source_of_Income
ORDER BY HouseholdCount DESC;

-- Identify extreme (very high) income values
SELECT TOP(10)
    Region,
    Total_Household_Income
FROM FAMILYIncomeDB..FamilyIncomeExpenditure
ORDER BY Total_Household_Income DESC;

-- Categorize households into income classes
SELECT 
    Region,
    Total_Household_Income,
    CASE 
        WHEN Total_Household_Income < 20000 THEN 'Low Income'
        WHEN Total_Household_Income BETWEEN 20000 AND 70000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS IncomeCategory
FROM FAMILYIncomeDB..FamilyIncomeExpenditure;

-- Rank households by income within each region (Window Function)
SELECT
    Region,
    Total_Household_Income,
    RANK() OVER (PARTITION BY Region ORDER BY Total_Household_Income DESC) AS IncomeRank
FROM FAMILYIncomeDB..FamilyIncomeExpenditure;

-- CTE: Compute total spending per family
WITH SpendingCTE AS (
    SELECT
        *,
        (Staple_Food_Expenditure +
         Meat_Expenditure +
         Seafood_Expenditure +
         Leisure_Expenditure +
         Alcohol_Expenditure +
         Tobacco_Expenditure +
         Education_Expenditure +
         Utilities_Expenditure +
         Transportation_Expenditure) AS TotalSpending
    FROM FAMILYIncomeDB..FamilyIncomeExpenditure
)
SELECT Region, Total_Household_Income, TotalSpending
FROM SpendingCTE
ORDER BY TotalSpending DESC;

-- Compare income vs spending using a computed difference column
SELECT 
    Region,
    Total_Household_Income,
    (Total_Household_Income -
     (Staple_Food_Expenditure +
      Meat_Expenditure +
      Seafood_Expenditure +
      Leisure_Expenditure +
      Education_Expenditure +
      Utilities_Expenditure)) AS SavingsEstimate
FROM FAMILYIncomeDB..FamilyIncomeExpenditure;


/* ---------------------------------------------------------------------------
   DATA ANALYSIS PHASE:
   This section performs SQL-based analytical processing to answer key
   questions about family income, expenditure patterns, housing factors,
   and entertainment-related consumption.

   It aligns fully with Phase 1 objectives:
   • Identify regions with highest vs. lowest income levels.
   • Understand how income influences education, leisure, housing expenses.
   • Explore relationships between income and housing characteristics.
   • Assess property listing patterns across cities.
   • Analyze top-selling video games and their relation to income levels.

   Skills Demonstrated:
  • Aggregations: SUM(), AVG(), COUNT(), MIN(), MAX()
   • GROUP BY and HAVING for grouped insights
   • JOIN operations to combine datasets
   • Subqueries for deeper filtering and comparisons
   • Window functions: RANK(), ROW_NUMBER(), LAG(), LEAD()
   • Common Table Expressions (CTEs) for step-by-step analysis
   • EXISTS queries for validation checks
   • Creating Views for reusable analytical outputs

   This phase transforms cleaned data into meaningful insights
   that support the overall objectives of the project.

--------------------------------------------------------------------------- */

--Basic aggregations, grouping, and simple insights--

-- Average household income per region
SELECT Region, AVG(Total_Household_Income) AS AvgIncome
FROM FAMILYIncomeDB..FamilyIncomeExpenditure
GROUP BY Region;

-- Total education spending per region
SELECT Region, SUM(Education_Expenditure) AS TotalEduSpending
FROM FAMILYIncomeDB..FamilyIncomeExpenditure
GROUP BY Region;

-- Count households by gender of household head
SELECT Household_Head_Gender, COUNT(*) AS CountHH
FROM FAMILYIncomeDB..FamilyIncomeExpenditure
GROUP BY Household_Head_Gender;

-- Average spending on staple food
SELECT AVG(Staple_Food_Expenditure) AS AvgStapleSpending
FROM FAMILYIncomeDB..FamilyIncomeExpenditure;

-- Regions ranked by total income (simple)
SELECT Region, SUM(Total_Household_Income) AS TotalRegionIncome
FROM FAMILYIncomeDB..FamilyIncomeExpenditure
GROUP BY Region
ORDER BY TotalRegionIncome DESC;

 
--JOINS, subqueries, grouped filters, and comparisons--

-- Identify regions where average income exceeds national average
SELECT Region, AVG(Total_Household_Income) AS AvgIncome
FROM FAMILYIncomeDB..FamilyIncomeExpenditure
GROUP BY Region
HAVING AVG(Total_Household_Income) >
      (SELECT AVG(Total_Household_Income)
       FROM FAMILYIncomeDB..FamilyIncomeExpenditure);

-- Compare average food vs. non-food spending per region
SELECT 
    Region,
    AVG(Staple_Food_Expenditure + Meat_Expenditure + Seafood_Expenditure) AS AvgFood,
    AVG(Leisure_Expenditure + Utilities_Expenditure + Transportation_Expenditure) AS AvgNonFood
FROM FAMILYIncomeDB..FamilyIncomeExpenditure
GROUP BY Region;

-- Percentage of female-led households per region
SELECT
    Region,
    (SUM(CASE WHEN Household_Head_Gender = 'Female' THEN 1 ELSE 0 END) * 100.0) /
    COUNT(*) AS FemaleLeadershipPercent
FROM FAMILYIncomeDB..FamilyIncomeExpenditure
GROUP BY Region;

-- Subquery: Households earning above regional average income
SELECT *
FROM FAMILYIncomeDB..FamilyIncomeExpenditure FE
WHERE Total_Household_Income >
    (SELECT AVG(Total_Household_Income)
     FROM FAMILYIncomeDB..FamilyIncomeExpenditure
     WHERE Region = FE.Region);

-- Identify regions with high average education spending
SELECT Region, AVG(Education_Expenditure) AS AvgEdu
FROM FAMILYIncomeDB..FamilyIncomeExpenditure
GROUP BY Region
HAVING AVG(Education_Expenditure) > 2000;

 
--CTEs, Window Functions, Views, EXISTS, Deep Insights--
-- CTE: Compute total spending for all households
WITH SpendingCTE AS (
    SELECT
        *,
        (Staple_Food_Expenditure +
         Meat_Expenditure +
         Seafood_Expenditure +
         Leisure_Expenditure +
         Alcohol_Expenditure +
         Tobacco_Expenditure +
         Education_Expenditure +
         Utilities_Expenditure +
         Transportation_Expenditure) AS TotalSpending
    FROM FAMILYIncomeDB..FamilyIncomeExpenditure
)
SELECT Region, AVG(TotalSpending) AS AvgTotalSpending
FROM SpendingCTE
GROUP BY Region;

-- Window Function: Rank households by income within each region
SELECT
    Region,
    Household_ID,
    Total_Household_Income,
    RANK() OVER (PARTITION BY Region ORDER BY Total_Household_Income DESC) AS IncomeRank
FROM FAMILYIncomeDB..FamilyIncomeExpenditure;

-- Window Function: Track change in income relative to previous household (sorted)
SELECT
    Household_ID,
    Total_Household_Income,
    LAG(Total_Household_Income, 1) OVER (ORDER BY Household_ID) AS PrevIncome
FROM FAMILYIncomeDB..FamilyIncomeExpenditure;

-- EXISTS Example: Find households with non-zero spending in at least one category
SELECT *
FROM FAMILYIncomeDB..FamilyIncomeExpenditure FE
WHERE EXISTS (
    SELECT 1
    FROM FAMILYIncomeDB..FamilyIncomeExpenditure
    WHERE 
        Staple_Food_Expenditure > 0 OR
        Meat_Expenditure > 0 OR
        Education_Expenditure > 0
);

-- Create a view for high-income households
CREATE VIEW HighIncomeHouseholds AS
SELECT *
FROM FAMILYIncomeDB..FamilyIncomeExpenditure
WHERE Total_Household_Income > 90000;

-- Using the created view
SELECT Region, COUNT(*) AS HighIncomeCount
FROM HighIncomeHouseholds
GROUP BY Region;