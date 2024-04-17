library(factoextra)
library(NbClust)
library(dplyr)

#CHANGED VEHICLE TYPE TO NUMERIC (PREVIOUSLY CHANGED AS FACTORS IN DATA CLEANING SCRIPT)
clean_dataset$Vehicle_Type <- as.numeric(clean_dataset$Vehicle_Type)



kmeans_data <- clean_dataset %>% select(Number_of_Vehicles, Number_of_Casualties, Age_of_Driver, Vehicle_Type)


#Determine number of clusters (k) - from elbow plot
fviz_nbclust(kmeans_data, kmeans, method = "wss") +
  geom_vline(xintercept = 4, linetype = 2)


options(max.print = 5000)
# Run k-means clustering, where k=4
kmc <- kmeans(kmeans_data, 4)
kmc

#Identify which cluster each vehicle type fall into
kmeans_data <-kmeans_data %>% mutate(cluster=kmc$cluster)
plot(Number_of_Casualties ~ Number_of_Vehicles , kmeans_data, col=kmc$cluster, main="Scatter Plot for Age of driver By Vehicle Type")
str(clean_dataset$Vehicle_Type)


#Identify which cluster each vehicle type fall into
kmeans_data <-kmeans_data %>% mutate(cluster=kmc$cluster)
plot(Number_of_Casualties ~ Age_of_Driver , kmeans_data, col=kmc$cluster, main="Scatter Plot for Age of driver By Vehicle Type")
str(clean_dataset$Vehicle_Type)


#Identify which cluster each vehicle type fall into
kmeans_data <-kmeans_data %>% mutate(cluster=kmc$cluster)
plot(Age_of_Driver ~ Number_of_Vehicles , kmeans_data, col=kmc$cluster, main="Scatter Plot for Age of driver By Vehicle Type")
str(clean_dataset$Vehicle_Type)
