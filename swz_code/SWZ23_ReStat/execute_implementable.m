clear
close all
cd('model')

% set parameters
beta = 0.995;
z = 0.33;
sigma = 1;
bfi = 0.7;
bcb = 1-bfi;
gamma = 0.086;
zeta = 2;
phipi = 1.5;
phix = 0.0;
rhotr = 0.0;
rhor = 0.8;
rhot = 0.8;
rhoq = 0.0;
thetapi = -0;
thetax = -0;
chi = 1;
thetas = 0;

save param_implement beta z sigma bfi bcb gamma zeta phipi phix rhotr rhor rhot rhoq thetapi thetax chi thetas

% place to save volatilities
H = 21;
vol = zeros(4,2);
qe_irf_theta = zeros(4,H);
qe_irf_rstar = zeros(4,H);
rs_irf_theta = zeros(4,H);
rs_irf_rstar = zeros(4,H);
x_irf_theta = zeros(4,H);
x_irf_rstar = zeros(4,H);
pi_irf_theta = zeros(4,H);
pi_irf_rstar = zeros(4,H);

% solve model with optimal rule
dynare model_optimal noclearall nolog nostrict

vol(1,1) = sqrt(oo_.var(1,1));
vol(1,2) = sqrt(oo_.var(2,2));
qe_irf_theta(1,:) = qe_et';
qe_irf_rstar(1,:) = qe_er';
rs_irf_theta(1,:) = rs_et';
rs_irf_rstar(1,:) = rs_er';
x_irf_theta(1,:) = x_et';
x_irf_rstar(1,:) = x_er';
pi_irf_theta(1,:) = pi_et';
pi_irf_rstar(1,:) = pi_er';


% model with basic rule
dynare model_implement noclearall nolog nostrict

vol(2,1) = sqrt(oo_.var(1,1));
vol(2,2) = sqrt(oo_.var(2,2));
qe_irf_theta(2,:) = qe_et';
qe_irf_rstar(2,:) = qe_er';
rs_irf_theta(2,:) = rs_et';
rs_irf_rstar(2,:) = rs_er';
x_irf_theta(2,:) = x_et';
x_irf_rstar(2,:) = x_er';
pi_irf_theta(2,:) = pi_et';
pi_irf_rstar(2,:) = pi_er';

% model where you respond to output gap in QE specification
phipi = 1.5;
phix = 0.0;
thetapi = -0;
thetax = -1.5;

save param_implement beta z sigma bfi bcb gamma zeta phipi phix rhotr rhor rhot rhoq thetapi thetax chi thetas
dynare model_implement noclearall nolog nostrict

vol(3,1) = sqrt(oo_.var(1,1));
vol(3,2) = sqrt(oo_.var(2,2));
qe_irf_theta(3,:) = qe_et';
qe_irf_rstar(3,:) = qe_er';
rs_irf_theta(3,:) = rs_et';
rs_irf_rstar(3,:) = rs_er';
x_irf_theta(3,:) = x_et';
x_irf_rstar(3,:) = x_er';
pi_irf_theta(3,:) = pi_et';
pi_irf_rstar(3,:) = pi_er';

% do model where you respond to output gap in QE specification and
% inflation in Taylor rule, but twice as much
phipi = 5;
phix = 0.0;
thetapi = -0;
thetax = -5;

save param_implement beta z sigma bfi bcb gamma zeta phipi phix rhotr rhor rhot rhoq thetapi thetax chi thetas
dynare model_implement noclearall nolog nostrict

vol(4,1) = sqrt(oo_.var(1,1));
vol(4,2) = sqrt(oo_.var(2,2));
qe_irf_theta(4,:) = qe_et';
qe_irf_rstar(4,:) = qe_er';
rs_irf_theta(4,:) = rs_et';
rs_irf_rstar(4,:) = rs_er';
x_irf_theta(4,:) = x_et';
x_irf_rstar(4,:) = x_er';
pi_irf_theta(4,:) = pi_et';
pi_irf_rstar(4,:) = pi_er';

% model where you respond to output gap in QE specification and
% inflation in Taylor rule, but twice as much
phipi = 15;
phix = 0;
thetapi = -0;
thetax = -15;

save param_implement beta z sigma bfi bcb gamma zeta phipi phix rhotr rhor rhot rhoq thetapi thetax chi thetas
dynare model_implement noclearall nolog nostrict

vol(5,1) = sqrt(oo_.var(1,1));
vol(5,2) = sqrt(oo_.var(2,2));
qe_irf_theta(5,:) = qe_et';
qe_irf_rstar(5,:) = qe_er';
rs_irf_theta(5,:) = rs_et';
rs_irf_rstar(5,:) = rs_er';
x_irf_theta(5,:) = x_et';
x_irf_rstar(5,:) = x_er';
pi_irf_theta(5,:) = pi_et';
pi_irf_rstar(5,:) = pi_er';


t = 0:20;

figure
subplot(2,2,1)
plot(t,4*pi_irf_rstar(1,:),'-k',t,4*pi_irf_rstar(2,:),'--b',t,4*pi_irf_rstar(3,:),':r',t,4*pi_irf_rstar(4,:),'-.g',t,4*pi_irf_rstar(5,:),'--m+','Linewidth',1.5)
ylabel('Inflation')
xlabel('Horizon')
grid on

subplot(2,2,2)
plot(t,x_irf_rstar(1,:),'-k',t,x_irf_rstar(2,:),'--b',t,x_irf_rstar(3,:),':r',t,x_irf_rstar(4,:),'-.g',t,x_irf_rstar(5,:),'--m+','Linewidth',1.5)
ylabel('Gap')
xlabel('Horizon')
grid on

subplot(2,2,3)
plot(t,4*rs_irf_rstar(1,:),'-k',t,4*rs_irf_rstar(2,:),'--b',t,4*rs_irf_rstar(3,:),':r',t,4*rs_irf_rstar(4,:),'-.g',t,4*rs_irf_rstar(5,:),'--m+','Linewidth',1.5)
grid on
ylabel('Interest Rate')
xlabel('Horizon')

subplot(2,2,4)
plot(t,qe_irf_rstar(1,:),'-k',t,qe_irf_rstar(2,:),'--b',t,qe_irf_rstar(3,:),':r',t,qe_irf_rstar(4,:),'-.g',t,qe_irf_rstar(5,:),'--m+','Linewidth',1.5)
ylabel('QE')
xlabel('Horizon')
grid on
legend('Optimal','\phi_{\pi} = 1.5, \lambda_{x} = 0','\phi_{\pi} = 1.5, \lambda_{x} = 1.5','\phi_{\pi} = 5, \lambda_{x} = 5','\phi_{\pi} = 15, \lambda_{x} = 15','Location','southeast')
saveas(gcf,'tau_alpha','epsc')  


figure
subplot(2,2,1)
plot(t,4*pi_irf_theta(1,:),'-k',t,4*pi_irf_theta(2,:),'--b',t,4*pi_irf_theta(3,:),':r',t,4*pi_irf_theta(4,:),'-.g',t,4*pi_irf_theta(5,:),'--m+','Linewidth',1.5)
ylabel('Inflation')
xlabel('Horizon')
grid on

subplot(2,2,2)
plot(t,x_irf_theta(1,:),'-k',t,x_irf_theta(2,:),'--b',t,x_irf_theta(3,:),':r',t,x_irf_theta(4,:),'-.g',t,x_irf_theta(5,:),'--m+','Linewidth',1.5)
ylabel('Gap')
xlabel('Horizon')
grid on

subplot(2,2,3)
plot(t,4*rs_irf_theta(1,:),'-k',t,4*rs_irf_theta(2,:),'--b',t,4*rs_irf_theta(3,:),':r',t,4*rs_irf_theta(4,:),'-.g',t,4*rs_irf_theta(5,:),'--m+','Linewidth',1.5)
ylabel('Interest Rate')
xlabel('Horizon')
grid on

subplot(2,2,4)
plot(t,qe_irf_theta(1,:),'-k',t,qe_irf_theta(2,:),'--b',t,qe_irf_theta(3,:),':r',t,qe_irf_theta(4,:),'-.g',t,qe_irf_theta(5,:),'--m+','Linewidth',1.5)
ylabel('QE')
xlabel('Horizon')
grid on
legend('Optimal','\phi_{\pi} = 1.5, \lambda_{x} = 0','\phi_{\pi} = 1.5, \lambda_{x} = 1.5','\phi_{\pi} = 5, \lambda_{x} = 5','\phi_{\pi} = 15, \lambda_{x} = 15','Location','southeast')
saveas(gcf,'tau_alpha','epsc')  

