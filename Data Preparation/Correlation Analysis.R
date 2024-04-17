library(corrplot)
library(GoodmanKruskal)


#Plot correlation matrix (in numbers)
coeff<-cor(clean_dataset[,c(3,4,22,37,38,40)])
corrplot(coeff, method = "number", type="upper")
mtext("Correlation Matrix ", at=3.5, line=2, cex=2)   #at = horizontal position, line = height, cex = size


#Plot correlation matrix (in ellipse)
coeff<-cor(clean_dataset[,c(3,4,22,37,38,40)])
corrplot(coeff, method = "ellipse", type="upper")
mtext("Correlation Matrix ", at=3.5, line=2, cex=2)   #at = horizontal position, line = height, cex = size


#Find out the correlation between each variable in the entire dataset 
options(max.print = 5000) #print every rows out 
GKtauDataframe(clean_dataset) 
