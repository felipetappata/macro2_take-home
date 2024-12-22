function [residual, g1, g2, g3] = model_4nk_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(8, 1);
T42 = params(3)*params(6)*params(36)/(1-params(3));
lhs =y(11);
rhs =y(16)-(1-params(3))/params(6)*(y(5)-y(13)-y(12))-params(3)*(params(38)*(y(15)-y(10))+params(39)*(y(14)-y(9)));
residual(1)= lhs-rhs;
lhs =y(6);
rhs =y(11)*params(36)*params(37)-T42*(params(38)*y(10)+params(39)*y(9))+y(13)*params(1);
residual(2)= lhs-rhs;
lhs =y(9);
rhs =params(17)*y(3)+params(21)*x(it_, 3);
residual(3)= lhs-rhs;
lhs =y(8);
rhs =params(18)*y(2)+(1-params(3))*(1+params(5))/(params(6)+(1-params(3))*params(5))*params(22)*x(it_, 1);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =params(19)*y(4)+params(23)*x(it_, 2);
residual(5)= lhs-rhs;
lhs =y(5);
rhs =params(20)*y(1)+(1-params(20))*(y(6)*params(14)+y(11)*params(15))+params(24)*x(it_, 4);
residual(6)= lhs-rhs;
lhs =y(11);
rhs =y(7)-y(8);
residual(7)= lhs-rhs;
lhs =y(12);
rhs =y(8)*params(6)*(params(18)-1)/(1-params(3));
residual(8)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(8, 20);

  %
  % Jacobian matrix
  %

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
  g1(2,9)=params(39)*T42;
  g1(2,10)=params(38)*T42;
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

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,400);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,8000);
end
end
end
end
