% 
% clc 
% clear all
% close all
warning('off');


imagen=pcread('encia.pcd');
imgnormal=pcread('normal.pcd');
newimage= imagen.Location;
newimage(:,4)=imgnormal.Intensity;

%%

%curvatura

I = curv3Dto2D(newimage(:,1),newimage(:,2),newimage(:,3),newimage(:,4),0.1);
%figure, histogram(I);
In=im2double(I);
 In = normalizar(In);
% figure, imhist(In);

% rango
h = curv3Dto2D(newimage(:,1),newimage(:,2),newimage(:,4),newimage(:,3),0.1);
%figure, imhist(h);
hn=im2double(h);
hn = normalizar(hn);

%figure, imhist(hn);


%altura
k = density3Dto2D(newimage(:,1),newimage(:,2),newimage(:,3),0.5);
%figure, histogram(k);
% kn = normalizar(k);
kn=im2double(k);
kn = normalizar(kn);
%figure, imhist(kn);

%%
Imaran=hn;

% level=graythresh(hn);
level=0.8; % para orthoaaid dilatar o no usar umbral

BW = im2bw(Imaran,level); %#ok<IM2BW>
BW = imrotate(BW,-90);

% BW= imcomplement(BW);
DT= bwdist((BW));

tempDT = MEDT(DT);

[m, n]=size(DT);
EDT=zeros(m,n);

EDT(1:m,n/4:n/1.33)=  tempDT(1:m,n/4:n/1.33);

[Xli, Yli]=XYpoints(EDT,255);


b1 = Yli\Xli;


    if b1<0.0
    angulo = atan(b1)*180 + 90;
    else
    angulo = atan(b1)*180 - 90 ;
    end

BWaling = imrotate(BW,-angulo);
tempang=-90-angulo;
Imaranaling = imrotate(Imaran,tempang);
 
BWrange = (BWaling.*Imaranaling);

[m, n]=size(BWrange);

newimage0=zeros(m, n);

left=BWrange(:,1:n/2);
[newimageleft]=MEDT2(left);

rigth=BWrange(:,n/2+1:n);
[newimageright]=MEDT2(rigth);

newimage0(:,1:n/2)=newimageleft;
newimage0(:,n/2+1:n)=newimageright;

newimage0=  imrotate(newimage0,-90);

% BWskel = bwskel(BWaling);

% BW2= imcomplement(BWskel);
% 
% BW2=  imrotate(BW2,-90);
% 
% 
% 
[MEDTX, MEDTY]=XYpoints(newimage0,255);

[MEDTX, MEDTY] = XYpointscale(MEDTX, MEDTY);


MEDTX= round(MEDTX);
MEDTY= round(MEDTY);


%% 
[points] = XYpointcurveselection(MEDTY);

%%
% 
MEDTX=MEDTX(points);
MEDTY=MEDTY(points);
% 
% 

% %% Fit: 'fourier-10coe'.
% [xData, yData] = prepareCurveData( MEDTX, MEDTY);
% 
% % Set up fittype and options.
% ft = fittype( 'fourier4' );
% opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
% opts.Display = 'Off';
% opts.Normalize = 'on';
% opts.StartPoint = [0 0 0 0 0 0 0 0 0 0.427623964745139];
% 
% % Fit model to data.
% [fitresult{1}, gof(1)] = fit( xData, yData, ft, opts );
% 
% % Create a figure for the plots.
% figure( 'Name', 'fourier-10coe' );
% 
% Plot fit with data.
% subplot( 2, 1, 1 );
% h = plot( fitresult{1}, xData, yData );
% legend( h, 'YY vs. XX', 'fourier-10coe', 'Location', 'NorthEast', 'Interpreter', 'none' );
% % Label axes
% xlabel( 'XX', 'Interpreter', 'none' );
% ylabel( 'YY', 'Interpreter', 'none' );
% grid on
% 
% % Plot residuals.
% subplot( 2, 1, 2 );
% h = plot( fitresult{1}, xData, yData, 'residuals' );
% legend( h, 'fourier-10coe - residuals', 'Zero Line', 'Location', 'NorthEast', 'Interpreter', 'none' );
% % Label axes
% xlabel( 'XX', 'Interpreter', 'none' );
% ylabel( 'YY', 'Interpreter', 'none' );
% grid on
% 



