function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(3, 1);
end
[T_order, T] = model_implement1.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(9, 1);
    residual(1) = (y(1)) - (y(1)-T(1)*(y(7)-y(2)-y(3)));
    residual(2) = (y(2)) - (y(1)*params(6)*params(7)+y(2)*params(1)-T(2)*(params(4)*y(5)+params(5)*y(4)));
    residual(3) = (y(6)) - (y(6)*params(10)+(1-params(10))*(y(2)*params(8)+y(1)*params(9)));
    residual(4) = (y(7)) - (y(6));
    residual(5) = (y(4)) - (y(4)*params(13)+(1-params(13))*(y(2)*params(14)+y(1)*params(15)));
    residual(6) = (y(3)) - (y(3)*params(11)+x(1));
    residual(7) = (y(5)) - (y(5)*params(12)+x(2));
    residual(8) = (y(8)) - (y(3)*T(3));
    residual(9) = (y(1)) - (y(9)-y(8));
end
