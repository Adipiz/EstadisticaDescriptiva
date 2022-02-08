
# Sesión 98: La función table ---------------------------------------------

set.seed(123)
x = sample(1:5, size = 12, replace = TRUE)
x

Respuestas = factor(sample(c('Si', 'No'), size=12, replace = TRUE))
Respuestas # este es una variable que denota un factor no ordenado, es decir, una variable cualitativa


# Utilizando la fn table podemos encontrar las frecuencias absolutas de una variable cualitativa


table(x)
table(Respuestas)

# El resultado de la función table entrega una tabla de contingencia

# si quiero fijar el número de niveles 

z = factor(x, levels =1:7)
z
table(z)

# para referirnos a cualquier nivel podemos utilizar

table(x)[3]  # por posición
table(x)["3"] # por nombre


# como es un vector podemos hacer operaciones para ellos

7*table(x)['3']




# Tablas de contingenica --------------------------------------------------


datos = factor(c('H', 'M', 'M','M', 'H', 'H','M', 'M'))
datos

table(datos)

table(datos)["M"]


# Sesión 99: Función prop.table -------------------------------------------

 # una función para obtener las frecuencias relativas

prop.table(table(x))
prop.table(table(Respuestas))

 # Calcular la tabla de frecuencias relativas a mano

length(x) # longitud del vector

table(x) # frecuencias absolutas de cada nivel

table(x)/length(x) # frecuencias relativas

prop.table(table(x)) == table(x)/length(x)


 # Utilizando la función which() podemos saber qué nivel tiene determinadas frecuencias

table(x)

names(which((table(x) == 0)))
 
names(which(table(x) == max(table(x))))
max(table(x))


 # Ejercicio

 x = rep("H", 6)
 y = rep("M", 14)
  z = c(x,y)

 table(z)
 prop.table(table(z))
 names(which(table(z) == max(table(z))))
 

# Sesión 100: Tablas de frecuencias bidimensionales -----------------------

 
 # table puede ser utilizado para construir tabla de frecuencias conjuntas
 
 
 Sexo = sample(c("M","H"), size = length(Respuestas), replace = T)
 Respuestas
 table(Respuestas, Sexo)
 
 t(table(Sexo, Respuestas))
 
 
 # Manejo de elementos
 
 table(Respuestas, Sexo)["No", "M"] # por niveles
 table(Respuestas, Sexo)[1, 2] # por posición
 
 
 # Para una tabla de frecuecnias bidimensionales tener cuidado que puedes calcular
 # dos tipos de frecuencias relativas, la Frecuencia relativa global y la frecuencia
 # relativa marginal.
 
 
 # Frecuencia relativa global: considera el total de la muestra, es decir para cada par
 # de niveles, uno de cada variable, la fracción de individuos que pertenecen a ambos niveles
 # respecto del total de la muestra
 
prop.table(table(Sexo, Respuestas))
 
 
 
 # Frecuencia relativca marginal: dentro de cada nivel de una variable y para cada nivel de 
 # de la otra, la fracción de individuos que pertenevcen al segundo nivel respecto 
 # del total de la subpoblación definida por el primer nivel.
 
 
 
prop.table(table(Sexo, Respuestas), margin = 1) # por sexo
 
prop.table(table(Sexo, Respuestas), margin = 2) # por Respuesta


# Sesión 101: La función CrossTable ---------------------------------------

  # Usando el paquete gmodels usando la función Crosstable()
  # una función para conocer tablas de frecuencias

sex = factor(c("H","M","M","M","H","H","M","M"))
ans = factor(c("S","N","S","S","S","N","N","S"))

CrossTable(sex,ans, prop.chisq = F)


# Sumas por filas y columnas

tt <- table(sex,ans)
tt  # Frecuencias absolutas


prop.table(tt) # frecuencia relatiuva todoal

prop.table(tt, margin = 1) # frecuencia relativa por sexo

prop.table(tt, margin = 2) # frecuencia relativa por ans
 

colSums(tt)
rowSums(tt)
colSums(prop.table(tt))
rowSums(prop.table(tt))

apply(tt, FUN= sum, MARGIN =1) 
apply(tt, FUN= sqrt, MARGIN =c(1,2)) 

 

# Sesión 105: Tablas a partir de data frames a partir de V.C. -------------

Beb_Energ <- read.table("Curso de R basic/data/EnergyDrink", header = TRUE)
getwd()
str(Beb_Energ) 

Beb_Energ$estudio = as.factor(Beb_Energ$estudio)
Beb_Energ$bebe = as.factor(Beb_Energ$bebe)
Beb_Energ$sexo = as.factor(Beb_Energ$sexo)

str(Beb_Energ) 

head(Beb_Energ)

# summary a variables cualitativas
summary(Beb_Energ)


apply(Beb_Energ, MARGIN = 2, FUN =table) # tabla de preferencias absolutas


apply(Beb_Energ, MARGIN = 2, FUN =table)$sexo


table(Beb_Energ$sex)


table(Beb_Energ)

# sólo analizar un par de variables


table(Beb_Energ[, c(1,3)])



# formato plano


ftable(Beb_Energ)


vcdExtra::mosaic3d(HairEyeColor, type = "expected",
                   box = TRUE, col = c("lightblue", "pink"))

