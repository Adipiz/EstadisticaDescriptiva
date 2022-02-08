#Questions for this assignment

#1. Si hubiéramos empezado a contar segundos a partir de las 12 campanadas que marcan el inicio de 2018,
#¿a qué hora de qué día de qué año llegaríamos a los 250 millones de segundos? ¡Cuidado con los años bisiestos!
  

# 
# bisiesto 2020 y  2024, nº días = 366 
# cada año bisiesto tiene  366 días, 

numero_bisiesto <- 2*366*24*60*60


# todo  2018,2019,2021,2022,2023

numero_normal <- 5 * 365* 24 *60* 60 


# entre 2018 y 2024 hay

total18_24 <- numero_bisiesto + numero_normal


250000000/(24*60*60*365)

# 220924800 número de segundos

segundos_faltantes <- 250000000 - total18_24

# esto quiere decir que,

segundos_dia <- 24*60*60

diade2025 <- segundos_faltantes%/%segundos_dia

segundodediadesobra2025 <- segundos_faltantes%%segundos_dia 

# corresponde al día 336 del año 2025
diade2025

# minutos

segundodediadesobra2025%/%60 # 746 minutos
segundodediadesobra2025%%60  # sobran 40 segundos

746%/%60  # hora 12 del día
746%%60   # con 26 minutos


yday('2025-12-02')


# según mis cálculos es el 3 de diciembre del 2025  a las 12 con 26 minutos y 28 segundos

#---- Modo lubridate
hora <- ymd_hms('2017-12-31 23:59:48')
segundos <- seconds(250000000) 
hora_250 <- hora + segundos
hora_250




#2. Crea una función en R que resuelva una ecuación de primer grado (de la forma Ax+B=0). 
# Es decir, los parámetros deben ser los coeficientes (en orden) y la función tiene que devolver la solución. 
# Por ejemplo, si la ecuación es 2x+4=0, la función tendría que devolver -2.

funcion1 <- function(A,B,C){
     
  if(A == 0 ){
    message('A no puede tomar el valor de 0')
  } else{
    x = (C-B)/A
    x
  }
 
}

funcion1(1,4,0)

# Una vez creada la función, utilízala para resolver las siguientes ecuaciones de primer grado:
  
5*x+3=0

funcion1(5,3,0)

7*x+4 = 18

funcion1(7,4,18)

x+1 = 1

funcion1(1,1,1)

#3. Da una expresión para calcular 3e-π con R y a continuación, da el resultado obtenido redondeado a 3 cifras decimales.

exp1 <- 3 * exp(1) - pi
round(exp1,3)



#4. Da una expresión para calcular el módulo del número complejo (2+3i)^2/(5+8i) y,
#a continuación, da el resultado obtenido redondeado a 3 cifras decimales.

round(Mod((2+3i)^2/(5+8i)),3)


