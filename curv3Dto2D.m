function I = curv3Dto2D( x,y,z,curv, res)

%ejemplo
% x=newimage(:,1);
% y=newimage(:,2);
% z=newimage(:,3);
% curv=newimage(:,4);
% res=1;

% funcion 2.5D convierte una imagen 3D en una imagen 2.5D
% I =  curv3Dto2D( x,y,z,curv, res)
% x,y,z coordenadas, curv, curvatura de la nube de puntos, res es la
% resolucion en milimetros
% el valor de la profundidad esta dado por la curvatura de la imagen
% con anterioridad se debe capturar la informacion de curvatura
% version preliminar 0.01
% J.D Tamayo-Quintero
%---------------------------------------------------------------------
%minimos y maximos

minx = min(x); maxx = max(x); 
miny = min(y); maxy = max(y); 
minz = min(z); maxz = max(z);

% la nube de puntos se asume que esta ubicada en el centro de masa
%-------------------------------------------------------------------------
% se busca los valores minimos y maximos para crear una rejilla cuadrada. 
% la ventaja de tener una matriz cuadrada es debido a un tiempo de computo
% menor.
minp = [minx,miny,minz]; maxp = [maxx,maxy,maxz];
mint = min(minp); maxt= max(maxp);

%-------------------------------------------------------------------
%resolucion

%medidas reales del modelo se asume las medidas en micrómetros
mdreal=(abs(mint)+abs(maxt));
x(1)= mint ;
x(2)= maxt ;
y(1)= mint ;
y(2)= maxt ;

%pasamos de micrómetros a mm
%tres = ((mdreal/1000)) ;
% aplicamos la resolucion deseada en micrometros
resf = round(mdreal/res);

%numero_de_pixeles_totales = resf;

%creamos una rejila en x y y
xi = linspace(min(x(:)),max(x(:)),resf);
yi = linspace(min(y(:)),max(y(:)),resf);
%zi = linspace(min(z(:)),max(z(:)),resf);

% buscamos el centro de la rejilla
[X,Y] = meshgrid(xi,yi);
grid_centers = [X(:),Y(:)];

% aplicamos el valor absoluto a los valores de la curvatura 
% realzamos con la raiz cuadrada. despues normalizamos

d=curv;
%d=(z);

% creamos nuestro clasificador para cada rejilla usamos knnsearch
clase = knnsearch(grid_centers,[x,y]); 

% funcion estatica 
fun_esta = @(x)max(x); 

% agrupamiento de los datos usamos accumarray
clase_esta = accumarray(clase,d,[resf*resf 1],fun_esta);
%clase_esta = accumarray(clase,d,[resf*resf 1],[],NaN);

clase_esta_M  = reshape(clase_esta , size(Y));

% volteamos la imagen

I = (clase_esta_M);
% I = clase_esta_M(end:-1:1,end:-1:1)
% I = rot270(clase_esta_M)
end





