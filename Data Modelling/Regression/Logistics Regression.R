library(dplyr)


training_set$Road_Surface_Conditions <- factor(training_set$Road_Surface_Conditions, ordered = TRUE, 
                                               levels = c("Dry", "Ice", "Wet"))
training_set$Weather_Conditions <- factor(training_set$Weather_Conditions, ordered = TRUE, 
                                          levels = c("Fine", "Fog", "Rain", "Snow"))



logistic1<-glm(Accident_Severity ~ Weather_Conditions  + Road_Surface_Conditions  + Number_of_Vehicles + Number_of_Casualties, data=training_set, family=binomial(link="logit"))
summary(logistic1)


#Remove the attribute: "Weather Condition"
logistic2<-glm(Accident_Severity ~ Road_Surface_Conditions  + Number_of_Vehicles + Number_of_Casualties, data=training_set, family=binomial(link="logit"))
summary(logistic2)


#calculate the probabilities
fitted_results <- predict(logistic2,newdata=testing_set,type='response')
#Plot the histogram to show the % of accidents that will be serious
hist(fitted_results, breaks=10, main="Prob of Serious Accident",xlab="Probability", ylab="count", col="blue",xlim=c(0.65,1), ylim=c(0,500))

 

# Assign ‘0’ - Serious if probability is >0.5 (SERIOUS = 0, SLIGHT = 1)
fitted_results <- ifelse(fitted_results > 0.5,0,1)


#Misclassification rate
misclassification_rate <- mean(fitted_results != testing_set$Accident_Severity)


