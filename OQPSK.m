figure(1);
subplot(4,1,1);
t = 0:0.001:8;
d = [0 0;0.5 1;1 1;1.5 0;2 1;2.5 1;3 0;3.5 0;4 1;4.5 0;5 1;5.5 1;6 0;6.5 1;7 0;7.5 1];
message = pulstran(t-0.25, d, 'rectpuls', 0.5);
plot(t, message);
axis([0 8 -0.2 +1.2]);

%%下面定义OQPSK的I路信号%%
subplot(4,1,2);
a = 1/sqrt(2);
x = t-0.5;
yI1 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-1.5;
yI2 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-2.5;
yI3 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-3.5;
yI4 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-4.5;
yI5 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-5.5;
yI6 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-6.5;
yI7 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-7.5;
yI8 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
yI = yI1+yI2+yI3+yI4+yI5+yI6+yI7+yI8;
plot(t, yI);
axis([0 8 -1.2 +1.2]);
title('I');

%%下面定义OQPSK的Q路信号，注意有0.5秒的延时%%
subplot(4,1,3);
x = t-1;
yQ1 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-2;
yQ2 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-3;
yQ3 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-4;
yQ4 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-5;
yQ5 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-6;
yQ6 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-7;
yQ7 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-8;
yQ8 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
yQ = yQ1+yQ2+yQ3+yQ4+yQ5+yQ6+yQ7+yQ8;
plot(t, yQ);
axis([0 8 -1.2 +1.2]);
title('Q');

%%下面分别将I, Q信号与载波相乘%%
subplot(4,1,4);
fc = 10;
I_carrier = cos(2*pi*fc*t);
Q_carrier = sin(2*pi*fc*t);
st = yI.*I_carrier - yQ.*Q_carrier;
plot(t, st);
axis([0 8 -1.2 +1.2]);
title('st');