# Supermarket Sales Exploratory Data Analysis (EDA) Project

## Project Overview
This project performs an Exploratory Data Analysis (EDA) on a dataset of supermarket sales to uncover patterns and insights. The dataset contains information on various sales transactions, including branch, customer type, payment method, gross income, and customer ratings.

## Project Structure
This project follows a structured approach:
1. **Data Cleaning**: Ensuring data quality by handling missing values, removing duplicates, and correcting data types.
2. **Exploratory Data Analysis (EDA)**: Examining the data with visualizations and statistical summaries to answer specific questions.

## Libraries Used
- `pandas` and `numpy`: For data manipulation and numerical calculations.
- `matplotlib` and `seaborn`: For creating visualizations.
- `calmap`: For calendar-based visualizations (optional).
- `ydata_profiling`: For generating a quick profiling report of the dataset.

## Dataset
- **File**: `supermarket_sales.csv`
- **Source**: Coursera EDA Project
- **Attributes**: 
  - Branch, City, Customer Type, Gender, Product Line, Unit Price, Quantity, Tax, Total, Date, Time, Payment Method, Cost of Goods Sold (COGS), Gross Margin Percentage, Gross Income, Rating.

## Project Steps

### 1. Data Cleaning
Before analysis, the data is cleaned to ensure accuracy and consistency:
- **Handling Missing Values**: Missing values are filled with the mode for categorical columns and the mean for numerical columns.
- **Removing Duplicates**: Any duplicate rows are removed to avoid skewing the analysis.
- **Data Type Corrections**: The `Date` column is converted to a datetime format and set as the index for easier time-based analysis.

### 2. Exploratory Data Analysis (EDA)
The EDA is divided into several tasks, each addressing different questions about the dataset.

#### Task 1: Univariate Analysis
- **Customer Ratings**: Distribution of customer ratings is examined to understand its uniformity.
  - **Visualization**: Distribution plot with mean and percentile markers.
  - **Insight**: Ratings are uniformly distributed, suggesting no particular skew.

- **Overall Sales**: Histograms are used to observe the distribution of numeric attributes like `Tax` and `Total`.

#### Task 2: Branch Analysis
- **Sales by Branch**: Visualized the count of transactions by branch to understand sales volume across branches.
- **Payment Methods**: Count of transactions by each payment method type (e.g., Ewallet, Cash, Credit Card).

#### Task 3: Bivariate Analysis
- **Gross Income and Customer Ratings**: Investigated potential relationships between gross income and customer ratings.
  - **Visualization**: Scatter and regression plots show no strong relationship between these two variables.
- **Branch and Gender Comparisons**: Box plots were used to compare gross income across branches and genders.

#### Task 4: Time Series Analysis
- **Trend in Gross Income**: Analyzed time trends in gross income to determine if there is a seasonal or noticeable pattern.
  - **Visualization**: Line plot of average daily gross income.
  - **Insight**: No noticeable time trend observed in gross income.

#### Task 5: Correlation Analysis
- **Correlation Heatmap**: A heatmap displays correlations between numeric variables, focusing on relationships with `gross income` and `Rating`.
  - **Insight**: No significant correlation between customer spending and overall shopping experience rating.

### 3. Additional Profiling Report
A profiling report is generated using `ydata_profiling` to provide an in-depth summary of the dataset, including missing values, duplicate counts, and other basic statistics.

## Conclusion
This project provides a comprehensive overview of supermarket sales data, with insights into customer behavior, sales performance across branches, and patterns in customer spending. No strong correlation was found between customer ratings and gross income, and sales appeared consistent over time without any noticeable trends.

## Credit
Bassim Eledath
