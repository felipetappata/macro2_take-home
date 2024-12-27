function [y, T, residual, g1] = static_5(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(3, 1);
  residual(1)=(y(7))-(y(7)-(1-params(3))/params(6)*(y(1)-y(2)-y(8)));
  residual(2)=(y(1))-(y(1)*params(20)+(1-params(20))*(y(2)*params(14)+y(7)*params(15))+params(24)*x(4));
  residual(3)=(y(2))-(y(7)*params(36)*params(37)-params(3)*params(6)*params(36)/(1-params(3))*(params(38)*y(6)+params(39)*y(5))+y(2)*params(1));
if nargout > 3
    g1_v = NaN(7, 1);
g1_v(1)=(1-params(3))/params(6);
g1_v(2)=1-params(20);
g1_v(3)=(-((1-params(20))*params(15)));
g1_v(4)=(-(params(36)*params(37)));
g1_v(5)=(-((1-params(3))/params(6)));
g1_v(6)=(-((1-params(20))*params(14)));
g1_v(7)=1-params(1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 3, 3);
end
end
