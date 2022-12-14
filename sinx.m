clear;
clc;
format long;
 
figure;
% ==========参数========== %
N = 10000;  % 整个图由N个样点构成
tscale = 6e-5;  % X轴显示的时间长度，单位为秒
dt = tscale / N;  % 每个样点间的时间间隔
t = 0 : dt : tscale;

f1 = 100000;  % 生成信号频率100kHz
f2 = 250000;  % 生成信号频率250kHz
f3 = 400000;  % 生成信号频率400kHz
A = 0.5;

% ==========生成正弦信号========== %
y1 = A * sin(2 * pi * f1 * t);  % 0.5为振幅。
y2 = A * sin(2 * pi * f2 * t);  % 0.5为振幅。
y3 = A * sin(2 * pi * f3 * t);  % 0.5为振幅。
 
% ==========画图========== %
subplot(3, 1, 1);
scatter(t .* 1000, y1, '.', 'k');  % 乘1000，将s换算成ms。
title('100kHz正弦信号');
axis([-inf, +inf, -1, +1]);  % 调节坐标显示范围。
xlabel('t/ms', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('电压/V', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

subplot(3, 1, 2);
scatter(t .* 1000, y2, '.', 'r');  % 乘1000，将s换算成ms。
title('250kHz正弦信号');
axis([-inf, +inf, -1, +1]);  % 调节坐标显示范围。
xlabel('t/ms', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('电压/V', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

subplot(3, 1, 3);
scatter(t .* 1000, y3, '.', 'b');  % 乘1000，将s换算成ms。
title('400kHz正弦信号');
axis([-inf, +inf, -1, +1]);  % 调节坐标显示范围。
xlabel('t/ms', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('电压/V', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

figure;
% ==========画采样后的图========== %
k = 1;
n_point = (k * tscale) / (1 / 500000);

t = linspace(0, k * tscale, n_point);
Y1 = A * sin(2 * pi * f1 * t);  % 0.5为振幅。
subplot(3, 2, 1);
stem(t .* 1000, Y1, '.');  % 乘1000，将s换算成ms。
title('500kHz采样信号');
axis([-inf, +inf, -1, +1]);  % 调节坐标显示范围。
xlabel('t/ms', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('电压/V', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

t = linspace(0, k * tscale, n_point);
Y2 = A * sin(2 * pi * f2 * t);  % 0.5为振幅。
subplot(3, 2, 3);
stem(t .* 1000, Y2, '.');  % 乘1000，将s换算成ms。
title('500kHz采样信号');
axis([-inf, +inf, -1, +1]);  % 调节坐标显示范围。
xlabel('t/ms', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('电压/V', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

t = linspace(0, k * tscale, n_point);
Y3 = A * sin(2 * pi * f3 * t);  % 0.5为振幅。
subplot(3, 2, 5);
stem(t .* 1000, Y3, '.');  % 乘1000，将s换算成ms。
title('500kHz采样信号');
axis([-inf, +inf, -1, +1]);  % 调节坐标显示范围。
xlabel('t/ms', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('电压/V', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

% ==========画采样后的频谱图========== %
fs = 500000;

yf1 = fft(Y1);
subplot(3, 2, 2);
realy = 2 * abs(yf1(1 : n_point)) / n_point;
realf = (0 : n_point - 1) * (fs / n_point);   
stem(realf, realy, '.');
title('100kHz正弦信号采样后频谱图');
axis([0, 500000, 0, 1]);
xlabel('f/Hz', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('电压/V', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

yf2 = fft(Y2);
subplot(3, 2, 4);
realy = 2 * abs(yf2(1 : n_point)) / n_point;  % 频率为250kHz时幅度大于0.5V。
realf = (0 : n_point - 1) * (fs / n_point);  
stem(realf, realy, '.');
title('250kHz正弦信号采样后频谱图');
axis([0, 500000, 0, 1]);
xlabel('f/Hz', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('电压/V', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

yf3 = fft(Y3);
subplot(3, 2, 6);
realy = 2 * abs(yf3(1 : n_point)) / n_point;
realf = (0 : n_point - 1) * (fs / n_point);  
stem(realf, realy, '.');
title('500kHz正弦信号采样后频谱图');
axis([0, 500000, 0, 1]);
xlabel('f/Hz', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('电压/V', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

% ==========恢复波形========== %
%原理(内插法): y(t)=Σx(n)*sinc((t-nTs)/Ts)
n_point = (k * tscale) / (1 / 500000);  % 采样点数
ts = 1 / fs;  % 采样时间间隔
to = linspace(0, k * tscale, n_point);
K = 30;  % 还原后的信号点倍数
dt = ts / K;  % 还原后的点时间间隔
ta = 0 : dt : n_point * ts;

figure;
% =====信号1===== %
y_recover1 = zeros(length(ta), 1);  % 恢复信号y，先建立一个0矩阵，从0到1，时间间隔为dt
for t = 0 : length(ta) - 1  % 求过采样后的每个值
    for m = 0 : length(to) - 1  % 累加sinc与原函数对应点的积
        y_recover1(t + 1) = y_recover1(t + 1) + Y1(m + 1) * sinc((t * dt - m * ts) / ts);
    end
end

subplot(3, 1, 1);
scatter(ta.* 1000, y_recover1, '.');
title('100kHz重建信号(内插法)');
axis([-inf, +inf, -1, +1]);  % 调节坐标显示范围。
xlabel('t/ms', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('电压/V', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

% =====信号2===== %
y_recover2 = zeros(length(ta), 1);  % 恢复信号y，先建立一个0矩阵，从0到1，时间间隔为dt
for t = 0 : length(ta) - 1  % 求过采样后的每个值
    for m = 0 : length(to) - 1  % 累加sinc与原函数对应点的积
        y_recover2(t + 1) = y_recover2(t + 1) + Y2(m + 1) * sinc((t * dt - m * ts) / ts);
    end
end

subplot(3, 1, 2);
scatter(ta.* 1000, y_recover2, '.');
title('250kHz重建信号(内插法)');
axis([-inf, +inf, -1, +1]);  % 调节坐标显示范围。
xlabel('t/ms', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('电压/V', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

% =====信号3===== %
y_recover3 = zeros(length(ta), 1);  % 恢复信号y，先建立一个0矩阵，从0到1，时间间隔为dt
for t = 0 : length(ta) - 1  % 求过采样后的每个值
    for m = 0 : length(to) - 1  % 累加sinc与原函数对应点的积
        y_recover3(t + 1) = y_recover3(t + 1) + Y3(m + 1) * sinc((t * dt - m * ts) / ts);
    end
end

subplot(3, 1, 3);
scatter(ta.* 1000, y_recover3, '.');
title('500kHz重建信号(内插法)');
axis([-inf, +inf, -1, +1]);  % 调节坐标显示范围。
xlabel('t/ms', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('电压/V', 'FontName', '宋体', 'FontWeight', 'normal', 'FontSize', 14);
grid on;
