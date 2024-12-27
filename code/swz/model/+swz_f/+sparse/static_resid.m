function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = swz_f.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(10, 1);
    residual(1) = (y(1)) - (y(1)-(1-params(2))/params(3)*(y(3)-y(2)-y(4)));
    residual(2) = (y(2)) - (y(1)*params(7)*params(8)-T(1)*(params(5)*y(9)+params(6)*y(7))+y(2)*params(1));
    residual(3) = (y(3)) - (y(3)*params(9)+(1-params(9))*(y(2)*params(14)+y(1)*params(15))+y(10));
    residual(4) = (y(4)) - (params(3)*(-(1-params(10)))*(1+params(4))/(params(3)+(1-params(2))*params(4))*y(8));
    residual(5) = (y(5)) - (y(8)*(1-params(2))*(1+params(4))/(params(3)+(1-params(2))*params(4)));
    residual(6) = (y(7)) - (y(7)*params(12)+x(1));
    residual(7) = (y(6)) - (y(1)+y(5));
    residual(8) = (y(8)) - (params(10)*y(8)+x(2));
    residual(9) = (y(9)) - (y(9)*params(11)+x(3));
    residual(10) = (y(10)) - (y(10)*params(13)+x(4));
end
