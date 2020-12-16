function [Xpoint, Ypoint, Zpoint] = XYZpoints(image)

[m n] =size(image);

num = numel(find(image~= 0));   % numero de datos

Xpoint = zeros(num,1);
Ypoint = zeros(num,1);
Zpoint = zeros(num,1);
K=1;
% 


    for i=1:m
        for j=1:n
            if image(i,j) ~= 0
                    Xpoint(K) = i;
                    Ypoint(K) = j;
                    Zpoint(K) = image(i,j);
                    K=K+1 ;
            end
        end
    end
end
