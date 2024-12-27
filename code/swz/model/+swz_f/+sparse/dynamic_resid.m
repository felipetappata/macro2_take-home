function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = swz_f.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(10, 1);
    residual(1) = (y(11)) - (y(21)-(1-params(2))/params(3)*(y(13)-y(22)-y(14))-params(2)*(params(5)*(y(29)-y(19))+params(6)*(y(27)-y(17))));
    residual(2) = (y(12)) - (y(11)*params(7)*params(8)-T(1)*(params(5)*y(19)+params(6)*y(17))+y(22)*params(1));
    residual(3) = (y(13)) - (params(9)*y(3)+(1-params(9))*(y(12)*params(14)+y(11)*params(15))+y(20));
    residual(4) = (y(14)) - (params(3)*(-(1-params(10)))*(1+params(4))/(params(3)+(1-params(2))*params(4))*y(18));
    residual(5) = (y(15)) - (y(18)*(1-params(2))*(1+params(4))/(params(3)+(1-params(2))*params(4)));
    residual(6) = (y(17)) - (params(12)*y(7)+x(1));
    residual(7) = (y(16)) - (y(11)+y(15));
    residual(8) = (y(18)) - (params(10)*y(8)+x(2));
    residual(9) = (y(19)) - (params(11)*y(9)+x(3));
    residual(10) = (y(20)) - (params(13)*y(10)+x(4));
end
