function r = mfcc(s, fs)
n = 250;  % 帧长
m = 100;  % 帧移
L = length(s);  % 信号总长度
nbFrame = floor((L - n) / m) + 1;  % 信号总帧数
for i = 1:n
  for j = 1:nbFrame
   M(i, j) = s(((j - 1) * m) + i);  %分帧
  end
end
h = hamming(n);  % Hamming窗w = 0.54 - 0.46cos(2pix);
M2 = diag(h)*M;  % 对M加窗，形成对角矩阵M2
for i = 1:nbFrame
frame(:,i) = fft(M2(:, i));   % 进行快速傅里叶变换，将其转换到频域上
end
t = n / 2;
% tmax = l / fs;
m = melfb(12, n, fs);  % 调用20阶MEL滤波器组进行滤波
n2 = 1 + floor(t);
z = m * abs(frame(1:n2, :)).^2  % 取前n2行帧列向量的平方
r = dct(log(z));  % 取对数后进行反余弦变换
end