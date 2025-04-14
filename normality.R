##Normality Test in RStudio

library(readxl)
library(ggplot2)
library(dplyr)


###

dummy_data <- read_excel(
  "C:/R-Studio Tutorial/dummy_data.xlsx",
  sheet = "Sheet1"
  
)

str(dummy_data)
head(dummy_data)

## visualizing density plot of the dataset

ggplot() +
  geom_density(
    data = dummy_data,
    aes(x = data1),
    fill = 'yellow'
  )
 
###

ggplot() +
  geom_density(
    
    data = dummy_data,
    aes(x = data2),
    fill = 'lightgreen'
  )

#################
## QQ_plot

ggplot(
  
  data = dummy_data,
  aes(sample = data1 )
)+
  
  stat_qq()+
stat_qq_line(color = "red", linewidth = 0.7)



######
ggplot(
  
  data = dummy_data,
  aes(sample = data2 )
)+
  
  stat_qq()+
stat_qq_line(color = "red", linewidth = 0.7)



########
ggplot(
  
  data = dummy_data,
  aes(sample = data1 )
)+
  
  stat_qq()+
stat_qq_line(color = "red", linewidth = 0.7)



## FORMAL TEST FOR NORMALITY
#shapiro-wilk normality test


shapiro.test(dummy_data$data1)

shapiro.test(dummy_data$data2)

shapiro.test(dummy_data$data3)

#######################################################################
#performing test in another dataset

electricity  <- read_excel(
  "C:/R-Studio Tutorial/electricity_utility_rates.xlsx"
)


str(electricity)

head(electricity)

unique(electricity$state)

elec_filt <- electricity |>
  filter(
    state %in% c("AZ", "MI", "IA", "CO")
  )


##density plot

ggplot(
  
  data = elec_filt[ elec_filt$state == "AZ", ],
  
  aes(x = comm_rate)
  
)+
  geom_density(fill = "red")


########For MI
ggplot(
  
  data = elec_filt[ elec_filt$state == "MI", ],
  
  aes(x = comm_rate)
  
)+
  geom_density(fill = "forestgreen")



## Plotting all the states at once ---------------------------------------
ggplot()+
  geom_density(
    data = elec_filt,
    aes(x = comm_rate,
        fill = state),
    alpha = 0.5
  )


##########################################

##QQ Plot

ggplot(
  data = elec_filt[elec_filt$state == "AZ",],
  aes(sample = comm_rate)
)+
  stat_qq()+
  stat_qq_line(color = "red")



##For MI State


























