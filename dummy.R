Datos1<-read.csv(file.choose(),stringsAsFactors = TRUE)
regresion1<-lm(ingreso~genero+exp, Datos1)
summary(regresion1)