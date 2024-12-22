%%% Ejercicio 2.e %%%
%%% Author: Felipe Tappata
%%% Date: 2024-12-21
%%% Solution of the model from 
%% Clear workspace
clear all;
clc;

%% Declare parameters
beta = 0.995;
z = 0.33;
sigma = 1;
chi = 1;
bfi = 0.697;
bcb = 0.303;
gamma = 0.0846;
zeta = 2.4925;
rho_r = 0.8;
rho_a = 0.8;
rho_theta = 0.8;
rho_q = 0.8;
rho_v = 0;
phi_pi = 1.5;
phi_x = 0;
s_r = 0.01;
s_q = 0.01;
s_theta = 0.01;
s_a = 0.0125;

%% Declare variable names

VARNAMES = {'x';
            'pi';
            'r';
            'rn';
            'yn';
            'y';
            'qe';
            'a';
            'theta';
            'v'};

% VARNAMES = {'rn',
%             'pi',
%             'y',
%             'yn',
%             'qe',
%             'theta',
%             'x',
%             'rn',
%             'a',
%             'v'};

%% Define matrices

AA = [];

BB = [];

CC = [];

DD = [];

JJ = [];

KK = [];

FF = [1, (1 - z) / sigma, 0, 0, 0, 0;
      0, beta, 0, 0, 0, 0;
      0, 0, 0, 0, 0, 0;
      0, 0, 0, 0, 0, 0;
      0, 0, 0, 0, 0, 0;
      0, 0, 0, 0, 0, 0];

GG = [-1, 0, - (1 - z) / sigma, (1 - z) / sigma, 0, 0;
      gamma * zeta, -1, 0, 0, 0, 0;
      (1 - rho_r) * phi_x, (1 - rho_r) * phi_pi, -1, 0, 0, 0;
      0, 0, 0, -1, 0, 0;
      0, 0, 0, 0, -1, 0;
      1, 0, 0, 0, 1, -1];

HH = [0, 0, 0, 0, 0, 0;
      0, 0, 0, 0, 0, 0;
      0, 0, rho_r, 0, 0, 0;
      0, 0, 0, 0, 0, 0;
      0, 0, 0, 0, 0, 0;
      0, 0, 0, 0, 0, 0];

LL = [-z * bcb, 0, -z * bfi, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0];

MM = [z * bcb, 0, z * bfi, 0;
      - (z * gamma * sigma * bcb) / (1 - z), 0, - (z * gamma * sigma * bfi) / (1 - z), 0;
      0, 0, 0, 1;
      0, - ((1 - rho_a) * (1 + chi) * sigma) / ((1 - z) * chi + sigma), 0, 0;
      0, ((1 - z) * (1 + chi)) / ((1 - z) * chi + sigma), 0, 0;
      0, 0, 0, 0];

NN = [rho_q, 0, 0, 0;
      0, rho_a, 0, 0;
      0, 0, rho_theta, 0;
      0, 0, 0, rho_v];

Sigma = [s_q ^ 2, 0, 0, 0;
         0, s_a ^ 2, 0, 0;
         0, 0, s_theta ^ 2, 0;
         0, 0, 0, s_r ^ 2];

%% Set runtime settings

l_equ = 0;
q_expectational_equ = 6;
m_states = 6;
n_endog = 0;
k_exog = 4;

DO_PLOTS = 1;
DO_IMPRESP = 1;
DO_SHOCK_RESP = 1;
SELECT_SHOCKS = 1:k_exog;
IMP_SELECT = 1:(m_states + n_endog + k_exog);
IMP_SUBPLOT = 1;
IMP_SINGLE = 0;
IMP_JOINT = 0;
HORIZON = 20;

%% Call Uhlig's 'do_it'
do_it;
