#para leer excel
require(readxl)
require(ggplot2)
Datos1<-read_excel(file.choose())
summary(Datos1)
head(Datos1,7)
Datos1$Region <- as.factor(Datos1$Region)

regresion1<-lm(Gasto~Region+Salario,Datos1)
summary(regresion1)


#p <- ggplot(Datos1, aes(Salario, Gasto))
#p + geom_point()
#p + geom_point(size=2,aes(shape = factor(Region),colour = factor(Region)))

ggplot(Datos1, aes(x=Salario, y=Gasto, color=Region, shape=Region)) +
  geom_point(size=2) + 
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)

