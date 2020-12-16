function  I= normalizar(I)
I = (( I - min(min(I)) ) ./ ( max(max(I)) - min(min(I)) )) ;
end