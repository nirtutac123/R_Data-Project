#Data cleaning & handling missing Data---------------------
install.packages("tidyverse")


library(tidyverse)

starwars


star <- starwars


str(star)


head(star)


star <- star %>%
select(
  -homeworld, -films, -vehicles, -starships
)
  

star %>%
  filter(complete.cases(hair_color))
  
star %>%
  filter(complete.cases(mass))  #removes NA values from the column mass

star %>%
  filter(complete.cases(hair_color, mass))

complete_data <- star %>%
  filter(complete.cases(.))  #overall dataset


comp_new <- star %>% na.omit()  #na.omit removes all the rows with NA values
star %>% drop_na()   # same as na.omit but is from the package tidyr

##################################################################################

incomplete_data <- star %>%
  filter(!complete.cases(.))
  
star %>%
  filter(!complete.cases(.))
  
star |>
  filter(!complete.cases(mass))
  

star <- star |>
  mutate(
    
    new_hair_color = replace_na(hair_color, "none")
    
  )
 

## replace_na 
##Mutate function from dplyr package creates new column, or relaces the column in the dataset.
  

##Find the average height
height_avg <- mean(star$height,
                   na.rm = T)  

height_avg

median(star$height, na.rm = T)

# MUtate replaces /ovverrides old value

star <- star |>
  mutate(
    
    height = replace_na(height, height_avg)
    
  )


str(star)


##Another way
star <- star |>
  mutate(
    mass_new = replace_na(
      mass, mean(star$mass, na.rm = T)
    )
  )

## a factor is a data type used to represent categorical variables.

star <- star |>
  mutate(
    
    sex = as.factor(sex),
    gender = as.factor(gender),
    hair_color = as.factor(hair_color)
  )


str(star)

star <- star |>
  mutate(
    mass_new = as.numeric(mass_new)
  )
  
str(star)

star <- star |>
  mutate(
    mass_chr = as.numeric(mass_chr)
  )

str(star)

star[ 84, 2] <- 176 # 84th row 2nd column - ovverrides original data

star[ c(84, 86, 87), 2] <- 20




##Encoding names

star <- star |>
  mutate(
    gender_encoded = recode(
      
      gender, 
      "masculine" = 1,
      "feminine" = 2
    )
  )


star$gender_encoded <- as.factor(star$gender_encoded)



##Dealing with duplicate dataset

my_df <- data.frame(

  name = c("A", "B", "C", "A"),
  
  value = c(1, 2, 3, 1)
)

## Viewing duplicate rows

duplicated(my_df)


## Viewing duplicate row

my_df[  duplicated(my_df)  ,  ]

## Viewing unduplicate rows

my_df[  !duplicated(my_df)  ,  ]


not_dup <- my_df[ !duplicated(my_df)      ,  ]


not_dup_2 <- my_df |> distinct()

not_dup_2


###############################################################################
##Removing outliers

car <- mtcars

Q1 = quantile(car$mpg, 0.25)

Q3 = quantile(car$mpg, 0.75)

IQR <- Q3 -Q1


lower_bound <- Q1 - 1.5*IQR

upper_bound <- Q3 + 1.5*IQR

no_outliers <- car |>
  filter(
    
    mpg >= lower_bound & mpg <= upper_bound
  )

































  
  
  
  
  