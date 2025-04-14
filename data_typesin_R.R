# Data types in R Studio--------------

#numeric data ------------

1

2
class(y)
 x <- 235
 y <- -20

 class(y)

 
 class(1.345)  
 
 #Character Data-----------
 hari <- "mohan"
class(hari) 

a <- "Hello World" 

class(a)

nu_ch <- '2'
 class(nu_ch) 

 
hari <- 'ram'  


#logical data

class(TRUE)

tr <- TRUE 
tru <- T
class(T)
class(F) 

# Factor data
val <- c(1, 2, 1, 2, 2, 1) #male = 1, female = 2

class(val)


class_val <- as.factor(val)

## vectors-------------

#numeric vector
numeric_vector <- c(10, 23, 14, 15, 1, 18, 45)

class(numeric_vector)

seq_vector <- 1:10

class(seq_vector)

new_vector <- seq(1, 10, length.out = 4)

class(new_vector)


chr_vec <- c("hari", "sita", "ram", "joseph")

class(chr_vec)
 
##logical vectors --------------------

## DATA FRAME-------

my_df <- data.frame(
  
  num = c(1, 4, 6),
  log = c(T, F, T),
  chr = c("A", "B", "C")
)

class(my_df)



#matrix
class(matrix_data)
matrix_data <- matrix(
  1:9,
  nrow = 3,
  ncol = 3
)

print(matrix_data)




rect_matrix <- matrix(
  c(
    1, 2, 3, 4, 5, 6
  ),
  
  nrow = 2,
  ncol = 3,
  
)

rect_matrix



## list 

x <- 20

my_list <- list(
  ind = x, 
  vector = chr_vec,
  data.f = my_df, 
  #mat_data = matrix_data
) 



print(my_list)


















 
 
 