function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = model_4nk.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(18, 1);
g1_v(1)=(1-params(3))/params(6);
g1_v(2)=1-params(20);
g1_v(3)=(-((1-params(3))/params(6)));
g1_v(4)=1-params(1);
g1_v(5)=(-((1-params(20))*params(14)));
g1_v(6)=(-1);
g1_v(7)=1-params(18);
g1_v(8)=1;
g1_v(9)=(-(params(6)*(params(18)-1)/(1-params(3))));
g1_v(10)=params(39)*T(1);
g1_v(11)=1-params(17);
g1_v(12)=params(38)*T(1);
g1_v(13)=1-params(19);
g1_v(14)=(-(params(36)*params(37)));
g1_v(15)=(-((1-params(20))*params(15)));
g1_v(16)=1;
g1_v(17)=(-((1-params(3))/params(6)));
g1_v(18)=1;
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 8);
end
