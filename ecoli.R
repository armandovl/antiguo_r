
library(C50)
library(class)
library(rpart)
library(rpart.plot)
require(readxl)

Datos1<-read.csv(file.choose(),stringsAsFactors=TRUE)
summary(Datos1)
head(Datos1,7)
str(Datos1)



modelo_titanic1<-C5.0(Datos1[,c(2:9)],Datos1$Tipo)
plot(modelo_titanic1)


arbol<-rpart(Tipo ~ Atr1+Atr2+Atr3+Atr4+Atr5+Atr6+Atr7,method="class",Datos1)
rpart.plot(arbol)

