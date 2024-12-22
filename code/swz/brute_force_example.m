
% ------------------------------------------------------------------------
% UNIVERSIDAD TORCUATO DI TELLA
% MACROECONOMICS II
% CALIBRATING DSGE MODELS: UHLIG'S TOOLKIT
% NKM: NEW KEYNESIAN MODEL UNDER A MONEY GROWTH RULE
% AND MONEY IN THE UTILITY FUNCTION
% ------------------------------------------------------------------------

disp('New Keynesian Model - Money Growth Rule - Class Replication');

disp('Hit any key when ready...');
pause;

% ------------------------------------------------------------------------

% Setting parameters-------------------------------------------------------


theta   = 2/3;                 % Probability of not changing prices. Mean duration of prices = 1/(1-theta)
alpha   = 1/3;                 % Labor elasticity of output 
betta   = 0.99;                % Discount factor
sigma   = 1;                   % Intertemporal Elasticity of Substitution. 1 then U(c)=log(c)
nu      = 1;                   % Utility for money parameter CHECK INTERPRETATION. 1 then U(m)=log(m)
eta     = 4;                   % abs of LM's slope wrt to nominal interest rate
varphi  = 1;                   % Frisch elasticity of Labor: 1/varphi
phi_pi  = 1.5;                 % Taylor Rule - Nom. Rate response to Inflation
phi_y   = 0.5/4;               % Taylor Rule - Nom. Rate response to Output Gap. /4 for quarters.
chi     = 1;                   % Utility for money parameter CHECK INTERPRETATION
epsilon = 6;                   % Intratemporal elasticity of Substitution. Markup = epsilon/(epsilon-1)
A       = 1;                   % NSS TFP
rho_a   = 0.9;                 % Autorregressive coefficient of TFP
rho_mu  = 0.5;                 % Autorregressive coefficient of Money Growth 
rho_v   = 0.5;                 % Autorregressive coefficient of Nom. Interest Rate shocks

Theta   = 0.25;                % named parameter
lambda  = 0.0425;              % named parameter
kappa   = 0.1275;              % Slope of NKPC wrt Output Gap
psi_yn  = 1;                   % Slope of Output Gap wrt TFP 

sigma_e_A  = .712;             % Standard deviation of TFP shock.  Units: Percent.
sigma_e_mu = .9;               % Standard deviation of Money Growth shock.  Units: Percent.
sigma_e_v  = .9;               % Standard deviation of Nominal Interest Rate shocks.  Units: Percent.

% Calculating the steady state --------------------------------------------



pi_bar   =  0;
i_bar    = -log(betta);
r_bar    =  i_bar;
rn_bar   =  r_bar; %from DIS in NSS
Mkp_bar  =  epsilon / (epsilon - 1);
A_bar    =  A;
N_bar    =  ((Mkp_bar^(-1)) * (A_bar^(1-sigma)))^(1/(alpha+varphi+sigma*(1-alpha)));
Y_bar    =  A_bar * (N_bar^(1-alpha));
Yn_bar   =  Y_bar; % In NSS, D_bar=1, no price dispersion
ygap_bar =  Y_bar - Yn_bar;
w_bar    =  A_bar * (N_bar^(sigma*(1-alpha)+varphi));
m_bar    =  (chi^(1/nu)) * (Y_bar^(sigma/nu)) * ((1-betta)^(-1/nu));

mu_bar   = 0; 
v_bar    = 0;

% Declaring the matrices --------------------------------------------------

% Order: [x(t), y(t), z(t)]
% This is the order of the variables in the matrices 

VARNAMES = ['Real Money Stock',
            'Output Gap      ',
            'Inflation       ',
            'Nominal Int Rate',
            'Real Int Rate   ',
            'Natural Int Rate',
            'Natural Output  ',
            'Output          ',
            'Labor           ',
            'Wage Rate       ',
            'Markup          ',
            'TFP             ',
            'TaylorRule Shock'];

% Translating into coefficient matrices.  
% The equations are, conveniently ordered:

% Brute force approach: 
% Declare all variables as endogenous variables.


% Log-linearized MIU Model ------------------------------------------------

% 1)  NKPC
% 2)  DIS
% 3)  LM
% 4)  Fisher Equation
% 5)  Natural Interest Rate
% 6)  Natural Output
% 7)  Output Gap
% 8)  Output
% 9)  Real Wage
% 10) Markup
% 11) TFP
% 12) Taylor Rule
% 13) Process of shocks to TR
% CHECK: 13 equations, 13 variables. (did it in paper)


% Endogenous state variables "x(t)": m, ygap, pi, i, r, rn, Yn, Y, N, w, Mkp
% Endogenous other variables "y(t)": none
% Exogenous state variables  "z(t)": A, v


% Switch to that notation.  Find matrices for format ----------------------


% Deterministic Equations
% 0 = AA x(t) + BB x(t-1) + CC y(t) + DD z(t)

% Expectational Equations
% 0 = E_t [ FF x(t+1) + GG x(t) + HH x(t-1) + JJ y(t+1) + KK y(t) + LL z(t+1) + MM z(t)]

% Exogenous State Variables
% z(t+1) = NN z(t) + epsilon(t+1) with E_t [ epsilon(t+1) ] = 0,



%---Block of Deterministic Equations

% Brute Force Approach:
% Not needed for solving, but code counts variables with the dimension of
% these matrices

% for x(t): matrix A

AA = zeros(0,11);


% for x(t-1): matrix B

BB = zeros(0,11);

% for y(t): matrix C
%Order: Same as vector y(t)

CC = zeros(0,0);


% for z(t) matrix D

DD = zeros(0,2);
   

%---Block of Expectational Equations


%for x(t+1): matrix F

FF = zeros(11,11);

FF(1,3) = betta;
FF(2,2) = 1;
FF(4,3) = -1;

%for x(t): matrix G

GG = zeros(11,11);

GG(1,2) =  kappa;
GG(1,3) = -1;

GG(2,2) = -1;
GG(2,5) = -1/sigma;
GG(2,6) =  1/sigma; 

GG(3,1) = -1;
GG(3,2) =  sigma/nu;
GG(3,4) = -eta;

GG(4,4) =  1;
GG(4,5) = -1;

GG(5,6) = -1;

GG(6,7) = -1;

GG(7,2) = -1;
GG(7,7) = -1;
GG(7,8) =  1;

GG(8,8) = -1;
GG(8,9) =  1-alpha;

GG(9,8)  = sigma + (varphi)/(1-alpha);
GG(9,10) = -1;

GG(10,2)  = -(sigma + (varphi + alpha)/(1-alpha));
GG(10,3)  = (1 + alpha * epsilon / (1-alpha)) * theta / (1-theta);
GG(10,11) = -1;

GG(11,2) = phi_y;
GG(11,3) = phi_pi;
GG(11,4) = -1;

%for x(t-1): matrix H
HH = zeros(11,11);


%for y(t+1): matrix J
JJ = zeros(11,0);


%for y(t): matrix K
KK = zeros(11,0);

%for z(t+1): matrix L
LL = zeros(11,2);

LL(5,1) = sigma * psi_yn;


%for z(t): matrix M
MM = zeros(11,2);

MM(3,1)  =   (sigma / nu) * psi_yn;
MM(5,1)  = - sigma * psi_yn;
MM(6,1)  =   psi_yn;
MM(8,1)  =   1;
MM(9,1)  = - varphi / (1-alpha);
MM(11,2) =   1;

%---Block of Exogenous State Variables


% for z(t): matrix N
NN = zeros(2,2);

NN(1,1) = rho_a;
NN(2,2) = rho_v;

% Variance-Covariance Matrix of Stochastic Processes for Shocks

Sigma = zeros(2,2);
Sigma(1,1) = sigma_e_A^2;
Sigma(2,2) = sigma_e_v^2;



% --- Setting the options:

% Normal approach

[l_equ,m_states] = size(AA);
[l_equ,n_endog ] = size(CC);
[l_equ,k_exog  ] = size(DD);


% Brute Force Approach
%[l_equ,m_states] = size(GG);
%n_endog = 0;
%[l_equ,k_exog  ] = size(MM);

  
PERIOD     = 4;  % # of periods per year, i.e. 12 for monthly, 4 for quarterly
GNP_INDEX  = 3;  % Index of output among the variables selected for HP filter

% -- Simulation options 

IMP_SELECT = [1:size(VARNAMES,1)]; % Vector containing indices of the variables to be plotted
DO_IMPRESP = 1;   % Calculate impulse-responses
DO_MOMENTS = 0; % Calculates moments based on frequency-domain methods
DO_SIMUL   = 0; % Calculates simulations

% -- Statistics options 
DO_HP_FILTER = 1;
HP_SELECT    = 1:(m_states+n_endog+k_exog); % Selecting the variables for the HP Filter calcs.
HP_LAMBDA    = 1600*(PERIOD/4)^4; %lambda paramaeter for HP Filter

N_LEADS_LAGS = 6; % calculate autocorr table up to #-1 leads and lags

SIM_LENGTH = 150; % Length of simulations in # of periods
SIM_MODE   = 2; % 1=one simulated time series, 2=simulation based calculation of moments
SIM_RANDOM_START = 1; %1=random start, 2=predetermined start
%SIM_X_START=zeros(m_states,1); % vector of length m setting initial values
%for endogenous variables x
%SIM_Z_START=zeros(k_exog,1);  % vector of length k setting initial values
%for endogenous variables z
%SIM_GIVEN_EPS = 0; %1=choose shocks, given_eps should be matrix of size
%k_exog X SIM_LENGTH, only relevant for SIM_MODE=2
SIM_N_SERIES = 50; % # of simulated series for calculation of moments
SIM_TRACK_N = 1; % Prints a little message at the start of each simulation
SIM_TRACK_LENGTH = 1; % Prints a little message every simulation

% -- Graphics options
DO_SHOCK_RESP = 1; % 1= Calculates IR for all shocks
SELECT_SHOCKS = 1 : k_exog; % Select shocks to which IRs should be plotted
DO_STATE_RESP = 0; % 1=calculates IR for deviations of state variables
SELECT_STATES = 1:m_states; % select state variables to which IR should be plotted 
INIT_DATE     = 4; % periods before shock 
HORIZON       = 12; % how far IRs should be calculated (!!!)
DO_PLOTS      = 1; % 1=make IR plots, 0=not
IMP_SUBPLOT   = 1; % 1=IRs in subplot
IMP_SUB_FONT  = 5; % size of title and lables in subplots
IMP_SINGLE    = 0; % 1=Each IR in a separate graph, 0=not
IMP_SELECT    = 1:(m_states+n_endog+k_exog); %vector of variables to be plotted
DO_NO_ZERO_RESPONSE = 0; % 1=avoid plotting responses near zero
ZERO_RESPONSE_LEVEL=0.0001; % interval for zero response (-e,e)
DO_ENLARGE    = 0; % 1=large letter for overheads
DO_THCK_LINES = 1; % 1=thicker lines if DO_ENLARGE=1
PRINT_FIT     = 0; % 1=send to printer
SIM_GRAPH     = 1; % 1=Plot simulated series
SIM_SUBPLOT   = 1; % 1=Simulated plots in subplot,0=one plot
SIM_JOINT     = 1; % 1=simulated series n one graph
SIM_SUB_FONT  = 6; % size of title and labels
SIM_MAX       = 200; %maximal umber of dates used for plots
SIM_SELECT    = 1:(m_states+n_endog+k_exog); %Variables for simulation graphs
SIM_DATE0     = 0; % set initial date of simulated series

% only relevant if DO_MOMENTS=1
DO_HP_GRAPH   = 0; % plot spectral densities
MOM_SUBPLOT   = 0; % 1=spectral densities in subplot
MOM_JOINT     = 0; % 1=all spectral densities in one figure
MOM_SINGLE    = 0; % 1=all spectral densities in separate figures
MOM_SUB_FONT  = 8; % size of title and labels
MOM_PLOT_RAW  = 0; %non HP Filtered spectral density plots

% DO_COLOR_PRINT = 1;


% Starting the calculations:

do_it;


 
       

