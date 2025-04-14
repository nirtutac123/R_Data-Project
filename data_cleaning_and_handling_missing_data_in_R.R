# data cleaning and handling missing data. 

library(tidyverse)

starwars

star <- starwars

str(star)

head(star)


star <- star %>% 
  select(
    -homeworld, - films, -vehicles, -starships
  )


## handling missing values. 

# removing the rows with missing values. 
head(star)

star %>% 
  filter(complete.cases(hair_color))


star %>% 
  filter(complete.cases(mass))

star %>% 
  filter(complete.cases(hair_color, mass))


complete_data <- star %>% 
  filter(complete.cases(.)) # overall dataset. 


comp_new <- star %>% na.omit() # na.omit removes all the rows with NA values. 
# na.omit is base R function

star %>% drop_na() # same as na.omit() but is from the package tidyr


star %>% drop_na(mass) # removes NA values from the column mass, 

#########################################################################


incomplete_data <- star %>% 
  filter(!complete.cases(.))



star %>% 
  filter(!complete.cases(mass))



