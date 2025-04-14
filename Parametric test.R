##Parametric and non-parametric test

library(readxl)
library(tidyverse)
library(rstatix)


install.packages("rstatix")

dummy_data <- read_excel(
  "C:/R-Studio Tutorial/dummy_data.xlsx",
  sheet = "Sheet1"
)

str(dummy_data)

head(dummy_data)

long_data <- dummy_data |>
  pivot_longer(
    cols = c(data1, data2, data3),
    names_to = "data_name",
    values_to = "data_values"
 )

is.na(long_data$data_values) |> sum()
sum(
  is.na(long_data$data_values)
)

long_data <- long_data |> na.omit()

sum(
  is.na(long_data$data_values)
)

 dummy_data %>%
   filter(!complete.cases(.))
 nrow()


####################### T Test #########################################
 

 two_data <- long_data |>
   filter(data_name %in% c("data1", "data2"))
 
 t_result <- t_test(
   data = two_data,
   formula = data_values ~ data_name 
   
 )

t_result


##################################################################################33
## ANOVA -----------------------------------------------------------------------
test_anova <- anova_test(
  data = long_data,
  formula = data_values ~ data_name
)

test_anova



###Post hoc test ----------------------------------------------------------------
#There are multiple post hoc tests, we'll perform TUKEY_HSD test

tukey_values <- tukey_hsd(
  
  x = long_data,
  formula = data_values ~ data_name
  
)

tukey_values

##########################################################
#VISUALIZATION
library(ggplot2)


ggplot(
  data = two_data,
  aes(
    x = data_name,
    y = data_values
  )
)+
  geom_boxplot(color = "blue", fill = "skyblue")

theme_bw()


#################################################################################
#ANOVA TEST --------------------------------------
install.packages("ggsignif")

library(ggsignif)


ggplot(
  data = long_data,
  
  aes(x = data_name,
      y = data_values)
)+
  
  geom_boxplot(fill = "yellow")
######

ggplot(
  data = long_data,
  
  aes(x = data_name,
      y = data_values)
)+
geom_boxplot() +
  theme_bw()+
  geom_signif(
    
    comparisions = list(
      c("data1", "data2")
    ),
    
    y_position = c(130),
    annotations = c("p<0.0001")
  )


































