% 4 equation NK model written in terms of excess return

var Rs Pi Y Yf qe theta X Rf Rb spread;

varexo eA et eq er;

parameters beta betab z psi chi sigma kappa Xfi Xb thetas epsi phi bcbs phipi phix Pis rhoq rhoA rhot rhor sq sA st sr Rres Rbs Qs bfis res ss Rbs Rss sp bcbs bs Cbs qes gamma zeta b1 b2;

load param_4nk_yield;

set_param_value('beta',beta);
set_param_value('betab',betab);
set_param_value('z',z);
set_param_value('psi',psi);
set_param_value('chi',chi);
set_param_value('sigma',sigma);
set_param_value('kappa',kappa);
set_param_value('Xfi',Xfi);
set_param_value('Xb',Xb);
set_param_value('thetas',thetas);
set_param_value('rhor',rhor);
set_param_value('sq',sq);
set_param_value('epsi',epsi);
set_param_value('phi',phi);
set_param_value('bcbs',bcbs);
set_param_value('phipi',phipi);
set_param_value('phix',phix);
set_param_value('Pis',Pis);
set_param_value('rhoq',rhoq);
set_param_value('rhoA',rhoA);
set_param_value('rhot',rhot);
set_param_value('sA',sA);
set_param_value('st',st);
set_param_value('sr',sr);
set_param_value('Rres',Rres);
set_param_value('Rbs',Rbs);
set_param_value('Qs',Qs);
set_param_value('bfis',bfis);
set_param_value('res',res);
set_param_value('ss',ss);
set_param_value('Rss',Rss);
set_param_value('sp',sp);
set_param_value('bcbs',bcbs);
set_param_value('bs',bs);
set_param_value('Cbs',Cbs);
set_param_value('qes',qes);
set_param_value('gamma',gamma);
set_param_value('zeta',zeta);
set_param_value('b1',b1);
set_param_value('b2',b2);

model(linear);
% (1) IS
X = X(+1) - ((1-z)/sigma)*(Rs - Pi(+1) - Rf) - z*(b1*(theta(+1) - theta) + b2*(qe(+1) - qe));

% (2) Phillips Curve
Pi = gamma*zeta*X - (gamma*sigma*z)/(1-z)*(b1*theta + b2*qe) + beta*Pi(+1);

% (3) Law of motion bond holding
qe = rhoq*qe(-1) + sq*eq;

% (4) Potential output
Yf = rhoA*Yf(-1) + ((1+chi)*(1-z)/(chi*(1-z)+sigma))*sA*eA;

% (5) Theta
theta = rhot*theta(-1) + st*et;

% (6) Taylor rule
Rs = rhor*Rs(-1) + (1-rhor)*(phipi*Pi + phix*X) + sr*er;

% (7) Output gap
X = Y - Yf;

% (8) Natural rate
Rf = sigma*(rhoA - 1)/(1-z)*Yf;

% (8) Alternative Euler equation representation to get long rate
Y = Y(+1) - (1/sigma)*(Rs - Pi(+1)) - (z/sigma)*(Rb - Rs);

% (9) Spread
spread = Rb - Rs;

end;

%steady;

shocks;
var eA = 1;
var et = 1;
var er = 1;
var eq = 1;
end;

stoch_simul(order=1,irf=21,nograph,ar=0);