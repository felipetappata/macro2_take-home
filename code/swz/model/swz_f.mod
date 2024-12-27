%%% Ejercicio 2.f %%%
%%% Author: Felipe Tappata (felipetappata@gmail.com)
%%% Date: 2024-12-21
%%% --------------------------   DESCRIPTION   --------------------------------
%%% Four-equation NK model from Sims et. al (2023)
%%% Dynare model file for direct comparison with brute force solution
%%% ---------------------------------------------------------------------------

%% Declare variables and parameters
var x pi rs rn yn y qe a theta v;
varexo e_q e_a e_t e_r;
parameters beta z sigma chi bfi bcb gamma xi rho_r rho_a rho_theta rho_q rho_v phi_pi phi_x s_r s_q s_theta s_a;

%% Calibrate model parameters 
beta      = 0.995;     % Discount factor
z         = 0.33;      % Share of impatient HHs
sigma     = 1;         % EIS
chi       = 1;         % Inverse Frisch elasticity
bfi       = 0.697;     % FI bond holdings
bcb       = 0.303;     % CB bond holdings
gamma     = 0.0846;    % Price stickiness parameter
xi        = 2.4925;    % Slope of Phillips curve
rho_r     = 0.8;       % MP shock persistence
rho_a     = 0.8;       % TFP shock persistence
rho_theta = 0.8;       % Financial shock persistence
rho_q     = 0.8;       % QE shock persistence
rho_v     = 0;         % MP shock persistence
phi_pi    = 1.5;       % Taylor rule inflation response
phi_x     = 0;         % Taylor rule output gap response
s_r       = 0.01;      % MP shock std
s_q       = 0.01;      % QE shock std
s_theta   = 0.01;      % Financial shock std
s_a       = 0.0125;    % TFP shock std

%% Specify model equations
model;
x = x(+1) - ((1-z)/sigma)*(rs - pi(+1) - rn) - z*(bfi*(theta(+1) - theta) + bcb*(qe(+1) - qe));
pi = gamma*xi*x - ((gamma*sigma*z)/(1-z))*(bfi*theta + bcb*qe) + beta*pi(+1);
rs = rho_r*rs(-1) + (1-rho_r)*(phi_pi*pi + phi_x*x) + v;
rn = ((-1*(1-rho_a)*(1+chi)*sigma)/(sigma + (1-z)*chi)) * a;
yn = (1-z)*(1+chi)/(sigma+(1-z)*chi) * a;
qe = rho_q*qe(-1) + e_q;
y = yn + x;
a = rho_a*a(-1)  + e_a;
theta = rho_theta*theta(-1) + e_t;
v = rho_v * v(-1) + e_r;
end;

%% Set initial steady state
initval;
x = 0;
pi = 0;
rs = 0;
rn = 0;
yn = 0;
y = 0;
qe = 0;
a = 0;
theta = 0;
v = 0;
end;

%% Configure shock processes
shocks; 
var e_q = s_q;
var e_a = s_a;
var e_t = s_theta;
var e_r = s_r;
end;

%% Run stochastic simulation
stoch_simul(order=1, irf=40);

