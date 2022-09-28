clear;
clc;
format long;
 
% ==========����========== %
N = 10000;  % ����ͼ��N�����㹹��
tscale = 6e-5;  % X����ʾ��ʱ�䳤�ȣ���λΪ��
dt = tscale / N;  % ÿ��������ʱ����
t = 0 : dt : tscale;

f1 = 100000;  % �����ź�Ƶ��100kHz
f2 = 250000;  % �����ź�Ƶ��250kHz
f3 = 400000;  % �����ź�Ƶ��400kHz
A = 0.5;

% ==========���������ź�========== %
y1 = A * sin(2 * pi * f1 * t);  % 0.5Ϊ�����
y2 = A * sin(2 * pi * f2 * t);  % 0.5Ϊ�����
y3 = A * sin(2 * pi * f3 * t);  % 0.5Ϊ�����
 
% ==========��ͼ========== %
subplot(3, 4, 1);
scatter(t .* 1000, y1, '.', 'k');  % ��1000����s�����ms��
title('100kHz�����ź�');
axis([-inf, +inf, -1, +1]);  % ����������ʾ��Χ��
xlabel('t/ms', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('��ѹ/V', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

subplot(3, 4, 5);
scatter(t .* 1000, y2, '.', 'r');  % ��1000����s�����ms��
title('250kHz�����ź�');
axis([-inf, +inf, -1, +1]);  % ����������ʾ��Χ��
xlabel('t/ms', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('��ѹ/V', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

subplot(3, 4, 9);
scatter(t .* 1000, y3, '.', 'b');  % ��1000����s�����ms��
title('400kHz�����ź�');
axis([-inf, +inf, -1, +1]);  % ����������ʾ��Χ��
xlabel('t/ms', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('��ѹ/V', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

% ==========���������ͼ========== %
k = 1;
n_point = (k * tscale) / (1 / 500000);

t = linspace(0, k * tscale, n_point);
Y1 = A * sin(2 * pi * f1 * t);  % 0.5Ϊ�����
subplot(3, 4, 2);
stem(t .* 1000, Y1, '.');  % ��1000����s�����ms��
title('500kHz�����ź�');
axis([-inf, +inf, -1, +1]);  % ����������ʾ��Χ��
xlabel('t/ms', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('��ѹ/V', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

t = linspace(0, k * tscale, n_point);
Y2 = A * sin(2 * pi * f2 * t);  % 0.5Ϊ�����
subplot(3, 4, 6);
stem(t .* 1000, Y2, '.');  % ��1000����s�����ms��
title('500kHz�����ź�');
axis([-inf, +inf, -1, +1]);  % ����������ʾ��Χ��
xlabel('t/ms', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('��ѹ/V', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

t = linspace(0, k * tscale, n_point);
Y3 = A * sin(2 * pi * f3 * t);  % 0.5Ϊ�����
subplot(3, 4, 10);
stem(t .* 1000, Y3, '.');  % ��1000����s�����ms��
title('500kHz�����ź�');
axis([-inf, +inf, -1, +1]);  % ����������ʾ��Χ��
xlabel('t/ms', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('��ѹ/V', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

% ==========���������Ƶ��ͼ========== %
fs = 500000;

yf1 = fft(Y1);
subplot(3, 4, 3);
realy = 2 * abs(yf1(1 : n_point)) / n_point;
realf = (0 : n_point - 1) * (fs / n_point);   
stem(realf, realy, '.');
title('100kHz�����źŲ�����Ƶ��ͼ');
axis([0, 500000, 0, 1]);
xlabel('f/Hz', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('��ѹ/V', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

yf2 = fft(Y2);
subplot(3, 4, 7);
realy = 2 * abs(yf2(1 : n_point)) / n_point;  % Ƶ��Ϊ250kHzʱ���ȴ���0.5V��
realf = (0 : n_point - 1) * (fs / n_point);  
stem(realf, realy, '.');
title('250kHz�����źŲ�����Ƶ��ͼ');
axis([0, 500000, 0, 1]);
xlabel('f/Hz', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('��ѹ/V', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

yf3 = fft(Y3);
subplot(3, 4, 11);
realy = 2 * abs(yf3(1 : n_point)) / n_point;
realf = (0 : n_point - 1) * (fs / n_point);  
stem(realf, realy, '.');
title('500kHz�����źŲ�����Ƶ��ͼ');
axis([0, 500000, 0, 1]);
xlabel('f/Hz', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('��ѹ/V', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

% ==========�ָ�����========== %
%ԭ��(�ڲ巨): y(t)=��x(n)*sinc((t-nTs)/Ts)
n_point = (k * tscale) / (1 / 500000);  % ��������
ts = 1 / fs;  % ����ʱ����
to = linspace(0, k * tscale, n_point);
K = 30;  % ��ԭ����źŵ㱶��
dt = ts / K;  % ��ԭ��ĵ�ʱ����
ta = 0 : dt : n_point * ts;

% =====�ź�1===== %
y_recover1 = zeros(length(ta), 1);  % �ָ��ź�y���Ƚ���һ��0���󣬴�0��1��ʱ����Ϊdt
for t = 0 : length(ta) - 1  % ����������ÿ��ֵ
    for m = 0 : length(to) - 1  % �ۼ�sinc��ԭ������Ӧ��Ļ�
        y_recover1(t + 1) = y_recover1(t + 1) + Y1(m + 1) * sinc((t * dt - m * ts) / ts);
    end
end

subplot(3, 4, 4);
scatter(ta.* 1000, y_recover1, '.');
title('�ؽ��ź�(�ڲ巨)');
axis([-inf, +inf, -1, +1]);  % ����������ʾ��Χ��
xlabel('t/ms', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('��ѹ/V', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

% =====�ź�2===== %
y_recover2 = zeros(length(ta), 1);  % �ָ��ź�y���Ƚ���һ��0���󣬴�0��1��ʱ����Ϊdt
for t = 0 : length(ta) - 1  % ����������ÿ��ֵ
    for m = 0 : length(to) - 1  % �ۼ�sinc��ԭ������Ӧ��Ļ�
        y_recover2(t + 1) = y_recover2(t + 1) + Y2(m + 1) * sinc((t * dt - m * ts) / ts);
    end
end

subplot(3, 4, 8);
scatter(ta.* 1000, y_recover2, '.');
title('�ؽ��ź�(�ڲ巨)');
axis([-inf, +inf, -1, +1]);  % ����������ʾ��Χ��
xlabel('t/ms', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('��ѹ/V', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
grid on;

% =====�ź�3===== %
y_recover3 = zeros(length(ta), 1);  % �ָ��ź�y���Ƚ���һ��0���󣬴�0��1��ʱ����Ϊdt
for t = 0 : length(ta) - 1  % ����������ÿ��ֵ
    for m = 0 : length(to) - 1  % �ۼ�sinc��ԭ������Ӧ��Ļ�
        y_recover3(t + 1) = y_recover3(t + 1) + Y3(m + 1) * sinc((t * dt - m * ts) / ts);
    end
end

subplot(3, 4, 12);
scatter(ta.* 1000, y_recover3, '.');
title('�ؽ��ź�(�ڲ巨)');
axis([-inf, +inf, -1, +1]);  % ����������ʾ��Χ��
xlabel('t/ms', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
ylabel('��ѹ/V', 'FontName', '����', 'FontWeight', 'normal', 'FontSize', 14);
grid on;