clear clc
close all

 cd images-3M

name='Max_3M_tapered.png';
% name='Max_3M_ovoidV2.png';
% name= 'Max_3M_square.png';
% 

% name='Man_3M_tapered.png';
% name='Man_3M_ovoid.png';
% name= 'Man_3M_square.png';

% cd arch_orthoaid

% name = 'max_5_61.52.bmp';
% name = 'max_4_58.78.bmp';
% name = 'max_3_57.00.bmp';
% name = 'max_2_64.78.bmp';
% name = 'max_1_64.00.bmp';
% 

% name = 'man_5_55.16.bmp';
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
% BW = imrotate(BW,90)


[X, Y] = XYpoints(BW,0);
[X, Y] = XYpointscale(X, Y);


X= round(X);
Y= round(Y);

%% 
[points] = XYpointcurveselection(Y)

%%

max_XXsqu=X(points);
max_YYsqu=Y(points);
% 
[fitresult, gof] =createFits(max_XXsqu, max_YYsqu);



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


