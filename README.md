# Brewlytics: Coffee Supply Chain Analytics and Forecasting

## Overview

This project analyzes a **synthetic** coffee supply chain dataset to uncover business insights and build predictive models. The focus is on understanding how pricing strategies, logistics, and regional dynamics influence revenue, along with forecasting future performance.

The analysis is conducted using _R_ for statistical modeling and _Tableau_ for visualization. The dataset is designed to simulate realistic trends in revenue, demand, and operational variables over time.

---

## Objectives

The project aims to:

- Understand the relationship between discount strategies and quantity sold  
- Analyze logistics factors such as freight mode and its impact on delivery efficiency  
- Explore revenue distribution across regions  
- Identify correlations between key numerical variables  
- Forecast future revenue trends using time series models  

---

## Dataset Description

The dataset contains **3000 observations** representing coffee shipments across different regions and time periods.

### Key Variables

#### Categorical Variables
- `Batch_Id`: Unique identifier for each shipment  
- `Coffee_Bean_Type`: Arabica, Robusta, Excelsa, Liberica  
- `Freight_Mode`: Air, Sea, Road  
- `Region`: Geographic region of operation  
- `Packing_Type`: Packaging category  
- `Export_Country`: Country of origin  
- `Import_Country`: Destination country  
- `Warehouse_Location`: Storage and distribution hub  

#### Numerical Variables
- `Weight_Kg`: Quantity shipped  
- `Discount_Percent`: Discount applied  
- `Price_per_kg`: Base price per unit  
- `Revenue_USD`: Revenue generated  
- `Transport_Days`: Delivery time  
- `Handling_Cost`: Operational handling cost  
- `Packaging_Cost`: Packaging expense  
- `Customs_Fee`: Import/export duties  
- `Insurance_Fee`: Risk coverage cost  

#### Time Variable
- `Order_Date`: Date of transaction (2015–2025)

---

## Key Analytical Components

### 1. Discount vs Quantity Analysis

A linear regression model is used to analyze how discounts influence the quantity sold.

- Model: `Weight_Kg ~ Discount_Percent`  
- Visualization: Scatter plot with regression line  

**Insight:**  
There is a strong positive relationship between discount percentage and quantity sold, indicating that higher discounts drive larger purchases.
<img width="502" height="313" alt="image" src="https://github.com/user-attachments/assets/ec34c19e-e7cd-47d3-9c40-8f12d1155bc4" /> 

---

### 2. Correlation Analysis

A correlation matrix is generated across all numerical variables.

**Purpose:**
- Identify relationships between cost components and revenue  
- Understand dependencies between logistics variables  
- Detect multicollinearity  
<img width="381" height="395" alt="image" src="https://github.com/user-attachments/assets/e419bb20-ab15-4cf7-bbc6-59c0ed68bd37" />

The `corrplot` package is used for visualization.

---

### 3. Revenue Distribution by Region

Boxplots are used to compare revenue across regions.

**Insights derived:**
- Identification of high-performing regions  
- Detection of variability in revenue  
- Recognition of outliers  
<img width="458" height="279" alt="Rplot02" src="https://github.com/user-attachments/assets/cc589700-e1b5-4839-a3f3-b73eeeebf661" />

---

### 4. Freight Mode Efficiency Analysis

The impact of freight mode on delivery time is analyzed.

- **Two categories** → t-test  
- **More than two categories** → ANOVA  

This helps determine whether transport mode significantly affects delivery performance.

---

### 5. Time Series Forecasting

Revenue is aggregated monthly and converted into a time series object.

**Process:**
1. Convert `Order_Date` into monthly format  
2. Aggregate revenue by month  
3. Create a time series object  
4. Apply ARIMA model  
5. Forecast future values  
<img width="958" height="547" alt="Screenshot 2025-05-19 190341" src="https://github.com/user-attachments/assets/20f97e08-3a70-407d-90a1-835e22b6e9cc" />

**Outcome:**  
The dataset has been curated to ensure a clear upward trend, allowing meaningful forecasting with a positive slope.

---

## Tableau Dashboard

A Tableau dashboard was created to visually explore the dataset and support decision-making.

### Dashboard Components

#### 1. Revenue Forecast Visualization
- Line chart showing **average revenue over time**
- Forecast added using Tableau’s built-in forecasting model  
- Displays trend and future projections  

#### 2. Sales Target Comparison
- Bar chart comparing revenue across categories (e.g., city or warehouse)  
- Includes a dynamic parameter slider for sales targets  
- Color encoding highlights whether targets are met  

#### 3. Warehouse Performance Analysis
- Visual comparison of warehouses based on:
  - Total shipment weight  
  - Average discount  
  - Number of orders  
- Helps identify operational efficiency  

#### 4. Freight Mode Analysis
- Boxplots comparing transport days across freight modes  
- Highlights efficiency differences between Air, Sea, and Road  

#### 5. Geographic Trade Insights
- Map-based visualization of export and import countries  
- Shows distribution of trade activity  

---

### Interactivity Features

- Filters for:
  - Bean Type  
  - Region  
  - Freight Mode  
  - Time period  
- Parameter slider for dynamic analysis  
- Drill-down capability for detailed exploration  

---

### Key Value of Dashboard

The Tableau dashboard transforms raw data into actionable insights by:
- Allowing real-time exploration  
- Highlighting performance gaps  
- Supporting forecasting-based decision-making  

---

## Tools and Technologies

- R (data analysis and modeling)  
- Tableau (data visualization and dashboarding)  

### R Libraries Used
- `dplyr`  
- `ggplot2`  
- `forecast`  
- `prophet`  
- `corrplot`  
- `lubridate`  

---

## File Structure

- CSV Dataset: Cleaned and engineered dataset  
- R Script: Analysis, modeling, and visualization code  
- Tableau Workbook (.twbx): Interactive dashboard  

---

## Key Insights

- Discounts significantly influence purchase quantity  
- Revenue shows a consistent upward trend over time  
- Logistics decisions impact operational efficiency  
- Regional variations exist in performance  
- Forecasting models provide reliable future estimates  

---

## Limitations

- Dataset is synthetic and may not fully reflect real-world complexities  
- External factors such as market shocks or seasonality are simplified  
- Forecast assumes continuity of past trends  

---

## Future Improvements

- Incorporate real-world datasets  
- Add external variables such as weather or economic indicators  
- Apply advanced forecasting models  
- Enhance dashboard interactivity  

---

## Conclusion

This project demonstrates how data analysis and forecasting can provide meaningful insights into a supply chain system. By combining statistical modeling with visualization tools, it becomes possible to understand historical performance and make informed predictions about future outcomes.
