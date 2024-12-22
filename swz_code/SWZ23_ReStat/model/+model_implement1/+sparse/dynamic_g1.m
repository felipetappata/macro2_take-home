function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(3, 1);
end
[T_order, T] = model_implement1.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(35, 1);
g1_v(1)=(-params(11));
g1_v(2)=(-params(13));
g1_v(3)=(-params(12));
g1_v(4)=(-params(10));
g1_v(5)=1;
g1_v(6)=(-(params(6)*params(7)));
g1_v(7)=(-((1-params(10))*params(9)));
g1_v(8)=(-((1-params(13))*params(15)));
g1_v(9)=1;
g1_v(10)=1;
g1_v(11)=(-((1-params(10))*params(8)));
g1_v(12)=(-((1-params(13))*params(14)));
g1_v(13)=(-T(1));
g1_v(14)=1;
g1_v(15)=(-T(3));
g1_v(16)=params(2)*(-params(5));
g1_v(17)=params(5)*T(2);
g1_v(18)=1;
g1_v(19)=params(2)*(-params(4));
g1_v(20)=params(4)*T(2);
g1_v(21)=1;
g1_v(22)=1;
g1_v(23)=(-1);
g1_v(24)=T(1);
g1_v(25)=1;
g1_v(26)=1;
g1_v(27)=1;
g1_v(28)=(-1);
g1_v(29)=(-1);
g1_v(30)=(-T(1));
g1_v(31)=(-params(1));
g1_v(32)=params(2)*params(5);
g1_v(33)=params(2)*params(4);
g1_v(34)=(-1);
g1_v(35)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 29);
end
