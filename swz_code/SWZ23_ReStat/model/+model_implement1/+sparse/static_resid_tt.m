function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 3
    T = [T; NaN(3 - size(T, 1), 1)];
end
T(1) = (1-params(2))/params(3);
T(2) = params(3)*params(2)*params(6)/(1-params(2));
T(3) = T(1)*(params(11)-1)^(-1);
end
