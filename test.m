n = 10;                         
traindir='soundContrastTrain\';
for i = 1:n                     
    file = sprintf('%ss%d.wav', traindir, i);           
    disp(file);
    [s, fs] = audioread(file);
    L = length(s);  % �ź��ܳ���
   fprintf('fs=%f \n',fs);%��ʾ����Ƶ��
    fprintf('L=%f \n',L);%��ʾ����Ƶ��
    z=enframe(s,882,441);
    v = mfcc(s, fs);
    n = 250;  % ֡��
m = 100;  % ֡��
L = length(s);  % �ź��ܳ���
nbFrame = floor((L - n) / m) + 1;  % �ź���֡��
for i = 1:n
  for j = 1:nbFrame
   M(i, j) = s(((j - 1) * m) + i);  %��֡
  end
end
end
s=filter([1 -0.97],1,s);