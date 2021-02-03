
library(C50)
library(class)
library(rpart)
library(rpart.plot)
require(readxl)

Datos1<-read_excel(file.choose())
summary(Datos1)
head(Datos1,7)
str(Datos1)

Datos1$Pclass= as.factor(Datos1$Pclass)
Datos1$Name= as.factor(Datos1$Name)
Datos1$Sex= as.factor(Datos1$Sex)
Datos1$Embarked= as.factor(Datos1$Embarked)
Datos1$Survived= as.factor(Datos1$Survived)

modelo_titanic1<-C5.0(Datos1[,c(1:4)],Datos1$Survived)
plot(modelo_titanic1)


arbol<-rpart(Survived ~ Pclass+Name+Sex+Embarked , method = "class", Datos1)
rpart.plot(arbol)

