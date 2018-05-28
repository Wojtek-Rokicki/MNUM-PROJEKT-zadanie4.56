function [dx2] = dx2(x1,x2)
    dx2 = -x1 + x2*(0.2-(x1)^2-(x2)^2);
end