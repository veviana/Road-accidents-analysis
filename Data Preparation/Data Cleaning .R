library(dplyr)
library(tidyverse)
library(tidyr)
library(lubridate)




clean_dataset <- your_dataset


#Replace missing values in Junction Control and Engine Type to "Not Applicable" 
clean_dataset$Junction_Control <- as.character(clean_dataset$Junction_Control)
clean_dataset$Junction_Control<- ifelse(is.na(clean_dataset$Junction_Control), 
                                       'Not Applicable', clean_dataset$Junction_Control)
clean_dataset$Engine_Type<- ifelse(is.na(clean_dataset$Engine_Type), 
                                       'Not Applicable', clean_dataset$Engine_Type)



#Replace those values in weather_condition with common meaning into the same value 
clean_dataset$Weather_Conditions[clean_dataset$Weather_Conditions == "Fine with strong winds"] <- "Fine"
clean_dataset$Weather_Conditions[clean_dataset$Weather_Conditions == "Rain with strong winds"] <- "Rain"
clean_dataset$Weather_Conditions[clean_dataset$Weather_Conditions == "Snow with strong winds"] <- "Snow"
clean_dataset$Weather_Conditions[clean_dataset$Weather_Conditions == "Unknown"] <- "Fine"


#Replace those values in vehicle type with common meaning into the same value 
clean_dataset$Vehicle_Type[clean_dataset$Vehicle_Type == "Minibus"] <- "Bus/Coach"
clean_dataset$Vehicle_Type[clean_dataset$Vehicle_Type == "Taxi/Grab"] <- "Car"



#Replace missing values in Engine Capacity CC and Age of Vehicles with the median 
colSums(is.na(clean_dataset)) #Count number of missing values in the entire dataset
clean_dataset <- clean_dataset %>% 
  mutate(Engine_Capacity_CC= round(ifelse(is.na(Engine_Capacity_CC), median(Engine_Capacity_CC, na.rm=TRUE), Engine_Capacity_CC),0))%>%
  mutate(Age_of_Vehicle= round(ifelse(is.na(Age_of_Vehicle), median(Age_of_Vehicle, na.rm=TRUE), Age_of_Vehicle),0))







#Filter away negative age values 
clean_dataset <- clean_dataset %>%  
  filter(Age_of_Casualty > 0 &  Age_of_Driver > 0)







#Plot a box plot to see if there are any extreme values (Driver's Age)
boxplot(clean_dataset$Age_of_Driver,
        main="Box Plot of Driver's Age",   
        xlab="Driver's Age",                                    
        col="white",                                            
        horizontal = TRUE)  
#Remove outliers - age of drivers aged >90, will be removed 
mean(clean_dataset$Age_of_Driver) #Before filtering, mean = 37.35. After filtering, mean = 37.31
clean_dataset <- clean_dataset %>% filter(Age_of_Driver < 90) #Filter away Driver's Age that are more than 90 years old  







#Plot a box plot to see if there are any extreme values (Vehicle's Age)
boxplot(clean_dataset$Age_of_Vehicle,
        main="Box Plot of Vehicle's Age",   
        xlab="Vehicle's Age",                                    
        col="white",                                            
        horizontal = TRUE)  
#Remove outliers - age of vehicle aged >30, will be removed 
mean(clean_dataset$Age_of_Vehicle) #Before filtering, mean = 5.44. After filtering, mean = 5.33
clean_dataset <- clean_dataset %>% filter(Age_of_Vehicle < 30) #Filter away Vehicle's Age that are more than 30 years old 










#Plot a box plot to see if there are any extreme values (Vehicle's Age)
boxplot(clean_dataset$Engine_Capacity_CC,
        main="Box Plot of Engine Capacity CC",   
        xlab="Engine Capacity",                                    
        col="white",                                            
        horizontal = TRUE) 
#Remove outliers - Engine_capacity_cc > 10000 will be removed
clean_dataset <- clean_dataset %>%  
  filter(Engine_Capacity_CC  < 10000 )








#No duplicates
sum(duplicated(clean_dataset))






#Change the date format & separate it into 3 columns 
clean_dataset$Date <- as.Date(clean_dataset$Date, format = "%d/%m/%Y") #change from character to date class
clean_dataset$year<- year(ymd(clean_dataset$Date))
clean_dataset$month <- month(ymd(clean_dataset$Date)) 
clean_dataset$day <- day(ymd(clean_dataset$Date))

clean_dataset$month <- month.abb[clean_dataset$month] #Format month into unabbreviated month


#Change Serious to 0 and Slight to 1 and convert the column into a factor
clean_dataset[clean_dataset$Accident_Severity == "Serious",]$Accident_Severity <- 0 
clean_dataset[clean_dataset$Accident_Severity == "Slight",]$Accident_Severity <- 1
clean_dataset$Accident_Severity <- as.factor(clean_dataset$Accident_Severity)

#Change vehicle type into factor 
clean_dataset[clean_dataset$Vehicle_Type == "Agri-vehicle",]$Vehicle_Type <- 4 
clean_dataset[clean_dataset$Vehicle_Type == "Bicycle",]$Vehicle_Type <- 1
clean_dataset[clean_dataset$Vehicle_Type == "Bus/Coach",]$Vehicle_Type <- 4
clean_dataset[clean_dataset$Vehicle_Type == "Car",]$Vehicle_Type <- 2
clean_dataset[clean_dataset$Vehicle_Type == "Goods Van",]$Vehicle_Type <- 4
clean_dataset[clean_dataset$Vehicle_Type == "Motorcycle",]$Vehicle_Type <- 3
clean_dataset[clean_dataset$Vehicle_Type == "Unknown",]$Vehicle_Type <- 5
clean_dataset$Vehicle_Type <- as.factor(clean_dataset$Vehicle_Type)




write.csv(clean_dataset,'clean_dataset.csv')









