clear clc
close all
RGB = imread('inferiort1ejemplo.jpg');

level=0.7;

BW = im2bw(RGB,level);

BW = imrotate(BW,90);

[m n] =size(BW);

num = numel(find(BW==0));   % numero de datos

X = zeros(num,1);
Y = zeros(num,1);
K=1;
% 


for i=1:m
    for j=1:n
            if BW(i,j)==0;
                X(K) = i;
                Y(K) = j;
                K=K+1 ;
            end
    
    end
end

Minx=min(X);
Maxx=max(X);
meanx=(Minx+Maxx)/2;

centro = find(X == meanx);

centromean= round(mean(centro));


n = 7:15;
fib= fibonacci(n);

fibneg= centromean - fib;
fibpos= centromean + fib;

fibo=[fibneg fibpos];

XX=X(fibo);
YY=Y(fibo);
[fitresult, gof] =createFits(XX, YY)








