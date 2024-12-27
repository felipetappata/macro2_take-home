function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(17)=params(12)*y(7)+x(1);
  y(18)=params(10)*y(8)+x(2);
  y(19)=params(11)*y(9)+x(3);
  y(20)=params(13)*y(10)+x(4);
  y(15)=y(18)*(1-params(2))*(1+params(4))/(params(3)+(1-params(2))*params(4));
  y(14)=params(3)*(-(1-params(10)))*(1+params(4))/(params(3)+(1-params(2))*params(4))*y(18);
end
