library(e1071) #To be used for skewness function



y <- your_dataset$Speed_Limit

skewness(y)




s <- your_dataset$Age_of_Vehicle
skewness(s)
distribution <-hist(s, breaks=10, col="darkslategray3", xlab="Engine Capacity", ylim = c(0,1200))
xfit<-seq(min(s),max(s),length=40)
yfit<-dnorm(xfit,mean=mean(s),sd=sd(s))
yfit <- yfit*diff(distribution$mids[1:2])*length(s)
lines(xfit, yfit, col="dark blue", lwd=2)
s <- log10(s)





s <- your_dataset$Speed_Limit
distribution <-hist(s, breaks=10, col="darkslategray3", xlab="Engine Capacity", ylim = c(0,1200))

xfit<-seq(min(s),max(s),length=40)
yfit<-dnorm(xfit,mean=mean(s),sd=sd(s))
yfit <- yfit*diff(distribution$mids[1:2])*length(s)
lines(xfit, yfit, col="dark blue", lwd=2)
s <- log10(s)




s <- your_dataset$Number_of_Vehicles
distribution <-hist(s, breaks=10, col="darkslategray3", xlab="Engine Capacity", ylim = c(0,1200))

xfit<-seq(min(s),max(s),length=40)
yfit<-dnorm(xfit,mean=mean(s),sd=sd(s))
yfit <- yfit*diff(distribution$mids[1:2])*length(s)
lines(xfit, yfit, col="dark blue", lwd=2)
s <- log10(s)



s <- your_dataset$Number_of_Casualties
distribution <-hist(s, breaks=10, col="darkslategray3", xlab="Engine Capacity", ylim = c(0,1200))

xfit<-seq(min(s),max(s),length=40)
yfit<-dnorm(xfit,mean=mean(s),sd=sd(s))
yfit <- yfit*diff(distribution$mids[1:2])*length(s)
lines(xfit, yfit, col="dark blue", lwd=2)
s <- log10(s)





s <- your_dataset$Engine_Capacity_CC
distribution <-hist(s, breaks=10, col="darkslategray3", xlab="Engine Capacity", ylim = c(0,1200))

xfit<-seq(min(s),max(s),length=40)
yfit<-dnorm(xfit,mean=mean(s),sd=sd(s))
yfit <- yfit*diff(distribution$mids[1:2])*length(s)
lines(xfit, yfit, col="dark blue", lwd=2)
s <- log10(s)






s <- your_dataset$Age_of_Casualty
distribution <-hist(s, breaks=10, col="darkslategray3", xlab="Engine Capacity", ylim = c(0,1200))

xfit<-seq(min(s),max(s),length=40)
yfit<-dnorm(xfit,mean=mean(s),sd=sd(s))
yfit <- yfit*diff(distribution$mids[1:2])*length(s)
lines(xfit, yfit, col="dark blue", lwd=2)
s <- log10(s)







s <- your_dataset$Age_of_Driver
distribution <-hist(s, breaks=10, col="darkslategray3", xlab="Engine Capacity", ylim = c(0,1200))

xfit<-seq(min(s),max(s),length=40)
yfit<-dnorm(xfit,mean=mean(s),sd=sd(s))
yfit <- yfit*diff(distribution$mids[1:2])*length(s)
lines(xfit, yfit, col="dark blue", lwd=2)
s <- log10(s)







































