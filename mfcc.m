function r = mfcc(s, fs)
n=fs*0.02;% ֡��
m =n/2;  % ֡��
L = length(s);  % �ź��ܳ���
M=enframe(s,n,m); %��֡
nbFrame = size(M,2);%��ȡ֡��
h = hamming(n);  % Hamming��w = 0.54 - 0.46cos(2pix);
M2 = diag(h)*M';  % ��M�Ӵ����γɶԽǾ���M2
for i = 1:nbFrame
frame(i,:) = fft(M2(i, :));   % ���п��ٸ���Ҷ�任������ת����Ƶ����
end
% tmax = l / fs;
m = melfb(20, n, fs);  % ����20��MEL�˲���������˲�
n2 = 1 + floor(n/2);
z = m * abs(frame(1:n2, :)).^2;  % ȡǰn2��֡��������ƽ��
r = dct(log(z));  % ȡ��������з����ұ任
end