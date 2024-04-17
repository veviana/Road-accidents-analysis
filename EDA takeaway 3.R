library(ggplot2)
library(ggridges)
library(dplyr)
library(RColorBrewer)
library(treemapify)





#Select columns needed for analysis
vehicleBySeverity <- your_dataset %>% 
  select (Accident_Index,Vehicle_Type) %>%    #Select columns needed
  group_by(Vehicle_Type) %>%
  summarise(count = n_distinct(Accident_Index))



#Pie chart to show distribution of vehicle type (better view)  
ggplot(vehicleBySeverity, aes(x="", y=count, fill=Vehicle_Type)) +
  geom_bar(stat="identity", width=1) +
  ggtitle("Pie Chart of Vehicle Type") +
  coord_polar("y", start=0) +                     #Create a pie chart and starts from the middle
  theme_void() +                                  #Empty theme 
  theme(plot.title = element_text(hjust = 0.5,vjust=-6))







ggplot(vehicleBySeverity, aes(area = count, fill = Vehicle_Type)) +
  geom_treemap()+
  scale_fill_brewer(palette = "Blues")+
  ggtitle("Proportion of Vehicle Type") +
  xlab("Vehicle Type")  +
  ylab("Count") +
  theme(plot.title = element_text(hjust = 0.5))



ggplot(vehicleBySeverity, aes(area = count, fill = Vehicle_Type)) +
  geom_treemap()
