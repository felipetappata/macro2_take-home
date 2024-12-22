function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = model_4nk.static_g1_tt(T, y, x, params);
end
g1 = zeros(8, 8);
g1(1,1)=(1-params(3))/params(6);
g1(1,2)=(-((1-params(3))/params(6)));
g1(1,8)=(-((1-params(3))/params(6)));
g1(2,2)=1-params(1);
g1(2,5)=params(39)*T(1);
g1(2,6)=params(38)*T(1);
g1(2,7)=(-(params(36)*params(37)));
g1(3,5)=1-params(17);
g1(4,4)=1-params(18);
g1(5,6)=1-params(19);
g1(6,1)=1-params(20);
g1(6,2)=(-((1-params(20))*params(14)));
g1(6,7)=(-((1-params(20))*params(15)));
g1(7,3)=(-1);
g1(7,4)=1;
g1(7,7)=1;
g1(8,4)=(-(params(6)*(params(18)-1)/(1-params(3))));
g1(8,8)=1;

end
