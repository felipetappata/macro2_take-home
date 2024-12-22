clear
close all
addpath c:\dynare\6.2\matlab
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

save param_4nk beta betab z psi chi sigma kappa Xfi Xb thetas epsi phi bcbs phipi phix Pis rhoq rhoA rhot rhor sq sA st sr Rres Rbs Qs bfis res ss Rbs Rss sp bcbs bs Cbs qes gamma zeta b1 b2

% four equation model
dynare model_4nk noclearall nolog
% calculate conversions
xr = oo_.irfs.Y_eA(1)/oo_.irfs.Y_er(1);
xq = oo_.irfs.Y_eA(1)/oo_.irfs.Y_eq(1);
xt = oo_.irfs.Y_eA(1)/oo_.irfs.Y_et(1);
check1 = oo_.irfs.Yf_eA(1);
Yirf0 =  [oo_.irfs.Y_eA'  xr*oo_.irfs.Y_er'  xq*oo_.irfs.Y_eq'  xt*oo_.irfs.Y_et'];
Piirf0 = [oo_.irfs.Pi_eA' xr*oo_.irfs.Pi_er' xq*oo_.irfs.Pi_eq' xt*oo_.irfs.Pi_et'];
Xirf0 =  [oo_.irfs.X_eA'  xr*oo_.irfs.X_er'  xq*oo_.irfs.X_eq'  xt*oo_.irfs.X_et'];
Rsirf0 = [oo_.irfs.Rs_eA' xr*oo_.irfs.Rs_er' xq*oo_.irfs.Rs_eq' xt*oo_.irfs.Rs_et'];
T_et = xt*oo_.irfs.theta_et;
QE_eq = xq*oo_.irfs.qe_eq;

% three equation model
sA = abs(.01*(chi*(1-0) + sigma)/((1+chi)*(1-0)));
zeta = (chi*(1-0)+sigma)/(1-0);
save param_3nk beta betab z psi chi sigma kappa Xfi Xb thetas epsi phi bcbs phipi phix Pis rhoq rhoA rhot rhor sq sA st sr Rres Rbs Qs bfis res ss Rbs Rss sp bcbs bs Cbs qes gamma zeta b1 b2
dynare model_3nk noclearall nolog
Yirf1 =  [oo_.irfs.Y_eA'  xr*oo_.irfs.Y_er'  xq*oo_.irfs.Y_eq'  xt*oo_.irfs.Y_et'];
Piirf1 = [oo_.irfs.Pi_eA' xr*oo_.irfs.Pi_er' xq*oo_.irfs.Pi_eq' xt*oo_.irfs.Pi_et'];
Xirf1 =  [oo_.irfs.X_eA'  xr*oo_.irfs.X_er'  xq*oo_.irfs.X_eq'  xt*oo_.irfs.X_et'];
Rsirf1 = [oo_.irfs.Rs_eA' xr*oo_.irfs.Rs_er' xq*oo_.irfs.Rs_eq' xt*oo_.irfs.Rs_et'];
check2 = oo_.irfs.Yf_eA(1);

T = size(Yirf0,1);
t = 1:T;

% Productivity / Natural Rate Shock
figure
subplot(2,2,1)
plot(t,100*Yirf0(:,1),'-k',t,100*Yirf1(:,1),'--b','Linewidth',2)
xlabel('Horizon')
ylabel('Output')
grid on 
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})

subplot(2,2,2)
plot(t,100*Xirf0(:,1),'-k',t,100*Xirf1(:,1),'--b','Linewidth',2)
xlabel('Horizon')
ylabel('Output Gap')
grid on 
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})

subplot(2,2,3)
plot(t,400*Piirf0(:,1),'-k',t,400*Piirf1(:,1),'--b','Linewidth',2)
xlabel('Horizon')
ylabel('Inflation')
grid on 
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})

subplot(2,2,4)
plot(t,400*Rsirf0(:,1),'-k',t,400*Rsirf1(:,1),'--b','Linewidth',2)
xlabel('Horizon')
ylabel('Interest Rate')
grid on 
legend('4 eq NK','3 eq NK','Location','southeast')
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})
saveas(gcf,'four_nat','epsc')  

% Monetary Shock
figure
subplot(2,2,1)
plot(t,100*Yirf0(:,2),'-k',t,100*Yirf1(:,2),'--b','Linewidth',2)
xlabel('Horizon')
ylabel('Output')
grid on 
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})

subplot(2,2,2)
plot(t,100*Xirf0(:,2),'-k',t,100*Xirf1(:,2),'--b','Linewidth',2)
xlabel('Horizon')
ylabel('Output Gap')
grid on 
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})

subplot(2,2,3)
plot(t,400*Piirf0(:,2),'-k',t,400*Piirf1(:,2),'--b','Linewidth',2)
xlabel('Horizon')
ylabel('Inflation')
grid on 
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})

subplot(2,2,4)
plot(t,400*Rsirf0(:,2),'-k',t,400*Rsirf1(:,2),'--b','Linewidth',2)
xlabel('Horizon')
ylabel('Interest Rate')
grid on 
legend('4 eq NK','3 eq NK')
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})
saveas(gcf,'four_pol','epsc')  

% Leverage Shock
figure
subplot(2,2,1)
plot(t,100*Yirf0(:,4),'-k',t,100*Yirf1(:,4),'--b','Linewidth',2)
xlabel('Horizon')
ylabel('Output')
grid on 
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})

subplot(2,2,2)
plot(t,100*Xirf0(:,4),'-k',t,100*Xirf1(:,4),'--b','Linewidth',2)
xlabel('Horizon')
ylabel('Output Gap')
grid on 
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})

subplot(2,2,3)
plot(t,400*Piirf0(:,4),'-k',t,400*Piirf1(:,4),'--b','Linewidth',2)
xlabel('Horizon')
ylabel('Inflation')
grid on 
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})

subplot(2,2,4)
plot(t,400*Rsirf0(:,4),'-k',t,400*Rsirf1(:,4),'--b','Linewidth',2)
xlabel('Horizon')
ylabel('Interest Rate')
grid on 
legend('4 eq NK','3 eq NK')
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})
saveas(gcf,'four_lev_qe','epsc')  
