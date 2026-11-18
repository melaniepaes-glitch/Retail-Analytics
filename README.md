# Retail Analytics: Predicting Customer Purchase Behavior

## Project Overview

This project analyzes retail customer data to explore purchasing patterns, customer demographics, product spending, and marketing campaign responses.

The goal is to identify meaningful customer behavior patterns and communicate findings through data cleaning, exploratory data analysis, SQL queries, Excel visualizations, and an interactive Power BI dashboard.

## Tools and Technologies

- **Python:** Data cleaning and exploratory data analysis
- **MySQL:** Data storage, validation, and analytical queries
- **Microsoft Excel:** Statistical summaries, PivotTables, and charts
- **Power BI:** Interactive dashboard and customer segmentation analysis

## Dataset

The original marketing campaign dataset contains 2,240 customer records.

During cleaning, 24 records with missing income values were removed, resulting in a cleaned dataset containing 2,216 customers.

### Key Dataset Metrics

| Metric | Value |
|---|---|
| Original Records | 2,240 |
| Cleaned Records | 2,216 |
| Missing Income Values Removed | 24 |
| Average Customer Income | $52,247.25 |
| Customers Who Responded | 333 |
| Campaign Response Rate | 15.03% |

## Project Structure

```text
retail-customer-analytics/
├── data/
├── excel/
├── sql/
├── python/
├── power bi/
├── screenshots/
└── README.md
```

## Data Cleaning and Validation

The dataset was cleaned and validated using Python and MySQL to ensure accuracy and consistency.

### Data Cleaning Steps

- Inspected the dataset for missing values and duplicate customer IDs.
- Identified 24 records with missing income values.
- Removed those 24 records, reducing the dataset from 2,240 to 2,216 customers.
- Created an `Age` feature using customers' birth years.
- Verified that the cleaned dataset contains no missing values or duplicate customer IDs.

### Data Quality Checks

| Validation Check | Result |
|---|---|
| Total cleaned records | 2,216 |
| Unique customer IDs | 2,216 |
| Missing values | 0 |
| Duplicate customer IDs | 0 |
| Average income | $52,247.25 |
| Positive campaign responses | 333 |

Python and MySQL validation results were compared to confirm consistency across the analysis.

## SQL Analysis

MySQL was used to organize, validate, and analyze customer purchasing behavior.

The SQL analysis includes:

- Creating the `retail_data` database and `marketing_campaign` table.
- Importing customer records and converting registration dates into SQL date format.
- Analyzing customer demographics, including education, marital status, and age groups.
- Examining customer income and purchasing patterns.
- Comparing spending across six product categories.
- Analyzing marketing campaign acceptance and customer responses.

SQL validation confirmed **2,216 unique customers**, **zero missing values**, and **333 positive campaign responses**.

## Power BI Dashboard

### Dashboard Preview



An interactive Power BI dashboard was developed to visualize customer demographics, purchasing behavior, and marketing campaign performance.

### Key Performance Indicators

- **Total Customers:** 2,216
- **Average Customer Income:** $52.25K
- **Campaign Response Rate:** 15.03%

### Dashboard Visualizations

- **Income Distribution:** Customer income grouped into 5,000-unit bins, with registration year as a comparison dimension.
- **Customer Demographics:** Customer distribution by education and marital status.
- **Normalized Wine Spending:** Customer-level wine spending divided by income, plotted against customer income.
- **Product Category Spending:** Total spending across wine, meat, gold, fish, sweets, and fruit categories.

### Interactive Filters

The dashboard includes **Year** and **Education** slicers to explore purchasing behavior across customer segments.

Both slicers were tested and confirmed to filter the product spending visualization.

## Python Exploratory Data Analysis (EDA)

Python was used to explore customer demographics, income distributions, spending behavior, and marketing campaign responses.

### Analysis Performed

- Inspected dataset structure, data types, and descriptive statistics.
- Identified and handled missing income values.
- Checked for duplicate customer IDs and remaining missing values.
- Examined numerical distributions and potential outliers.
- Explored relationships between customer characteristics and purchasing behavior.
- Calculated campaign response counts and response rates.

The cleaned dataset contains **2,216 customers**, with an overall campaign response rate of **15.03%**.

The Jupyter notebook contains the Python code and supporting exploratory analysis.

## Excel Analysis

Microsoft Excel was used for descriptive statistics, customer segmentation, and visual exploration.

### Analysis Performed

- Calculated summary statistics for customer data.
- Created an **Income boxplot** to examine the spread of customer incomes and potential outliers.
- Created an **Age histogram** to explore the distribution of customer ages.
- Analyzed customer registrations by year.
- Compared campaign responses across education levels and marital status groups using PivotTables and charts.

The Excel workbook provides an additional view of customer characteristics and campaign engagement.

## How to Explore and Run This Project

### Prerequisites

- Python 3 with Jupyter Notebook
- Python libraries used in the notebook, such as pandas, NumPy, Matplotlib, and Seaborn
- MySQL Server and MySQL Workbench
- Microsoft Excel
- Power BI Desktop

### 1. Download the Repository

Download or clone this repository to your computer.

The `data/` folder contains the original and cleaned customer datasets.

### 2. Run the Python Analysis

Open the Jupyter notebook in the `python/` folder.

Update the dataset file path if necessary, install any missing Python libraries, and run the notebook cells in order.

The notebook contains the data cleaning, validation, and exploratory analysis.

### 3. Run the SQL Analysis

The SQL workflow uses the **cleaned customer dataset**, not the original raw dataset. Data cleaning is performed in Python first, removing 24 records with missing income values. The resulting 2,216-customer dataset is then imported into MySQL for validation and analytical queries.

When reproducing the SQL analysis, use the cleaned CSV from the `data/` folder as the import source.

Open the SQL script in the `sql/` folder using MySQL Workbench.

The script creates the `retail_data` database and the `marketing_campaign` table.

Before importing the CSV, check the MySQL permitted import directory:

```sql
SHOW VARIABLES LIKE 'secure_file_priv';
```

Update the CSV path in the `LOAD DATA INFILE` statement to match your local environment.

Run the import once, then execute the data transformation, validation, and analytical queries.

**Note:** The age calculation uses the current calendar year, so calculated ages may change when the script is run in a different year.

### 4. Explore the Excel Workbook

Open the workbook in the `excel/` folder to review descriptive statistics, PivotTables, and visualizations.

### 5. Explore the Power BI Dashboard

Open the `.pbix` file in the `power bi/` folder using Power BI Desktop.

If Power BI cannot locate the dataset, update the data source path through **Transform data → Data source settings**.

Use the Year and Education slicers to explore different customer segments.

## Notes on Reproducibility

- The original dataset contains 2,240 records.
- The cleaned dataset contains 2,216 records after removing 24 records with missing income.
- The SQL import requires a local file path compatible with the MySQL server configuration.
- The Excel and Power BI files may require refreshing or updating their data source paths on another computer.
- The SQL setup should be run against a new database when reproducing the complete workflow.
