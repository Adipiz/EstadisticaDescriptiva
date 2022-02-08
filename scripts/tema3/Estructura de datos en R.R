
# Sesión 48: Vectores y tipos de datos en R -------------------------------

# ojo con las jerarquías a la hora de hacer un vector----

x <- c("hola", 1)

# Con scan creamos un vector a Mano----
y <- scan()

# Ahora si quiero modificar un vector a mano----
fix(x)
x
rep("27-04-1992",10)

scan()

vec<- c(16,0,1,20,1,7,88,5,1,9)
fix(vec)


# Cuidado con los decimales----

scan(dec =",")

scan(what = "character")

rep(c(1,2,3),5)




# Sesión 49: Progresiones aritméticas y secuencias ------------------------

# Creciente----
seq(5, 60, by = 2.5)

# Decreciente----
seq(100, 10, by = -10)

# Si quiero especificar los pasos entre una ditancia entre dos números----

seq(7,88, length.out = 7)

# Si no me interesa especificar un límite---

seq(10, length.out = 8, by = 4)

# secuencias con dos puntos----

(4:9)
-(4:9)

# Ejercicios----

# Primeros 20 número
 seq(1,20, by = 1)
 c(1:20)
 (1:20)

# 20 primero números pares
 
 seq(2, length.out = 20, by = 2)
 
# 30 num equidistantes entre 17 y 98, con 4 cifras significativas
 
signif(seq(17,98, length.out = 30),4)
round(seq(17,98, length.out = 30),2)

?round

x <- c(rep(pi,5), 5:10, -8)

c(x,288, 18, x)




# Sesión 50: Funciones y órden de vectores --------------------------------


# trabajando con vectores-----
x = 1:10
x
x + pi

pi*x

sqrt(x)

# uso de sapply para aplicar dicha función a un vector


sapply(x, FUN = function(elemento){sqrt(elemento)})

cd = function(x){
  summary(lm((1:4)~c(1:3,x)))$r.squared 
  }

cd(3)
cd(4)

x =  1:10
sapply(x, cd)


(1:10)^(1:10)

x
prod(x)
diff(x)
rev(x)
sort(x)
?sort
?rev

cummax(x)




# Sesión 52:  Subvectores y filtros ---------------------------------------
# Subvectores----
x <- c(6,5,3)
x[-1]    # Quita el primer elemento

x[-c(1,2)]  # más números

x[x != 5 & x>6]


which.min(x)  # posición min del vector

which(x == min(x))

# ejemplo-----


x = seq(3, 50, by = 3.5)

x[length(x)-1]

x[-3]


x[4:8]
x[8:4]

x[-seq(1,length(x),by = 2)]
x[seq(1,length(x),by = 2)]

x[length(x)-3:length(x)]

x[c(1,5,6)]

x[x > 15]

x[x > 20 & x<40]

x[x !=3 & x !=30]

x[x < 10 | x > 40]

x[x%%2 ==0] # número par

x[x%%2 == 1] # número impar

x>30

x = c(0,7,9,2,4,8,9,2,0)
# índices de una entrada-----

which(x>4)  # si quiero las posiciones


x[which(x>4)] # si me interesan los elementos del vector


x[which(x < 5 | x%%2==0)] # elementos que cumplen con esta condición

which(x%%2 == 0)

which.min(x)

which(x ==min(x)) # si hay más de un elemento

which.max(x)
which(x ==max(x))

# numeric(0) el vector no tiene valores numericos ceros
# integer(0) lo mismo para las posiciones


# Sesión 53: Los valores NA -----------------------------------------------

x = 1:10
x[3]
x[3] = 32


x[11]
x[11] = 15 # añadimos un valor inexistente en el vector

x[2:5] = x[2:5] + 6
x

# quiero los tres últimos número que sean ceros----

x[(length(x)-2):length(x)] = 0
x


x[length(x) + 5] = 9   # la posición última es 9, pero habían 11 números, entonces rellenas con NAs

sum(x, na.rm = T)

x[which(is.na(x))]

y = x

y[is.na(y)] = mean(y, na.rm =T)
y
x[!is.na(x)]

na.omit(x)  # na.omit() elimina los NAs


# Sesión 54: Factores -----------------------------------------------------


# transformar a factores usando factor() y as.factor()----

nombres = c("alonso", "julie", "juan", "alonso", "julie", "rojo")

nombres.factor = factor(nombres)


levels(nombres.factor)


gender = c("M","H", "H", "M", "M", "M", "M", "H", "H")
gender.factor = factor(gender)

gender.factor2 = as.factor(gender)

gender.factor3 = factor(gender, levels = c("H", "M", "B"))

gender.factor4 = factor(gender, levels = c("M", "H", "B"),
                        labels = c("Mujer", "Hombre", "Hermafrodita"))

levels(gender.factor4)

levels(gender.factor4) = c("Femenino", "Masculino", "Híbrido")


notas = c(1,4,3,2,3,2,4,3,1,2,3,4,2,3,4)
notas
notas.factor = factor(notas)
notas.factor

levels(notas.factor) = c("suspendido", "suficiente", "notable", "excelente")
notas.factor

notas

levels(notas.factor) = c("Suspendido","aprobado","aprobado", "aprobado")
notas.factor


# Factores ordenados----
ordered(notas, labels = c("Sus", "Suf", "Not", "Exc"))



# Sesión 55 : Listas ------------------------------------------------------

# uso de list()

x = c(1,5,-2,6,-7,8,-3,4,-9)
L = list(nombre = "temperatura", datos = x, media = mean(x), sumas = cumsum(x))
L[[2]]
L[2]
L$media

str(L) # tipo de componentes

# ejemplo de una regresión lineal 
summary(lm(c(2,3,7,9)~ c(6,9,14,22)))

reg <- lm(c(2,3,7,9)~ c(6,9,14,22))

str(reg)

reg$coefficients

names(reg)



# Sesión 56: Matrices -----------------------------------------------------

# tabla rectangular ordenadas en filas y columnas

M = matrix(1:12, nrow =4) # ordenada por columna
M

M =matrix(1:12, nrow = 4, byrow = T) # ordenada por fila
M

M = matrix(1:12, nrow =3) # ordenada por columna
M

M =matrix(1:12, nrow = 3, byrow = T) # ordenada por fila
M

M =matrix(1:12, nrow = 5, byrow = T) # Fíjate que rellena
M  

# Ejercicio matrices ----

M = matrix(0, nrow = 3, ncol = 5, byrow = T)
M

M <- matrix(1:12, ncol=4, byrow = F)
M

rbind(M, -(1:4), -(5:8)) # agregar elementos en filas

cbind(M, 1:+3)  # agregar elentos

diag(1:6)

diag(5, nrow =3)

# Cómo acceder a una sub matriz matriz[i,j]

M[1,]
M[,3]
M[c(1,3),3:4]   # buscar cosas


sum(M)

# Funciones para filas o columnas

colSums(M)
rowSums(M)
colMeans(M)
rowMeans(M)
prod(M)

apply(M, MARGIN = 1, FUN = function(x){sqrt(sum(x^2))})
apply(M, MARGIN = c(1,2), FUN = function(x){(x^2)})
apply(M, MARGIN = 2, FUN = function(x){sqrt(sum(x^2))})





# Sesión 57: Un repaso de álgebra líneal ----------------------------------


apply(M, MARGIN = 1, FUN = function(x){sqrt(sum(x^2))})
apply(M, MARGIN = c(1,2), FUN = function(x){(x^2)})
apply(M, MARGIN = 2, FUN = function(x){sqrt(sum(x^2))})

t(M)
M

t(M)%*%M

M*M

# Ejercicios matrices m
# elevar una matriz a n como una aproximación: mtx.exp(matriz,n)

A = matrix(c(2,0,2,1,2,3,0,1,3), nrow = 3, byrow = T)
B = matrix(c(3,2,1,1,0,0,1,1,1), nrow = 3, byrow = T)

A%*%B
mtx.exp(A,2)
mtx.exp(B,3)

det(t(M)%*%M)

qr(M)$rank


A.B= t(M)%*%M

qr(A.B)$rank

M = rbind(c(1,4,2),c(0,1,3),c(1,8,9))
M

qr(M)$rank

solve(M)
round(solve(M)%*%M,2)

# resolver sistemas de ecuaciones lineales
solve(M, c(1,2,3))


eigen(M)$values
