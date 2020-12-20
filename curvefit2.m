clear clc
close all

 cd images-3M

% name='Max_3M_tapered.png';
% name='Max_3M_ovoidV2.png';
% name= 'Max_3M_square.png';
% 

% name='Man_3M_tapered.png';
name='Man_3M_ovoid.png';
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


[Xx, Yy] = XYpoints(BW,0);
% [X, Y] = XYpointscale(Xx, Yy);

[X, Y] = XYpointscale(Xx, Yy);



X= round(X);
Y= round(Y);

%% 
[points] = XYpointcurveselection(Y);

%%



man_XX_ova_21=X(points);
man_YY_ova_21=Y(points);
% 
[fitresult, gof] =createFits(man_XX_ova_21, man_YY_ova_21)
man_XX_ova=(Xx);
man_YY_ova=(Yy);
max_man_ova_x=max(man_XX_ova);
min_man_ova_x=min(man_XX_ova);
max_man_ova_y=max(man_YY_ova);
min_man_ova_y=min(man_YY_ova);

%%
man_XX_ova_21=man_XX_ova_21';
man_YY_ova_21=man_YY_ova_21'
% 
% man_XX_tap_21=X(points);
% man_YY_tap_21=Y(points);
% % 
% [fitresult, gof] =createFits(man_XX_tap_21, man_YY_tap_21)
% man_XX_tap=(Xx);
% man_YY_tap=(Yy);
% max_man_tap_x=max(man_XX_tap);
% min_man_tap_x=min(man_XX_tap);
% max_man_tap_y=max(man_YY_tap);
% min_man_tap_y=min(man_YY_tap);
% 
% %%
% man_XX_tap_21=man_XX_tap_21';
% man_YY_tap_21=man_YY_tap_21';


% man_XX_squ_21=X(points);
% man_YY_squ_21=Y(points);
% % 
% [fitresult, gof] =createFits(man_XX_squ_21, man_YY_squ_21)
% man_XX_squ=(Xx);
% man_YY_squ=(Yy);
% max_man_squ_x=max(man_XX_squ);
% min_man_squ_x=min(man_XX_squ);
% max_man_squ_y=max(man_YY_squ);
% min_man_squ_y=min(man_YY_squ);
% 
% %%
% man_XX_squ_21=man_XX_squ_21';
% man_YY_squ_21=man_YY_squ_21';


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


