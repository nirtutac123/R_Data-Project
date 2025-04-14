library(datasets)
library(help = "datasets")


head(trees)

rukh <- trees

str(rukh)
###################################
cor.test(rukh$Girth, rukh$Volume,
         method = "spearman")





####################################3
rstatix::cor_test(rukh)


###########################################OTHER FUNCTION
cor(rukh)


#################################
?cor.test



#######################################

##REGRESSION ------------------------------------------

vol_regression <- lm(
  
  data = rukh,
  formula = Volume ~  Girth
)


summary(vol_regression)


## Y = mx + C

## Volume = 5.0659    * GIRTH + (-36.9435)

# Y = 5.06x - 36.94


#########################################################
#Visualization ---------------------------------------

library(ggplot2)

ggplot(
  
  data = rukh, 
  aes(
    x = Girth,
    y = Volume
  )
)+
  geom_point()+
  geom_smooth(
    
    method = "lm",
    se = FALSE
  )+
  theme_classic()+
  annotate(
    
    geom = "text",
    label = "y = 5.06x- 36.94          R² = 0.93",
    x = 9,
    y = 65,
    fontface = "italic",
    size = 4,
    family = "sans",
    hjust = 0
  )


##############################################################################
##MULTIPLE REGRESSION EQUATION

multi <- lm(
  data = rukh, 
  formula = Volume ~ Girth + Height
)


summary(multi)


#Equation

#Volume = 4.7*Girth + 0.34 * Height + (-57.99)












