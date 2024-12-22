function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = model_4nk.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(8, 1);
    residual(1) = (y(7)) - (y(7)-(1-params(3))/params(6)*(y(1)-y(2)-y(8)));
    residual(2) = (y(2)) - (y(7)*params(36)*params(37)-T(1)*(params(38)*y(6)+params(39)*y(5))+y(2)*params(1));
    residual(3) = (y(5)) - (y(5)*params(17)+params(21)*x(3));
    residual(4) = (y(4)) - (y(4)*params(18)+(1-params(3))*(1+params(5))/(params(6)+(1-params(3))*params(5))*params(22)*x(1));
    residual(5) = (y(6)) - (y(6)*params(19)+params(23)*x(2));
    residual(6) = (y(1)) - (y(1)*params(20)+(1-params(20))*(y(2)*params(14)+y(7)*params(15))+params(24)*x(4));
    residual(7) = (y(7)) - (y(3)-y(4));
    residual(8) = (y(8)) - (y(4)*params(6)*(params(18)-1)/(1-params(3)));
end
