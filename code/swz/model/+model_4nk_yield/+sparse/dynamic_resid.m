function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = model_4nk_yield.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(10, 1);
    residual(1) = (y(17)) - (y(27)-(1-params(3))/params(6)*(y(11)-y(22)-y(18))-params(3)*(params(38)*(y(26)-y(16))+params(39)*(y(25)-y(15))));
    residual(2) = (y(12)) - (y(17)*params(36)*params(37)-T(1)*(params(38)*y(16)+params(39)*y(15))+y(22)*params(1));
    residual(3) = (y(15)) - (params(17)*y(5)+params(21)*x(3));
    residual(4) = (y(14)) - (params(18)*y(4)+(1-params(3))*(1+params(5))/(params(6)+(1-params(3))*params(5))*params(22)*x(1));
    residual(5) = (y(16)) - (params(19)*y(6)+params(23)*x(2));
    residual(6) = (y(11)) - (params(20)*y(1)+(1-params(20))*(y(12)*params(14)+y(17)*params(15))+params(24)*x(4));
    residual(7) = (y(17)) - (y(13)-y(14));
    residual(8) = (y(18)) - (y(14)*params(6)*(params(18)-1)/(1-params(3)));
    residual(9) = (y(13)) - (y(23)-(y(11)-y(22))*1/params(6)-params(3)/params(6)*(y(19)-y(11)));
    residual(10) = (y(20)) - (y(19)-y(11));
end
