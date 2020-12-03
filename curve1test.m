clear clc
close all
RGB = imread('Max_3M_tapered.png');

level=graythresh(RGB);



BW = im2bw(RGB,level); %#ok<IM2BW>

Icomplement = imcomplement(BW);

BWskel = bwskel(Icomplement);

BWskel = imcomplement(BWskel)

BW = imrotate(BWskel,90);



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
meanx= round((Minx+Maxx)/2);

centro = find(X == meanx);

centromean= round(mean(centro));


n = 2:7;
fib= fibonacci(n)*9;

fibneg= centromean - fib;
fibpos= centromean + fib;

fibo=[fibneg  centromean   fibpos];

XX=X(fibo);
YY=Y(fibo);
[fitresult, gof] =createFits(XX, YY)








