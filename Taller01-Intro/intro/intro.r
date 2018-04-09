## consola
6*8
2^6
## si escribimos una expresion incompleta queda esperando input: darle ESC

## arriba y abajo para scrollear por los comandos

## functiones
sqrt(2)

## los paquetes tienen funciones
## para ver la ayuda de la funcion sqrt
?sqrt
## asignamos el output de una funcion a una variable [SquareRoot2]
SqareRoot2 <- sqrt(2)
## tambien funciona
HoursYear = 365*60
## listar todos los objetos en la sesion
ls()
## definir una funcion
MyAbs <- function(x) {
    if ( x < 0 ) -x
    else x

}

MyAbs(-1)
## [1] 1
MyAbs(2)
## [1] 2
