clear
close all
addpath('occbin_20140630\toolkit_files')
cd('model')% first do ZLB with no QE. Then do ZLB with endogenous QE. irf0 = IRFs
% without ZLB, irf1 = IRFs with ZLB, irf2 = IRFs without ZLB but endogenous
% QE, irf3 = IRFs with ZLB with endogenous QE

nr = 1; % 1 for potential output shock, otherwise for credit shock

% set parameters
beta = 0.995;
z = 0.33;
sigma = 1;
bfi = 0.7;
bcb = 1-bfi;
gamma = 0.086;
zeta = 2;
phipi = 100;
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

addpath('occbin_20140630\toolkit_files')
nperiods=30;
maxiter=150;

modnam = 'model_implement1';
modnamstar = 'model_implement_zlb'; 

constraint = 'rs<-(1/beta-1)';
constraint_relax = 'rsnot>-(1/beta-1)';


baseline1= zeros(10,2);

scenario= baseline1;
if nr == 1
scenario(end,1) = 0.0001; % make the shocks small, so that it doesn't impact the length of time the ZLB binds for
else
    scenario(end,2) = 0.0001;
end

baseline=baseline1;
baseline(1:9,1) = -0.0060;

% Do private QE shocks
irfshock = char('er','et');

%%%%%%%%%%%%% No ZLB
%%%%%%%%%%%%%%%%%%
% First time we solve simulation only with baseline shocks
[sim_MP] = ...
  solve_one_constraint(modnam,modnamstar,...
  constraint, constraint_relax,...
  baseline,irfshock,nperiods,maxiter);

% Second time we solve simulation with baseline shocks and scenario
[sim_MP2] = ...
  solve_one_constraint(modnam,modnamstar,...
  constraint, constraint_relax,...
  baseline+scenario,irfshock,nperiods,maxiter);
irf0 = sim_MP2 - sim_MP; % IRF with no Taylor rule

%%%%%%%%%%%%%%%% Impose ZLB
%%%%%%%%%%%%%%%%%%%%%%

shock_size = 1;
% First time we solve simulation only with baseline shocks
[~, sim_zlb] = ...
  solve_one_constraint(modnam,modnamstar,...
  constraint, constraint_relax,...
  baseline,irfshock,nperiods,maxiter);

% Second time we solve simulation with baseline shocks and scenario
[~, sim_zlb2] = ...
  solve_one_constraint(modnam,modnamstar,...
  constraint, constraint_relax,...
  baseline+scenario*shock_size,irfshock,nperiods,maxiter);

irf1 = sim_zlb2 - sim_zlb;
thetax = -5000;

save param_implement beta z sigma bfi bcb gamma zeta phipi phix rhotr rhor rhot rhoq thetapi thetax chi thetas
%%%%%%%%%%%%%%%% Impose ZLB
%%%%%%%%%%%%%%%%%%%%%%

shock_size = 1;
% First time we solve simulation only with baseline shocks
[~, sim_zlb] = ...
  solve_one_constraint(modnam,modnamstar,...
  constraint, constraint_relax,...
  baseline,irfshock,nperiods,maxiter);

% Second time we solve simulation with baseline shocks and scenario
[~, sim_zlb2] = ...
  solve_one_constraint(modnam,modnamstar,...
  constraint, constraint_relax,...
  baseline+scenario*shock_size,irfshock,nperiods,maxiter);

irf3 = sim_zlb2 - sim_zlb;

T = size(irf1(10:end,1),1);
t = 0:T-1;


if nr ==1
    % y is position 9, x is positioin 1, pi is position 2, rs is position 7
    xr = 25;
    figure
    subplot(2,2,1)
    plot(t,-xr*100*irf0(10:end,1),'-k',t,-xr*100*irf1(10:end,1),'--b',t,-xr*100*irf3(10:end,1),':r','Linewidth',1.5)
    grid on
    ylabel('Output Gap')
    xlabel('Horizon')

    subplot(2,2,2)
    plot(t,-xr*400*irf0(10:end,2),'-k',t,-xr*400*irf1(10:end,2),'--b',t,-xr*400*irf3(10:end,2),':r','Linewidth',1.5)
    grid on
    ylabel('Inflation')
    xlabel('Horizon')

    subplot(2,2,3)
    plot(t,-xr*400*irf0(10:end,7),'-k',t,-xr*400*irf1(10:end,7),'--b',t,-xr*400*irf3(10:end,7),':r','Linewidth',1.5)
    grid on
    ylabel('Interest Rate')
    xlabel('Horizon')

    subplot(2,2,4)
    plot(t,-xr*100*irf0(10:end,4),'-k',t,-xr*100*irf1(10:end,4),'--b',t,-xr*100*irf3(10:end,4),':r','Linewidth',1.5)
    grid on
    ylabel('QE')
    xlabel('Horizon')
    legend('No QE, No ZLB','No QE, ZLB','QE, ZLB')
else
    % y is position 9, x is positioin 1, pi is position 2, rs is position 7
    xr = -100;
    figure
    subplot(2,2,1)
    plot(t,xr*100*irf0(10:end,1),'-k',t,xr*100*irf1(10:end,1),'--b',t,xr*100*irf3(10:end,1),':r','Linewidth',1.5)
    grid on
    ylabel('Output Gap')
    xlabel('Horizon')

    subplot(2,2,2)
    plot(t,xr*400*irf0(10:end,2),'-k',t,xr*400*irf1(10:end,2),'--b',t,xr*400*irf3(10:end,2),':r','Linewidth',1.5)
    grid on
    ylabel('Inflation')
    xlabel('Horizon')

    subplot(2,2,3)
    plot(t,xr*400*irf0(10:end,7),'-k',t,xr*400*irf1(10:end,7),'--b',t,xr*400*irf3(10:end,7),':r','Linewidth',1.5)
    grid on
    ylabel('Interest Rate')
    xlabel('Horizon')

    subplot(2,2,4)
    plot(t,xr*100*irf0(10:end,4),'-k',t,xr*100*irf1(10:end,4),'--b',t,xr*100*irf3(10:end,4),':r','Linewidth',1.5)
    grid on
    ylabel('QE')
    xlabel('Horizon')
    legend('No QE, No ZLB','No QE, ZLB','QE, ZLB')    
end
