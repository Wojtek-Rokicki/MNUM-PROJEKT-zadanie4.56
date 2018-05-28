function [y] = pc()
tic;
%for h=0.001:0.001:0.020
h = 0.003; %krok
x1=8; %pierwszy pkt
x2=7; %drugi pkt
t=0:h:20; %ilosc kroków

y(:,1) = [x1 x2]; %zapis pierwszych danych do wykresu

for i=1:3
    k11=dx1(x1,x2);
    k12=dx2(x1,x2);
    
    k21=dx1(x1+0.5*h,x2+0.5*h*k11);
    k22=dx2(x1+0.5*h,x2+0.5*h*k12);
    
    k31=dx1(x1+0.5*h,x2+0.5*h*k21);
    k32=dx2(x1+0.5*h,x2+0.5*h*k22);
    
    k41=dx1(x1+h,x2+h*k31);
    k42=dx2(x1+h,x2+h*k31);
    
    x1=x1+(h/6)*(k11+k41+2*(k21+k31));
    x2=x2+(h/6)*(k12+k42+2*(k22+k32));
    
    y(:,i+1)=[x1 x2]; %zapisanie danych
end
for i = 4:(length(t))
    %predykcja z ewaluacja
    tmp1 = x1 + (h/24)*55*dx1(x1,x2) - 59*(h/24)*dx1(y(1,i-1),y(2,i-1)) + 37*(h/24)*dx1(y(1,i-2),y(2,i-2)) - 9*(h/24)*dx1(y(1,i-3),y(2,i-3));
    tmp2 = x2 + (h/24)*55*dx2(x1,x2) - 59*(h/24)*dx2(y(1,i-1),y(2,i-1)) + 37*(h/24)*dx2(y(1,i-2),y(2,i-2)) - 9*(h/24)*dx2(y(1,i-3),y(2,i-3));
    %korekcja z ewaluacja
    x1 = x1 + (h/720)*646*dx1(x1,x2) - 264*(h/720)*dx1(y(1,i-1),y(2,i-1)) + 106*(h/720)*dx1(y(1,i-2),y(2,i-2)) - 19*(h/720)*dx1(y(1,i-3),y(2,i-3)) + h*(251/720)*dx1(tmp1, tmp2);
    x2 = x2 + (h/720)*646*dx2(x1,x2) - 264*(h/720)*dx2(y(1,i-1),y(2,i-1)) + 106*(h/720)*dx2(y(1,i-2),y(2,i-2)) - 19*(h/720)*dx2(y(1,i-3),y(2,i-3)) + h*(251/720)*dx2(tmp1, tmp2);
    
    y(:,i)=[x1 x2];
end
plot(y(1,:),y(2,:));
hold on;
%plot(0:h:20,y(1,:),'-',0:h:20,y(2,:),'-')
%end
toc;
end