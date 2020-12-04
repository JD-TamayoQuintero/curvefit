function I = range3dto2d( x,y,z,numr,numc )

%d = sqrt( x.^2 + y.^2 + z.^2);
d= z

% grid construction
xl = min(x); 
xr = max(x); 
yl = min(y); 
yr = max(y);

xx = linspace(xl,xr,numc); 
yy = linspace(yl,yr,numr);

[X,Y] = meshgrid(xx,yy);
grid_centers = [X(:),Y(:)];

% classification
clss = knnsearch(grid_centers,[x,y]); 

% defintion of local statistic

local_stat = @(z)max(z); 

% data_grouping
class_stat = accumarray(clss,d,[numr*numc 1],local_stat);

% 2D reshaping
class_stat_M  = reshape(class_stat , size(X)); 

% Force un-filled cells to the brightest color

class_stat_M (class_stat_M == 0) = max(max(class_stat_M));

% flip image horizontally and vertically
I = class_stat_M(end:-1:1,end:-1:1);

I = ( I - min(min(I)) ) ./ ( max(max(I)) - min(min(I)) );
end

