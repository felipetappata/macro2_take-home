function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(3, 1);
end
[T_order, T] = model_implement1.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(9, 1);
    residual(1) = (y(10)) - (y(19)-T(1)*(y(16)-y(20)-y(12))-params(2)*(params(4)*(y(23)-y(14))+params(5)*(y(22)-y(13))));
    residual(2) = (y(11)) - (y(10)*params(6)*params(7)+y(20)*params(1)-T(2)*(params(4)*y(14)+params(5)*y(13)));
    residual(3) = (y(15)) - (params(10)*y(6)+(1-params(10))*(y(11)*params(8)+y(10)*params(9)));
    residual(4) = (y(16)) - (y(15));
    residual(5) = (y(13)) - (params(13)*y(4)+(1-params(13))*(y(11)*params(14)+y(10)*params(15)));
    residual(6) = (y(12)) - (params(11)*y(3)+x(1));
    residual(7) = (y(14)) - (params(12)*y(5)+x(2));
    residual(8) = (y(17)) - (y(12)*T(3));
    residual(9) = (y(10)) - (y(18)-y(17));
end
