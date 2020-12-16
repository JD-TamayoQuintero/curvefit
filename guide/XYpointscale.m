function [Xscale, Yscale] = XYpointscale(X, Y)


minX = min(X);
X=X-minX;   %corro al origen

maxX = max(X);
Xscale = (X/maxX)*1000;   % normalizo a 512


minY= min(Y);
Y=Y-minY;    %corro al origen

% maxMEDTY = max(MEDTY)
Yscale = (Y/maxX)*1000;  % normalizo en funcion de x para manterner relacion de aspecto


end
