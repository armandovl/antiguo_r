library(rpart)
library(rpart.plot)
tenis_titan<-read.csv(file.choose(),stringsAsFactors=TRUE)

tenis_titan$Pclass= as.factor(tenis_titan$Pclass)

arbol<-rpart(Survived ~ Pclass+Sex+Embarked , method = "class", tenis_titan)

rpart.plot(arbol)
summary(arbol)