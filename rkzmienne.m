wart=[8 7; 0 0.4; 5 0; 0.01 0.001];
for i=1:4
    figure(i)
    rk4zmien(wart(i,1),wart(i,2),0.015)
end