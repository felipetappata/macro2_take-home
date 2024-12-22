function [residual, g1, g2, g3] = model_4nk_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 8, 1);

%
% Model equations
%

T31 = params(3)*params(6)*params(36)/(1-params(3));
lhs =y(7);
rhs =y(7)-(1-params(3))/params(6)*(y(1)-y(2)-y(8));
residual(1)= lhs-rhs;
lhs =y(2);
rhs =y(7)*params(36)*params(37)-T31*(params(38)*y(6)+params(39)*y(5))+y(2)*params(1);
residual(2)= lhs-rhs;
lhs =y(5);
rhs =y(5)*params(17)+params(21)*x(3);
residual(3)= lhs-rhs;
lhs =y(4);
rhs =y(4)*params(18)+(1-params(3))*(1+params(5))/(params(6)+(1-params(3))*params(5))*params(22)*x(1);
residual(4)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(19)+params(23)*x(2);
residual(5)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(20)+(1-params(20))*(y(2)*params(14)+y(7)*params(15))+params(24)*x(4);
residual(6)= lhs-rhs;
lhs =y(7);
rhs =y(3)-y(4);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(4)*params(6)*(params(18)-1)/(1-params(3));
residual(8)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(8, 8);

  %
  % Jacobian matrix
  %

  g1(1,1)=(1-params(3))/params(6);
  g1(1,2)=(-((1-params(3))/params(6)));
  g1(1,8)=(-((1-params(3))/params(6)));
  g1(2,2)=1-params(1);
  g1(2,5)=params(39)*T31;
  g1(2,6)=params(38)*T31;
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
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,64);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,512);
end
end
end
end
