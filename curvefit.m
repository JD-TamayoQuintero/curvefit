clear clc
close all

cd images-3M

% name='Max_3M_tapered.png';
% name='Max_3M_ovoid.png';
% name= 'Max_3M_square.png';


RGB = imread(name);


cd ..\

level=graythresh(RGB);



BW = im2bw(RGB,level); %#ok<IM2BW>

Icomplement = imcomplement(BW);

BWskel = bwskel(Icomplement);

BWskel = imcomplement(BWskel);

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
X=(X-Minx)

Miny=min(Y)
Y=(Y-Miny)


Maxx=max(X);
meanx= round((Maxx)/2);

centro = find(X == meanx);

centromean= round(mean(centro));


n = 2:7;
fib= fibonacci(n)*9;

fibneg= centromean - fib;
fibpos= centromean + fib;

fibo=[fibneg  centromean   fibpos];

XX=X(fibo);
YY=Y(fibo);
[fitresult, gof] =createFits(XX, YY);

for i=1:7
    model=fitresult{i}
end

cd images-3M

s1 = 'fitresult.mat';
s2 = name;
s3 = [s2 s1];
s4 ='result.mat';
s5 = [s2 s4];


save(s3, 'fitresult');
save(s5, 'gof');
cd ..\


