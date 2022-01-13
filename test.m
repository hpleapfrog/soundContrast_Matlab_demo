n = 10;                         
traindir='soundContrastTrain\';
for i = 1:n                     
    file = sprintf('%ss%d.wav', traindir, i);           
    disp(file);
    [s, fs] = audioread(file);
    L = length(s);  % 信号总长度
   fprintf('fs=%f \n',fs);%显示采样频率
    fprintf('L=%f \n',L);%显示采样频率
    z=enframe(s,882,441);
    v = mfcc(s, fs);
    n = 250;  % 帧长
m = 100;  % 帧移
L = length(s);  % 信号总长度
nbFrame = floor((L - n) / m) + 1;  % 信号总帧数
for i = 1:n
  for j = 1:nbFrame
   M(i, j) = s(((j - 1) * m) + i);  %分帧
  end
end
end
s=filter([1 -0.97],1,s);