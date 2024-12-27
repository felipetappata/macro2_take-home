function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
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
%   residual
%

if T_flag
    T = model_4nk_yield.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(10, 1);
    residual(1) = (y(11)) - (y(19)-(1-params(3))/params(6)*(y(5)-y(15)-y(12))-params(3)*(params(38)*(y(18)-y(10))+params(39)*(y(17)-y(9))));
    residual(2) = (y(6)) - (y(11)*params(36)*params(37)-T(1)*(params(38)*y(10)+params(39)*y(9))+y(15)*params(1));
    residual(3) = (y(9)) - (params(17)*y(3)+params(21)*x(it_, 3));
    residual(4) = (y(8)) - (params(18)*y(2)+(1-params(3))*(1+params(5))/(params(6)+(1-params(3))*params(5))*params(22)*x(it_, 1));
    residual(5) = (y(10)) - (params(19)*y(4)+params(23)*x(it_, 2));
    residual(6) = (y(5)) - (params(20)*y(1)+(1-params(20))*(y(6)*params(14)+y(11)*params(15))+params(24)*x(it_, 4));
    residual(7) = (y(11)) - (y(7)-y(8));
    residual(8) = (y(12)) - (y(8)*params(6)*(params(18)-1)/(1-params(3)));
    residual(9) = (y(7)) - (y(16)-(y(5)-y(15))*1/params(6)-params(3)/params(6)*(y(13)-y(5)));
    residual(10) = (y(14)) - (y(13)-y(5));

end
