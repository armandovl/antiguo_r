myurl="https://docs.google.com/spreadsheets/d/1_3FfbYFKWrUQWb8inaFe6D2uharQfAbcPXDGVmXERSY/pub?gid=0&single=true&output=csv"
tabla=read.csv(url(myurl))
attach(tabla)
names(tabla)
boxplot(Presion~Tratamiento)
aov(Presion~Tratamiento)
anovaDatos=aov(Presion~Tratamiento)
summary (anovaDatos)
TukeyHSD(anovaDatos)
