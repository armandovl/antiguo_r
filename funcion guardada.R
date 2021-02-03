#funcion para encontrar las raices de una funcion cuadratica
nombre_funcion<-function(a,b,c){
  
  root<-(-b+sqrt(b^2-(4*a*c)))/(2*a)
  root2<-(-b-sqrt(b^2-(4*a*c)))/(2*a)
  print(root)
  print(root2)
  
}


