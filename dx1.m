function [dx1] = dx1(x1, x2)
    dx1 = x2 + x1*(0.2-(x1)^2-(x2)^2);
end