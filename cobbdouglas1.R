#para leer excel
require(readxl)
require(ggplot2)
library(lmtest) #para la prueba durwin watson
Datos1<-read_excel(file.choose())
summary(Datos1)
head(Datos1,7)


regresion1<-lm(produccion~capital+superficie+trabajadores,Datos1)
summary(regresion1)


regresion2<-lm(log(produccion)~log(capital)+log(superficie)+log(trabajadores),Datos1)
summary(regresion2)

dwtest(regresion2) #no hay autocorrelación


ggplot(Datos1, aes(x=Salario, y=Gasto, color=Region, shape=Region)) +
  geom_point(size=2) + 
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)

