# EDA 1: Do younger drivers get into ‘Serious’ accidents more frequently? 

library(dplyr)
library(ggplot2)



#Filter Accident Severity (Keep only those whereby accident severity is SERIOUS)
severityByAge <-  your_dataset %>% 
  select(Accident_Severity, Age_of_Driver) %>% 
  filter(Accident_Severity == "Serious")



#Plot a box plot to see if there are any extreme values (Driver's Age)
boxplot(severityByAge$Age_of_Driver,
        main="Age of drivers involved in 'Serious' accident",   #Box Plot Title
        xlab="Driver's Age",                                    #x-axis label
        ylab="Serious Accident Severity",                       #y-axis label
        col="white",                                            #color of box plot, set it to white
        horizontal = TRUE)                                      #view the box plot in horizontal manner 


#Remove negative driver's age 
severityByAge <-  your_dataset %>% 
  select(Accident_Severity, Age_of_Driver)%>% 
  filter(Accident_Severity == "Serious" & Age_of_Driver > 0)



#Plot Histogram: Accident Severity Against Driver's Age (To see the distribution of driver's age)
hist(severityByAge$Age_of_Driver, 
     main="Histogram of Driver's age involved in 'Serious' accident",     #Histogram title 
     xlab="Driver's Age", 
     border="black", #Set the outer border color for the histogram to black
     col="steelblue", #Color of histogram (use blue instead of red/green)
     xlim=c(0,100), #Set x-axis limit to 100 (Since max driver's age is 94)
     ylim=c(0,150), #Set y-axis limit to 150 
     las=1, #Display the values on y-axis vertically instead of horizontally 
     breaks=10) #Bin the age group (10 years apart)



ggplot(severityByAge, aes(x=Age_of_Driver)) + 
  geom_histogram(color="black", fill="steelblue",binwidth = 10) +
  xlim(c(0, 100)) + ylim(c(0, 150)) +
  ggtitle("Histogram of Driver's age involved in 'Serious' accident") +
  theme(plot.title = element_text(hjust = 0.5)) 
















