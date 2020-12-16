function [Xscale, Yscale] = XYpointscalemean(X, Y)


% % meannX = mean(X);
% % Xscale=meannX-X;   %corro al origen

Xscalemin = min(X);
X=X-Xscalemin;

% % meannY= mean(Y);
% % Yscale=meannY-Y;    %corro al origen
% 
Yscalemin = min(Y);
Y=Y-Yscalemin;



maxY = max(Y); maxX = max(X); MAX=max(max(X), max(Y));

Yscale = (Y/maxY);

Xscale = (X/maxX);

% meannX = mean(Xscale);
% Xscale=meannX-Xscale;
% 
% meannX = mean(Yscale);
% Yscale=meannX-Yscale;


end
