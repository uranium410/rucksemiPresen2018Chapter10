%関数g(x)=x^2,p(x)=1/2 exp(-|x|)に関する期待値
%∫g(x)p(x)dxをガウス分布を代理分布とした重点サンプリング法で計算する

%サンプルの和
sampleNum = 1000000;

%合計値
sum = 0;

for i = 1:sampleNum
    sample = normrnd(0,1);
    sum = sum + g(sample)*p(sample)/normpdf(sample,0);
end

answer = sum / sampleNum;

disp('重点サンプリング法を用いた計算結果は')
disp(answer)
%解は2であるが、重点サンプリング法では
%大きく外れた値が出やすい。

function result = p(x)
    result = 1/2 * exp(-abs(x));
end

function result = g(x)
    result = x^2;
end