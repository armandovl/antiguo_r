
require(ggplot2) #biblioteca gráficos

Datos1<-read.csv(file.choose(),stringsAsFactors = TRUE) #carga archivo
head(Datos1) #estructura de datos
summary(Datos1)


regresion1<-lm(Ingreso~genero+experiencia, Datos1) #modelo regresión
summary(regresion1) #estadísticos del modelo

#gráfico
ggplot(Datos1, aes(x=experiencia, y=Ingreso, color=genero, shape=genero)) +
  geom_point(size=2) + 
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)


regresion3<-lm(log(Ingreso)~genero+log(experiencia), Datos1) #modelo regresión
summary(regresion3) #estadísticos del modelo