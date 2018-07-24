########################################################################
# ex3_8_cell_segmentation.R
########################################################################

library(AppliedPredictiveModeling)
library(tidyverse)
library(e1071)
library(caret)

# Load and prepare data ---------------------------------------------------

data("segmentationOriginal")

seg_data <- segmentationOriginal %>%
  filter(Case == "Train")
cell_id <- seg_data$Cell
class <- seg_data$Class
case <- seg_data$Case

## Remove response variables and binary versions of the predictors
seg_data <- seg_data %>%
  select(-Cell, -Class, -Case) %>%
  select(-contains("Status"))

## Find the skewness of each of the variables
skew_values <- seg_data %>%
  summarise_all(skewness)