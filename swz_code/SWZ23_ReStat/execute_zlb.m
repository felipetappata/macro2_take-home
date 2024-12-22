clear
close all
cd('model')

global z sigma rf_irf gamma zeta a2 H T omega beta

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

% exogenous processes
rhoA = 0.8;
rhoq = 0.8;
rhot = 0.8;
sA = 0.01;
sq = 0.01;
st = 0.01;
sr = 0.01;

% save parameters
gamma = (1-phi)*(1-phi*beta)/phi;
zeta = (chi*(1-z)+sigma)/(1-z);
a1 = bfis/bs;
a2 = bcbs/bs;
alpha = 0.75; % probability of remaining in ZLB, so expected duration = 1/(1-alpha)
T = 21; % length of IRF to calculate
a33 = [0 ]; % coefficient on rf
Q = size(a33,2);

% simulate path of rf
rf_irf = zeros(T,1);
rf_irf(1,1) = -0.0025;
for j = 2:T
    rf_irf(j,1) = rhoA*rf_irf(j-1,1);
end
pi_irf = zeros(T,Q);
x_irf = zeros(T,Q);
qe_irf = zeros(T,Q);

for i = 1:Q
    tau = a33(i);

omega1 = (1-z)*gamma*zeta/(sigma*(1-alpha*rhoA)*(1-alpha*beta*rhoA)-(1-z)*gamma*zeta*alpha*rhoA);
omega2 = (1-alpha*beta*rhoA)/(gamma*zeta)*omega1;
pi_irf(1,i) = omega1*rf_irf(1,1);
x_irf(1,i) = omega2*rf_irf(1,1);
qe_irf(1,i) = tau*rf_irf(1,1);

for j = 2:T
    pi_irf(j,i) = alpha^(j-1)*omega1*rf_irf(j,1);
    x_irf(j,i) = alpha^(j-1)*omega2*rf_irf(j,1);
    qe_irf(j,i) = alpha^(j-1)*tau*rf_irf(j,1);
end

end

t = 1:T;

% optimal policy
omega1h = (1-z)*(1-alpha*beta*rhoA)/(sigma*(1-alpha*rhoA)*(1-alpha*beta*rhoA)-gamma*zeta*(1-z)*alpha*rhoA);
omega2h = (1-z)*gamma*zeta/(sigma*(1-alpha*rhoA)*(1-alpha*beta*rhoA)-gamma*zeta*(1-z)*alpha*rhoA);
b1 = z*sigma*a2*((1-alpha*rhoA)*(1-alpha*beta*rhoA) - gamma*alpha*rhoA)/(sigma*(1-alpha*rhoA)*(1-alpha*beta*rhoA)-gamma*zeta*(1-z)*alpha*rhoA);
b2 = (gamma*sigma*z*a2*(zeta*(1-z)*((1-alpha*rhoA)*(1-alpha*beta*rhoA)-gamma*alpha*rhoA) - sigma*(1-alpha*rhoA)*(1-alpha*beta*rhoA) + gamma*zeta*(1-z)*alpha*rhoA)/((1-alpha*beta*rhoA)*(1-z)*(sigma*(1-alpha*rhoA)*(1-alpha*beta*rhoA) - gamma*zeta*(1-z)*alpha*rhoA)));

ii = [0.0001 1 100]; 
Q = size(ii,2);

pi_irf2 = zeros(T,Q);
x_irf2 = zeros(T,Q);
qe_irf2 = zeros(T,Q);

for i = 1:Q
    mu = ii(i);
    
    phi2=-(gamma*zeta*(1-z)-gamma*sigma)/(mu*(1-z));
    psi1=gamma*(1-z)/(gamma*sigma*(1-alpha*rhoA)*phi2-alpha*gamma*rhoA*(1-z)+(1-z)*(1-alpha*rhoA)*(1-gamma*zeta*phi2-alpha*beta*rhoA));
    psi2=psi1*phi2;
    tau=-(1-gamma*zeta*phi2-alpha*beta*rhoA)*(1-z)/(z*gamma*sigma*a2)*psi1;

pi_irf2(1,i) = psi1*rf_irf(1,1);
x_irf2(1,i) = psi2*rf_irf(1,1);
qe_irf2(1,i) = tau*rf_irf(1,1);

for j = 2:T
    pi_irf2(j,i) = alpha^(j-1)*psi1*rf_irf(j,1);
    x_irf2(j,i) = alpha^(j-1)*psi2*rf_irf(j,1);
    qe_irf2(j,i) = alpha^(j-1)*tau*rf_irf(j,1);
end

end


figure
subplot(2,2,1)
plot(t,400*rf_irf,'k','Linewidth',2)
ylabel('Natural Rate')
xlabel('Horizon')
grid on 
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})


subplot(2,2,2)
plot(t,100*x_irf(:,1),'k',t,100*x_irf2(:,1),'--b',t,100*x_irf2(:,2),'-.m',t,100*x_irf2(:,3),':r','Linewidth',2)
ylabel('Output Gap')
xlabel('Horizon')
grid on
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})


subplot(2,2,3)
plot(t,400*pi_irf(:,1),'k',t,400*pi_irf2(:,1),'--b',t,400*pi_irf2(:,2),'-.m',t,400*pi_irf2(:,3),':r','Linewidth',2)
ylabel('Inflation')
xlabel('Horizon')
grid on
legend('No QE','\mu \rightarrow 0', '\mu = 1','\mu = 100','Location','southeast')
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})


subplot(2,2,4)
plot(t,100*qe_irf(:,1),'k',t,100*qe_irf2(:,1),'--b',t,100*qe_irf2(:,2),'-.m',t,100*qe_irf2(:,3),':r','Linewidth',2)
ylabel('QE')
xlabel('Horizon')
grid on
xlim([1 21])
xticks([1 6 11 16 21])
xticklabels({'0','5','10','15','20'})

saveas(gcf,'four_endo_zlb2','epsc')  