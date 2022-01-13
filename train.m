
function code = train(traindir, n) 
for i = 1:n                     % �����ݿ��еĴ����γ��뱾
    file = sprintf('%ss%d.wav', traindir, i);           
    disp(file);
    [s, fs] = audioread(file);
    v = mfcc(s, fs);            % ���� MFCC's ��ȡ��������������ֵ��Mel����ϵ��
    code{i} = vqlbg(v, 20);      % ѵ��VQ�뱾  ͨ��ʸ���������õ�ԭ˵���˵�VQ�뱾
end
end
