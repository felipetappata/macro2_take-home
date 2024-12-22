function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = model_4nk_yield.static_resid_tt(T, y, x, params);
end
residual = zeros(10, 1);
    residual(1) = (y(7)) - (y(7)-(1-params(3))/params(6)*(y(1)-y(2)-y(8)));
    residual(2) = (y(2)) - (y(7)*params(36)*params(37)-T(1)*(params(38)*y(6)+params(39)*y(5))+y(2)*params(1));
    residual(3) = (y(5)) - (y(5)*params(17)+params(21)*x(3));
    residual(4) = (y(4)) - (y(4)*params(18)+(1-params(3))*(1+params(5))/(params(6)+(1-params(3))*params(5))*params(22)*x(1));
    residual(5) = (y(6)) - (y(6)*params(19)+params(23)*x(2));
    residual(6) = (y(1)) - (y(1)*params(20)+(1-params(20))*(y(2)*params(14)+y(7)*params(15))+params(24)*x(4));
    residual(7) = (y(7)) - (y(3)-y(4));
    residual(8) = (y(8)) - (y(4)*params(6)*(params(18)-1)/(1-params(3)));
    residual(9) = (y(3)) - (y(3)-(y(1)-y(2))*1/params(6)-params(3)/params(6)*(y(9)-y(1)));
    residual(10) = (y(10)) - (y(9)-y(1));

end
