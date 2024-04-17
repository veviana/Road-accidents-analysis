library(dplyr)
library(ggplot2)



e<-training_set$Age_of_Driver    #Predictor
h<-training_set$Age_of_Casualty  #Target
plot(e,h,col = "steelblue",main = "Age of Driver Vs Age of Casualty", abline(lm(h~e)),cex = 1.3,pch = 16,xlab = "Age of Driver",ylab = "Age of Casualty")

summary(lm(h~e))
 





training_set$Sex_of_Driver


multiple <- lm(Number_of_Casualties ~ Number_of_Vehicles + Engine_Capacity_CC + Age_of_Vehicle ,data = training_set)
summary(multiple)


model1 <- lm(Number_of_Casualties ~  Sex_of_Driver + Number_of_Vehicles, data = training_set)
summary(model1)
