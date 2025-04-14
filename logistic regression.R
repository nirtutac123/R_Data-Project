##LOGISTIC REGRESSION

##BINARY LOGISTIC REGRESSION -------------------------------------

library(readxl)
library(tidyverse)


smoking <- read_excel(
  "C:/R-Studio Tutorial/smoking_data.xlsx"
)

str(smoking)

smoking_data <- smoking |>
  mutate(
    Disesae = ifelse(Disease == "diseased", 1, 0),
    Gender = as.factor(Gender),
    Smoker_status = as.factor(Smoker_status)
    
  )   |>
  mutate(
    Disease = as.factor(Disease)
  )

str(smoking_data)


my_model1 <- glm(
  
  data = smoking_data,
  formula = Disease ~ Age + Gender + Smoker_status,
  family = binomial()
  )

summary(my_model1)


### MULTICOLLINEARITY -----------------------------------------
library(car)

car::vif(my_model1)

exp(
  
  cbind(
    OR = coef(my_model1)
  )
)


########## Predicting probabilities -------------------------------


smoking_data$predicted_prob <- predict(
  my_model1,
  type = "response"
)

smoking_data <- smoking_data |>
  mutate(
    pred_class = ifelse(predicted_prob >= 0.5, 1, 0)
  )

names(smoking_data)




























