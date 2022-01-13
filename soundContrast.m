function testmsg = soundContrast(testdir, n, code)
nameList={'1','2','3','4','5','6','7','8','9' ,'10'};                        %这个是我们要识别的9个数
for k = 1:n                     % 数据库中每一个语音的特征
    file = sprintf('%ss%d.wav', testdir, k);	%找出文件的路径
    [s, fs] = audioread(file);      
        
    v = mfcc(s, fs);            % 对找到的文件取mfcc变换
    distmin = inf;
    k1 = 0;
   
    for l = 1:length(code)   
        d = disteu(v, code{l}); 
        dist = sum(min(d,[],2)) / size(d,1);
      
        if dist < distmin
            distmin = dist;%%对语音信号的识别
            k1 = l;
        end      
    end
    msg=nameList{k1}
    msgbox({'数字是',msg});
end
end

