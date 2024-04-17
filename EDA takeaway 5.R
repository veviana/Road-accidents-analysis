# EDA 5: Does weather condition and junction control affect the number of accidents (for each gender)?

library(dplyr)
library(ggpubr)
library(ggplot2)



#Replace those values in weather_condition with common meaning into the same value 
your_dataset$Weather_Conditions[your_dataset$Weather_Conditions == "Fine with strong winds"] <- "Fine"
your_dataset$Weather_Conditions[your_dataset$Weather_Conditions == "Rain with strong winds"] <- "Rain"
your_dataset$Weather_Conditions[your_dataset$Weather_Conditions == "Snow with strong winds"] <- "Snow"


#Replace missing values in Junction Control to "Not Applicable" 
your_dataset$Junction_Control <- as.character(your_dataset$Junction_Control)
your_dataset$Junction_Control<- ifelse(is.na(your_dataset$Junction_Control), 
                                       'Not Applicable', your_dataset$Junction_Control)


#Selection of data
OccurrenceByRoad <- your_dataset %>% select (Accident_Index, Weather_Conditions, Junction_Control, Sex_of_Driver) %>%
  group_by(Sex_of_Driver,Weather_Conditions,Junction_Control) %>%
  summarise(number_of_accidents = n_distinct(Accident_Index),
            count = n()) %>%
  filter(!is.na(Sex_of_Driver)) 
  



ggballoonplot(OccurrenceByRoad, x = "Weather_Conditions", y = "Junction_Control", size = "number_of_accidents",
              fill = "number_of_accidents",
              facet.by = "Sex_of_Driver",
              ggtheme = theme_bw(),
              title = "Number of accidents by Weather, Junction Control and Gender") +
  scale_fill_viridis_c(option = "C") +
  font("title", size = 16, face = "bold") + 
  theme(plot.title = element_text(hjust = 0.5)) 




