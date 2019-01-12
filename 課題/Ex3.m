%ラプラス分布に従う確率密度関数を逆関数サンプリングを用いて生成する。
%さらに、Ex2と同じ計算を逆関数サンプリングを用いて行う。

rangeMin = -5;
rangeMax = 5;
graph_dx = 0.1;
sampleNum = 10000;
sample = zeros(1,sampleNum);


for i = 1:sampleNum
    sample(i) = GetLaplaceSample();
end

%比較用の確率密度関数のグラフ生成
compLapX = rangeMin:graph_dx:rangeMax;
compLapY = LaplaceDensityFunc(compLapX);

xbins = -5:graph_dx:5;
hold off
histogram(sample,xbins,'Normalization','pdf')
hold on
plot(compLapX,compLapY,"linewidth",3)

%ここからモンテカルロ積分
sampleNum = 10000;
sum = 0;

%ここから実際に計算
for i = 1:sampleNum
    sum = sum + g(GetLaplaceSample());
end

res = sum/sampleNum;
disp("積分した値は")
disp(res)


%ラプラス分布の逆関数
function result = LaplaceInv(u)
    result = -sign(u-1/2)*log(1-2*abs(u-1/2));
end

%逆関数サンプリング
function result = GetLaplaceSample()
    result = LaplaceInv(rand());
end

%比較用のラプラス分布の確率密度関数
function result = LaplaceDensityFunc(x)
    result = 1/2*exp(-abs(x));
end

%関数g(x)
function result = g(x)
    result = x*x;
end