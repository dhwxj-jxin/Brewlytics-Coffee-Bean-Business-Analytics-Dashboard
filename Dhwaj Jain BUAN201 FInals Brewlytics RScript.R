# --- Load Libraries ---
library(dplyr)
library(ggplot2)
library(forecast)
library(prophet)
library(corrplot)
library(cluster)
library(readr)
library(tidyr)
library(broom)
library(dplyr)
library(lubridate)
library(prophet)

install.packages("ggplot2")  # Run this only if ggplot2 is not installed
library(ggplot2)  # Load ggplot2 for ggtitle() and additional plotting functionality


install.packages("forecast")   # Only once if not installed
library(forecast)              # Load forecast package

# Load your CSV file
coffee_data <- read_csv("C://Users//Dhwaj//Downloads//FLAME University//Y2//Y2 S4//BUAN201- Data Mining for Business Intelligence//Dhwaj Jain BUAN201 FInals Brewlytics CSV Dataset.csv")

#--- Linear Regression----#
lm_model <- lm(Weight_Kg ~ Discount_Percent, data = coffee_data)
summary(lm_model)

# Plot
ggplot(coffee_data, aes(x = Discount_Percent, y = Weight_Kg)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", color = "blue") +
  ggtitle("Linear Regression: Discount vs Quantity Sold") +
  xlab("Discount (%)") +
  ylab("Quantity Sold (Kg)") +
  theme_minimal()





# --- Correlation Matrix ---
numeric_vars <- coffee_data %>%
  select(where(is.numeric))   # Select only numeric columns

cor_matrix <- cor(numeric_vars, use = "complete.obs")

# Plot Correlation Matrix
corrplot(cor_matrix, method = "color", type = "upper", tl.cex = 0.8)



# --- Boxplot of Revenue by Region ---
ggplot(coffee_data, aes(x = Region, y = Total_Revenue)) +
  geom_boxplot(fill = "skyblue") +
  ggtitle("Boxplot: Revenue by Region") +
  xlab("Region") +
  ylab("Total Revenue") +
  theme_minimal() +
  coord_flip()

# --- Freight Mode Comparison (t-test / ANOVA) ---
# Example: Compare Transport Days across Freight Modes
# If only 2 freight modes → use t-test
# If more than 2 freight modes → use ANOVA

freight_modes <- coffee_data %>%
  filter(!is.na(Freight_Mode))  # remove NAs

# If 2 freight modes: t-test
if (length(unique(freight_modes$Freight_Mode)) == 2) {
  t_test_result <- t.test(Transport_Days ~ Freight_Mode, data = freight_modes)
  print(t_test_result)
} else {
  # More than 2 freight modes: ANOVA
  anova_result <- aov(Transport_Days ~ Freight_Mode, data = freight_modes)
  summary(anova_result)
  
  # Boxplot
  ggplot(freight_modes, aes(x = Freight_Mode, y = Transport_Days)) +
    geom_boxplot(fill = "lightgreen") +
    ggtitle("Transport Days by Freight Mode") +
    xlab("Freight Mode") +
    ylab("Transport Days") +
    theme_minimal()
}
