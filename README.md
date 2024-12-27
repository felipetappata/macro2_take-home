# Documentación para examen domiciliario de Macroeconomía II

Este repositorio contiene documentación adicional para el código entregado en el examen domiciliario de Macroeconomía II.
El directorio `code` de este repositorio coincide con el directorio `code` en la carpeta entregada, pero sin los subdirectorios `Uhlig Toolkit` y `Dynare`, y ciertos *paths* cambiados en los archivos para mayor compatibilidad.
En el directorio hay muchos archivos auxiliares o residuales de experimentación.
Antes que intentar reducirla a su versión minimal, y correr el riesgo de omitir sin querer alguna dependencia, se entrego la carpeta de códigos tal como estaba en el momento de llegar la hora de entregar, sin reducirla a lo mínimo necesario. 
En lo que sigue, resaltamos los archivos necesarios para resolver los ejercicios del examen, y explicamos de manera breve su funcionamiento.
Ante cualquier duda, créase un *issue* en el repositorio de GitHub o escríbase un correo al autor.

El archivo `run_all.sh` es nuevo respecto a la entrega original, pero puede facilitar el uso de los códigos.
Usando el comando `bash run_all.sh` se pueden correr todos los códigos de manera secuencial, ubicando el *output* en el directorio `output` cuando sea apropiado.


*Este repositorio se borrará en marzo de 2025.*

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

## Mapa del directorio
```bash
.
├── README.md
├── cat
└── code
    ├── swz
    │   ├── brute_force_example.m
    │   ├── figures
    │   │   ├── four_lev_qe.pdf
    │   │   ├── four_nat.pdf
    │   │   ├── four_pol.pdf
    │   │   ├── four_spreads.pdf
    │   │   ├── impulse_responses.pdf
    │   │   ├── swz_e_irf-a.png
    │   │   ├── swz_e_irf-qe.png
    │   │   ├── swz_e_irf-theta.png
    │   │   └── swz_e_irf-v.png
    │   ├── model
    │   │   ├── +model_3nk
    │   │   │   ├── +debug
    │   │   │   │   ├── dynamic_resid.m
    │   │   │   │   └── static_resid.m
    │   │   │   ├── +sparse
    │   │   │   │   ├── +block
    │   │   │   │   │   ├── dynamic_1.m
    │   │   │   │   │   ├── dynamic_2.m
    │   │   │   │   │   ├── dynamic_3.m
    │   │   │   │   │   ├── static_1.m
    │   │   │   │   │   ├── static_2.m
    │   │   │   │   │   ├── static_3.m
    │   │   │   │   │   ├── static_4.m
    │   │   │   │   │   ├── static_5.m
    │   │   │   │   │   └── static_6.m
    │   │   │   │   ├── dynamic_g1.m
    │   │   │   │   ├── dynamic_g1_tt.m
    │   │   │   │   ├── dynamic_g2.m
    │   │   │   │   ├── dynamic_g2_tt.m
    │   │   │   │   ├── dynamic_resid.m
    │   │   │   │   ├── dynamic_resid_tt.m
    │   │   │   │   ├── static_g1.m
    │   │   │   │   ├── static_g1_tt.m
    │   │   │   │   ├── static_resid.m
    │   │   │   │   └── static_resid_tt.m
    │   │   │   ├── driver.m
    │   │   │   ├── dynamic.m
    │   │   │   ├── dynamic_g1.m
    │   │   │   ├── dynamic_g1_tt.m
    │   │   │   ├── dynamic_g2.m
    │   │   │   ├── dynamic_g2_tt.m
    │   │   │   ├── dynamic_g3.m
    │   │   │   ├── dynamic_g3_tt.m
    │   │   │   ├── dynamic_params_derivs.m
    │   │   │   ├── dynamic_resid.m
    │   │   │   ├── dynamic_resid_g1.m
    │   │   │   ├── dynamic_resid_g1_g2.m
    │   │   │   ├── dynamic_resid_g1_g2_g3.m
    │   │   │   ├── dynamic_resid_tt.m
    │   │   │   ├── static.m
    │   │   │   ├── static_g1.m
    │   │   │   ├── static_g1_tt.m
    │   │   │   ├── static_g2.m
    │   │   │   ├── static_g2_tt.m
    │   │   │   ├── static_g3.m
    │   │   │   ├── static_g3_tt.m
    │   │   │   ├── static_params_derivs.m
    │   │   │   ├── static_resid.m
    │   │   │   ├── static_resid_g1.m
    │   │   │   ├── static_resid_g1_g2.m
    │   │   │   ├── static_resid_g1_g2_g3.m
    │   │   │   └── static_resid_tt.m
    │   │   ├── +model_4nk
    │   │   │   ├── +debug
    │   │   │   │   ├── dynamic_resid.m
    │   │   │   │   └── static_resid.m
    │   │   │   ├── +sparse
    │   │   │   │   ├── +block
    │   │   │   │   │   ├── dynamic_1.m
    │   │   │   │   │   ├── dynamic_2.m
    │   │   │   │   │   ├── dynamic_3.m
    │   │   │   │   │   ├── static_1.m
    │   │   │   │   │   ├── static_2.m
    │   │   │   │   │   ├── static_3.m
    │   │   │   │   │   ├── static_4.m
    │   │   │   │   │   ├── static_5.m
    │   │   │   │   │   └── static_6.m
    │   │   │   │   ├── dynamic_g1.m
    │   │   │   │   ├── dynamic_g1_tt.m
    │   │   │   │   ├── dynamic_g2.m
    │   │   │   │   ├── dynamic_g2_tt.m
    │   │   │   │   ├── dynamic_resid.m
    │   │   │   │   ├── dynamic_resid_tt.m
    │   │   │   │   ├── static_g1.m
    │   │   │   │   ├── static_g1_tt.m
    │   │   │   │   ├── static_resid.m
    │   │   │   │   └── static_resid_tt.m
    │   │   │   ├── driver.m
    │   │   │   ├── dynamic.m
    │   │   │   ├── dynamic_g1.m
    │   │   │   ├── dynamic_g1_tt.m
    │   │   │   ├── dynamic_g2.m
    │   │   │   ├── dynamic_g2_tt.m
    │   │   │   ├── dynamic_g3.m
    │   │   │   ├── dynamic_g3_tt.m
    │   │   │   ├── dynamic_params_derivs.m
    │   │   │   ├── dynamic_resid.m
    │   │   │   ├── dynamic_resid_g1.m
    │   │   │   ├── dynamic_resid_g1_g2.m
    │   │   │   ├── dynamic_resid_g1_g2_g3.m
    │   │   │   ├── dynamic_resid_tt.m
    │   │   │   ├── static.m
    │   │   │   ├── static_g1.m
    │   │   │   ├── static_g1_tt.m
    │   │   │   ├── static_g2.m
    │   │   │   ├── static_g2_tt.m
    │   │   │   ├── static_g3.m
    │   │   │   ├── static_g3_tt.m
    │   │   │   ├── static_params_derivs.m
    │   │   │   ├── static_resid.m
    │   │   │   ├── static_resid_g1.m
    │   │   │   ├── static_resid_g1_g2.m
    │   │   │   ├── static_resid_g1_g2_g3.m
    │   │   │   └── static_resid_tt.m
    │   │   ├── +model_4nk_yield
    │   │   │   ├── +debug
    │   │   │   │   ├── dynamic_resid.m
    │   │   │   │   └── static_resid.m
    │   │   │   ├── +sparse
    │   │   │   │   ├── +block
    │   │   │   │   │   ├── dynamic_1.m
    │   │   │   │   │   ├── dynamic_2.m
    │   │   │   │   │   ├── dynamic_3.m
    │   │   │   │   │   ├── dynamic_4.m
    │   │   │   │   │   ├── dynamic_5.m
    │   │   │   │   │   ├── static_1.m
    │   │   │   │   │   ├── static_2.m
    │   │   │   │   │   ├── static_3.m
    │   │   │   │   │   ├── static_4.m
    │   │   │   │   │   ├── static_5.m
    │   │   │   │   │   ├── static_6.m
    │   │   │   │   │   ├── static_7.m
    │   │   │   │   │   └── static_8.m
    │   │   │   │   ├── dynamic_g1.m
    │   │   │   │   ├── dynamic_g1_tt.m
    │   │   │   │   ├── dynamic_g2.m
    │   │   │   │   ├── dynamic_g2_tt.m
    │   │   │   │   ├── dynamic_resid.m
    │   │   │   │   ├── dynamic_resid_tt.m
    │   │   │   │   ├── static_g1.m
    │   │   │   │   ├── static_g1_tt.m
    │   │   │   │   ├── static_resid.m
    │   │   │   │   └── static_resid_tt.m
    │   │   │   ├── driver.m
    │   │   │   ├── dynamic.m
    │   │   │   ├── dynamic_g1.m
    │   │   │   ├── dynamic_g1_tt.m
    │   │   │   ├── dynamic_g2.m
    │   │   │   ├── dynamic_g2_tt.m
    │   │   │   ├── dynamic_g3.m
    │   │   │   ├── dynamic_g3_tt.m
    │   │   │   ├── dynamic_params_derivs.m
    │   │   │   ├── dynamic_resid.m
    │   │   │   ├── dynamic_resid_g1.m
    │   │   │   ├── dynamic_resid_g1_g2.m
    │   │   │   ├── dynamic_resid_g1_g2_g3.m
    │   │   │   ├── dynamic_resid_tt.m
    │   │   │   ├── static.m
    │   │   │   ├── static_g1.m
    │   │   │   ├── static_g1_tt.m
    │   │   │   ├── static_g2.m
    │   │   │   ├── static_g2_tt.m
    │   │   │   ├── static_g3.m
    │   │   │   ├── static_g3_tt.m
    │   │   │   ├── static_params_derivs.m
    │   │   │   ├── static_resid.m
    │   │   │   ├── static_resid_g1.m
    │   │   │   ├── static_resid_g1_g2.m
    │   │   │   ├── static_resid_g1_g2_g3.m
    │   │   │   └── static_resid_tt.m
    │   │   ├── +swz_f
    │   │   │   ├── +debug
    │   │   │   │   ├── dynamic_resid.m
    │   │   │   │   └── static_resid.m
    │   │   │   ├── +sparse
    │   │   │   │   ├── +block
    │   │   │   │   │   ├── dynamic_1.m
    │   │   │   │   │   ├── dynamic_2.m
    │   │   │   │   │   ├── dynamic_3.m
    │   │   │   │   │   ├── static_1.m
    │   │   │   │   │   ├── static_2.m
    │   │   │   │   │   ├── static_3.m
    │   │   │   │   │   ├── static_4.m
    │   │   │   │   │   ├── static_5.m
    │   │   │   │   │   ├── static_6.m
    │   │   │   │   │   └── static_7.m
    │   │   │   │   ├── dynamic_g1.m
    │   │   │   │   ├── dynamic_g1_tt.m
    │   │   │   │   ├── dynamic_resid.m
    │   │   │   │   ├── dynamic_resid_tt.m
    │   │   │   │   ├── static_g1.m
    │   │   │   │   ├── static_g1_tt.m
    │   │   │   │   ├── static_resid.m
    │   │   │   │   └── static_resid_tt.m
    │   │   │   ├── driver.m
    │   │   │   ├── dynamic.m
    │   │   │   ├── dynamic_g1.m
    │   │   │   ├── dynamic_g1_tt.m
    │   │   │   ├── dynamic_g2.m
    │   │   │   ├── dynamic_g2_tt.m
    │   │   │   ├── dynamic_g3.m
    │   │   │   ├── dynamic_g3_tt.m
    │   │   │   ├── dynamic_params_derivs.m
    │   │   │   ├── dynamic_resid.m
    │   │   │   ├── dynamic_resid_g1.m
    │   │   │   ├── dynamic_resid_g1_g2.m
    │   │   │   ├── dynamic_resid_g1_g2_g3.m
    │   │   │   ├── dynamic_resid_tt.m
    │   │   │   ├── static.m
    │   │   │   ├── static_g1.m
    │   │   │   ├── static_g1_tt.m
    │   │   │   ├── static_g2.m
    │   │   │   ├── static_g2_tt.m
    │   │   │   ├── static_g3.m
    │   │   │   ├── static_g3_tt.m
    │   │   │   ├── static_params_derivs.m
    │   │   │   ├── static_resid.m
    │   │   │   ├── static_resid_g1.m
    │   │   │   ├── static_resid_g1_g2.m
    │   │   │   ├── static_resid_g1_g2_g3.m
    │   │   │   └── static_resid_tt.m
    │   │   ├── four_lev_qe.eps
    │   │   ├── four_nat.eps
    │   │   ├── four_pol.eps
    │   │   ├── four_spreads.eps
    │   │   ├── irf_data.mat
    │   │   ├── model_3nk
    │   │   │   ├── Output
    │   │   │   │   └── model_3nk_results.mat
    │   │   │   ├── checksum
    │   │   │   └── model
    │   │   │       └── bytecode
    │   │   │           ├── block
    │   │   │           │   ├── dynamic.bin
    │   │   │           │   ├── dynamic.cod
    │   │   │           │   ├── static.bin
    │   │   │           │   └── static.cod
    │   │   │           ├── dynamic.bin
    │   │   │           ├── dynamic.cod
    │   │   │           ├── static.bin
    │   │   │           └── static.cod
    │   │   ├── model_3nk.mod
    │   │   ├── model_4nk
    │   │   │   ├── Output
    │   │   │   │   └── model_4nk_results.mat
    │   │   │   ├── checksum
    │   │   │   └── model
    │   │   │       └── bytecode
    │   │   │           ├── block
    │   │   │           │   ├── dynamic.bin
    │   │   │           │   ├── dynamic.cod
    │   │   │           │   ├── static.bin
    │   │   │           │   └── static.cod
    │   │   │           ├── dynamic.bin
    │   │   │           ├── dynamic.cod
    │   │   │           ├── static.bin
    │   │   │           └── static.cod
    │   │   ├── model_4nk.mod
    │   │   ├── model_4nk_f.mod
    │   │   ├── model_4nk_yield
    │   │   │   ├── Output
    │   │   │   │   └── model_4nk_yield_results.mat
    │   │   │   ├── checksum
    │   │   │   └── model
    │   │   │       └── bytecode
    │   │   │           ├── block
    │   │   │           │   ├── dynamic.bin
    │   │   │           │   ├── dynamic.cod
    │   │   │           │   ├── static.bin
    │   │   │           │   └── static.cod
    │   │   │           ├── dynamic.bin
    │   │   │           ├── dynamic.cod
    │   │   │           ├── static.bin
    │   │   │           └── static.cod
    │   │   ├── model_4nk_yield.mod
    │   │   ├── param_3nk.mat
    │   │   ├── param_4nk.mat
    │   │   ├── param_4nk_f.mat
    │   │   ├── param_4nk_yield.mat
    │   │   ├── swz_f
    │   │   │   ├── Output
    │   │   │   │   └── swz_f_results.mat
    │   │   │   ├── checksum
    │   │   │   ├── graphs
    │   │   │   │   ├── swz_f_IRF_e_a.eps
    │   │   │   │   ├── swz_f_IRF_e_q.eps
    │   │   │   │   ├── swz_f_IRF_e_r.eps
    │   │   │   │   └── swz_f_IRF_e_t.eps
    │   │   │   └── model
    │   │   │       └── bytecode
    │   │   │           ├── block
    │   │   │           │   ├── dynamic.bin
    │   │   │           │   ├── dynamic.cod
    │   │   │           │   ├── static.bin
    │   │   │           │   └── static.cod
    │   │   │           ├── dynamic.bin
    │   │   │           ├── dynamic.cod
    │   │   │           ├── static.bin
    │   │   │           └── static.cod
    │   │   ├── swz_f.log
    │   │   ├── swz_f.mod
    │   │   ├── swz_f_dynare_output.log
    │   │   └── yield_irf_data.mat
    │   ├── model_solution.mat
    │   ├── swz_brute_force.m
    │   ├── swz_e.jl
    │   ├── swz_e.m
    │   ├── swz_e_output.log
    │   ├── swz_f.m
    │   ├── swz_f_dynare_output.log
    │   ├── swz_figure1.jl
    │   ├── swz_figure1.m
    │   ├── swz_figure2.jl
    │   └── swz_figure2.m
    └── werning
        ├── 1.b.jl
        ├── Project.toml
        ├── figure1.pdf
        ├── figure1.png
        ├── figure1.svg
        ├── figure2.pdf
        ├── figure2.png
        ├── figure2.svg
        ├── gr-temp
        │   ├── 2150f0a834153453fe9cca292b703620.aux
        │   ├── 2150f0a834153453fe9cca292b703620.log
        │   ├── 27561e14a1e265b8ff47778b64b2afb2.aux
        │   ├── 27561e14a1e265b8ff47778b64b2afb2.log
        │   ├── 858c19f4662571fdd75d96baf925be44.aux
        │   ├── 858c19f4662571fdd75d96baf925be44.log
        │   ├── cd382fe8f745f1623305e0595d6e0f12.aux
        │   ├── cd382fe8f745f1623305e0595d6e0f12.log
        │   ├── gr-cache-2150f0a834153453fe9cca292b703620.png
        │   ├── gr-cache-27561e14a1e265b8ff47778b64b2afb2.png
        │   ├── gr-cache-858c19f4662571fdd75d96baf925be44.png
        │   └── gr-cache-cd382fe8f745f1623305e0595d6e0f12.png
        └── requirements.txt

44 directories, 300 files
```