
library(C50)
library(class)
library(rpart)
library(rpart.plot)

data_iris<-read.csv(file.choose(),stringsAsFactors=FALSE)

data_iris[1:15, 1:5]

arbol<-rpart(variety ~ sepal.length+sepal.width+petal.length+petal.width , method = "class", data=data_iris)

rpart.plot(arbol)

