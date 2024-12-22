% filepath: /Users/felipe/Library/CloudStorage/OneDrive-UniversidadTorcuatoDiTella/Maeco/1. Primer Año/Tercer Trimestre/macro2 - Macroeconomía II/take-home/code/swz/swz_brute_force.m

% SWZ 4-Equation New Keynesian Model - Brute Force Implementation
% Based on Sims, Wu and Zhang (2023)

disp('4-Equation New Keynesian Model - Brute Force Implementation');
disp('Hit any key when ready...');
pause;

%% 1. Parameter Settings
% Core parameters
beta = 0.995; % Discount factor parent
betab = 0.99; % Discount factor child
z = 0.33; % Child share of consumption
sigma = 1; % Inverse elasticity of substitution
chi = 1; % Inverse Frisch elasticity
phi = 0.75; % Calvo parameter
gamma = (1 - phi) * (1 - phi * beta) / phi; % Phillips curve coefficient
zeta = (chi * (1 - z) + sigma) / (1 - z); % Elasticity of marginal cost to gap

% Policy parameters
rhor = 0.8; % Taylor rule smoothing
phipi = 1.5; % Taylor rule inflation response
phix = 0; % Taylor rule output gap response

% Shock processes
rhoA = 0.8; % AR(1) productivity
rhot = 0.8; % AR(1) credit shock
rhoq = 0.8; % AR(1) QE shock
sigma_eA = 0.01; % Std dev productivity shock
sigma_et = 0.01; % Std dev credit shock
sigma_eq = 0.01; % Std dev QE shock

% Bond market parameters
b1 = 0.7; % Weight on credit in IS/PC curves (bfis/bs)
b2 = 0.3; % Weight on QE in IS/PC curves (bcbs/bs)

%% 2. Model Variables Setup
% Declaring variable names for clarity
VARNAMES = ['Output Gap      ',
            'Inflation       ',
            'Policy Rate     ',
            'Natural Rate    ',
            'QE              ',
            'Credit Shock    ',
            'Potential Output'];
%%
% Order of variables in state vector:
% x(t) = [x_t, pi_t, R_t, R*_t, qe_t, theta_t, Y*_t]

%% 3. System Matrices
% The model has 4 key equations:
% 1) IS curve:
% x_t = E_t[x_t+1] - ((1-z)/sigma)(R_t - E_t[pi_t+1] - R*_t)
%       - z(b1(E_t[theta_t+1] - theta_t) + b2(E_t[qe_t+1] - qe_t))

% 2) Phillips curve:
% pi_t = gamma*zeta*x_t - (gamma*sigma*z/(1-z))(b1*theta_t + b2*qe_t) + beta*E_t[pi_t+1]

% 3) Taylor rule:
% R_t = rhor*R_t-1 + (1-rhor)(phipi*pi_t + phix*x_t)

% 4) QE rule (exogenous process):
% qe_t = rhoq*qe_t-1

% Number of variables
n = 7; % Number of variables in state vector

%---Block of Deterministic Equations

% Brute Force Approach:
% Not needed for solving, but code counts variables with the dimension of
% these matrices

% for x(t): matrix A

AA = zeros(0,n);


% for x(t-1): matrix B

BB = zeros(0,n);

% for y(t): matrix C
%Order: Same as vector y(t)

CC = zeros(0,n);


% for z(t) matrix D

DD = zeros(0,n);
   
% For x(t+1): Matrix F
FF = zeros(n, n);
FF(1, 1) = 1; % E_t[x_t+1] in IS curve
FF(1, 2) = (1 - z) / sigma; % E_t[pi_t+1] in IS curve
FF(2, 2) = beta; % E_t[pi_t+1] in Phillips curve
FF(1, 6) = -z * b1; % E_t[theta_t+1] in IS curve
FF(1, 5) = -z * b2; % E_t[qe_t+1] in IS curve

% For x(t): Matrix G
GG = zeros(n, n);
GG(1, 1) = -1; % x_t in IS curve
GG(1, 3) =- (1 - z) / sigma; % R_t in IS curve
GG(1, 4) = (1 - z) / sigma; % R*_t in IS curve
GG(1, 6) = z * b1; % theta_t in IS curve
GG(1, 5) = z * b2; % qe_t in IS curve

GG(2, 1) = gamma * zeta; % x_t in Phillips curve
GG(2, 2) = -1; % pi_t in Phillips curve
GG(2, 6) =- (gamma * sigma * z / (1 - z)) * b1; % theta_t in Phillips curve
GG(2, 5) =- (gamma * sigma * z / (1 - z)) * b2; % qe_t in Phillips curve

GG(3, 2) = (1 - rhor) * phipi; % pi_t in Taylor rule
GG(3, 1) = (1 - rhor) * phix; % x_t in Taylor rule
GG(3, 3) = -1; % R_t in Taylor rule

% For x(t-1): Matrix H
HH = zeros(n, n);
HH(3, 3) = rhor; % R_t-1 in Taylor rule
HH(5, 5) = rhoq; % qe_t-1 in QE rule

% Shock processes
NN = zeros(3, 3);
NN(1, 1) = rhoA; % TFP shock
NN(2, 2) = rhot; % Credit shock
NN(3, 3) = rhoq; % QE shock

% Variance-covariance matrix of shocks
Sigma = zeros(3, 3);
Sigma(1, 1) = sigma_eA ^ 2;
Sigma(2, 2) = sigma_et ^ 2;
Sigma(3, 3) = sigma_eq ^ 2;

%% 4. Options for Solution and Simulation

% Time period settings
PERIOD = 4; % Quarterly model
HORIZON = 40; % IRF horizon

% Variable selection
IMP_SELECT = 1:n; % Plot all variables
DO_IMPRESP = 1; % Calculate IRFs
DO_MOMENTS = 0; % Skip moment calculations
DO_SIMUL = 0; % Skip simulations

% IRF options
DO_SHOCK_RESP = 1; % Calculate shock responses
SELECT_SHOCKS = 1:3; % All shocks
INIT_DATE = 1; % Start period
DO_PLOTS = 1; % Generate plots
IMP_SUBPLOT = 1; % Use subplots

%% 5. Call Solver
% Note: This requires Uhlig's toolkit with do_it.m
do_it;

%% 6. Post-Processing
% Add any additional analysis of results here
