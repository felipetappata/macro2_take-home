# UTDT - Maestría en Economía - Macroeconomía II - 2024 

## Profesor: Francisco J. Ciocchini

## Examen Domiciliario

20-22/12/2024

## 1. [35 puntos] Werning (2024)

Lea el siguiente artículo:
Werning, Iván (2024). "Recalculating Sargent and Wallace's 'Some Unpleasant Monetarist Arithmetic'," Federal Reserve Bank of Minneapolis Quarterly Review, Vol. 44, No. 3 (November), pp. 1-19.
a) Derive detalladamente, e interprete, todos los resultados del artículo (excepto los del Apéndice B).
b) Replique las figuras 1 y 2 . La demanda de dinero utilizada es $L\left(\pi_{t, t+1}\right)=\frac{\gamma_{1}}{2}-\frac{\gamma_{2}}{2}\left(1+\pi_{t, t+1}\right)$, con $\gamma_{1}=3$ y $\gamma_{2}=2.5$. La tasa de interés real es $r=0.05$. Para la Figura 2 utilice $\frac{1+\omega_{0}}{1+\Delta_{0}}=\frac{M_{-1,0}+\left(1+i_{-1,0}\right) B_{-1,0}}{M_{0,1}}=0.243$ y $D=0.336$.
2. [65 puntos] Sims, Wu, and Zhang (2023)

En este ejercicio nos vamos a concentrar en las secciones I y II del siguiente artículo:
Sims, E., Wu J., and Zhang, J. (2023). "The Four-Equation New Keynesian Model," The Review of Economics and Statistics, Vol. 105, Issue 4 (July), pp. 931-947.
a) Resuelva el problema de optimización de cada agente y obtenga todas las ecuaciones correspondientes al modelo no lineal. ${ }^{1,2}$
b) Log-linealice todas las ecuaciones del modelo. ${ }^{3}$
c) Demuestre que el sistema de ecuaciones log-lineales se puede reducir al siguiente Modelo Neokeynesiano de Cuatro Ecuaciones:

$$
\begin{equation*}
\begin{aligned}
& x_{t}=\mathbb{E}_{t} x_{t+1}-\frac{1-z}{\sigma}\left(r_{t}^{s}-\mathbb{E}_{t} \pi_{t+1}-r_{t}^{*}\right)-z\left(\bar{b}^{F I}\left(\mathbb{E}_{t} \theta_{t+1}-\theta_{t}\right)+\bar{b}^{c b}\left(\mathbb{E}_{t} q e_{t+1}-q e_{t}\right)\right) \\
& \pi_{t}=\gamma \zeta x_{t}-\frac{z \gamma \sigma}{1-z}\left(\bar{b}^{F I} \theta_{t}+\bar{b}^{c b} q e_{t}\right)+\beta \mathbb{E}_{t} \pi_{t+1} \\
& r_{t}^{s}=\rho_{r} r_{t-1}^{s}+\left(1-\rho_{r}\right)\left(\phi_{\pi} \pi_{t}+\phi_{x} x_{t}\right)+v_{t} \\
& q e_{t}=\rho_{q} q e_{t-1}+\epsilon_{q, t}
\end{aligned}
\end{equation*}
$$

con

$$
\begin{equation*}
\begin{aligned}
& r_{t}^{*}=-\frac{\left(1-\rho_{a}\right)(1+\chi) \sigma}{\sigma+(1-z) \chi} a_{t} \\
& y_{t}^{*}=\frac{(1-z)(1+\chi)}{\sigma+(1-z) \chi} a_{t} \\
& y_{t}=y_{t}^{*}+x_{t} \\
& a_{t}=\rho_{a} a_{t-1}+\epsilon_{a, t} \\
& \theta_{t}=\rho_{\theta} \theta_{t-1}+\epsilon_{\theta, t} \\
& v_{t}=\rho_{v} v_{t-1}+\epsilon_{r, t}
\end{aligned}
\end{equation*}
$$

donde $\mathbb{E}\left(\epsilon_{q, t}\right)=0, \operatorname{Var}\left(\epsilon_{q, t}\right)=s_{q}^{2}, \mathbb{E}\left(\epsilon_{a, t}\right)=0, \operatorname{Var}\left(\epsilon_{a, t}\right)=s_{a}^{2}, \mathbb{E}\left(\epsilon_{\theta, t}\right)=0, \operatorname{Var}\left(\epsilon_{\theta, t}\right)=s_{\theta}^{2}, \mathbb{E}\left(\epsilon_{r, t}\right)=0 y$ $\operatorname{Var}\left(\epsilon_{r, t}\right)=s_{r}^{2}$. Los autores suponen que $\rho_{v}=0$.

[^0]d) Describa e interprete cada una de las ecuaciones del modelo. Demuestre que la ecuación (36) del artículo se puede deducir del sistema anterior. Explique bajo qué condiciones el sistema anterior se reduce al modelo neokeynesiano estándar de tres ecuaciones. Liste cada una de las ecuaciones del modelo de tres ecuaciones.
e) Escriba las ecuaciones del modelo en forma matricial, utilizando el formato brute force de Uhlig. Escriba un código para el toolkit de Uhlig y resuelva el modelo utilizando la siguiente calibración (muy similar a la de la Tabla 1 del artículo): $\beta=0.995, z=0.33, \sigma=\chi=1, \bar{b}^{F I}=0.697, \bar{b}^{c b}=0.303, \gamma=0.0846$, $\zeta=2.4925, \rho_{r}=\rho_{a}=\rho_{\theta}=\rho_{q}=0.8, \rho_{v}=0, \phi_{\pi}=1.5, \phi_{x}=0$. Los desvíos estándar de los shocks no son relevantes porque nos vamos a concentrar en las funciones de impulso-respuesta, pero los autores utilizan los siguientes valores: $s_{r}=s_{q}=s_{\theta}=0.01$, y $s_{a}=0.0125$. Presente la solución del modelo (matrices $P$ y $Q)$. Reporte las funciones de impulso-respuesta para cada shock.
f) Escriba un código en Dynare y demuestre que obtiene la misma solución del inciso anterior.
g) Replique la Figura 1 del artículo (los tres paneles). ${ }^{4}$ Preste atención a la manera en que los autores normalizan los shocks. En el panel (a), la función de impulso-respuesta del producto está calculada para un shock de tamaño $\epsilon_{a, 0}=s_{a}=0.0125$. Comente las similitudes y diferencias entre los resultados de los dos modelos.
h) Obtenga la ecuación (39) del artículo. Replique la Figura 2.

[^1]
[^0]:    ${ }^{1}$ Puede consultar el apéndice online del artículo.
    ${ }^{2}$ Para complementar la descripción de los bonos de largo plazo, puede leer la nota adjunta Bonos.pdf.
    ${ }^{3}$ Puede consultar el apéndice online del artículo.

[^1]:    ${ }^{4}$ Note que para hacerlo tendrá que resolver también el modelo de tres ecuaciones.

