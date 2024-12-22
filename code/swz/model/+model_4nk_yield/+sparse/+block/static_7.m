function [y, T, residual, g1] = static_7(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  residual(1)=(y(3))-(y(3)-(y(1)-y(2))*1/params(6)-params(3)/params(6)*(y(9)-y(1)));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=params(3)/params(6);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
