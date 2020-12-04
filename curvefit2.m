clear clc
close all

%  cd images-3M

% name='Max_3M_tapered.png';
% name='Max_3M_ovoid.png';
% name= 'Max_3M_square.png';
% 

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

name = 'man_5_55.16.bmp';
%  name = 'man_4_55.34.bmp';
% name = 'man_3_56.22.bmp';
% name = 'man_2_60.34.bmp';
% name = 'man_1_56.52.bmp';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
% name = 'copy_JD_man_1_56.52.png'



RGB = imread(name);


cd ..\

level=graythresh(RGB);
% level=0; % para orthoaaid dilatar o no usar umbral



BW = im2bw(RGB,level); %#ok<IM2BW>

Icomplement = imcomplement(BW);

BWskel = bwskel(Icomplement);

BWskel = imcomplement(BWskel);

BW = imrotate(BWskel,90);



[X, Y] = XYpoints(BW,0);


[X, Y] = XYpointscale(X, Y);

% 
% Minx=min(X);
%  X=(X-Minx)
% 
% Miny=min(Y)
% Y=(Y-Miny)
% 
% 
% Maxx=max(X);
% meanx= round((Maxx)/2);

X= round(X)
Y= round(Y)

% centro = 300;
% 
% centromean= round(mean(centro));

%%  no es muy eficiente moviendose en pixeles

% nf = 2:7;
% fib= fibonacci(nf)*9;
% 
% fibneg= centromean - fib;
% fibpos= centromean + fib;
% 
% fibo=[fibneg  centromean   fibpos];
% 
% % point(:,:) = find(X == fibo(:,:));
% 
% % XX=X(fibo);
% % YY=Y(fibo);
% %  [fitresult, gof] =createFits(XX, YY);
% % 
% % for i=1:7
% %     model=fitresult{i}
% % end


%%  segundo camino moviendose en Y
nf2 = 2:17;
fib2= fibonacci(nf2)*7;

centroA=find(Y == 0);  
centro = Y(300);
puntoA=find(Y == fib2(:,1));  pAmin = min(puntoA); pAmax= max(puntoA);
puntoB=find(Y == fib2(:,2));  pBmin = min(puntoB); pBmax= max(puntoB);
puntoC=find(Y == fib2(:,3));  pCmin = min(puntoC); pCmax= max(puntoC);
puntoD=find(Y == fib2(:,4));   pDmin = min(puntoD); pDmax= max(puntoD);
puntoE=find(Y == fib2(:,5));  pEmin = min(puntoE); pEmax= max(puntoE);
puntoF=find(Y == fib2(:,6));   pFmin = min(puntoF); pFmax= max(puntoF);
puntoG=find(Y == fib2(:,7));  pGmin = min(puntoG); pGmax= max(puntoG);
puntoH=find(Y == fib2(:,8));  pHmin = min(puntoH); pHmax= max(puntoH);
puntoI=find(Y == fib2(:,9));  pImin = min(puntoI); pImax= max(puntoI);
% 
% fibneg2= centro - fib2(1:3)*5;
% fibpos2= centro + fib2(1:3)*5;
% fibo2=[fibneg2  centro   fibpos2];
centroA = round(mean(centroA))

puntos= [ centroA pImin pHmin pGmin  pAmin pBmin pCmin pDmin pEmin pFmin pImax pHmax pGmax  pFmax pEmax pDmax pCmax pBmax pAmax]

XX=X(puntos);
YY=Y(puntos);

[fitresult, gof] =createFits(XX, YY);



%%


cd arch_orthoaid

s1 = 'fitresult.mat';
s2 = name;
s3 = [s2 s1];
s4 ='result.mat';
s5 = [s2 s4];


save(s3, 'fitresult');
save(s5, 'gof');
cd ..\


