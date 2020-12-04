function [Xpoint Ypoint] = XYpoints(image, value)

[m n] =size(image);

num = numel(find(image==value));   % numero de datos

Xpoint = zeros(num,1);
Ypoint = zeros(num,1);
K=1;
% 


    for i=1:m
        for j=1:n
                if image(i,j)==value;
                    Xpoint(K) = i;
                    Ypoint(K) = j;
                    K=K+1 ;
                end

        end
    end
end
