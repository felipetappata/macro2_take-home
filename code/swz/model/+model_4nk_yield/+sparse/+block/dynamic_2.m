function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(3, 1);
  residual(1)=(y(17))-(y(27)-(1-params(3))/params(6)*(y(11)-y(22)-y(18))-params(3)*(params(38)*(y(26)-y(16))+params(39)*(y(25)-y(15))));
  residual(2)=(y(11))-(params(20)*y(1)+(1-params(20))*(y(12)*params(14)+y(17)*params(15))+params(24)*x(4));
  residual(3)=(y(12))-(y(17)*params(36)*params(37)-params(3)*params(6)*params(36)/(1-params(3))*(params(38)*y(16)+params(39)*y(15))+y(22)*params(1));
if nargout > 3
    g1_v = NaN(11, 1);
g1_v(1)=(-params(20));
g1_v(2)=(1-params(3))/params(6);
g1_v(3)=1;
g1_v(4)=(-((1-params(20))*params(14)));
g1_v(5)=1;
g1_v(6)=1;
g1_v(7)=(-((1-params(20))*params(15)));
g1_v(8)=(-(params(36)*params(37)));
g1_v(9)=(-((1-params(3))/params(6)));
g1_v(10)=(-params(1));
g1_v(11)=(-1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 3, 9);
end
end
