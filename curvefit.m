clear clc
close all

% cd images-3M

% name='Max_3M_tapered.png';
% name='Max_3M_ovoid.png';
% name= 'Max_3M_square.png';


% name='Man_3M_tapered.png';
% name='Man_3M_ovoid.png';
% name= 'Man_3M_square.png';

cd arch_orthoaid

% name = 'max_5_61.52.bmp';
% name = 'max_4_58.78.bmp';
% name = 'max_3_57.00.bmp';
% name = 'max_2_64.78.bmp';
% name = 'max_1_64.00.bmp';
% 

% name = 'man_5_55.16.bmp';
% name = 'man_4_55.34.bmp';
% name = 'man_3_56.22.bmp';
% name = 'man_2_60.34.bmp';
% name = 'man_1_56.52.bmp';
name = 'copy_JD_man_1_56.52.png'



RGB = imread(name);


cd ..\

level=graythresh(RGB);
% level=0; % para orthoaaid dilatar o no usar umbral



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

% for i=1:7
%     model=fitresult{i}
% end

cd arch_orthoaid

s1 = 'fitresult.mat';
s2 = name;
s3 = [s2 s1];
s4 ='result.mat';
s5 = [s2 s4];


save(s3, 'fitresult');
save(s5, 'gof');
cd ..\


