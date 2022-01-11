function r = mfcc(s, fs)
n = 250;  % ֡��
m = 100;  % ֡��
L = length(s);  % �ź��ܳ���
nbFrame = floor((L - n) / m) + 1;  % �ź���֡��
for i = 1:n
  for j = 1:nbFrame
   M(i, j) = s(((j - 1) * m) + i);  %��֡
  end
end
h = hamming(n);  % Hamming��w = 0.54 - 0.46cos(2pix);
M2 = diag(h)*M;  % ��M�Ӵ����γɶԽǾ���M2
for i = 1:nbFrame
frame(:,i) = fft(M2(:, i));   % ���п��ٸ���Ҷ�任������ת����Ƶ����
end
t = n / 2;
% tmax = l / fs;
m = melfb(12, n, fs);  % ����20��MEL�˲���������˲�
n2 = 1 + floor(t);
z = m * abs(frame(1:n2, :)).^2  % ȡǰn2��֡��������ƽ��
r = dct(log(z));  % ȡ��������з����ұ任
end