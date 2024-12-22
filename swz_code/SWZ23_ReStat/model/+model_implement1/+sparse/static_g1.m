function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(3, 1);
end
[T_order, T] = model_implement1.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(22, 1);
g1_v(1)=(-(params(6)*params(7)));
g1_v(2)=(-((1-params(10))*params(9)));
g1_v(3)=(-((1-params(13))*params(15)));
g1_v(4)=1;
g1_v(5)=(-T(1));
g1_v(6)=1-params(1);
g1_v(7)=(-((1-params(10))*params(8)));
g1_v(8)=(-((1-params(13))*params(14)));
g1_v(9)=(-T(1));
g1_v(10)=1-params(11);
g1_v(11)=(-T(3));
g1_v(12)=params(5)*T(2);
g1_v(13)=1-params(13);
g1_v(14)=params(4)*T(2);
g1_v(15)=1-params(12);
g1_v(16)=1-params(10);
g1_v(17)=(-1);
g1_v(18)=T(1);
g1_v(19)=1;
g1_v(20)=1;
g1_v(21)=1;
g1_v(22)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 9);
end
