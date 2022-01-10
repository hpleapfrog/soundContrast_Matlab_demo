function d = disteu(x, y)

[M, N] = size(x);  %��Ƶx��ֵ����M��N��
[M2, P] = size(y); %��Ƶy��ֵ����M2��P��
if (M ~= M2)
    error('��ƥ�䣡')  %������Ƶʱ�䳤�Ȳ����
end
d = zeros(N, P);
if (N < P)%��������Ƶʱ�䳤����ȵ�ǰ����
    copies = zeros(1,P);
    for n = 1:N
        d(n,:) = sum((x(:, n+copies) - y) .^2, 1);
    end
else
    copies = zeros(1,N);
    for p = 1:P
        d(:,p) = sum((x - y(:, p+copies)) .^2, 1)';
    end%%�ɶ�ŷ�Ͼ���������������֮��ľ���
d=d.^0.5;
end
