var x pi rs rf qe theta;

varexo er et;

parameters beta z sigma bfi bcb gamma zeta phipi phix rhotr rhor rhot rhoq thetapi thetax;
load param_implement;
set_param_value('beta',beta);
set_param_value('z',z);
set_param_value('sigma',sigma);
set_param_value('bfi',bfi);
set_param_value('bcb',bcb);
set_param_value('gamma',gamma);
set_param_value('zeta',zeta);
set_param_value('phipi',phipi);
set_param_value('phix',phix);
set_param_value('rhotr',rhotr);
set_param_value('rhor',rhor);
set_param_value('rhot',rhot);
set_param_value('rhoq',rhoq);
set_param_value('thetapi',thetapi);
set_param_value('thetax',thetax);

model(linear);

% (1) IS
x = x(+1) - ((1-z)/sigma)*(rs - pi(+1) - rf) - z*(bfi*(theta(+1)-theta)+bcb*(qe(+1)-qe));

% (2) Phillips Curve
pi = gamma*zeta*x + beta*pi(+1) - (z*gamma*sigma/(1-z))*(bfi*theta + bcb*qe);

% (3) Taylor rule
rs = rhotr*rs(-1) + (1-rhotr)*(phipi*pi + phix*x);

% (4) QE rule
qe = rhoq*qe(-1) + (1-rhoq)*(thetapi*pi + thetax*x);

% (5) Process for natural rate
rf = rhor*rf(-1) + er;

% (6) Theta process
theta = rhot*theta(-1) + et;

end;

shocks;
var er = (1/4)^2;
var et = 1;
end;

stoch_simul(order=1,irf=21,nograph,ar=1);
