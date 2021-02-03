require(readxl)
require(lmtest)



Datos1<-read_excel(file.choose())
regresion1<-lm(por_per_re_ed~por_per_po, Datos1)
summary(regresion1)

bptest(regresion1)
#se toma el p value 
#p value>0.05 homocedasticidad
#p value<0.05 heterocedasticidad

residuos1<-residuals(regresion1)
predichos1<-fitted(regresion1)
plot(residuos1~predichos1)
plot(residuos1~Datos1$Gasto_Publico)
