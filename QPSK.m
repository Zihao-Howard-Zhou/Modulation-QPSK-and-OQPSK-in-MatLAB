subplot(4,1,1);
%%%第一个图先画输入的二进制比特序列%%%
t = 0:0.001:8;     
d = [0 0;0.5 1;1 1;1.5 0;2 1;2.5 1;3 0;3.5 0;4 1;4.5 0;5 1;5.5 1;6 0;6.5 1;7 0;7.5 0];
message = pulstran(t-0.25, d, 'rectpuls', 0.5);
plot(t, message);
axis([0 8 -0.2 +1.2]);
title('message');

%%%下面分别绘制映射+脉冲成型之后的I, Q信号%%%
subplot(4,1,2);
a = 1/sqrt(2);
x = t-0.5;           %因为我们设采样时刻在 kTs+0.5,也就是每一个码元持续时间的中间
I1 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-1.5;             %第二个时刻的码元输入升余弦滚降滤波器
I2 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-2.5;
I3 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-3.5;
I4 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-4.5;
I5 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-5.5;
I6 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-6.5;
I7 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-7.5;
I8 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
I = I1+I2+I3+I4+I5+I6+I7+I8;
plot(t, I);
title('I signal');

subplot(4,1,3);
x = t-0.5;           %因为我们设采样时刻在 kTs+0.5,也就是每一个码元持续时间的中间
Q1 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-1.5;             %第二个时刻的码元输入升余弦滚降滤波器
Q2 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-2.5;
Q3 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-3.5;
Q4 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-4.5;
Q5 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-5.5;
Q6 = -a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-6.5;
Q7 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
x = t-7.5;
Q8 = a.*sinc(x).*cos(pi*x)./(1-4.*x.*x);
Q = Q1+Q2+Q3+Q4+Q5+Q6+Q7+Q8;
plot(t, Q);
title('Q signal');

subplot(4,1,4);
fc = 10;
I_carrier = cos(2*pi*fc*t);
Q_carrier = sin(2*pi*fc*t);
st = I.*I_carrier - Q.*Q_carrier;
plot(t, st);
title('modulated signal');

figure(2);
fc = 10;
I_carrier = cos(2*pi*fc*t);
Q_carrier = sin(2*pi*fc*t);
st = I.*I_carrier - Q.*Q_carrier;
plot(t, st);
hold on;
envelope = sqrt(I.^2 + Q.^2);
plot(t, envelope, 'r');
%hold on;
%plot(t, -envelope, 'r');

figure(3);
j = sqrt(-1);
t = 0:0.001:8;
complex_I_Q = I + Q.*j;
complex_carrier = I_carrier + Q_carrier.*j;
st_complex = complex_I_Q.*complex_carrier;
plot3(real(st_complex), t, imag(st_complex));
hold on;
plot3(I, t, Q);
ylabel('t');
zlabel('y');
xlabel('x');
set(gca,'YDir','reverse');
axis([-1.5 1.5 0 8 -1.5 1.5]);
grid on;

% figure(4);
% plot(t,real(st_complex));
% 
% figure(5);
% plot(t, imag(st_complex));

% figure(4);
% fc = 1;
% t=-5:0.001:5;
% x=cos(2*pi*fc*t);
% y=sin(2*pi*fc*t);
% %r1 = sin(t)+sin(2.*t)+3*sinc(t)+j*sin(t);
% %st = r1.*(x+j*y);
% %plot3(real(st), t, imag(st));
% plot3(x,t,y);
% xlabel('x');
% ylabel('t');
% zlabel('y');
% set(gca,'YDir','reverse');
% grid on;
% title('e^{j\omega_0t}的波形');


% figure(5);
% a = 1/sqrt(2);
% t = 0:0.001:8;
% dI_ori = [0 -a;0.5 -a;1 a;1.5 a;2 -a;2.5 -a;3 a;3.5 a;4 a;4.5 a;5 -a;5.5 -a;6 -a;6.5 -a;7 a;7.5 a];
% I_ori = pulstran(t-0.25, dI_ori, 'rectpuls', 0.5);
% subplot(3,1,1);
% plot(t, I_ori);
% axis([0 8 -2 2]);
% subplot(3,1,2);
% dQ_ori = [0 a;0.5 a;1 -a;1.5 -a;2 -a;2.5 -a;3 a;3.5 a;4 -a;4.5 -a;5 -a;5.5 -a;6 a;6.5 a;7 a;7.5 a];
% Q_ori = pulstran(t-0.25, dQ_ori, 'rectpuls', 0.5);
% plot(t, Q_ori);
% axis([0 8 -2 2]);
% subplot(3,1,3);
% st2 = I_ori.*cos(2*pi*10*t) - Q_ori.*sin(2*pi*10*t);
% plot(t, st2);
% axis([0 8 -2 2]);
% 
% figure(6);
% IQ_complex = I_ori + Q_ori*j;
% carrier_complex = cos(2*pi*t) + sin(2*pi*t)*j;
% st3 = IQ_complex.*carrier_complex;
% plot3(real(st3), t, imag(st3));
% xlabel('x');
% ylabel('t');
% zlabel('y');
% set(gca,'YDir','reverse');
% grid on;


% figure(4);
% fc = 10;
% I_carrier = cos(2*pi*fc*t);
% Q_carrier = sin(2*pi*fc*t);
% st = I.*I_carrier - Q.*Q_carrier;
% plot(t, st);
% hold on;
% envelope = sqrt(I.^2 + Q.^2);
% plot(t, envelope, 'r');
% hold on;
% plot(t, -envelope, 'r');



% figure(5);
% s = I + Q*j;
% plot3(real(s), t, imag(s));
% set(gca,'YDir','reverse');
% xlabel('x');
% ylabel('t');
% zlabel('z');