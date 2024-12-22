function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  residual(1)=(y(10))-(y(19)-(1-params(2))/params(3)*(y(16)-y(20)-y(12))-params(2)*(params(4)*(y(23)-y(14))+params(5)*(y(22)-y(13))));
  residual(2)=(y(16))-(y(15));
  residual(3)=(y(11))-(y(10)*params(6)*params(7)+y(20)*params(1)-params(3)*params(2)*params(6)/(1-params(2))*(params(4)*y(14)+params(5)*y(13)));
  residual(4)=(y(13))-(params(13)*y(4)+(1-params(13))*(y(11)*params(14)+y(10)*params(15)));
  residual(5)=(y(15))-(params(10)*y(6)+(1-params(10))*(y(11)*params(8)+y(10)*params(9)));
if nargout > 3
    g1_v = NaN(20, 1);
g1_v(1)=(-params(10));
g1_v(2)=(-params(13));
g1_v(3)=(1-params(2))/params(3);
g1_v(4)=1;
g1_v(5)=(-1);
g1_v(6)=1;
g1_v(7)=params(2)*(-params(5));
g1_v(8)=params(5)*params(3)*params(2)*params(6)/(1-params(2));
g1_v(9)=1;
g1_v(10)=1;
g1_v(11)=(-((1-params(13))*params(14)));
g1_v(12)=(-((1-params(10))*params(8)));
g1_v(13)=1;
g1_v(14)=(-(params(6)*params(7)));
g1_v(15)=(-((1-params(13))*params(15)));
g1_v(16)=(-((1-params(10))*params(9)));
g1_v(17)=params(2)*params(5);
g1_v(18)=(-((1-params(2))/params(3)));
g1_v(19)=(-params(1));
g1_v(20)=(-1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 15);
end
end
