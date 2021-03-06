#C�digo para ejercicio 2
#Armando Vald�s L�pez
#M�todos 2

#carga de bibliotecas
require(readxl) #para leer excel
require(ggplot2) #para hacer graficos
library(lmtest) #para la prueba durwin watson
library(psych) # para correlacion

Datos1<-read_excel(file.choose())
summary(Datos1) #estad�sticos de los datos 
head(Datos1,7) #estructura de los datos primeros 7 registros


regresion2<-lm(log(xt)~log(wt)+log(ct),Datos1) #regresi�n Cobb DOuglas
summary(regresion2) #estad�sticos de la regresion

dwtest(regresion2) #si hay autocorrelaci�n

cor(Datos1) #si hay multicolinealidad

