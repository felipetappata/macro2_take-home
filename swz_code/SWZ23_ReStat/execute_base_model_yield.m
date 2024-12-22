clear
close all
addpath c:\dynare\4.5.6\matlab
cd('model')

beta = 0.995; % discount rate patient
Pis = 1; % trend inflation
Rss = Pis/beta; % SS short rate
Rres = Rss; % SS rate on reserves
sp = 2/400; % targeted spread
Rbs = sp + Rss; % steady state long rate
betab = beta*Rss/Rbs; % discount factor impatient
epsi = 11; % elasticity of sub
pms = (epsi-1)/epsi; % steady state markup
ws = pms; % steady state wage
Ls = 1; % targeted SS labor
phi = 0.75; % calvo parameter
prs = ( ( 1-phi*Pis^(epsi-1) )/(1-phi))^(1/(1-epsi)); % SS reset price
vs = (1-phi)*prs^(-epsi)/(1-phi*Pis^(epsi)); % SS dispersion
Ys = Ls/vs; % SS output
z = 0.33; % Targeted share of impatient types
Cbs = z*Ys; % SS consumption impatient
Cs = (1-z)*Ys; % SS consumptin patient
chi = 1; % Inverse Frisch
sigma = 1; % EIS
psi = Cs^(-sigma)*ws/Ls^(chi); % Labor disutility consistent with 
r = 0.1; % SS reserve/output ratio
res = r*Ys; % SS reserves
kappa = 1 - 40^(-1); % Perpetuity decay
Qs = (Rbs - kappa)^(-1); % Steady state bond price
bcbs = res/Qs; % steady state CB bond holdings
bs = Cbs/Qs;
Xb = (Rbs*Qs*bs);
bfis = bs - bcbs; % Steady state FI bond holdings
thetas = 5; % modified leverage ratio
Xfi = Qs*bfis/thetas; % Transfer to FI
ss = Qs*bfis*(1-kappa*Pis^(-1)) + res - Xfi; % steady state deposits/saving
qes = Qs*bcbs;

% checks
Ds = Ys - ws*Ls; % production dividends
Dfi = Rbs*Qs*bfis + Rres*res - Rss*ss; % FI dividends
Ts = -Rbs*Qs*bcbs + Rres*res; % lump sum transfer (should be negative because it is a transfer)

check = Cs + ss - ws*Ls - Rss*ss - Ds - Dfi + Ts + kappa*Qs*bfis + Xfi + Xb; % should be zero -- patient household budget constraint)
check2 = Cbs + bs - Qs*bs*(1-kappa) - Xb;

% taylor rule
rhor = 0.8;
phipi = 1.5;
phix = 0.0;

% exogenous processes
rhoA = 0.8;
rhoq = 0.8;
rhot = 0.8;

srf = 1/400; % desired shock to natural rate. Pick sA to generate this -- 100 basis points annualized
sA = abs(.01*(chi*(1-z) + sigma)/((1+chi)*(1-z)));
sq = 0.01;
st = 0.01;
sr = 0.01;

% save parameters
gamma = (1-phi)*(1-phi*beta)/phi;
zeta = (chi*(1-z)+sigma)/(1-z);
b1 = bfis/bs;
b2 = bcbs/bs;

save param_4nk_yield beta betab z psi chi sigma kappa Xfi Xb thetas epsi phi bcbs phipi phix Pis rhoq rhoA rhot rhor sq sA st sr Rres Rbs Qs bfis res ss Rbs Rss sp bcbs bs Cbs qes gamma zeta b1 b2

% four equation model
dynare model_4nk_yield noclearall nolog

xr = Y_eA(1)/Y_er(1);
xq = Y_eA(1)/Y_eq(1);
xt = Y_eA(1)/Y_et(1);
check1 = Yf_eA(1);
Yirf0 = [Y_eA xr*Y_er xq*Y_eq xt*Y_et];
Piirf0 = [Pi_eA xr*Pi_er xq*Pi_eq xt*Pi_et];
Xirf0 = [X_eA xr*X_er xq*X_eq xt*X_et];
Rsirf0 = [Rs_eA xr*Rs_er xq*Rs_eq xt*Rs_et];
spread0 = [spread_eA xr*spread_er xq*spread_eq xt*spread_et];
T_et = xt*theta_et;
QE_eq = xq*qe_eq;

T = size(Y_eA,1);
t = 1:T;

figure
plot(t,400*spread0(:,2),'-k',t,400*spread0(:,3),'--b','Linewidth',2)
grid on
xlabel('Horizon')
ylabel('Excess Return')
legend('MP Shock', 'QE Shock')
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})
saveas(gcf,'four_spreads','epsc')  
