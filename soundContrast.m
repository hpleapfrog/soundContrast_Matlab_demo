function testmsg = soundContrast(testdir, n, code)
nameList={'1','2','3','4','5','6','7','8','9' ,'10'};                        %���������Ҫʶ���9����
for k = 1:n                     % ���ݿ���ÿһ������������
    file = sprintf('%ss%d.wav', testdir, k);	%�ҳ��ļ���·��
    [s, fs] = audioread(file);      
        
    v = mfcc(s, fs);            % ���ҵ����ļ�ȡmfcc�任
    distmin = inf;
    k1 = 0;
   
    for l = 1:length(code)   
        d = disteu(v, code{l}); 
        dist = sum(min(d,[],2)) / size(d,1);
      
        if dist < distmin
            distmin = dist;%%�������źŵ�ʶ��
            k1 = l;
        end      
    end
    msg=nameList{k1}
    msgbox({'������',msg});
end
end

