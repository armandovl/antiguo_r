
require(ggplot2) #biblioteca gr�ficos

Datos1<-read.csv(file.choose(),stringsAsFactors = TRUE) #carga archivo
head(Datos1) #estructura de datos
summary(Datos1)


regresion1<-lm(Ingreso~genero+experiencia, Datos1) #modelo regresi�n
summary(regresion1) #estad�sticos del modelo

#gr�fico
ggplot(Datos1, aes(x=experiencia, y=Ingreso, color=genero, shape=genero)) +
  geom_point(size=2) + 
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)


regresion3<-lm(log(Ingreso)~genero+log(experiencia), Datos1) #modelo regresi�n
summary(regresion3) #estad�sticos del modelo