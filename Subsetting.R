#Subsetting ------------------

mtcars
?mtcars

cars <- mtcars


str(cars)

head(cars)

tail(cars)


head(cars, 10)

write.csv(
  cars,
  
  "cardata.csv"
)

## accessing specific columns
cars$mpg

cars$cyl

cars[1]

cars[2]

col_s <- cars[c(2, 3)]


##REnaming the columns --------------------


names(cars)

names(cars)[1]

names(cars)[1] <- "miles_per_gallon"

names(cars)



names(cars)[ c(2, 3)] <- c("cylinder", "disp")

names(cars)





































