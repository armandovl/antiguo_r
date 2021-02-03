
library(C50)
library(class)
library(rpart)
library(rpart.plot)

titanic_data<-read.csv(file.choose(),stringsAsFactors=TRUE)

titanic_data[1:15, 1:3]

arbol<-rpart(Survived~Clase+Sex+Embarked, method = "class", data=titanic_data)

rpart.plot(arbol)



modelo_titanic<-C5.0(titanic_data[,c(1:2)],titanic_data$Survived)
class(titanic_data$Clase)
plot(modelo_titanic)
summary(modelo_titanic)