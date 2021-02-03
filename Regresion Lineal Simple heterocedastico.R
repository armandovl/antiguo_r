#install.packages('readxl') #ya se instaló
library(readxl)

#data_iris<-read.csv(file.choose(),stringsAsFactors=FALSE)
Datos<-read_excel(file.choose())
regresion<-lm(por_des_15~por_car_alim, Datos)
regresion #los coeficientes
summary(regresion)

vcov(regresion)
anova(regresion)


confint(regresion)

#heterocedasticidad
residuos=residuals(regresion)
predichos=fitted(regresion)
plot(residuos~predichos)

#solo los residuos
plot(residuos)

plot(residuos)

#install.packages('lmtest')
library(lmtest)
bptest(regresion)

#Como 2.2e-16 < 0.05 Se rechaza la Ho, por lo tanto hay evidencia de que la varianza de los residuos es heterocedatica
#################


