#install.packages("readxl") PARA INSTALAR PAQUETES
#LLAMAR BIBLIOTECAS
library(readxl) #para leer exceles
library(rio) #para exportar formato excel

#PONER EL DIRECTORIO DE TRABAJO (CARPETA)
setwd("C:/Users/HP/Documents/bienestar/MONEDEROS")

#LLAMAR BASES y convertirals en Data frame
base_Agosto<-read_excel("1919_AGOSTO.xls")
base_Septiembre<-read_excel("1922_SEPTIEMBRE.xls")
base_Octubre<-read_excel("1925_OCTUBRE.xls")
base_Noviembre<-read_excel("2142_NOVIEMBRE.xls")
base_Diciembre<-read_excel("1929_DICIEMBRE.xls")
base_estructura<-read_excel("estructura.xlsx")
base_google<-read.csv("TARJETASG.csv")

#uNIR BASES 
base_unido<-rbind(base_Agosto,base_Septiembre,base_Octubre,base_Noviembre,base_Diciembre)


#TRANSFORMAR A TIPO FECHa la columna fecha
base_unido$Fecha<- as.Date(base_unido$Fecha,"%d/%m/%Y")
View(base_unido)



#TRASNFORMAR EL DATAFRAME de tarjetas EN UN ARREGLO
prueba_arreglo<-c(base_google$monedero2)
print(prueba_arreglo)  

#TRANSFORMAR LAS SALIDAS DEL ARREGLO EN CARACTERES PORQUE SALIAN DOUBLES (NUMEROS REALES)
prueba_arreglo<-as.character(prueba_arreglo)


#ciclo de busqueda
for (i in 1:42) { #del 1 al 42
  contador<-i #va ir en aumento
  monedero_actual<-prueba_arreglo[contador] #recorre cad codigo del arreglo
  prueba_monedero<-base_unido[base_unido$ID2== monedero_actual ,] #filtra por cada codigo
  print(i) #imprime el numero que va recorriendo
  print(prueba_arreglo[i]) #imprime el codigo que va reccoriendo
  print(head(prueba_monedero,3)) #imprime los primeros 3 numero del codigo que encontro
  base_estructura<-rbind(base_estructura,prueba_monedero) #va añadiendo lo que va encontrando a df base_estructura
}


View(base_estructura)
View(base_unido)

#busqueda Prueba
prueba_monedero<-carga_combustible_W[carga_combustible_W$ID2== "T-15746850",]
print(prueba_monedero)

prueba_monedero<-base_unido[base_unido$ID2== "T-15746850",]
print(prueba_monedero)

prueba_monedero<-cruce[cruce$ID2== "T-15746850",]
print(prueba_monedero)

#erportar como excel
export(base_estructura,"encontrados_id.xlsx")
export(base_unido,"base_unido.xlsx")

################################################################################################
#buscarV en R


carga_combustible<-read_excel("CARGA_COMBUSTIBLE.xlsx")
carga_combustible_W<-carga_combustible[,c(2,4,5,6,10)]
print(carga_combustible_W)

#TRANSFORMAR A TIPO FECHa la columna fecha
carga_combustible_W$FECHA_DE_INICIO<- as.Date(carga_combustible_W$FECHA_DE_INICIO,"%d/%m/%Y")
carga_combustible_W$FECHA_DE_FIN<- as.Date(carga_combustible_W$FECHA_DE_FIN,"%d/%m/%Y")
str(carga_combustible_W)

cruce<-merge(x=base_unido,y=carga_combustible_W,all.y = TRUE,by="ID2")
View(carga_combustible_W)

######################limpiar
crucelimpio<-cruce[!is.na(cruce$FECHA_DE_INICIO), ]

crucelimpio<-crucelimpio[!is.na(crucelimpio$Fecha), ]





#TRANSFORMAR A TIPO FECHa la columna fecha
crucelimpio$Fecha<- as.Date(crucelimpio$Fecha,"%d/%m/%Y")
View(base_unido)



export(cruce, "cruce.xlsx")

##############################################################################################################
#cumplir condición fecha

veredicto<-list() #crear una lista limpia

for(i in 1:9866){
  contador2<-i
  f_carga<-crucelimpio$Fecha[contador2]
  f_inicio<-crucelimpio$FECHA_DE_INICIO[contador2]
  f_fin<-crucelimpio$FECHA_DE_FIN[contador2]
  #print(contador2)
  
  if(f_carga>=f_inicio & f_carga<=f_fin){
    resultado<-"verdadero"
  } else{
    resultado<-"falso"
  }
 #print(resultado)
  veredicto<-c(veredicto,resultado)
}

#asignar veredicto a la base de datos  
crucelimpio$Resultado<-veredicto


export(crucelimpio, "archivo_depurado.xlsx")

 

