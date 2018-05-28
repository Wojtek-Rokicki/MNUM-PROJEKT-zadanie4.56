function [] = RozwODE()
%% 8 7; 0 0.4; 5 0; 0.01 0.001
wart=[8 7; 0 0.4; 5 0; 0.01 0.001];
for i=1:4
[T,Y] = ode45(@doode,[0 20],wart(i,:));
figure(i)
plot(Y(:,1),Y(:,2))
end
end