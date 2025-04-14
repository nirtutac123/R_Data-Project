# arima modeling 

library(tseries)
library(forecast)

shampoo <- read.csv(
  "D:/Drive/r_training/R Training GRIT_Sushank/Datasets/time series data/shampoo_sales.csv"
)

str(shampoo)

head(shampoo)


smp_ts <- ts(shampoo$Sales.of.shampoo.over.a.three.year.period)

plot(smp_ts)

###################################################

# autocorrelation functions 

acf(smp_ts)
Acf(smp_ts)

Pacf(smp_ts)


adf.test(smp_ts)

###

# making our data stationary 

smp_ts |> diff(differences = 1) |> adf.test()
# the data is stationary at differences 1,
# therefore d = 1

# finding p (AR part)

smp_ts |> diff(differences = 1) |> Pacf()

# here the first lag has high autocorrelation 
# therefore p = 1


# finding q (MA)

smp_ts |> diff(differences = 1) |> Acf()
# q  = 1, 2, or 15

# lets take 2. 

## p, d, q = 1, 1, 2

smp_model <- Arima(
smp_ts,
order = c(1, 1, 2)
)

summary(smp_model)

## studying residuals -------------
Acf(smp_model$residuals)

Pacf(smp_model$residuals)

####

checkresiduals(smp_model)


Box.test(smp_model$residuals, 
         type = "Ljung-Box")

Box.test(smp_model$residuals, 
         type = "Box-Pierce")


#####################################################
# forecasting the outcome. 


smp_forescast <- forecast(
  smp_model,
  h = 6
)

smp_forescast

plot(smp_forescast)

lines(fitted(smp_forescast), col = "red")

# accuracy ----

accuracy(smp_model)

########################################################

auto_model <- auto.arima(
  smp_ts,
  ic = "aic",
  trace = T
)




checkresiduals(auto_model)

forecast(
  auto_model,
  h =6
)



