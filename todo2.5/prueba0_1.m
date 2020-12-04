clc
close all
clear all

load('hn01') ;   %rango
load('kn01') ;   %elevacion
load('In01');    %curvatura

tempIN=In;
temphn=hn;
tempKN=kn;

newimage(:,:,1)=In;
newimage(:,:,2)=hn;
newimage(:,:,3)=kn;

h=rgb2gray(newimage);
figure,imshow(h);

temphn(temphn<=0.8)=0;
temphn(temphn>=0.99)=0;
 temphn=imbinarize(temphn,0.5);
figure,imshow(temphn);

 colormap(jet);
 xlabel('\fontsize{24} Eje X');
ylabel('\fontsize{24} Eje Y');
title('\fontsize{24} Imagen de rango 0.1mm')
set(gca, 'fontsize', 20) 

% A=[0 0 0, 1 1 1, 0 0 0];
% temphn = imerode(temphn, A);
% figure, imshow(temphn);

se90 = strel('line', 25, 90);
se0 = strel('line', 25, 0);

temphn = imdilate(temphn, [se90 se0]);
figure,imshow(temphn);

BWdfill = imfill(temphn, 'holes');
figure, imshow(BWdfill);

BW2 = bwmorph(temphn,'skel',inf);
figure,imshow(BW2);

temphn=BWdfill.*(hn);
figure,imshow(temphn*0.3+ BW2)
% figure,imshow(temphn);
% 
% tempIn=BWdfill.*(In*20);
% figure,imshow(tempIn);
% 
% tempKn=BWdfill.*(kn);
% figure,imshow(tempKn);
% 
% tempIn=BWdfill.*(In*20);
% figure,imshow(tempIn);
% 
% 
% 
% 
