function [dy  ] = doode( t,y )
dy = zeros(2,1);    % a column vector
dy(1) = y(2)+y(1)*(0.2-y(1)*y(1)-y(2)*y(2));
dy(2) = -y(1)+y(2)*(0.2-y(1)*y(1)-y(2)*y(2));
end