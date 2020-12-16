clear clc
close all

 cd images-3M

% name='Max_3M_tapered.png';
% name='Max_3M_ovoidV2.png';
% name= 'Max_3M_square.png';
% 

% name='Man_3M_tapered.png';
% name='Man_3M_ovoid.png';
name= 'Man_3M_square.png';

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


[Xx, Yy] = XYpoints(BW,0);
[X, Y] = XYpointscale(Xx, Yy);


X= round(X);
Y= round(Y);

%% 
[points] = XYpointcurveselection(Y);

%%

man_XX_squ=X(points);
man_YY_squ=Y(points);
% 
[fitresult, gof] =createFits(man_XX_squ, man_YY_squ);

man_XX_squ=(Xx);
man_YY_squ=(Yy);
max_man_squ_x=max(man_XX_squ);
min_man_squ_x=min(man_XX_squ);
max_man_squ_y=max(man_YY_squ);
min_man_squ_y=min(man_YY_squ);

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


