# Random Forest Regression

This project involves building and evaluating a **Random Forest Regression** model using Python. The notebook provides a comprehensive workflow, from loading and preprocessing data to training the model, making predictions, and evaluating its performance.

## Overview
Random Forest Regression is a versatile machine learning algorithm capable of handling both linear and non-linear relationships. It creates a forest of decision trees during training and uses averaging to improve prediction accuracy and control overfitting.

The project follows these key steps:
1. **Data Import and Exploration**:
   - Load the dataset into a pandas DataFrame.
   - Examine the dataset structure to understand features and target variables.
   - Handle missing or inconsistent data if necessary.

2. **Data Preprocessing**:
   - Split the data into training and testing sets.
   - Normalize or scale features as needed to improve model performance.

3. **Model Training**:
   - Use `RandomForestRegressor` from `scikit-learn` to fit the training data.
   - Hyperparameters such as the number of estimators and tree depth are tuned to optimize model performance.

4. **Model Prediction**:
   - Make predictions on the test dataset.
   - Compare predicted values with actual values to gauge model accuracy.

5. **Evaluation**:
   - Compute evaluation metrics such as:
     - **R-squared (R²)**: Measures the proportion of the variance in the target variable explained by the model.
     - **Mean Squared Error (MSE)**: Quantifies the average squared difference between actual and predicted values.
   - Visualize the relationship between actual and predicted values using scatter plots to assess the model's performance.

6. **Visualization**:
   - Generate a scatter plot with:
     - Green points: Representing the predicted values.
     - Red dashed line: Indicating the ideal prediction line where actual = predicted.

## Prerequisites
The project is implemented in Python, and the following libraries are required:
- `pandas`: For data manipulation and analysis.
- `numpy`: For numerical computations.
- `matplotlib`: For data visualization.
- `scikit-learn`: For implementing the Random Forest Regression model.

