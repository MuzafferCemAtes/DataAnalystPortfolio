# Red Wine Quality Analysis

This project aims to analyze and classify red wine quality using machine learning and clustering techniques. The dataset consists of physicochemical properties of red wine samples and their quality ratings.

## Project Overview

### Objective:
- Predict wine quality based on its physicochemical properties.
- Explore clustering techniques to group wines with similar characteristics.
- [Dataset](https://archive.ics.uci.edu/dataset/186/wine+quality)

### Dataset:
- The dataset contains 11 features related to wine properties (e.g., alcohol, pH, sulfates) and a quality score (3-8).
- **Imbalanced classes**: Most samples are rated as 5 or 6, with very few at the extremes.

### Key Techniques:
- **Data Preprocessing**: Cleaning, feature engineering, and handling class imbalance.
- **Supervised Learning**: Testing models like Random Forest, Gradient Boosting, and SVM.
- **Unsupervised Learning**: K-means clustering for pattern discovery.

---

## Steps in Analysis

### 1. Data Preprocessing
- **Cleaning**: Removed duplicate rows and handled outliers using IQR analysis.
- **Class Grouping**: Grouped quality scores into three categories: `Low`, `Medium`, and `High`.
- **Feature Engineering**:
  - Added derived features such as `acidity balance`, `alcohol density`, and logarithmic transformations for certain features.

---

### 2. Exploratory Data Analysis
- **Visualizations**:
  - Distribution of wine quality scores.
  - Boxplots and histograms for feature distributions.
  - Correlation heatmaps to understand relationships between features.

---

### 3. Machine Learning Models
#### **Random Forest Classifier**:
- Achieved an accuracy of **~68%** after hyperparameter tuning with GridSearchCV.
- Identified key features: `Alcohol`, `Sulphates`, `Volatile Acidity`.

#### **Gradient Boosting Classifier**:
- Achieved similar performance to Random Forest but offered more interpretability in feature importance.

#### **Support Vector Classifier (SVC)**:
- Performed comparably but required significant tuning for optimal results.

---

### 4. Clustering Analysis
#### **K-Means Clustering**:
- Used the **elbow method** to select the optimal number of clusters (`k=3`).
- Evaluated clustering quality using **silhouette scores**, with the highest score being **0.21**.
- Highlighted challenges in clustering due to overlapping feature distributions.

---

## Challenges and Insights
### Imbalanced Data:
- The dataset was heavily skewed toward `Medium` quality wines.
- **Oversampling (SMOTE)** was applied to balance the training dataset.

### Clustering Limitations:
- Clustering results were weak due to overlapping feature distributions.
- A silhouette score of **0.21** indicates limited separability among clusters.

### Key Insights:
- **Alcohol content** is the most significant predictor of wine quality.
- Wines with higher acidity balance and sulphates tend to be of higher quality.

---

## Conclusions and Recommendations
### Best Model:
- The **Random Forest Classifier** performed best with an accuracy of **68%** on the test set.

### Future Work:
- Explore additional external datasets to enrich features.
- Use advanced balancing techniques for imbalanced datasets.
- Experiment with ensemble models or deep learning for better performance.

---

## How to Run the Project
1. Clone this repository.
2. Install required Python packages listed in `requirements.txt`.
3. Run the Jupyter Notebook `Red_Wine_Quality.ipynb` for step-by-step execution.
4. Review the outputs and results in the notebook.

---

Thank you for exploring this project!

