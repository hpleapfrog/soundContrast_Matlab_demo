n = 10;                         % number of centroids required
traindir='soundContrastTrain\';
for i = 1:n                     % �����ݿ��еĴ����γ��뱾
    file = sprintf('%ss%d.wav', traindir, i);           
    disp(file);
    [s, fs] = audioread(file);
    L = length(s);  % �ź��ܳ���
   fprintf('fs=%f \n',fs);%��ʾ����Ƶ��
    fprintf('L=%f \n',L);%��ʾ����Ƶ��
end
s=filter([1 -0.97],1,s);