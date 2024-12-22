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
    T = model_4nk.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(8, 20);
g1(1,5)=(1-params(3))/params(6);
g1(1,13)=(-((1-params(3))/params(6)));
g1(1,9)=params(3)*(-params(39));
g1(1,14)=params(3)*params(39);
g1(1,10)=params(3)*(-params(38));
g1(1,15)=params(3)*params(38);
g1(1,11)=1;
g1(1,16)=(-1);
g1(1,12)=(-((1-params(3))/params(6)));
g1(2,6)=1;
g1(2,13)=(-params(1));
g1(2,9)=params(39)*T(1);
g1(2,10)=params(38)*T(1);
g1(2,11)=(-(params(36)*params(37)));
g1(3,3)=(-params(17));
g1(3,9)=1;
g1(3,19)=(-params(21));
g1(4,2)=(-params(18));
g1(4,8)=1;
g1(4,17)=(-((1-params(3))*(1+params(5))/(params(6)+(1-params(3))*params(5))*params(22)));
g1(5,4)=(-params(19));
g1(5,10)=1;
g1(5,18)=(-params(23));
g1(6,1)=(-params(20));
g1(6,5)=1;
g1(6,6)=(-((1-params(20))*params(14)));
g1(6,11)=(-((1-params(20))*params(15)));
g1(6,20)=(-params(24));
g1(7,7)=(-1);
g1(7,8)=1;
g1(7,11)=1;
g1(8,8)=(-(params(6)*(params(18)-1)/(1-params(3))));
g1(8,12)=1;

end
