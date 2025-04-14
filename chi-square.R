##############
#CHI-SQUARE TEST


library(readxl)


# loading the dataset

cancer_data <- readxl::read_excel(
  "C:/R-Studio Tutorial/cancer_dummy_data.xlsx",
  sheet = "Sheet1"
)


str(cancer_data)

head(cancer_data)


chisq_test(
  x = cancer_data$Smoking_Category,
  y = cancer_data$Cancer_status
)

cancer_table <- table(
  cancer_data$Smoking_Category,
  cancer_data$Cancer_status
)

cancer_table

chisq_test(cancer_table)


class(cancer_table)


#VISUALIZING

cancer_df <- as.data.frame(cancer_table)

head(cancer_df)


## USING ggplot2 package

ggplot()+
  geom_bar(
    data = cancer_df,
    aes(x = Var1,
        y = Freq,
        fill = Var2
        ),
    
    stat = "identity",
    position = "dodge"
    
  )+
  labs(
    x = "Smoking Status",
    y = "Number of respondants",
    main = "Cancer VS Smoking"
  )+
  theme_bw()



ggsave(
  "cancer.png"
)


rm(list = ls()) #CLEANS THE ENVIRONMENT

dev.off() ## REMOVES ALL THE PLOTS


gc() #IT CLEANS OUR MEMORY

CTRL + L #CLEANS CONTROL MEMORY


rm(list = ls(all.names = TRUE))





























