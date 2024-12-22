function [y, T, residual, g1] = static_4(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  residual(1)=(y(7))-(y(6));
  residual(2)=(y(4))-(y(4)*params(13)+(1-params(13))*(y(2)*params(14)+y(1)*params(15)));
  residual(3)=(y(1))-(y(1)-(1-params(2))/params(3)*(y(7)-y(2)-y(3)));
  residual(4)=(y(2))-(y(1)*params(6)*params(7)+y(2)*params(1)-params(3)*params(2)*params(6)/(1-params(2))*(params(4)*y(5)+params(5)*y(4)));
  residual(5)=(y(6))-(y(6)*params(10)+(1-params(10))*(y(2)*params(8)+y(1)*params(9)));
if nargout > 3
    g1_v = NaN(13, 1);
g1_v(1)=1;
g1_v(2)=(1-params(2))/params(3);
g1_v(3)=1-params(13);
g1_v(4)=params(5)*params(3)*params(2)*params(6)/(1-params(2));
g1_v(5)=(-((1-params(13))*params(14)));
g1_v(6)=(-((1-params(2))/params(3)));
g1_v(7)=1-params(1);
g1_v(8)=(-((1-params(10))*params(8)));
g1_v(9)=(-((1-params(13))*params(15)));
g1_v(10)=(-(params(6)*params(7)));
g1_v(11)=(-((1-params(10))*params(9)));
g1_v(12)=(-1);
g1_v(13)=1-params(10);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 5);
end
end
