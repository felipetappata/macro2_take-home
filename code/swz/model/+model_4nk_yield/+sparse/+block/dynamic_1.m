function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(15)=params(17)*y(5)+params(21)*x(3);
  y(14)=params(18)*y(4)+(1-params(3))*(1+params(5))/(params(6)+(1-params(3))*params(5))*params(22)*x(1);
  y(16)=params(19)*y(6)+params(23)*x(2);
  y(18)=y(14)*params(6)*(params(18)-1)/(1-params(3));
end
