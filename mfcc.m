function r = mfcc(s, fs)
m = 100;
n = 256;
l = length(s);
nbFrame = floor((l - n) / m) + 1;   %��-�޷���ȡ�� 
for i = 1:n
for j = 1:nbFrame
M(i, j) = s(((j - 1) * m) + i);  %�Ծ���M��ֵ
end
end
h = hamming(n);    %�� hamming ����������������˺��Ҷ˵�������
M2 = diag(h) * M;
for i = 1:nbFrame
frame(:,i) = fft(M2(:, i));  %���źŽ��п��ٸ���Ҷ�任FFT  
end
t = n / 2;
tmax = l / fs;
m = melfb(20, n, fs); %����������Ƶ��ͨ��Mel Ƶ���˲�����õ�Mel Ƶ��,�����ڽ���ת���ɶ���Ƶ��
n2 = 1 + floor(n / 2);
z = m * abs(frame(1:n2, :)).^2;
r = dct(log(z));  %����������Ƶ�ף�������ɢ���ұ任(DCT)�任�������򣬼��ɵõ�Mel ����ϵ��(MFCC����)
end
