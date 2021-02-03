
library(C50)
library(class)
library(rpart)
library(rpart.plot)
require(readxl)

Datos1<-read.csv(file.choose(),stringsAsFactors=TRUE)
summary(Datos1)
head(Datos1,7)
str(Datos1)




modelo_titanic1<-C5.0(Datos1[,c(1:3)],Datos1$Survived)
plot(modelo_titanic1)


arbol<-rpart(Survived ~ Pclass+Sex+Embarked , method = "class", Datos1)
rpart.plot(arbol)

