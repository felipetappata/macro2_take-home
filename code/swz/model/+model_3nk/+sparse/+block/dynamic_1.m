function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(13)=params(17)*y(5)+params(21)*x(3);
  y(12)=params(18)*y(4)+(1+params(5))/(params(6)+params(5))*params(22)*x(1);
  y(14)=params(19)*y(6)+params(23)*x(2);
  y(16)=y(12)*params(6)*(params(18)-1);
end
