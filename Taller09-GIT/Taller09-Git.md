Taller9-Git
========================================================
author: 
date: 
autosize: true

¿Qué es Git?
========================================================

Sirve para tener respaldos de archivos de texto:
- Código
- Datos en texto plano (.csv, .txt)

Github
========================================================

Github es un sitio Web que permite publicar código desde Git.

La mayor parte de los proyectos opensource están disponibles en Github:
- Dplyr -> [https://github.com/tidyverse/dplyr ]
- Rstudio -> [ https://github.com/rstudio/rstudio ]
- Linux -> [ https://github.com/torvalds/linux ]


Flujo de trabajo
======================================================
- Es importante pensar en términos de "cambios" a los archivos
- También es importante ser disciplinado
- Cuando las cosas se complican es cuando git más sirve, pero es más probable que perdamos la disciplina (proyectos grandes, problemas difíciles)

Ventajas
======================================================
- Es un undo infinito (si lo usamos bien)
- Permite que todos trabajemos sobre el mismo conjunto de archivos
- Permite tener varias copias del código (puedo experimentar y aprender sobre el problema que estoy tratando de resolver, tirar todo, y después crear una solución)



Kit de supervivencia
========================================================
- Iniciar un repositorio
- Agregar y commitear
- Recuperar versiones anteriores


A tener en cuenta
=========================================================
- Working directory (es el estado actual de los archivos en el disco duro)
- Staging area (limbo donde pongo todos los cambios antes de commitearlos)
- Commit (sustantivo) (un conjunto de cambios)
- Commit (verbo) (guardar un conjunto de cambios en la historia del repo)
- Los comandos tienen opciones que modifican (sustancialmente) lo que hacen


Tengo un archivo
====================================================
main.R


Iniciar un nuevo repo
===========================================================
```
$ git init # crea el repo
```


Agregar cambios al staging area
===========================================================
```
$ git add main.R # Agrega (los cambios en) main al "staging area"
```



Commitear todo lo stageado
===========================================================
```
$ git commit -m "Commit inicial" # commiteo todo los cambios que hay en la staging area
```


Flujo de Trabajo
=========================================================
Hacemos algunos cambios
```
# Un script para calcular exportaciones por sector
library(tibble)

sectores <- tibble(ciiu = c("0111", "0110", "0112"),
                   giro = c("arroz", "soja", "carne"))

expors <- tibble(empresa = c("ZZZ", "YYY", "XXX", "WWW", "NNN"),
                 expors = c(10000, 9000,    8000, 3000, 1000 ))
```

Flujo de Trabajo (2)
=========================================================
Para ver las diferencias entre working y el último commit
```
$ git diff
```

Me gustan los cambios
========================================================

- Git status me da un resúmen de estos cambios
- Agregarlos al staging area

```
$ git add main.R
```
- Ahora git status cambia: 
  -- tengo cambios stageados listos para ser commiteados

Commitearlos
========================================================
```
$ git commit -m "Agrega data frames"
```
Ahora git status dice que no hay cambios

Otro cambio
======================================================
Agrego la empresa "RRR" que exporta 5000

Escenarios:
- Hago el cambio y lo deshago
- Hago el cambio, lo stageo y lo deshago
- Hago el cambio, lo comiteo y lo deshago

Hago el cambio
=====================================================
...


Primer escenario
=========================================================
Lo quiero deshacer sin haber hecho nada más que cambiar el working dir

Git status
=======================================================
Interpretar

Git diff
=========================================================

Interpretar

Deshacer cambio
=======================================================
```
git checkout main.R
```
Saca la última versión comiteada de un archivo

git status y git diff estan "limpios"

Caso b
=====================================================
Hago el cambio y lo stageo
```
$ git add main.R
```
Git diff ya no da nada!
Tengo cambios para ser commiteados

```
$ git reset HEAD main.R # des-stagear cambios
$ git checkout main.R  # ahora estoy igual que en el anterior
```

Caso c
==========================================================
Hago el cambio, lo stageo y lo commiteo

Memoria?


Deshacer cambios commiteados con revert
=========================================================
Sirve para dejar los logs de haber deshecho el commit
```
$ git revert HEAD

```

Deshacer cambios commiteados con reset
=========================================================

```
$ git reset --hard HEAD^1
```

Repositorios remotos con Github
========================================================
Descargamos las diapos desde github
```
$ git clone https://github.com/rlabuonora/taller_R.git
```

Hago un cambio y lo subo
=====================================================

Hago el cambio
```
$ git add README.md
$ git commit -m "Cambio en README"

```
Y lo mando (me pide credenciales github y tengo que tener permiso del admin del repo)
```
$ git push origin master
```
