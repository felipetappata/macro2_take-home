clear
close all
cd('model')

global z sigma gamma zeta b1 b2 eta beta rhot

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
%sA = abs(srf/(sigma*(rhoA - 1)*(chi*(1-z)+sigma)/(1-z)^2));
sA = abs(srf*(chi*(1-z)+sigma)/(sigma*(rhoA-1)*(1+chi)));
sA = abs(.01*(chi*(1-z) + sigma)/((1+chi)*(1-z)));
%sA = 0.01;
sq = 0.01;
st = 0.01;
sr = 0.01;

% save parameters
gamma = (1-phi)*(1-phi*beta)/phi;
zeta = (chi*(1-z)+sigma)/(1-z);
b1 = bfis/bs;
b2 = bcbs/bs;

et = 0;
QQ = size(et,2);
T = 21;
theta_irf = zeros(T,1);
theta_irf(1,1) = 0.01;
for j = 2:T
    theta_irf(j,1) = rhot*theta_irf(j-1,1);
end
pi_irf = zeros(T,QQ);
x_irf = zeros(T,QQ);
rs_irf = zeros(T,QQ);
for ii = 1:QQ
    eta = et(ii);
mu = 1;

varphi1 = -((1-rhot)*z*gamma*b1*(zeta-sigma/(1-z)))/((1-z)/sigma*rhot*gamma*zeta-(1-beta*rhot)*(1-rhot));
varphi2 = ((1-beta*rhot)*varphi1+z*gamma*sigma*b1/(1-z))/(gamma*zeta);
T = 21;

% simulate path of theta


pi_irf(1,ii) = varphi1*theta_irf(1,1);
x_irf(1,ii) = varphi2*theta_irf(1,1);
rs_irf(1,ii) = eta*theta_irf(1,1);

for j = 2:T
    pi_irf(j,ii) = varphi1*theta_irf(j,1);
    x_irf(j,ii) = varphi2*theta_irf(j,1);
    rs_irf(j,ii) = eta*theta_irf(j,1);
end

end

t = 1:T;

% prepopulate 
mt = [0.00001 1 100];
Q = size(mt,2);
pi_irf2 = zeros(T,Q);
x_irf2 = zeros(T,Q);
rs_irf2 = zeros(T,Q);
eta_hold = zeros(1,Q);

for ii = 1:Q
mu = mt(ii);

varphi1 = -mu*z*gamma*sigma*b1/((1-z)*(gamma^2*zeta^2+mu*(1-beta*rhot)));
varphi2 = -gamma*zeta/mu*varphi1;

% pick eta optimally
eta_opt = rhot*varphi1+sigma*gamma*zeta*(1-rhot)/(mu*(1-z))*varphi1+(1-rhot)*sigma*z*b1/(1-z);
eta_hold(ii) = eta_opt;

% compute optimal IRFs
eta = eta_opt;



pi_irf2(1,ii) = varphi1*theta_irf(1,1);
x_irf2(1,ii) = varphi2*theta_irf(1,1);
rs_irf2(1,ii) = eta*theta_irf(1,1);

for j = 2:T
    pi_irf2(j,ii) = varphi1*theta_irf(j,1);
    x_irf2(j,ii) = varphi2*theta_irf(j,1);
    rs_irf2(j,ii) = eta*theta_irf(j,1);
end

end


t = 1:T;


figure
subplot(2,2,1)
plot(t,100*theta_irf,'--b',t,100*theta_irf,'-.m',t,100*theta_irf,':r','Linewidth',2)
ylabel('Credit Shock')
xlabel('Horizon')
grid on 
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})

subplot(2,2,2)
plot(t,100*x_irf2(:,1),'--b',t,100*x_irf2(:,2),'-.m',t,100*x_irf2(:,3),':r','Linewidth',2)
ylabel('Output Gap')
xlabel('Horizon')
grid on 
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})

subplot(2,2,3)
plot(t,400*pi_irf2(:,1),'--b',t,400*pi_irf2(:,2),'-.m',t,400*pi_irf2(:,3),':r','Linewidth',2)
ylabel('Inflation')
xlabel('Horizon')
grid on 
legend('\mu \rightarrow 0', '\mu = 1','\mu = 100','Location','southeast')
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})

subplot(2,2,4)
plot(t,400*rs_irf2(:,1),'--b',t,400*rs_irf2(:,2),'-.m',t,400*rs_irf2(:,3),':r','Linewidth',2)
ylabel('Short Rate')
xlabel('Horizon')
grid on 
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})
saveas(gcf,'four_nozlb2','epsc')  
