function [max_XXsqu, max_YYsqu]=curvefit3m(image)


RGB = imread(image);
cd ..\

%  name='Max_3M_tapered.png';
% name='Max_3M_ovoid.png';
% name= 'Max_3M_square.png';
% 

% name='Man_3M_tapered.png';
% name='Man_3M_ovoid.png';
% name= 'Man_3M_square.png';

level=graythresh(RGB);
% level=0; % para orthoaaid dilatar o no usar umbral



BW = im2bw(RGB,level); %#ok<IM2BW>

Icomplement = imcomplement(BW);

BWskel = bwskel(Icomplement);

BWskel = imcomplement(BWskel);

BW = imrotate(BWskel,90);
% BW = imrotate(BW,90)


[X, Y] = XYpoints(BW,0);
[X, Y] = XYpointscale(X, Y);


X= round(X);
Y= round(Y);

%% 
[points] = XYpointcurveselection(Y);

%%

max_XXsqu=X(points);
max_YYsqu=Y(points);

end
% 
% [fitresult, gof] =createFits(XX, YY);



%%


% cd arch_orthoaid
% 
% s1 = 'fitresult.mat';
% s2 = name;
% s3 = [s2 s1];
% s4 ='result.mat';
% s5 = [s2 s4];
% 
% 
% save(s3, 'fitresult');
% save(s5, 'gof');
% cd ..\


