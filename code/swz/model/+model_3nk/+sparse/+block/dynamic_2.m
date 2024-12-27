function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(3, 1);
  residual(1)=(y(15))-(y(23)-1/params(6)*(y(9)-y(18)-y(16)));
  residual(2)=(y(9))-(params(20)*y(1)+(1-params(20))*(y(10)*params(14)+y(15)*params(15))+params(24)*x(4));
  residual(3)=(y(10))-(y(15)*params(36)*params(37)+y(18)*params(1));
if nargout > 3
    g1_v = NaN(11, 1);
g1_v(1)=(-params(20));
g1_v(2)=1/params(6);
g1_v(3)=1;
g1_v(4)=1;
g1_v(5)=(-((1-params(20))*params(15)));
g1_v(6)=(-(params(36)*params(37)));
g1_v(7)=(-((1-params(20))*params(14)));
g1_v(8)=1;
g1_v(9)=(-1);
g1_v(10)=(-(1/params(6)));
g1_v(11)=(-params(1));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 3, 9);
end
end
