

library(tidyverse)


cr=read.csv(choose.files())
# download the dataset https://www.kaggle.com/mlg-ulb/creditcardfraud

#let check structure
str(cr)

cr$Time
cr$Class
cr$time_of_day <- cr$Time %%(24*3600)
cr$Class <- factor(ifelse(cr$Class == 0, "zero", "one"))
# check na in variable
sapply(cr, function(x) sum(is.na(x)))


# convert to hours, then reduce mod 24
ggplot(data =cr,mapping=aes(x=Time,y=V1,col=Class==1))+geom_point()

ggplot(cr,aes(x=time_of_day,col=Class))+geom_density()

# detect time of day 
ggplot(cr, aes(x = time_of_day, fill = Class)) +
  geom_density(alpha = 0.5) + 
  labs(title = "Time of Day", 
       x = "Time of Day", 
       y = "Density", 
       col = "Class") +
  scale_fill_discrete(labels = c("Fraud", "Not Fraud"))

# Detect amount of the day

ggplot(cr, aes(x = Amount, fill = Class)) +
  geom_density(alpha = 0.5) + 
  labs(title = "Time of Day", 
       x = "Time of Day", 
       y = "Density", 
       col = "Class") +
  scale_fill_discrete(labels = c("Fraud", "Not Fraud"))


cr$logamount<-log(cr$Amount+1)


# Detect amount of the day

ggplot(cr, aes(x=logamount, fill = Class)) +
  geom_density(alpha = 0.5) + 
  labs(title = "amount", 
       x = "amount", 
       y = "Density", 
       col = "Class") +
  scale_fill_discrete(labels = c("Fraud", "Not Fraud"))+ 
