clc
close all
clear all

load('hn') ;   %rango
load('kn') ;   %elevacion
load('In');    %curvatura

tempIN=In;
temphn=hn;
tempKN=kn;

newimage(:,:,1)=In;
newimage(:,:,2)=hn;
newimage(:,:,3)=kn;

h=rgb2gray(newimage);
figure,imshow(h);

temphn(temphn<=0.75)=0;
temphn(temphn>=0.9)=0;
temphn=imbinarize(temphn,'global');

se90 = strel('line', 25, 90);
se0 = strel('line', 25, 0);

temphn = imdilate(temphn, [se90 se0]);
BWdfill = imfill(temphn, 'holes');
figure, imshow(BWdfill);

temphn=BWdfill.*(hn);
figure,imshow(temphn);

tempIn=BWdfill.*(In*20);
figure,imshow(tempIn);

tempKn=BWdfill.*(kn);
figure,imshow(tempKn);

tempIn=BWdfill.*(In*20);
figure,imshow(tempIn);


