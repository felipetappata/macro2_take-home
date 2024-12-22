function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(0, 1);
end
[T_order, T] = model_3nk.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(8, 1);
    residual(1) = (y(15)) - (y(23)-1/params(6)*(y(9)-y(18)-y(16)));
    residual(2) = (y(10)) - (y(15)*params(36)*params(37)+y(18)*params(1));
    residual(3) = (y(13)) - (params(17)*y(5)+params(21)*x(3));
    residual(4) = (y(12)) - (params(18)*y(4)+(1+params(5))/(params(6)+params(5))*params(22)*x(1));
    residual(5) = (y(14)) - (params(19)*y(6)+params(23)*x(2));
    residual(6) = (y(9)) - (params(20)*y(1)+(1-params(20))*(y(10)*params(14)+y(15)*params(15))+params(24)*x(4));
    residual(7) = (y(15)) - (y(11)-y(12));
    residual(8) = (y(16)) - (y(12)*params(6)*(params(18)-1));
end
