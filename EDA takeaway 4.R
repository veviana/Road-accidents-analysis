library(dplyr)
library(ggplot2)



#Selection of data for analysis & other calculations
countByGender <- your_dataset %>% 
  select (Accident_Index, Sex_of_Driver) %>%
  group_by(Sex_of_Driver) %>%
  filter(Sex_of_Driver %in% c("F", "M")) %>%                         #Remove missing values 
  summarise(count = n(),                                             #Count the total number of females and males who are involved in accident 
            number_of_accidents = n_distinct(Accident_Index)) %>%    #Calculate the total number of accidents
  mutate(Occurrence_Percentage = 
           round((number_of_accidents/count * 100),2))
              





#Pie chart to show distribution of gender (better view)  
ggplot(countByGender, aes(x="", y=count, fill=Sex_of_Driver)) +
  geom_bar(stat="identity", width=1) +
  ggtitle("Pie Chart of Driver's Gender") +
  coord_polar("y", start=0) +                     #Create a pie chart and starts from the middle
  theme_void() +                                  #Empty theme 
  theme(plot.title = element_text(hjust = 0.5,vjust=-6))






#Plot bar graph to show comparison between gender the frequency of accidents 
ggplot(countByGender, aes(x=Sex_of_Driver, y=Occurrence_Percentage)) + 
  geom_bar(stat = "identity", width = 0.4, fill = "#0072B2") +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 100)) +
  ggtitle("Percentage of accidents By Gender") +
  xlab("Gender of Driver") +
  ylab("Occurrence Frequency") +
  theme(plot.title = element_text(hjust = 0.5)) +
  geom_text(aes(label=Occurrence_Percentage), position=position_dodge(width=0.6), vjust=-0.7,size=4) #Display values on chart 





