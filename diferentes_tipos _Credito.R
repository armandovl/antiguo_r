#traemos el fichero
setwd("C:/Users/valde/OneDrive/SASUniversityEdition/myfolders/Bases_de_Datos")
data_creditos<-read.csv("valoracion_creditos.csv")

#Estructura de los datos
summary(data_creditos)
str(data_creditos)
head(data_creditos,3)
tail(data_creditos,3)

#Biblioteca rpart
library(rpart)
library(rpart.plot)

#Biblioteca c50
library(C50)
library(class)

#modelo rpart
modelo_rpart<-rpart(Valoracion_credito~Edad+Ingresos+Tarjetas_credito
                    +Educacion+Creditos_coche,
                    method = "class",
                    data=data_creditos)
rpart.plot(modelo_rpart)
#importancia del modelo
library(caret) # Machine learning
dt_importance <- varImp(modelo_rpart)


library(tree)
install.packages("party")
library(party)

#modelo party

modelo_party<-ctree(Valoracion_credito~Edad+Ingresos+Tarjetas_credito
                    +Educacion+Creditos_coche, data_creditos)
plot(modelo_party)

modelo_party1<-ctree(Valoracion_credito~., data_creditos)
plot(modelo_party1)

#modelo tree
modelo_tree <- tree(Valoracion_credito~., data=data_creditos= "gini")
plot(modelo_tree)
text(modelo_tree)

#modelo C50
modelo_c50<-C5.0(data_creditos[,c(2:6)],data_creditos$Valoracion_credito)
plot(modelo_c50)
summary(modelo_c50)
