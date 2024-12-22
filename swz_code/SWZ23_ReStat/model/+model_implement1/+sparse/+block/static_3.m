function [y, T] = static_3(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(8)=y(3)*(1-params(2))/params(3)*(params(11)-1)^(-1);
end
