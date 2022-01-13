function r = mfcc(s, fs)
n=fs*0.02;% 帧长
m =n/2;  % 帧移
L = length(s);  % 信号总长度
M=enframe(s,n,m); %分帧
nbFrame = size(M,2);%获取帧数
h = hamming(n);  % Hamming窗w = 0.54 - 0.46cos(2pix);
M2 = diag(h)*M';  % 对M加窗，形成对角矩阵M2
for i = 1:nbFrame
frame(i,:) = fft(M2(i, :));   % 进行快速傅里叶变换，将其转换到频域上
end
% tmax = l / fs;
m = melfb(20, n, fs);  % 调用20阶MEL滤波器组进行滤波
n2 = 1 + floor(n/2);
z = m * abs(frame(1:n2, :)).^2;  % 取前n2行帧列向量的平方
r = dct(log(z));  % 取对数后进行反余弦变换
end