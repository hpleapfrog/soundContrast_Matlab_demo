
function code = train(traindir, n) 
for i = 1:n                     % 对数据库中的代码形成码本
    file = sprintf('%ss%d.wav', traindir, i);           
    disp(file);
    [s, fs] = audioread(file);
    v = mfcc(s, fs);            % 计算 MFCC's 提取特征特征，返回值是Mel倒谱系数
    code{i} = vqlbg(v, 20);      % 训练VQ码本  通过矢量量化，得到原说话人的VQ码本
end
end
