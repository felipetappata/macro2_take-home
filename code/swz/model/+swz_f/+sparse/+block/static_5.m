function [y, T] = static_5(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(5)=y(8)*(1-params(2))*(1+params(4))/(params(3)+(1-params(2))*params(4));
  y(4)=params(3)*(-(1-params(10)))*(1+params(4))/(params(3)+(1-params(2))*params(4))*y(8);
end
