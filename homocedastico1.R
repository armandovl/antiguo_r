require(readxl) #para leer excel
require(lmtest) #para varios indicadores


setwd("C:/Users/valde/OneDrive/2.-Ejercicios en R/Bases de Datos/")
Datos1<-read_excel("GPA_Y_CRECIMIENTO_bueno.xlsx")
regresion1<-lm(Tasa_Crecimiento~Gasto_Publico, Datos1)
summary(regresion1)



bptest(regresion1)
#se toma el p value 
#p value>0.05 homocedasticidad
#p value<0.05 heterocedasticidad



residuos1<-residuals(regresion1)
predichos1<-fitted(regresion1)
plot(residuos1~predichos1)


