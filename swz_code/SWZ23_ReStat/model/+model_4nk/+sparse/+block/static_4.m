function [y, T] = static_4(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(8)=y(4)*params(6)*(params(18)-1)/(1-params(3));
end
