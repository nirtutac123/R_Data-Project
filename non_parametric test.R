########## NON PARAMETRIC TEST ------------------------------------------------------


#loading necessary library
library(readxl)  #loading exel files
library(rstatix)  #performing statstical test
library(tidyverse) # for data cleaning, wrangling and visuaizing

# Loading dataset

electricity  <- readxl::read_excel(
  "C:/R-Studio Tutorial/electricity_utility_rates.xlsx"
)

str(electricity)

unique(electricity$state)

el_filt <- electricity |>
  filter(
    state %in% c("AL", "CT", "MT", "MO")
  )

##nKRUSKAL WALLIS TEST --
##  ANALOGOUS TO ANOVA (BUT FOR NON-NORMAL DATA)

el_kruskal <- kruskal_test(
  data = el_filt,
  formula = comm_rate  ~ state
)

el_kruskal


#############################################

# PAIRWISE COMPARISIONS --------------------------
# wilcoxon_test()

pair_result <- wilcox_test(
  
  data = el_filt,
  formula = comm_rate ~ state
)

pair_result












































































