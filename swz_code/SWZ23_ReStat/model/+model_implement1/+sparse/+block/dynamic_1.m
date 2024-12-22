function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(12)=params(11)*y(3)+x(1);
  y(14)=params(12)*y(5)+x(2);
  T(1)=(1-params(2))/params(3)*(params(11)-1)^(-1);
  y(17)=y(12)*T(1);
end
