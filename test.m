n = 10;                         % number of centroids required
traindir='soundContrastTrain\';
for i = 1:n                     % 对数据库中的代码形成码本
    file = sprintf('%ss%d.wav', traindir, i);           
    disp(file);
    [s, fs] = audioread(file);
    L = length(s);  % 信号总长度
   fprintf('fs=%f \n',fs);%显示采样频率
    fprintf('L=%f \n',L);%显示采样频率
end
s=filter([1 -0.97],1,s);