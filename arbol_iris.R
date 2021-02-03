#traemos el fichero

setwd("C:/Users/valde/OneDrive/SASUniversityEdition/myfolders/Base_de_Datos")
data_iris<-read.csv("iris.csv")

#Estructura de los datos
summary(data_iris)
head(data_iris,7)
str(data_iris)

#Biblioteca c50
library(C50)
library(class)

#Biblioteca rpart
library(rpart)
library(rpart.plot)

library(ggplot2) # Visualizaci?n de Datos
library(plotly) # Visualizaci?n de Datos interactivo
library(psych) # Visualizaciones de correlaci?n
library(rattle) # Gr?fico de tree
library(caret) # Machine learning

#modelo C50
modelo_c50<-C5.0(data_iris[,c(1:4)],data_iris$variety)
plot(modelo_c50)
summary(modelo_c50)

#modelo rpart
modelo_rpart<-rpart(variety ~ sepal.length+sepal.width+
               petal.length+petal.width,
               method = "class",
               data=data_iris)
rpart.plot(modelo_rpart)

#importancia del modelo
dt_importance <- varImp(modelo_rpart)
dt_importance1 <- varImp(modelo_c50)


#matriz de correlaci?n
pairs.panels(
  data_iris[,1:4], # Our data.
  scale = TRUE, # Changes size of correlation value lables based on strength.
  hist.col = 'grey85', # Histogram color.  
  bg = c("mediumseagreen","orange2","mediumpurple1")[data_iris$variety], # Colors of the Species levels.
  pch = 21, # The plot characters shape and size.
  main = 'Correlation matrix of Iris data')  # Title.

#boxplot
ggplot(
  # (1) Set data; (2) Specify X and Y variables; (3) 'fill' color separates our Species levels.
  data = data_iris, mapping = aes(x = variety, y =  sepal.width, fill = variety)) +
  geom_boxplot() +  # Specifies that we want a box plot. 
  scale_fill_brewer(palette = 'Dark2') +  # Change color of box plots. 
  theme_light() +  # Set light theme. 
  labs(title = 'Box plot of sepal width for each species', 
       x = 'Variety', y = 'Sepal Width')  # Assign a title, axis names.




