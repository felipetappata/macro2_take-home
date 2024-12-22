# A Toolkit for Analyzing Nonlinear Dynamic Stochastic Models Easily 

Harald Uhlig*

CentER, University of Tilburg, and CEPR


#### Abstract

Often, researchers wish to analyze nonlinear dynamic discrete-time stochastic models. This paper provides a toolkit for solving such models easily, building on log-linearizing the necessary equations characterizing the equilibrium and solving for the recursive equilibrium law of motion with the method of undetermined coefficients. This paper contains nothing substantially new. Instead, the paper simplifies and unifies existing approaches to make them accessible for a wide audience, showing how to log-linearizing the nonlinear equations without the need for explicit differentiation, how to use the method of undetermined coefficients for models with a vector of endogenous state variables, to provide a general solution by characterizing the solution with a matrix quadratic equation and solving it, and to provide frequency-domain techniques to calculate the second order properties of the model in its HP-filtered version without resorting to simulations. Since the method is an Euler-equation based approach rather than an approach based on solving a social planners problem, models with externalities or distortionary taxation do not pose additional problems. MATLAB programs to carry out the calculations in this paper are made available. This paper should be useful for researchers and Ph.D. students alike.


Corresponding address:
CentER for Economic Research, Tilburg University,
Postbus 90153, 5000 LE Tilburg, The Netherlands, e-mail: uhlig@kub.nl

[^0]
## 1 Introduction

Often, researchers wish to analyze nonlinear dynamic discrete-time stochastic models. This paper provides a toolkit for solving such models easily, building on log-linearizing the necessary equations characterizing the equilibrium and solving for the recursive equilibrium law of motion with the method of undetermined coefficients ${ }^{1}$

This paper contains nothing substantially new. Instead, the point of this paper is to simplify and unify existing methods in order to make them accessible to a large audience of researchers, who may have always been interested in analyzing, say, real business cycle models on their own, but hesitated to make the step of learning the numerical tools involved. This paper reduces the pain from taking that step. The methods here can be used to analyze most of the models studied in the literature. We discuss how to log-linearizing the nonlinear equations without the need for explicit differentiation and how to use the method of undetermined coefficients for models with a vector of endogenous state variables. The methods explained here follow directly from McCallum (1983), King, Plosser and Rebelo (1987) and Campbell (1994), among others ${ }^{2}$. We provide a general solution built on solving matrix-quadratic equations, see also Binder and Pesaran (1996), and provide frequency-domain techniques, building on results in King and Rebelo (1993), to calculate the second-order moments of the model in its HP-filtered version without resorting to simulations. Since the method is an Euler-equation based approach rather than an approach based on solving a social planners problem, solving models with externalities or distortionary taxation does not pose additional problems. Since the (nonlinear) Euler equations usually need to be calculated in any case in order to find the steady state, applying the method described in this paper requires little in terms of additional manipulations by hand, given some preprogrammed routines to carry out the matrix calculations of section 5. MATLAB programs to carry out these calculations, given the log-linearized system, are available at my home page ${ }^{3}$. The method in this paper therefore allows to solve nonlinear dynamic stochastic models easily.

Numerical solution methods for solving nonlinear stochastic dynamic models have been studied extensively in the literature, see in particular Kydland and Prescott (1982),

[^1]the comparison by Taylor and Uhlig (1990) and the methods proposed by various authors in the same issue, Judd (1991), Hansen and Prescott (1995) and Danthine and Donaldson (1995). The literature on solving linear-quadratic dynamic stochastic models or linear stochastic difference equations is even larger. The key paper here is Blanchard and Kahn (1980). Furthermore, there are the textbook treatment in Sargent (1987), Chapters IX and XI, as well as, say, Muth (1961), McGrattan (1994) or Hansen, McGrattan and Sargent (1994), to name a random few. Subject to applicability, all the methods relying on a log-linear approximation to the steady state have in common that they will find the same recursive equilibrium law of motion as the method described in this paper, since the linear space approximating a nonlinear differentiable function is unique and "immune" to differentiable transformations of the parameter space. But while McGrattan (1994) and Hansen, McGrattan and Sargent (1994) focus on solving models via maximizing a quadratic objective function, and while Blanchard and Kahn (1980) solve linear systems by searching for the stable manifold in the entire system of necessary equations describing the equilibrium relationships, this paper by contrast solves directly for the desired recursive equilibrium law of motion. This approach is very natural. The stability condition is imposed at the point, where a certain matrix quadratic equation is solved. It is shown how this matrix quadratic equation can be reduced to a standard eigenvalue problem of another matrix with twice as many dimensions.

Three related contributions are McCallum (1983), which is the key reference for the method of undetermined coefficients, Ceria and Rios-Rull (1992) and Binder and Pesaran (1996). These contributions also derive the recursive equilibrium law of motion. McCallum (1983) reduces the coefficient-finding problem to a problem solvable with the methods in Blanchard and Kahn (1980), whereas Ceria and Rios-Rull (1992) reduce the problem to one of solving a matrix-quadratic equation as do we, but do not reduce the matrix-quadratic equation problem to a standard eigenvalue problem. Binder and Pesaran (1996) finally may be most closely related in that they reduce the matrix quadratic equation characterizing the solution to an eigenvalue problem as we do. These three contributions, however, for most parts do not distinguish between endogenous variables which have to be part of the state vector, and other endogenous variables. Thus applying these models in somewhat larger system can either result in unnecessary large and computationally demanding eigenvalue problems in which "bubble solutions" have to be removed in a painstaking fashion, or one is always forced to reduce the system beforehand to make it fit their description ${ }^{4}$.

But all these technical differences to the existing literature are not in any way

[^2]essential. It shall be stressed again that the main purpose and merit of this paper is to make solving nonlinear dynamic stochastic models easy. In fact, this paper describes the entire method as a "cookbook recipe", which should be of great practical use to Ph.D. students and researchers alike. Since the focus here is entirely on the computational aspect of studying these models, some issues are left aside entirely. In particular, the issue of existence or multiplicity of equilibria as well as the reasons for concentrating on stable solutions is not discussed. The methods in this paper should therefore not be applied blindly, but only in light of, say, McCallum (1983), Stokey, Lucas with Prescott (1989) and the related literature.

The outline of the paper will be evident from the description of the general procedure in the next section.

## 2 The general procedure

The general procedure to solve and analyze nonlinear dynamic stochastic models takes the following steps.

1. Find the necessary equations characterizing the equilibrium, i.e. constraints, first-order conditions, etc., see section 4.
2. Pick parameters and find the steady state(s), see section 4.
3. Log-linearize the necessary equations characterizing the equilibrium of the system to make the equations approximately linear in the log-deviations from the steady state, see section 3 and section 4.
4. Solve for the recursive equilibrium law of motion via the method of undetermined coefficients, employing the formulas of section 5.
5. Analyze the solution via impulse-response analysis and second-order-properties, possibly taking account of, say, the Hodrick-Prescott-Filter. This can be done without having to simulate the model, see section 6 .

The next section skips directly to step 3 of the procedure outlined above and describes how to log-linearize nonlinear equations without explicit differentiation. Section 4 studies Hansens 1985) benchmark real business cycle model as a prototype example, in which calculating the Euler equations, the steady state and the loglinearization is carried out to see how this method works. Once, a linearized system has been obtained, the methods in section 5 provide the desired recursive equilibrium law of motion.

## 3 Log-linearization

Log-linearizing the necessary equations characterizing the equilibrium is a well-known technique. In the context of real business cycle models, log-linearization has been proposed in particular by King, Plosser and Rebelo (1987) and Campbell (1994). Log-linearization also appears frequently in text books, see e.g. Obstfeld and Rogoff, p. 503-505. Nonetheless, the technique often seems to create more headaches than it should. It thus is useful for the purpose of this paper to review how it is done. The next two sections simplify the approach of Campbell (1994). Readers who are familiar enough with log-linearization are advised to skip directly to section 5.

The principle is to use a Taylor approximation around the steady state to replace all equations by approximations, which are linear functions in the log-deviations of the variables.

Formally, let $X_{t}$ be the vector of variables, $\bar{X}$ their steady state and

$$
\begin{equation*}
x_{t}=\log X_{t}-\log \bar{X}
\end{equation*}
$$

the vector of log-deviations. The vector $100 \cdot x_{t}$ tells us, by how much the variables differ from their steady state levels in period $t$ in per cent. The necessary equations characterizing the equilibrium can be written as
$$
\begin{align*}
1 & =f\left(x_{t}, x_{t-1}\right)  \tag{3.1}\\
1 & =E_{t}\left[g\left(x_{t+1}, x_{t}\right)\right] \tag{3.2}
\end{align*}
$$
where $f(0,0)=1$ and $g(0,0)=1$, i.e. the left-hand side of (3.1) and (3.2). Taking first-order approximations around $\left(x_{t}, x_{t-1}\right)=(0,0)$ yields ${ }^{5}$

$$
\begin{equation*}
\begin{aligned}
0 & \approx f_{1} \cdot x_{t}+f_{2} \cdot x_{t-1} \\
0 & \approx E_{t}\left[g_{1} \cdot x_{t+1}+g_{2} \cdot x_{t}\right]
\end{aligned}
\end{equation*}
$$

${ }^{5}$ An alternative to approximate (3.2) rewrites it as

$$
\begin{equation*}
0=\log \left(E_{t}\left[\exp \left(\tilde{g}\left(x_{t+1}, x_{t}\right)\right)\right]\right)
\end{equation*}
$$

where $\tilde{g}=\log g$. Assuming $x_{t}$ and $x_{t+1}$ to be (approximately) conditionally jointly normally distributed with an (approximately) constant conditional variance-covariance matrix, and assuming that

$$
\begin{equation*}
\log g(0,0) \approx \frac{1}{2} \operatorname{Var}_{t}\left[\tilde{g}_{1} \cdot x_{t+1}+\tilde{g}_{2} \cdot x_{t}\right] \tag{3.3}
\end{equation*}
$$

independent of $t$ (rather than $\log g(0,0)=0$ ) yields

$$
\begin{equation*}
\begin{aligned}
0 & \approx \log E_{t}\left[\exp \left(\tilde{g}(0,0)+\tilde{g}_{1} \cdot x_{t+1}+\tilde{g}_{2} \cdot x_{t}\right)\right] \\
& \approx E_{t}\left[\tilde{g}_{1} \cdot x_{t+1}+\tilde{g}_{2} \cdot x_{t}\right]
\end{aligned}
\end{equation*}
$$

using $E\left[e^{X}\right]=e^{E[X]+\operatorname{Var}[X] / 2}$ for normally distributed variables. The two ways of approximating (3.2) differ essentially only in their choice for $g(0,0)$, since $g_{1}=\tilde{g}_{1}$, if $g(0,0)=1$.

One obtains a linear system in $x_{t}$ and $x_{t-1}$ in the deterministic equations and $x_{t+1}$ and $x_{t}$ in the expectational equations. This linear system can be solved with the method of undetermined coefficients, described in section 5.

In the large majority of cases, there is no need to differentiate the functions $f$ and $g$ explicitely. Instead, the log-linearized system can usually be obtained as follows. Multiply out everything before log-linearizing. Replace a variable $X_{t}$ with $X_{t}=\bar{X} e^{x_{t}}$, where $x_{t}$ is a real number close to zero. Let likewise $y_{t}$ be a real number close to zero. Take logarithms, where both sides of an equation only involve products, or use the following three building blocks, where $a$ is some constant:

$$
\begin{equation*}
\begin{aligned}
e^{x_{t}+a y_{t}} & \approx 1+x_{t}+a y_{t} \\
x_{t} y_{t} & \approx 0 \\
E_{t}\left[a e^{x_{t+1}}\right] & \approx E_{t}\left[a x_{t+1}\right] \text { up to a constant. }
\end{aligned}
\end{equation*}
$$

For example, these building blocks yield

$$
\begin{equation*}
\begin{aligned}
e^{x_{t}} & \approx 1+x_{t} \\
a X_{t} & \approx a \bar{X} x_{t} \text { up to a constant } \\
\left(X_{t}+a\right) Y_{t} & \approx \bar{X} \bar{Y} x_{t}+(\bar{X}+a) \bar{Y} y_{t} \text { up to a constant }
\end{aligned}
\end{equation*}
$$

Constants drop out of each equation in the end, since they satisfy steady state relationships, but they are important in intermediate steps: compare for example the two equations above. Rather than describing the general principles further, it is fruitful to consider a specific example instead.

## 4 An example: Hansens real business cycle model.

The following model is the benchmark real business cycle model due to Hansen (1985) and explained there in detail. Here, the mathematical description shall suffice. The main point of this example here is to explain how to perform the first three steps of the general procedure.

The social planner solves the problem of the representative agent

$$
\begin{equation*}
\max E \sum_{t=1}^{\infty} \beta^{t}\left(\frac{C_{t}^{1-\eta}-1}{1-\eta}-A N_{t}\right)
\end{equation*}
$$

s.t.
$$
\begin{align*}
C_{t}+I_{t} & =Y_{t}  \tag{4.1}\\
K_{t} & =I_{t}+(1-\delta) K_{t-1} \\
Y_{t} & =Z_{t} K_{t-1}^{\rho} N_{t}^{1-\rho} \\
\log Z_{t} & =(1-\psi) \log \bar{Z}+\psi \log Z_{t-1}+\epsilon_{t}, \quad \epsilon_{t} \sim i . i . d . \mathcal{N}\left(0 ; \sigma^{2}\right),
\end{align*}
$$
where $C_{t}$ is consumption, $N_{t}$ is labor, $I_{t}$ is investment, $Y_{t}$ is production, $K_{t}$ is capital $Z_{t}$ is the total factor productivity and $A, \beta, \eta, \delta, \rho, \bar{Z}, \psi$ and $\sigma^{2}$ are parameters. Hansen only considered the case $\eta=1$, so that the objective function is

$$
\begin{equation*}
E \sum_{t=0}^{\infty} \beta^{t}\left(\log C_{t}-A N_{t}\right)
\end{equation*}
$$

As in Campbell (1994), there is no difficulty in considering arbitrary $\eta$, since no growth trend is assumed.

The first order conditions are
$$
\begin{align*}
A & =C_{t}^{-\eta}(1-\rho) \frac{Y_{t}}{N_{t}} \\
1 & =\beta E_{t}\left[\left(\frac{C_{t}}{C_{t+1}}\right)^{\eta} R_{t+1}\right]  \tag{4.2}\\
R_{t} & =\rho \frac{Y_{t}}{K_{t-1}}+1-\delta \tag{4.3}
\end{align*}
$$

Equation (4.2) is the Lucas asset pricing equations, see Lucas (1978), which typically arises in these models.

In contrast to some of the real business cycle literature and to avoid confusion in the application of the method in section 5, it is very useful to stick to the following dating convention. A new date starts with the arrival of new information. If a variable is chosen and/or (eventually) known at date $t$, it will be indexed with $t$. Use only variables dated $t$ and $t-1$ in deterministic equations and variables dated $t+1, t$ and $t-1$ in equations involving expectations $E_{t}[\cdot]$.

The steady state for the real business cycle model above is obtained by dropping the time subscripts and stochastic shocks in the equations above, characterizing the equilibrium. Formally, this amounts to finding steady state values such that $f(0,0)=$ 1 and $g(0,0)=1$ in the notation of the previous section ${ }^{6}$. For example, equations (4.2) and (4.3) result in

$$
\begin{equation*}
\begin{aligned}
1 & =\beta \bar{R} \\
\bar{R} & =\rho \frac{\bar{Y}}{\bar{K}}+1-\delta
\end{aligned}
\end{equation*}
$$

where bars over variables denote steady state values. One needs to decide what one wants to solve for. If one fixes $\beta$ and $\delta$, these two equations will imply values for $\bar{R}$ and $\bar{Y} / \bar{K}$. Conversely, one can fix $\bar{R}$ and $\bar{Y} / \bar{K}$ and then these two equations yield values

[^3]for $\beta$ and $\delta$. The latter procedure maps observable characteristics of the economy into "deep parameters," and is the essence of calibration, see Kydland and Prescott (1991).

Introduce small letters to denote log-deviations, i.e. write

$$
\begin{equation*}
C_{t}=\bar{C} e^{c_{t}}
\end{equation*}
$$

for example. The resource constraint (4.1) then reads

$$
\begin{equation*}
\bar{C} e^{c_{t}}+\bar{I} e^{i_{t}}=\bar{Y} e^{y_{t}}
\end{equation*}
$$

This can be written approximately as

$$
\begin{equation*}
\bar{C}\left(1+c_{t}\right)+\bar{I}\left(1+i_{t}\right)=\bar{Y}\left(1+y_{t}\right)
\end{equation*}
$$

Since $\bar{C}+\bar{I}=\bar{Y}$ due to the definition of the steady state, the constant terms drop out ${ }^{7}$ and one obtains

$$
\begin{equation*}
\bar{C} c_{t}+\bar{I} i_{t}=\bar{Y} y_{t} \tag{4.4}
\end{equation*}
$$

The resource constraint is now stated in terms of percentage deviations: the steady state levels in this equation rescale the percentage deviations to make them comparable. Note that no explicit differentiation is required to obtain the log-linearized version of the resource constraint: log-linearization is obtained just by using the building blocks described in the previous section.

Similarly log-linearizating the other equations yields

$$
\begin{equation*}
\begin{aligned}
\bar{K} k_{t} & =\bar{I} i_{t}+(1-\delta) \bar{K} k_{t-1} \\
y_{t} & =z_{t}+\rho k_{t-1}+(1-\rho) n_{t} \\
z_{t} & =\psi z_{t-1}+\epsilon_{t} \\
0 & =-\eta c_{t}+y_{t}-n_{t} \\
0 & =E_{t}\left[\eta\left(c_{t}-c_{t+1}\right)+r_{t+1}\right] \\
\bar{R} r_{t} & =\rho \frac{\bar{Y}}{\bar{K}}\left(y_{t}-k_{t-1}\right) .
\end{aligned}
\end{equation*}
$$

To find the state variables, one needs to find all (linear combinations of) variables dated $t-1$ in these equations: the endogenous state variable is capital, $k_{t-1}$ whereas the exogenous state variable is the technology parameter $z_{t-1}$. Note that there are as many expectational equations as there are endogenous state variables. The coefficients of the equations above need to be collected in the appropriate matrices to restate these equations in the form required for section 5: this is a straightforward exercise.

[^4]
## 5 Solving recursive stochastic linear systems with the method of undetermined coefficients

This section describes how to find the solution to the recursive equilibrium law of motion in general, using the method of undetermined coefficients. MATLAB programs performing the calculations in this section are available at my home page ${ }^{8}$. The idea is to write all variables as linear functions (the "recursive equilibrium law of motion") of a vector of endogenous variables $x_{t-1}$ and exogenous variables $z_{t}$, which are given at date $t$, i.e. which cannot be changed at date $t$. These variables are often called state variables or predetermined variables. In the real business cycle example of section 4 , these are at least $k_{t-1}$ and $z_{t}$, since they are clearly unchangeable as of date $t$ and, furthermore, show up in the linearized equations system. In principle, any endogenous variable dated $t-1$ or earlier could be considered a state variable. Thus, in subsection 5.1 below, we use "brute force" and simply declare all endogenous variables to be state variables, whereas in subsection 5.2 , we try to be a bit more sensitive and exploit more of the available structure. The latter is typically done in practice, see e.g. Campbell (1994). Both subsections will characterize the solution with a matrix quadratic equation, see also Ceria and Rios-Rull (1992) and Binder and Pesaran (1996). Subsection 5.3 shows, how to solve that equation. For models with just one endogenous state variable, such as the real business cycle model of section 4 when analyzed with the more structured approach in subsection 5.2 below, the matrix quadratic equation is simply a quadratic equation in a real number. In that case, the solution to the quadratic equation is obviously known from high-school algebra: it is contained as a special case of the general solution in section 5.3. In subsection 5.4 we discuss our solution method, and compare it in particular to the Blanchard-Kahn (1980) approach.

### 5.1 With brute force...

As a first cut, and with somewhat brute force, one may simply use all variables without distinction as a vector of endogenous state variables ${ }^{9} x_{t-1}$ of size $m \times 1$ or as a vector of exogenous stochastic processes $z_{t}$ of size $k \times 1$. It is assumed that the log-linearized equilibrium relationships can be written in the following form

$$
\begin{equation*}
0=E_{t}\left[F x_{t+1}+G x_{t}+H x_{t-1}+L z_{t+1}+M z_{t}\right] \tag{5.1}
\end{equation*}
$$

[^5]$$
\begin{equation*}
z_{t+1}=N z_{t}+\epsilon_{t+1} ; \quad E_{t}\left[\epsilon_{t+1}\right]=0 \tag{5.2}
\end{equation*}
$$

where $F, G, H, L$ and $M$ and matrices, collecting the coefficients. It is assumed that $N$ has only stable eigenvalues. The real business cycle example above can be easily written in this form. For example, the resource constraint (4.4) would be

$$
\begin{equation*}
0=E_{t}\left[\bar{C} c_{t}+\bar{I} i_{t}-\bar{Y} y_{t}\right]
\end{equation*}
$$

since $c_{t}, i_{t}$ and $y_{t}$ are already known at date $t$ and hence nothing changes when one takes their expectations given all information up to date $t$. Note that $F=L=0$ for this equation. Of course, there are other equations in the real business cycle model, and one of them involves nonzero entries for $F$ and $L$.

What one is looking for is the recursive equilibrium law of motion

$$
\begin{equation*}
x_{t}=P x_{t-1}+Q z_{t} \tag{5.3}
\end{equation*}
$$

i.e. matrices $P$ and $Q$, so that the equilibrium described by these rules is stable. The solution is characterized in the following theorem, see also Binder and Pesaran (1996). The characterization involves a matrix quadratic equation, see equation (5.4). Subsection 5.3 discusses, how it can be solved. For the purpose of that section, let $m$ be the length of the vector $x_{t}$, and let $l=n=0$.

Theorem 1 If there is a recursive equilibrium law of motion solving equations (5.1), and (5.2), then the following must be true.

1. $P$ satisfies the (matrix) quadratic equation

$$
\begin{equation*}
0=F P^{2}+G P+H \tag{5.4}
\end{equation*}
$$

The equilibrium described by the recursive equilibrium law of motion (5.3) and (5.2) is stable iff all eigenvalues of $P$ are smaller than unity in absolute value.
2. Given $P$, let $V$ denote the matrix

$$
\begin{equation*}
V=N^{\prime} \otimes F+I_{k} \otimes(F P+G)
\end{equation*}
$$

Then,

$$
\begin{equation*}
V Q=-v e c(L N+M) \tag{5.5}
\end{equation*}
$$

where vec $(\cdot)$ denotes columnwise vectorization.
Obviously, if the matrix $V$ in this theorem is invertible, then multiplication of equation (5.5) with $V^{-1}$ yields the unique solution for $Q$.

Proof: Plugging the recursive equilibrium law of motion (5.3) into equation (5.1) twice and using (5.2) to calculate the expectations yields
$$
\begin{align*}
0= & ((F P+G) P+H) x_{t-1}+  \tag{5.6}\\
& ((F Q+L) N+(F P+G) Q+M) z_{t}
\end{align*}
$$

The coefficient matrices on $x_{t-1}$ and $z_{t}$ need to be zero. Equating the coefficient on $x_{t-1}$ to zero yields equation (5.4) for $P$. Taking the columnwise vectorization of the coefficient matrices of $z_{t}$ in this equation and collecting terms in $\operatorname{vec}(Q)$ yields the equation (5.5) for $Q$.

## 5.2 ... or with sensitivity.

We now exploit more of the structure in the linearized model. Analyzing the equations of the real business cycle example of section 4 , one sees that the only endogenous variable dated $t-1$ which shows up in any of the equations is capital, $k_{t-1}$. It is thus a reasonably guess to treat $k_{t-1}$ as the only endogenous state variable together with the exogenous state variable $z_{t}$. This principle is general: in the vast majority of cases, this is how one can identify the vector of state variables ${ }^{10}$. In practice, one often sees researchers exploiting some of the equilibrium equations to "get rid" of some variables, and have only a few variables remaining. For the real business cycle example of section 4 , it is actually possible to reduce everything to a single equation for the endogenous variables, containing only $k_{t+1}, k_{t}$ and $k_{t-1}$. Often, one sees reductions to a system involving two equations in two endogenous variables such as $c_{t}$ and $k_{t-1}$, see e.g. Campbell (1994), presumably because this allows thinking in terms of a state space diagram, see e.g. Blanchard and Fisher (1989), chapter 2. The analysis below follows this often-used procedure. However, there is no reason to go through the hassle of "eliminating" variables by hand, using some of the equations: since this is all just simple linear algebra applied to a system of equations, it is far

[^6]easier to leave all the equations in, and leave it to the formulas to sort it all out. That is what is done below.

We thus make the following assumptions ${ }^{11}$. There is an endogenous state vector $x_{t}$, size $m \times 1$, a list of other endogenous variables ("jump variables") $y_{t}$, size $n \times 1$, and a list of exogenous stochastic processes $z_{t}$, size $k \times 1$. The equilibrium relationships between these variables are
$$
\begin{align*}
0 & =A x_{t}+B x_{t-1}+C y_{t}+D z_{t}  \tag{5.7}\\
0 & =E_{t}\left[F x_{t+1}+G x_{t}+H x_{t-1}+J y_{t+1}+K y_{t}+L z_{t+1}+M z_{t}\right]  \tag{5.8}\\
z_{t+1} & =N z_{t}+\epsilon_{t+1} ; \quad E_{t}\left[\epsilon_{t+1}\right]=0 \tag{5.9}
\end{align*}
$$
where it is assumed that $C$ is of size $l \times n, l \geq n$ and $^{12}$ of rank $n$, that $F$ is of size $(m+n-l) \times n$, and that $N$ has only stable eigenvalues. Note, that one could have written all equations (5.7) in the form of equation (5.8) with the corresponding entries in the matrices $F, J$ and $L$ set to zero. Essentially, that is what is done in subsection 5.1. Instead, the point here is to somehow exploit the structure inherent in equations of the form (5.7), which do not involve taking expectations.

What one is looking for is the recursive equilibrium law of motion
$$
\begin{align*}
x_{t} & =P x_{t-1}+Q z_{t}  \tag{5.10}\\
y_{t} & =R x_{t-1}+S z_{t} \tag{5.11}
\end{align*}
$$
i.e. matrices $P, Q, R$ and $S$, so that the equilibrium described by these rules is stable. The solution is characterized in the next theorem. To calculate the solution, one needs to solve a matrix quadratic equation: how this is done, is explained in subsection 5.3.

The important special case $l=n$ is treated in corrolary 1. The special case $l=n=0$ was the topic of subsection 5.1.

Theorem 2 If there is a recursive equilibrium law of motion solving equations (5.7), (5.8) and (5.9), then the coefficient matrices can be found as follows. Let $C^{+}$be the pseudo-inverse ${ }^{13}$ of $C$. Let $C^{0}$ be an $(~ l-n) \times l$ matrix, whose rows form a basis of the null space ${ }^{14}$ of $C^{\prime}$.

[^7]1. $P$ satisfies the (matrix) quadratic equations
$$
\begin{array}{ll}
0= & C^{0} A P+C^{0} B \\
0=\left(F-J C^{+} A\right) P^{2} & -\left(J C^{+} B-G+K C^{+} A\right) P-K C^{+} B+H \tag{5.13}
\end{array}
$$

The equilibrium described by the recursive equilibrium law of motion (5.10), (5.11) and by (5.9) is stable iff all eigenvalues of $P$ are smaller than unity in absolute value.
2. $R$ is given by

$$
\begin{equation*}
R=-C^{+}(A P+B)
\end{equation*}
$$

3. Given $P$ and $R$, let $V$ be the matrix

$$
\begin{equation*}
V=\left[\begin{array}{cc}
I_{k} \otimes A, & I_{k} \otimes C \\
N^{\prime} \otimes F+I_{k} \otimes(F P+J R+G), & N^{\prime} \otimes J+I_{k} \otimes K
\end{array}\right] .
\end{equation*}
$$

where $I_{k}$ is the identity matrix of size $k \times k$. Then
V\left[$$
\begin{array}{l}
\operatorname{vec}(Q)  \tag{5.14}\\
\operatorname{vec}(S)
\end{array}
$$\right]=-\left[$$
\begin{array}{c}
\operatorname{vec}(D) \\
\operatorname{vec}(L N+M)
\end{array}
$$\right]
where vec $(\cdot)$ denotes columnwise vectorization.
Obviously, if the matrix $V$ in this theorem is invertible, then multiplication of equation (5.14) with $V^{-1}$ yields the unique solution for $Q$.

Proof: Plug the recursive equilibrium law of motion into equation (5.7). This yields

$$
\begin{equation*}
(A P+C R+B) x_{t-1}+(A Q+C S+D) z_{t}=0 \tag{5.15}
\end{equation*}
$$

which has to hold for arbitrary $x_{t-1}$ and $z_{t}$. Thus, the coefficient matrices on $x_{t-1}$ and $z_{t}$ in (5.15) are zero. Plugging the recursive equilibrium law of motion into equation (5.8) twice and using (5.9) yields
$$
\begin{align*}
0= & ((F P+J R+G) P+K R+H) x_{t-1}+  \tag{5.16}\\
& ((F Q+J S+L) N+(F P+J R+G) Q+K S+M) z_{t}
\end{align*}
$$

Again, the coefficient matrices on $x_{t-1}$ and $z_{t}$ need to be zero. Taking the columnwise vectorization of the coefficient matrices of $z_{t}$ in equations (5.15) and (5.16) and collecting terms in $\operatorname{vec}(Q)$ and $\operatorname{vec}(S)$ yields the formula for $Q$ and $S$.

To find $P$ and thus $R$, rewrite the coefficient matrix on $x_{t-1}$ in equation (5.15) as
$$
\begin{align*}
R & =-C^{+}(A P+B)  \tag{5.17}\\
0 & =C^{0} A P+C^{0} B,
\end{align*}
$$
noting that the matrix $\left[\left(C^{+}\right)^{\prime},\left(C^{0}\right)^{\prime}\right]$ is nonsingular and that $C^{0} C=0$, see Strang (1980), p. 88. Use (5.17) to replace $R$ in the coefficient matrix on $x_{t-1}$ in (5.16), yielding (5.13). Note finally that the stability of the equilibrium is determined by the stability of $P$, since $N$ has stable roots by assumption.

Corollary 1 Suppose that $l=n$, i.e. that there are as many expectational equations as there are endogenous state variables. If there is a recursive equilibrium law of motion solving equations (5.7), (5.8) and (5.9), then their coefficient matrices can be found as follows.

1. $P$ satisfies the (matrix) quadratic equation

$$
\begin{equation*}
\left(F-J C^{-1} A\right) P^{2}-\left(J C^{-1} B-G+K C^{-1} A\right) P-K C^{-1} B+H=0 . \tag{5.18}
\end{equation*}
$$

The equilibrium described by the recursive equilibrium law of motion (5.10), (5.11) and by (5.9) is stable iff all eigenvalues of $P$ are smaller than unity in absolute value.
2. $R$ is given by

$$
\begin{equation*}
R=-C^{-1}(A P+B)
\end{equation*}
$$

3. $Q$ satisfies
$$
\begin{align*}
& \left(N^{\prime} \otimes\left(F-J C^{-1} A\right)+I_{k} \otimes\left(J R+F P+G-K C^{-1} A\right)\right) \operatorname{vec}(Q)= \\
& \quad \operatorname{vec}\left(\left(J C^{-1} D-L\right) N+K C^{-1} D-M\right), \tag{5.19}
\end{align*}
$$
where $I_{k}$ is the identity matrix of size $k \times k$, provided the matrix which needs to be inverted in this formula is indeed invertible.
4. $S$ is given by

$$
\begin{equation*}
S=-C^{-1}(A Q+D)
\end{equation*}
$$

Proof: This corollary can be obtained directly by inspecting the formulas of theorem 2 above for the special case $l=n$. In particular, $C^{+}$is just the inverse of $C$. Alternatively, a direct proof can be obtained directly by following the same proof strategy as above: there is no need to repeat it.

The formulas in these theorems become simpler yet, if $m=1$ or $k=1$. If $m=1$, there is just one endogenous state variable and the matrix quadratic equation
above becomes a quadratic equation in the real number $P$, which can be solved using high-school algebra: this is the case for the real business cycle model and thus the case which Campbell (1994) analyzes. If $k=1$, there is just one exogenous state variables, in which case the Kronecker product (i.e. " $\otimes$ ") in the formulas above becomes multiplication, and in which case $\operatorname{vec}(Q)=Q$ and $\operatorname{vec}(S)=S$, since $Q$ and $S$ are already vectors rather than matrices.

### 5.3 Solving the matrix quadratic equation.

To generally solve the matrix quadratic equations (5.4) or (5.12), (5.13) for $P$, write them generally as

$$
\begin{equation*}
\Psi P^{2}-\Gamma P-\Theta=0 \tag{5.20}
\end{equation*}
$$

For equations (5.12) and (5.13), define

$$
\begin{equation*}
\begin{aligned}
\Psi & =\left[\begin{array}{c}
0_{l-n, m} \\
F-J C^{+} A
\end{array}\right] \\
\Gamma & =\left[\begin{array}{c}
C^{0} A \\
J C^{+} B-G+K C^{+} A
\end{array}\right] \\
\Theta & =\left[\begin{array}{c}
C^{0} B \\
K C^{+} B-H,
\end{array}\right]
\end{aligned}
\end{equation*}
$$

where $0_{l-n, m}$ is a $(l-n) \times m$ matrix with only zero entries. In the special case $l=n$, the formulas for $\Psi, \Gamma$ and $\Theta$ become slightly simpler:

$$
\begin{equation*}
\begin{aligned}
\Psi & =F-J C^{-1} A \\
\Gamma & =J C^{-1} B-G+K C^{-1} A \\
\Theta & =K C^{-1} B-H
\end{aligned}
\end{equation*}
$$

For equation (5.4), simply use $\Psi=F, \Gamma=-G$ and $\Theta=-H$.
Equation (5.20) can now be solved by turning it into a generalized eigenvalue and eigenvector problem ${ }^{15}$, for which most mathematical packages have preprogrammed routines ${ }^{16}$. Recall, that a generalized eigenvalue $\lambda$ and eigenvector $s$ of a matrix $\Xi$ with respect to a matrix $\Delta$ are defined to be a vector and a value satisfying

$$
\begin{equation*}
\lambda \Delta s=\Xi s \tag{5.21}
\end{equation*}
$$

[^8]A standard eigenvalue problem is obtained, if $\Delta$ is the identity matrix. More generally, the generalized eigenvector problem can be reduced to a standard one, if $\Delta$ is invertible, by calculating standard eigenvalues and eigenvectors for $\Delta^{-1} \Xi$ instead.

Theorem 3 To solve the quadratic matrix equation

$$
\begin{equation*}
\Psi P^{2}-\Gamma P-\Theta=0 \tag{5.22}
\end{equation*}
$$

for the $m \times m$ matrix $P$, given $m \times m$ matrices $\Gamma$ and $\Theta$, define the $2 m \times 2 m$ matrices $\Xi$ and $\Delta$ via

$$
\begin{equation*}
\Xi=\left[\begin{array}{ll}
\Gamma & \Theta \\
I_{m} & 0_{m, m}
\end{array}\right]
\end{equation*}
$$

and

$$
\begin{equation*}
\Delta=\left[\begin{array}{ll}
\Psi & 0_{m, m} \\
0_{m, m} & I_{m}
\end{array}\right],
\end{equation*}
$$

where $I_{m}$ is the identity matrix of size $m$, and where $0_{m, m}$ is the $m \times m$ matrix with only zero entries.

1. If $s$ is a generalized eigenvector and $\lambda$ the corresponding generalized eigenvalue of $\Xi$ with respect to $\Delta$, then $s$ can be written as $s^{\prime}=\left[\lambda x^{\prime}, x^{\prime}\right]$ for some $x \in \mathbf{R}^{m}$.
2. If there are $m$ generalized eigenvalues $\lambda, \ldots, \lambda_{m}$ together with generalized eigenvectors $s_{1}, \ldots, s_{m}$ of $\Xi$ with respect to $\Delta$, written as $s_{i}^{\prime}=\left[\lambda_{i} x_{i}^{\prime}, x_{i}^{\prime}\right]$ for some $x_{i} \in \mathbf{R}^{m}$, and if $\left(x_{1}, \ldots, x_{m}\right)$ is linearly independent, then

$$
\begin{equation*}
P=\Omega \Lambda \Omega^{-1}
\end{equation*}
$$

is a solution to the matrix quadratic equation (5.22), where $\Omega=\left[x_{1}, \ldots, x_{m}\right]$ and $\Lambda=\operatorname{diag}\left(\lambda, \ldots, \lambda_{m}\right)$. The solution $P$ is stable if $\left|\lambda_{i}\right|<1$ for all $i=1, \ldots, m$.
Conversely, any diagonalizable solution $P$ to (5.22) can be written in this way.
3. If $m=1$, then the solutions $P$ to equation (5.22) are given by

$$
\begin{equation*}
P_{1,2}=\frac{1}{2 \Psi}\left(\Gamma \pm \sqrt{\Gamma^{2}+4 \Psi \Theta}\right) .
\end{equation*}
$$

if $\Psi \neq 0$ and

$$
\begin{equation*}
P=-\frac{\Theta}{\Gamma}
\end{equation*}
$$

if $\Psi=0$ and $\Gamma \neq 0$.

Proof: First, examine the last $m$ rows of equation (5.21) to see that any eigenvector $s$ for some eigenvalue $\lambda$ of the matrix $\Xi$ with respect to $\Delta$ can indeed be written as

$$
\begin{equation*}
s=\left[\begin{array}{l}
\lambda x \\
x
\end{array}\right]
\end{equation*}
$$

for some $x \in \mathbf{R}^{m}$ because of the special form of $\Xi$ and $\Delta$. Examining the first $m$ rows of equation (5.21) then shows that

$$
\begin{equation*}
\lambda^{2} \Psi x-\lambda \Gamma x-\Theta x=0 \tag{5.23}
\end{equation*}
$$

It follows that

$$
\begin{equation*}
\Psi \Omega \Lambda^{2}-\Gamma \Omega \Lambda-\Theta \Omega=0
\end{equation*}
$$

and hence

$$
\begin{equation*}
\Psi P^{2}-\Gamma P-\Theta=0
\end{equation*}
$$

as claimed, after multiplying with $\Omega^{-1}$ from the right.
Reversing the steps shows that any diagonalizable solution $P$ to (5.22) can be written in this way.

Some additional properties of a solution $P$ to (5.20) are stated in the following theorem ${ }^{17}$ :

Theorem 4 1. The eigenvalues $\lambda$ of $\Xi$ are the solutions to the equation

$$
\begin{equation*}
\operatorname{det}\left(\lambda^{2} \Psi-\lambda \Gamma-\Theta\right)=0
\end{equation*}
$$

The lower half $x$ of the eigenvector $s$ to $\lambda$ satisfies

$$
\begin{equation*}
\left(\lambda^{2} \Psi-\lambda \Gamma-\Theta\right) x=0
\end{equation*}
$$

2. If $\Psi$ is invertible and if $P$ is a real-valued solution to the matrix-quadratic equation (5.18), then

$$
\begin{equation*}
\operatorname{tr}\left(4 \Psi^{-1} \Theta+\left(\Psi^{-1} \Gamma\right)^{2}\right) \geq 0
\end{equation*}
$$

Proof: The claim about $\lambda$ follows from

$$
\begin{equation*}
\operatorname{det}\left(\left[\begin{array}{ll}
(\Gamma-\lambda \Psi) & \Theta \\
I_{m} & -\lambda I_{m}
\end{array}\right]\right)=\operatorname{det}(-\lambda(\Gamma-\lambda \Psi)-\Theta),
\end{equation*}
$$

[^9]which follows from inspecting the formula for the determinant. The claim about the eigenvector piece $x$ is just (5.23). For the last claim, calculate that

$$
\begin{equation*}
0=\operatorname{tr}\left(P^{2}-\Psi^{-1} \Gamma P-\Psi^{-1} \Theta\right)=\operatorname{tr}\left(\left(P-\frac{1}{2} \Psi^{-1} \Gamma\right)^{2}-\left(\Psi^{-1} \Theta+\frac{1}{4}\left(\Psi^{-1} \Gamma\right)^{2}\right)\right)
\end{equation*}
$$

The conclusion follows since $\operatorname{tr}\left(\left(P-\frac{1}{2} \Psi^{-1} \Gamma\right)^{2}\right) \geq 0$.

### 5.4 Discussion.

Theorem 3 links the approach used here to Blanchard and Kahn (1980), which is the key reference for solving linear difference equations. Consider solving the second order difference equation

$$
\begin{equation*}
\Psi x_{t+1}-\Gamma x_{t}-\Theta x_{t-1}=0 \tag{5.24}
\end{equation*}
$$

The approach in Blanchard and Kahn (1980) amounts to finding the stable roots of $\Xi$ by instead analyzing the dynamics of the "stacked" system $s_{t}^{\prime}=\left[x_{t}^{\prime}, x_{t-1}^{\prime}\right]$,

$$
\begin{equation*}
\Delta s_{t+1}=\Xi s_{t}
\end{equation*}
$$

i.e. by reducing (5.24) to a first-order difference equation. The approach here solves for the matrix $P$ in the recursive equilibrium law of motion $x_{t+1}=P x_{t}$. Theorem 3 above states that both approaches amount to the same problem. The advantage of the method here is that it is easily applied to the entire system (5.7), (5.8) and (5.9), reducing it to (5.24) eventually, while finding the stable roots in the entire system given by these equations and at the same time taking care of the expectation operators, using the Blanchard-Kahn (1980) procedure, is often perceived as complicated. Fundamentally, there is no difference.

To apply theorem 3, one needs to select $m$ out of $2 m$ possible eigenvalues. Note that $P$ has only nonzero eigenvalues if the state space was chosen to be of minimal size: thus attention can be restricted to the roots $\left|\lambda_{i}\right|>0$ in that case. In general, there may be quite a bit of choice left. In practice, however, there will often be exactly $m$ stable eigenvalues remaining so that the stable solution is unique ${ }^{18}$.

[^10]For a one-dimensional vector of endogenous state variables, this condition is called saddle-point stability. The literature on solving linear rational expectations equilibria typically assumes this condition to hold or shows it to hold in social planning problems under reasonable conditions, see Blanchard and Kahn (1980), Kollintzas (1985) and Hansen, McGrattan and Sargent (1994). If there are fewer stable eigenvalues than endogenous state variables, the equilibrium might be inherently unstable. The method above then still permits calculation of an equilibrium which satisfies the nonlinear equilibrium conditions at least locally. In particular, in models involving more than one agent or sectors or countries, one may find as many unit roots as there are more agents (sectors, countries) than one since shocks may affect the relative wealth (capital) of any two agents (sectors, countries) and thus may result in permanent changes in their consumption paths (or capital stocks): in these cases, the method above allowing for unit roots still gives useful results, which obviously should then be used with some care. These unit roots typically already show up as an indetermined steady state: any of the possible steady states can then serve as a starting point for the dynamic calculation, keeping in mind that a simulation based on the dynamics calculated here will eventually wander away too far to be numerically useful. If there are more stable eigenvalues than endogenous state variables, enlarging the number of endogenous state variables by including further lagged values might help. Nonetheless, the presence of an excess of stable roots then may point to the existence of sunspots or endogenous fluctuations, see e.g. Farmer and Guo (1994).

If not all eigenvalues of $\Xi$ are distinct, $P$ in turn might have repeated eigenvalues. Since the eigenspace for a repeated eigenvalue is (usually) multidimensional, there will be infinitely many choices for the eigenvectors and hence infinitely many choices for $P$ in that case. Note, for example, that for any given $\lambda$ and any three real numbers $a, b, c$ satisfying $a^{2}+b c=\lambda^{2}$, all matrices

$$
\begin{equation*}
P=\left[\begin{array}{ll}
a & b \\
c & -a
\end{array}\right]
\end{equation*}
$$

solve

$$
\begin{equation*}
P^{2}-\left[\begin{array}{ll}
\lambda^{2} & 0 \\
0 & \lambda^{2}
\end{array}\right]=0 .
\end{equation*}
$$

These cases are rare in practice, since $\Xi$ is diagonalizable with distinct eigenvalues generically in the coefficients of the system (5.7), (5.8) and (5.9).

More disconcerting is the possibility that some of the roots may be complex rather than real. Consider, for example, $\Psi=I_{2}, \Gamma=-I_{2}$ and

$$
\begin{equation*}
\Theta=\left[\begin{array}{cc}
0.23 & 0.64 \\
-0.64 & 0.23
\end{array}\right] .
\end{equation*}
$$

Using the theorem above, one obtains exactly two stable roots, which happen to be complex, $\lambda_{1,2}=0.3 \pm 0.4 i=0.5 e^{ \pm \alpha i}$, where where $\alpha \approx 0.9273$. Their associated eigenvectors are complex, too. Calculating $P$ results in a matrix with only real entries, however, given by

$$
\begin{equation*}
P=\left[\begin{array}{cc}
0.3 & 0.4 \\
-0.4 & 0.3
\end{array}\right]=0.5\left[\begin{array}{cc}
\cos \alpha & \sin \alpha \\
-\sin \alpha & \cos \alpha
\end{array}\right] .
\end{equation*}
$$

Since $\Xi$ is a real-valued matrix, complex eigenvalues only arise in complex-conjugate pairs. When using both roots of a complex-conjugate pair to calculate $\Lambda$ and thus $P$, the resulting solution should be a real-valued matrix. In order to do this, one may have to enlarge the state space of endogenous state variables to be at least twodimensional, see again Farmer and Guo (1994) for an example. The complex roots then give rise to endogenous damped cycles of frequency $\alpha$.

## 6 Interpreting the results

The results obtained, i.e. the recursive equilibrium law of motion

$$
\begin{equation*}
\begin{gathered}
x_{t}=P x_{t-1}+Q z_{t} \\
y_{t}=R x_{t-1}+S z_{t} \\
z_{t}=N z_{t-1}+\epsilon_{t}
\end{gathered}
\end{equation*}
$$

can be used to examine model implications. Since $x_{t}, y_{t}$ and $z_{t}$ are log-deviations, the entries in $P, Q, R, S$ and $N$ can be understood as elasticities and interpreted accordingly, see e.g. Campbell (1994).

Impulse responses to a particular shock $\epsilon_{1}$ can be calculated by setting $x_{0}=0, y_{0}=$ 0 and $z_{0}=0$, as well as $\epsilon_{t}=0$ for $t \geq 2$, and recursively calculating $z_{t}$ and then $x_{t}$ and $y_{t}$, given $x_{t-1}, y_{t-1}, z_{t-1}$ and $\epsilon_{t}$ for $t=1, \ldots, T$ with the recursive equilibrium law of motion and the law of motion for $z_{t}$.

To find the second moment properties of the model such as variances and autocorrelations of certain variables as well as the small sample properties of their estimators, simulation methods are often used. Before calculating these moments, the HodrickPrescott filter is typically applied (short: HP-Filter). This section demonstrates a frequency-domain technique to obtain these moments (albeit without the small sample properties of their estimators) without the need for any simulations ${ }^{19}$. Obviously,

[^11]the methods here do not deliver properties of the small sample distribution, which may be necessary for testing.

The matrix-valued spectral density for $\left[x_{t}^{\prime}, z_{t}^{\prime}\right]^{\prime}$ is given by

$$
\begin{equation*}
\begin{aligned}
& f(\omega)=\frac{1}{2 \pi}\left[\begin{array}{l}
\left(I_{m}-P e^{-i \omega}\right)^{-1} Q \\
I_{k}
\end{array}\right]\left(I_{k}-N e^{-i \omega}\right)^{-1} \Sigma \\
& \left(I_{k}-N^{\prime} e^{i \omega}\right)^{-1}\left[Q^{\prime}\left(I_{m}-P^{\prime} e^{i \omega}\right)^{-1}, I_{k}\right]
\end{aligned}
\end{equation*}
$$

where $I_{k}$ and $I_{m}$ are the identity matrices of dimension $k$ and $m$, see Hamilton (1994), formula (10.4.43). Two ways to calculate the matrix-valued spectral density for the entire vector of variables $s_{t}=\left[x_{t}^{\prime}, y_{t}^{\prime}, z_{t}^{\prime}\right]^{\prime}$ are

$$
\begin{equation*}
\begin{aligned}
g(\omega) & =\left[\begin{array}{cc}
I_{m} & 0_{m, k} \\
R e^{-i \omega} & S \\
0_{k, m} & I_{k}
\end{array}\right] f(\omega)\left[\begin{array}{ccc}
I_{m} & R^{\prime} e^{i \omega} & 0_{m, k} \\
0_{k, m} & S^{\prime} & I_{k}
\end{array}\right] \\
& =W f(\omega) W^{\prime}, \text { where } W=\left[\begin{array}{cc}
I_{m}, & 0_{m, k} \\
R P^{+}, & S-R P^{+} Q \\
0_{k, m}, & I_{k}
\end{array}\right]
\end{aligned}
\end{equation*}
$$

where $P^{+}$is the pseudo-inverse of $P$ and where the last equality exploits $s_{t}=$ $W\left[x_{t}^{\prime}, z_{t}^{\prime}\right]^{\prime}$, replacing $x_{t-1}$ with $P^{+} x_{t}-P^{+} Q z_{t}$ in the recursive equilibrium law of motion for $y_{t}$. The HP filter aims at removing a smooth trend $\tau_{t}$ from some given data $s_{t}$ by solving

$$
\begin{equation*}
\min _{\tau_{t}} \sum_{t=1}^{T}\left(\left(s_{t}-\tau_{t}\right)^{2}+\lambda\left(\left(\tau_{t+1}-\tau_{t}\right)-\left(\tau_{t}-\tau_{t-1}\right)\right)^{2}\right)
\end{equation*}
$$

The solution is a linear lag polynomial $r_{t}=s_{t}-\tau_{t}=h(L) s_{t}$ which has the transfer function

$$
\begin{equation*}
\tilde{h}(\omega)=\frac{4 \lambda(1-\cos (\omega))^{2}}{1+4 \lambda(1-\cos (\omega))^{2}}
\end{equation*}
$$

see King and Rebelo (1993). Thus, the matrix spectral density of the HP-filtered vector is simply

$$
\begin{equation*}
g_{H P}(\omega)=\tilde{h}^{2}(\omega) g(\omega)
\end{equation*}
$$

from which one can obtain the autocorrelations of $r_{t}$ in time domain via an inverse Fourier transformation,

$$
\begin{equation*}
\int_{-\pi}^{\pi} g_{H P}(\omega) e^{i \omega k} d \omega=E\left[r_{t} r_{t-k}^{\prime}\right]
\end{equation*}
$$

see formula (10.4.4) in Hamilton (1994). Inverse Fourier transformations are part of many numerical packages.

## 7 Conclusions

We have provided a toolkit to analyze nonlinear dynamic stochastic models easily. The main contribution of this paper is to simplify and unify existing approaches, showing how to log-linearize the necessary equations characterizing the equilibrium without explicit differentiation, to provide a general solution to a linearized system using the method of undetermined coefficients, allowing in particular for a vector of endogenous states, and to provide simulation-free frequency-domain based method to calculate the the model implications in its HP-filtered version. These methods are easy to use if a numerical package such as MATLAB or GAUSS is available. This paper should therefore be useful for anybody interested in analyzing nonlinear stochastic dynamic models.

## References

[1] Atkeson, A. (1997), "A modification of Harald's program," class notes, University of Pennsylvania.
[2] Binder, Michael and Hashem M. Pesaran (1994), "Multivariate Rational Expectations Models and Macroeconomic Modeling: A Review and Some New Results,", University of Cambridge Department of Applied Economics Working Paper, 9415, Handbook of Applied Econometrics (forthcoming).
[3] Blanchard, Olivier Jean and Charles M. Kahn (1980), "The Solution of Linear Difference Models under Rational Expectations," Econometrica, 48(5), 1305-11.
[4] Blanchard, Oliviers and Stanley Fisher, 1989, Lectures on Macroeconomics, MIT Press.
[5] Brock, W.A. and L. Mirman (1972), "Optimal economic growth and uncertainty: the discounted case," Journal of Economic Theory Vol. 4, No. 3, pp. 479-513.
[6] Campbell, J. (1994), "Inspecting the mechanism: an analytical approach to the stochastic growth model," Journal of Monetary Economics Vol. 33, No. 3, pp. 463-506.
[7] Campbell, J. and J. Cochrane (1994), "By force of habit: A consumption-based explanation of aggregate stock market behavior," draft, Harvard University.
[8] Ceria, S. and J.V. Rios-Rull (1992), "On the Existence, Uniqueness, and Computability of Nonoptimal Recursive Equilibria in Linear Quadratic Economies," draft, Carnegie-Mellon University,
[9] Danthine, J.-P. and J.B. Donaldson (1995), "Computing equilibria of nonoptimal economics," in T. Cooley (ed.), Frontiers of Business Cycle Research, Princeton University Press, pp. 65-97.
[10] Farmer, Roger E. A. and Jang-Ting Guo (1994), "Real Business Cycles and the Animal Spirits Hypothesis," Journal of Economic Theory 63, 42-72.
[11] Hamilton, J.D. (1994), Time Series Analysis, Princeton University Press.
[12] Hansen, G.D. (1985), "Indivisible labor and the business cycle," Journal of Monetary Economics Vol. 16, pp. 309-327.
[13] Hansen, G.D. and E.C. Prescott (1995), "Recursive methods for computing equilibria of business cycle models," in T.C. Cooley (ed.), Frontiers of Business Cycle Research, Princeton University, pp. 39-64.
[14] Hansen, L., E.R. McGrattan and T.J. Sargent (1994), "Mechanics of forming and estimating linear economies," Federal Reserve Bank of Minneapolis Staff Report 182,
[15] King, R.G., C.I. Plosser and S.T. Rebelo (1987), "Production, growth and business cycles: technical appendix," working paper, University of Rochester.
[16] King, R.G. and S.T. Rebelo (1993), "Low Frequency Filtering and Real Business Cycles," Journal of Economic Dynamics and Control vol. 17, no. 1-2, 207-231,
[17] Judd, K.L. (1991), "Minimum weighted residual methods for solving dynamic economic models," Federal Reserve Bank of Minneapolis Discussion Paper No. 99.
[18] Kollintzas, Tryphon, "The Symmetric Linear Rational Expectations Model," Econometrica, vol. 53, no. 4, 963-976.
[19] Kydland, F. and E.C. Prescott (1982), "Time to build and aggregate fluctuations," Econometrica, vol. 50, 1345-1370.
[20] Kydland, F. and E.C. Prescott (1991), "The econometrics of the general equilibrium approach to business cycles," Scandinavian Journal of Economics Vol. 93, pp. 161-178.
[21] Lettau, M. and H. Uhlig (1995), "By force of habit: asset pricing puzzles versus consumption volatility," draft, CentER, Tilburg University.
[22] Lucas, R.E., Jr., (1978), "Asset prices in an exchange economy, Econometrica Vol. 46, pp. 1429-1445.
[23] McCallum, B. T. (1983), "On non-uniqueness in rational expectations models," Journal of Monetary Economics, vol. 11, 139-168.
[24] Muth, J. F., "Rational Expectations and the Theory of Price Movements," Econometrica, vol. 29, 315-335.
[25] Obstfeld, M. and K. Rogoff (1996), Foundations of International Macroeconomics, MIT Press.
[26] Sargent, T.J. (1987), Macroeconomic Theory, 2nd edition, Academic Press.
[27] Stokey, N.L. and R.E. Lucas, Jr., with E.C. Prescott (1989), Recursive Methods in Economic Dynamics, Harvard University Press,
[28] Strang, G. (1980), Linear Algebra and Its Applications, 2nd edition, Academic Press,
[29] Taylor, J. and H. Uhlig (1990), "Solving nonlinear stochastic growth models: a comparison of alternative solution methods," Journal of Business and Economic Statistics Vol. 8, pp. 1-19.
[30] Uhlig, H. and Y. Xu (1996), "Effort and the cycle: Cyclical Implications of Efficiency Wages", CentER DP 9649, Tilburg University.


[^0]:    *I am grateful to Michael Binder, Toni Braun, Jan Magnus, Ellen McGrattan and Yexiao Xu for helpful comments. I am grateful to Andrew Atkeson for pointing out to me a significant improvement of subsection 5.3. This paper was completed while visiting the Institute for Empirical Macroeconomics at the Federal Reserve Bank of Minneapolis: I am grateful for its hospitality. Any views expressed here are those of the authors and not necessarily those of the Federal Reserve Bank of Minneapolis or the Federal Reserve System. This version is an updated version of the Discussion Paper 101 at the Institute for Empirical Macroeconomics and of the CentER DP 9597.

[^1]:    ${ }^{1}$ Note that the nonlinear model is thus replaced by a linearized approximate model. "Essential" nonlinearities like chaotic systems are unlikely to be handled well by the methods in this paper.
    ${ }^{2}$ Campbell even touts the approach followed in his paper as "analytical", but note that in his case as well as in our case, one needs to linearize equations and solve quadratic equations. Campbell presumably attaches the attribute "analytical" to this numerical procedure, since it is rather straightforward indeed and carrying it out by hand is actually feasible in many cases. Otherwise, every numerical calculation anywhere could be called "analytical", since it could in principle be carried out and analyzed by hand - it would just take very long.
    ${ }^{3}$ http://cwis.kub.nl/ few5/center/STAFF/uhlig/toolkit.dir/toolkit.htm is the address of the web site for the programs.

[^2]:    ${ }^{4}$ Furthermore, McCallum (1983) uses eigenvalue methods also to solve some other equations in his method, which are solved here by a simple linear-equation-solution techniques, compare his solution for equation (A.6) in his paper to equation (5.14).

[^3]:    ${ }^{6}$ Alternatively, find the steady state so that (3.3) is satisfied. This is, however, rarely done.

[^4]:    ${ }^{7}$ Another way to see that constants can in the end be dropped is to note that the steady state is characterized by $c_{t}=k_{t}=y_{t}=k_{t-1}=0$. If one replaces all log-deviations with zero, only the constant terms remain, and that equation can be subtracted from the equation for general $c_{t}, k_{t}, y_{t}$ and $k_{t-1}$ above.

[^5]:    ${ }^{8}$ http://cwis.kub.nl/ few5/center/STAFF/uhlig/toolkit.dir/toolkit.htm is the address of the web site for the programs.
    ${ }^{9}$ To make this work really generally, one should actually not only include all the variables dated $t-1$ but also all the variables dated $t-2$ as part of the state vector $x_{t-1}$. More is even required, if the equations already contain further lags of endogenous variables, see also the next footnote. Usually, however, this isn't necessary.

[^6]:    ${ }^{10}$ There are exceptions. In richer models, the state variables need to include variables chosen at a date earlier than $t-1$ as well because these lagged variables appear in the equations. One can recast this into the desired format as follows. The list of state variables might consist out of lagged values of the capital stock, $k_{t-1}$ and $k_{t-2}$. This can and should be rewritten as $k_{1, t-1}$ and $k_{2, t-1}$ with $k_{1, t-1}$ replacing $k_{t-1}$ and where the additional equation $k_{2, t}=k_{1, t-1}$ needs to be added to the system. With that notation, $k_{2, t}$ is "chosen" at date $t$, satisfying the "dating convention" stated in section 4. One may also need to add additional variables like e.g. $c_{t-1}$ or $k_{t-2}$ as state variables, even though they don't show up in the equations with these dates, when the model exhibits sun spot dynamics. This can be done in the same manner, but one needs to be careful with interpreting the results. The reader is advised to read Farmer and Guo (1994) for an example as well for the appropriate interpretation for such a case.

[^7]:    ${ }^{11}$ Note that the notation differs from the notation in section 3
    ${ }^{12}$ The case $l<n$ can be treated as well: the easiest approach is to simply "redeclare" some other endogenous variables to be state variables instead, i.e. to raise $m$ and thus lower $n$, until $l=n$.
    ${ }^{13}$ The pseudo-inverse of the matrix $C$ is the $n \times l$ matrix $C^{+}$satisfying $C^{+} C C^{+}=C^{+}$and $C C^{+} C=C$. Since it is assumed that $\operatorname{rank}(C) \geq n$, one gets $C^{+}=\left(C^{\prime} C\right)^{-1} C^{\prime}$, see Strang (1980), p. 138. The MATLAB command to compute the pseudo-inverse is pinv $(C)$.
    ${ }^{14} C^{0}$ can be found via the singular value decomposition of $C^{\prime}$, see Strang (1980), p. 142. The MATLAB command for computing $C^{0}$ is $\left(\operatorname{null}\left(C^{\prime}\right)\right)^{\prime}$.

[^8]:    ${ }^{15} \mathrm{An}$ earlier version of the paper proposed to study an altered version of these equations by postmultiplying equation (5.12) with $P$. This altered equation together with (5.13) can then often be reduced to a standard rather than a generalized eigenvalue problem, but had the drawback of introducing spurious zero roots. The version presented here does not involve this alteration, and thus does not introduce spurious zero roots. This update is due to Andy Atkeson (1997), and I am very grateful to him for pointing it out to me. Any errors here are mine, of course.
    ${ }^{16}$ The Matlab command for finding the generalized eigenvalues and eigenvectors is eig $(\Xi, \Delta)$.

[^9]:    ${ }^{17} \mathrm{I}$ am grateful to Jan Magnus for pointing these out to me. Furthermore, Ceria and Rios-Rull, 1992, point to additional literature on this subject, which found and concentrated on part 1 of theorem 4 , but did not study the more useful theorem 3.

[^10]:    ${ }^{18}$ Another approach to select a unique solution is in McCallum (1983), who suggests to use those roots that can be obtained continuously from the zero roots of the equation $\Psi P^{2}-\Gamma P-\alpha \Theta$ for $\alpha=0$, as $\alpha$ changes from 0 to 1 . However, not only is following these roots as functions of $\alpha$ computationally very demanding, it is also the case that uniqueness gets lost once two or more such paths cross each other. If these paths do not cross in a particular application, and if additionally all roots for all $\alpha$ are positive real numbers, say, then the McCallum proposal simply amounts to using the roots of minimal value. The MATLAB programs supplied by the author use the roots of minimal absolute value subject to eliminating spurious zero roots and tries to use complex roots in conjugate pairs, as described below.

[^11]:    ${ }^{19}$ Some of these methods were originally contained in an early version of Uhlig and Xu (1996), but were eventually cut from that paper.

