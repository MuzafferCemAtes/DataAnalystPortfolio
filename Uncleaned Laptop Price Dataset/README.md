# Beginner-Level Data Cleaning Project

This project demonstrates the basics of data cleaning, focusing on preparing a dataset for analysis by handling common issues such as missing values, duplicates, and formatting inconsistencies. The dataset used here contains various laptop specifications, such as screen resolution, processor details, weight, and price.

## Project Outline

1. **Introduction**
   - Objective: To clean and prepare data for further analysis.
   - Dataset: A dataset containing specifications for different laptop models.

2. **Data Inspection**
   - Loaded the data and inspected its structure using `head()` and `info()` to understand columns and data types.

3. **Handling Missing Values**
   - Checked for missing values in each column.
   - Filled missing values in categorical columns (e.g., `Screen`) with a placeholder like "Unknown".

4. **Removing Duplicates**
   - Identified and removed duplicate rows to ensure data uniqueness.

5. **Data Cleaning and Formatting**
   - **Screen Resolution**: Separated into `Screen` and `Resolution` columns.
   - **CPU and GPU**: Extracted brand, model, and speed for better analysis.
   - **Weight**: Removed "kg" and converted values to `float` type.
   - **Price**: Converted `Price` column to a numeric type.

6. **Data Type Conversion**
   - Converted necessary columns (e.g., `Inches`, `Weight`, `Price`) to appropriate numeric types.

7. **Conclusion**
   - The dataset is now clean and ready for analysis.
   - Further steps, such as outlier detection and handling, will be included in the intermediate-level data cleaning project.

## How to Use
- Clone the repository.
- Open `beginner_basic_data_cleaning.ipynb` in Jupyter Notebook or any compatible environment.
- Run each cell sequentially to observe the data cleaning process.

## Next Steps
This beginner-level project covers essential data cleaning techniques. For more advanced techniques, see the intermediate-level data cleaning project, which will include tasks such as outlier detection and handling.

## Requirements
- Python 3.x
- Pandas
- Matplotlib (for visualizations, optional)

## License
This project is open-source and available under the MIT License.


