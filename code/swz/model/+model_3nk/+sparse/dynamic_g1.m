function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(0, 1);
end
[T_order, T] = model_3nk.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(27, 1);
g1_v(1)=(-params(20));
g1_v(2)=(-params(18));
g1_v(3)=(-params(17));
g1_v(4)=(-params(19));
g1_v(5)=1/params(6);
g1_v(6)=1;
g1_v(7)=1;
g1_v(8)=(-((1-params(20))*params(14)));
g1_v(9)=(-1);
g1_v(10)=1;
g1_v(11)=1;
g1_v(12)=(-(params(6)*(params(18)-1)));
g1_v(13)=1;
g1_v(14)=1;
g1_v(15)=1;
g1_v(16)=(-(params(36)*params(37)));
g1_v(17)=(-((1-params(20))*params(15)));
g1_v(18)=1;
g1_v(19)=(-(1/params(6)));
g1_v(20)=1;
g1_v(21)=(-(1/params(6)));
g1_v(22)=(-params(1));
g1_v(23)=(-1);
g1_v(24)=(-((1+params(5))/(params(6)+params(5))*params(22)));
g1_v(25)=(-params(23));
g1_v(26)=(-params(21));
g1_v(27)=(-params(24));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 28);
end
