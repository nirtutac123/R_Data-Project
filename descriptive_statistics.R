# Descriptive statistics

iris

?iris

iris_data <- iris

head(iris_data)

str(iris_data)

unique(iris_data$Species)

unique(iris_data$Sepal.Length)




# descriptive statistics

mean(iris_data$Sepal.Length) # gives us mean (average)
 
median(iris_data$Sepal.Width) # gives us median

max(iris_data$Sepal.Length) # gives us max value

min(iris_data$Sepal.Length) # give us mimimum value. 

range(iris_data$Sepal.Length) # gives min and max values. 

## Calcualting range. 
max(iris_data$Sepal.Length) - min(iris_data$Sepal.Length)

sd(iris_data$Sepal.Length) # gives us standard deviation

quantile(iris_data$Sepal.Length) # gives us the quartile values. 

## Percentile
quantile(
  iris_data$Sepal.Length,
  probs = 0.90
)

quantile(
  iris_data$Sepal.Length,
  probs = c(0.1, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8, 0.9)
)


# Interquartile Range 
IQR(iris_data$Sepal.Length)


## Mode ---

table(iris_data$Sepal.Length) |> as.data.frame()

library(dplyr)

table(iris_data$Sepal.Length) |> as.data.frame() |> dplyr::arrange(Freq)


table(iris_data$Sepal.Length) |> as.data.frame() |> arrange(desc(Freq))

# using summary function
summary(iris_data$Sepal.Length)

summary(iris_data)

# summarizing for setosa only. 

summary(
  iris_data[ iris_data$Species == "setosa"   ,  ]
)




## USING dplyr package ----------------------------------

iris_data |>
  summarise(
    
    mean_value = mean(Petal.Length),
    standard_dev = sd(Petal.Length),
    count = n()
    
  )


iris_data |>
  group_by(Species)|>
  summarise(
    
    mean_value = mean(Petal.Length),
    standard_dev = sd(Petal.Length),
    count = n()
    
  )

# grouping by two columns
head(mtcars)

mtcars %>%
  group_by(cyl, gear) |>
  summarise(
    
    mean = mean(disp),
    median = median(disp),
    std = sd(disp)
    
  )
  
# filtering using multiple column values 

mtcars |>
  filter(
    cyl == "4" & gear == "4"
  )


## skewness and kurtosis
# you need the package moments for calculating skewness and kurtosis. 
library(moments)

skewness(iris_data$Sepal.Length)
kurtosis(iris_data$Sepal.Length)



#######################################################################

# Data Visualization-------------------------

# scatterplot 
plot(
  x = iris_data$Sepal.Length,
  y = iris_data$Sepal.Width
)


plot(
  x = iris_data$Sepal.Length,
  y = iris_data$Sepal.Width,
  xlab = "Sepal Length", 
  ylab = "Sepal Width",
  main = "Scatterplot",
  
  pch = 19,
  col = "red"
  
)

?plot.default


## Histogram -----------------------

hist(
  iris_data$Sepal.Length,
  col = "skyblue",
  border = "red"
)


species_count <- table(iris_data$Species)

barplot(species_count,
        col = c("red", "green", "blue")
        )

########
## Boxplot -------------------

boxplot(
  
  Sepal.Length ~ Species,
  data = iris_data
  
)

# for ~ sign, press the butto just left of 1, with shift


################################################################
# using ggplot2 package for 

library(ggplot2)

# histogram
ggplot(
  
  data = iris_data,
  
  aes(x = Sepal.Length)
  
)+
  geom_histogram(
    
    fill = "skyblue",
    color = "darkblue",
    binwidth = 0.3
    
  )+
  labs(
    
    x = "sepal length",
    y = "Frequency",
    title = "Hist"
    
  )+
  theme_bw()


## Scatterplot ----------------------------------------

ggplot(
  data = iris_data,
  aes(
    x = Sepal.Length,
    y = Petal.Length
  )
  )+
  geom_point(
    color = "maroon"
  )+
  geom_smooth(
    method = "lm",
    se = F
  )



## BOXPLOT -------------------------------

ggplot(
  data = iris_data,
  
  aes(
    x = Species,
    y = Petal.Length,
    fill = Species
  )
  
)+
  geom_boxplot()

ggsave(
  
  "boxplot.jpg",
  width = 4, 
  height = 3,
  dpi = 600
)














