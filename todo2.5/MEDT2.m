function [newimage] = MEDT2(image)

[m, n] =size(image);

newimage = zeros(m,n);
   % numero de datos


    for i=1:m
        for j=1:n
            if image(i,j)== max(image(i,:))
                if  image(i,j) > 0
                    newimage(i,j)=255;
                else
                    newimage(i,j)=0;
                end
            end
        end
    end
end


