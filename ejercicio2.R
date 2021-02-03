#Código para ejercicio 2
#Armando Valdés López
#Métodos 2

#carga de bibliotecas
require(readxl) #para leer excel
require(ggplot2) #para hacer graficos
library(lmtest) #para la prueba durwin watson
library(psych) # para correlacion

Datos1<-read_excel(file.choose())
summary(Datos1) #estadísticos de los datos 
head(Datos1,7) #estructura de los datos primeros 7 registros


regresion2<-lm(log(xt)~log(wt)+log(ct),Datos1) #regresión Cobb DOuglas
summary(regresion2) #estadísticos de la regresion

dwtest(regresion2) #si hay autocorrelación

cor(Datos1) #si hay multicolinealidad

