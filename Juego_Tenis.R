
library(C50)
library(class)

tenis_data<-read.csv(file.choose(),stringsAsFactors=TRUE)
modelo_tenis<-C5.0(tenis_data[,c(2:5)],tenis_data$Juega_Tenis)
plot(modelo_tenis)
summary(modelo_tenis)