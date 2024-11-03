# Intermediate Data Cleaning Project

This project demonstrates data cleaning techniques at an intermediate level, focusing on preparing a dataset for analysis by handling common issues such as missing values, duplicates, standardizing formats, and removing outliers.

## Project Outline

1. **Introduction**
   - Objective: To clean and prepare a dataset containing laptop specifications for accurate analysis.
   - Dataset: A dataset with various features like screen resolution, CPU, weight, and price.

2. **Data Inspection**
   - Loaded the dataset and inspected its structure to understand column types, null values, and potential issues.

3. **Handling Missing Values**
   - Identified and filled missing values in categorical columns, such as `Screen`, using placeholders like "Unknown."

4. **Removing Duplicates**
   - Identified and removed duplicate rows to maintain data uniqueness.

5. **Data Cleaning and Standardization**
   - **Screen Resolution**: Split complex features like `ScreenResolution` into separate columns to facilitate analysis.
   - **CPU and GPU**: Extracted relevant details like model and speed for granularity.
   - **Weight and Price**: Removed non-numeric characters (e.g., "kg") and converted these columns to numeric types.

6. **Removing Outliers**
   - Used **box plots** to visualize distributions and spot potential outliers in `Weight` and `Price`.
   - Applied the **IQR method** to identify and remove extreme values, reducing the impact of outliers on analysis.

7. **Final Data Validation**
   - Confirmed the changes and verified data consistency, ensuring the dataset is clean and ready for further analysis.


## License
This project is open-source and available under the MIT License.
