delta=8/160;
t=0:delta:8;
a=1/sqrt(2);
x=t-0.5;
y1= -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-1.5;
y2= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-2.5;
y3= - a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-3.5;
y4= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-4.5;
y5= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-5.5;
y6= -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-6.5;
y7= -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-7.5;
y8= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
I= y1+y2+y3+y4+y5+y6+y7+y8;
% figure(1);
% plot(t, I);
% Q路信号
t=0:delta:8;
a=1/sqrt(2);
x=t-0.5;
y1= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-1.5;
y2= -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-2.5;
y3= -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-3.5;
y4= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-4.5;
y5= -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-5.5;
y6= -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-6.5;
y7= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-7.5;
y8= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
Q= y1+y2+y3+y4+y5+y6+y7+y8;
%包络曲面
figure(1);
i=find(isnan(I));        %isnan：返回一个和I一样维度的数组，如果I里面的元素有nan，返回1，是数字就返回 0
                         %i = find(isnan(I))就是找到isnan(I)里面非0元素的位置
I(i)=0;
i=find(isnan(Q));
Q(i)=0;
I(81)=0.708;I(121)=-0.708;
Q(41)=-0.708;Q(101)=-0.708;Q(141)=0.708;
r=sqrt(power(I,2)+power(Q,2));
u=linspace(-pi,pi,50);
y=linspace(0,8,161);
[U,Y]=meshgrid(u,y);
[U,R]=meshgrid(u,r);
X=R.*cos(U);
Z=R.*sin(U);
surf(X,Y,Z);
axis equal
ylabel('t');
zlabel('y');
xlabel('x');
set(gca,'YDir','reverse');
axis([-1.5 1.5 0 8 -1.5 1.5]);
grid on;


hold on;
t=0:0.001:8;
a=1/sqrt(2);
x=t-0.5;
y1= -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-1.5;
y2= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-2.5;
y3= - a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-3.5;
y4= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-4.5;
y5= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-5.5;
y6= -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-6.5;
y7= -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-7.5;
y8= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
y01= y1+y2+y3+y4+y5+y6+y7+y8;
% Q路信号
t=0:0.001:8;
a=1/sqrt(2);
x=t-0.5;
y1= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-1.5;
y2= -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-2.5;
y3= -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-3.5;
y4= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-4.5;
y5= -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-5.5;
y6= -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-6.5;
y7= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x=t-7.5;
y8= a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
y02= y1+y2+y3+y4+y5+y6+y7+y8;
% IQ信号
t=0:0.001:8;
s=y01+y02*j;

plot3(real(s) ,t,imag(s),'r') ;
set(gca,'YDir','reverse');
xlabel('I');
ylabel('t');
zlabel('Q');

% figure(2);
% fc = 10;
% I_carrier = cos(2*pi*fc*t);
% Q_carrier = sin(2*pi*fc*t);
% st = y01.*I_carrier - y02.*Q_carrier;
% plot(t, st);
% hold on;
% envelope = sqrt(y01.^2 + y02.^2);
% plot(t, envelope, 'r');


