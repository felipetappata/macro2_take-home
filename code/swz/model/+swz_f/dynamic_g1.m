function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = swz_f.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(10, 23);
g1(1,6)=1;
g1(1,16)=(-1);
g1(1,17)=(-((1-params(2))/params(3)));
g1(1,8)=(1-params(2))/params(3);
g1(1,9)=(-((1-params(2))/params(3)));
g1(1,12)=params(2)*(-params(6));
g1(1,18)=params(2)*params(6);
g1(1,14)=params(2)*(-params(5));
g1(1,19)=params(2)*params(5);
g1(2,6)=(-(params(7)*params(8)));
g1(2,7)=1;
g1(2,17)=(-params(1));
g1(2,12)=params(6)*T(1);
g1(2,14)=params(5)*T(1);
g1(3,6)=(-((1-params(9))*params(15)));
g1(3,7)=(-((1-params(9))*params(14)));
g1(3,1)=(-params(9));
g1(3,8)=1;
g1(3,15)=(-1);
g1(4,9)=1;
g1(4,13)=(-(params(3)*(-(1-params(10)))*(1+params(4))/(params(3)+(1-params(2))*params(4))));
g1(5,10)=1;
g1(5,13)=(-((1-params(2))*(1+params(4))/(params(3)+(1-params(2))*params(4))));
g1(6,2)=(-params(12));
g1(6,12)=1;
g1(6,20)=(-1);
g1(7,6)=(-1);
g1(7,10)=(-1);
g1(7,11)=1;
g1(8,3)=(-params(10));
g1(8,13)=1;
g1(8,21)=(-1);
g1(9,4)=(-params(11));
g1(9,14)=1;
g1(9,22)=(-1);
g1(10,5)=(-params(13));
g1(10,15)=1;
g1(10,23)=(-1);

end
