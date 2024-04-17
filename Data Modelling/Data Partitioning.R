#Data Partitioning - 80% training and 20% testing 



set.seed(123) #Choose randomly and store results every single time - avoid having a different set of values in each set every time this code is run

partition <- sample(nrow(clean_dataset), 0.80 * nrow(clean_dataset))
training_set <- clean_dataset[partition,]  #Place 80% of data from your_dataset into training set
testing_set <- clean_dataset[-partition, ] #Place 20% of data from your_dataset into testing set
