## Developing equations and writing formula In R

car <- mtcars

names(car)

car$new_col1 <- NA

car$new_col1 <- 20

car$fmla_1 <- 3*car$mpg + 5*car$drat

car$average <- mean(car$mpg)

names(car)

library(dplyr)

car <- car |>
  mutate(
    f_2 = 4*disp + hp/2
  )

## A bit advanced
## case when approach

car <- car %>%
  mutate(
    f_3 = case_when(
      cyl == 4 ~ mpg + 4*wt,
      TRUE ~ 0
    )
  )

###

car <- car %>%
  mutate(
    f_5 = case_when(
      cyl == 4 ~ mpg + 4*wt,
      cyl == 6 ~ mpg / 2 + 2*wt,
      TRUE ~ 0
    )
  )

### More advanced case when approaches

car <- car |>
  mutate(
    advanced = case_when(
      cyl == 6 & gear == 4 ~ drat/5 + mpg/5,
      cyl == 6 & gear == 4 ~ drat/10 + mpg/10,
      TRUE ~ drat/2 + mpg/2
        
    )
    )
############################################################################
# grouping
car <- car |>
  group_by(cyl) |>
  mutate(
    cyl_avg = mean(mpg)
  ) |>
  ungroup()

car |>
  group_by(cyl) |>
  summarise(
    cyl_avg = mean(mpg)
  )

















































































































