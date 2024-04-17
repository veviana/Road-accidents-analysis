library(dplyr)
library(ggplot2)


#Select columns needed for analysis
accidentByRoadCondition <-  your_dataset %>% 
  select(Accident_Index, Road_Surface_Conditions, Accident_Severity)


#Use group_by to find the total number of accidents by road surface condition and accident severity 
accidentByRoadCondition_group <- accidentByRoadCondition %>% 
  group_by(Road_Surface_Conditions,Accident_Severity) %>%     
  filter(Road_Surface_Conditions %in% c("Dry", "Wet")) %>%    #Only want to gain insights for road surface conditions that are dry / wet
  summarise(count = n(),
            number_of_accidents = n_distinct(Accident_Index)) %>%
  mutate(Occurrence_Percentage = round((number_of_accidents/count * 100),2))

      



#Plot Grouped Bar Chart: Find out whether the dry or wet road conditions affects the number of accidents and accident severity 
ggplot(data=accidentByRoadCondition_group, aes(x=Road_Surface_Conditions, y=Occurrence_Percentage, fill=Accident_Severity)) +
  geom_bar(stat="identity", position = position_dodge(width = 0.6),width = 0.4) + #gap between each bars (same road condition) and gap between each surface condition (dry and wet)
  ggtitle("Number of accident by Road Condition and Severity") +               
  xlab("Road Surface Condition") +
  ylab("Number of accidents")  +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 80)) +
  geom_text(aes(label=Occurrence_Percentage), position=position_dodge(width=0.6), vjust=-0.7,size=4)+    #Display the values (easier visualisation)
  scale_fill_manual(values=c("#56B4E9", "#0072B2")) +
  labs(fill = "Accident Severity") +
  theme(plot.title = element_text(hjust = 0.5)) #Centralised the title 
