function[y] = rk4()
l=1
%for h=0.001:0.001:0.020
h = 0.003; %krok
x1=8; %pierwszy pkt
x2=7; %drugi pkt
%% 8 7; 0 0.4; 5 0; 0.01 0.001
tic; 
t=0:h:20; %ilosc kroków
 
y(:,1) = [x1 x2]; %dane do wykresu
 
for i=1:(length(t)-1)
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
%figure(l)
plot(y(1,:),y(2,:))
l=l+1;
toc;
%end
end