library(tidyverse)
library(h2o)
library(plotly)

# set directory
setwd("C:/Users/user/OneDrive - Moe, Inc/Desktop/datasets/creditcardfruad")



# read the datset

df=read.csv("creditcard.csv")


glimpse(df)
skimr::skim(df)
dim(df)  # 284807 observations and 31 variables 

# class 0 is no fraud and 1 is fraud 

# data is scaled 

# let create  graph and see the fraud and non fraud ratio 
ggplot(df,aes(x=Class))+geom_bar(fill=c("blue","red"))
plot_ly(data=df,x=~Class)



table(df$Class)
prop.table(table(df$Class))

# prop.table(table(df$Class))
# 
# 0           1 
# 0.998272514 0.001727486 

# 99% is no fruad and 0017% is fraud 

df %>% 
  filter(Class==1)
