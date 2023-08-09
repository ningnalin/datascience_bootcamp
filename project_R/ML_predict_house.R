## Predict House Price

library(caret)
library(tidyverse)
library(janitor)

house2016 <- read_csv("House Price India 2016.csv")
house2016 <- clean_names(house2016)

house2016$logprice <- log(house2016$price)  ## ปรับการกระจายตัว


## Split

train_test_split <- function(data){
  set.seed(62)
  n <- nrow(data)
  id <- sample(1:n, size= n*0.8)
  train_data <- data[id, ]
  test_data <- data[-id, ]
  return(list(train_data, test_data))
}


split_house2016 <- train_test_split(house2016)

train_house2016 <- split_house2016[[1]]  ## Train
test_house2016 <- split_house2016[[2]]  ## Test


## Train Control

ctrl <- trainControl(
  method = "cv",
  number = 5,
  verboseIter = FALSE #Show training log
)

lm_model_ctrl <- train(logprice ~
                         number_of_bathrooms + 
                         living_area +
                         grade_of_the_house +
                         renovation_year +
                         built_year, 
                       data = train_house2016, 
                       method = "lm",
                       trControl = ctrl)

## Score & Evaluate

p <- predict(lm_model_ctrl, newdata = test_house2016)
error_lm <- test_house2016$logprice - p
mae_lm <- mean(abs(error_lm))
rmse_lm <- sqrt(mean(error_lm **2))


## เทียบผล

lm_model_ctrl

cat("RMSE TEST :", rmse_lm,
    "\n MAE TEST :", mae_lm)
