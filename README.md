# Documentación para examen domiciliario de Macroeconomía II

Este repositorio contiene documentación adicional para el código entregado en el examen domiciliario de Macroeconomía II.
El directorio `code` de este repositorio coincide con el directorio `code` en la carpeta entregada.
En el directorio hay muchos archivos auxiliares o residuales de experimentación.
Antes que intentar reducirla a su versión minimal, y correr el riesgo de omitir sin querer alguna dependencia, se entrego la carpeta de códigos tal como estaba en el momento de llegar la hora de entregar, sin reducirla a lo mínimo necesario. 
En lo que sigue, resaltamos los archivos necesarios para resolver los ejercicios del examen, y explicamos de manera breve su funcionamiento.
Ante cualquier duda, créase un *issue* en el repositorio de GitHub o escríbase un correo al autor.

## 1. *Some Unpleasant Monetarist Arithmetic*
### Inciso (b)
El inciso (b) exige replicar las figuras 1 y 2 de Werning (2024).
El archivo `code/werning/1.b.jl` contiene el código necesario para replicar las figuras.
Se debe correr usando Julia, que se puede instalar siguiendo las instrucciones en [https://julialang.org/downloads/](https://julialang.org/downloads/).
Hay un archivo llamado `Project.toml` en el mismo directorio que contiene las dependencias necesarias para correr el código.
Por default, el programa guarda las figuras en PNG y PDF en el directorio donde se ejecuta, pero obviamente esto se puede cambiar.

## 2. *The Four-Equation New Keynesian Model*
### Inciso (e)
El inciso (e) pide transformar el modelo del *paper* en el formato requerido para el método *brute-force* de Uhlig, y en el texto se encuentra la conexión entre el sistema de ecuaciones y las matrices.
El archivo `code/swz/swz_e.m` define el modelo y corre el `do_it` de Uhlig, luego grafica las funciones impulso-respuesta para los shocks.
El archivo genera un output que no es usado; era la intención replicar las IRF usando Julia, pero no se logró.

### Inciso (f)
El código correspondiente para estimar el modelo usando *Dynare* consiste en el modelo, que es definido en `code/swz/model/swz_f.mod`, y el script de MATLAB que lo corre: `code/swz/swz_f.m`.

### Inciso (g)
El código para los incisos (g) y (h) es básicamente idéntico al de los autores, al menos la parte que utiliza *Dynare*, con la diferencia de que en lugar de graficar usando MATLAB exportamos los datos y graficamos en Julia.
El archivo `code/swz/swz_figure1.m` parte de la base del código de los autores (`execute_base_model.m`), actualizando el *syntax* para acceder algunas variables de acuerdo con las nuevas versiones de *Dynare* y exportando los datos a un archivo `.mat` para ser leídos por `code/swz/swz_figure1.jl`, que grafica las funciones impulso-respuesta, de manera esencialmente equivalente a los gráficos escritos en MATLAB originalmente.
El script de MATLAB toma como input el modelo escrito por los autores `code/swz/model/model_3nk.mod` y `code/swz/model/model_4nk.mod`.

### Inciso (h)
El archivo `code/swz/swz_figure2.m` parte del código de los autores `execute_base_model_yield.m`, actualizando de nuevo el *syntax* y exportando los datos a un archivo `.mat` para ser leídos por `code/swz/swz_figure2.jl`, que realiza una versión traducida a Julia del gráfico original en MATLAB.
El script de MATLAB toma como input el modelo escrito por los autores `code/swz/model/model_4nk_yield.mod`.
