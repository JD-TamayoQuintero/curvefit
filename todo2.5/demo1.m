h = curv3Dto2D(newimage(:,1),newimage(:,2),newimage(:,3),newimage(:,3),0.1);
figure, imhist(h);
hn = normalizar(h);
figure, imhist(hn);

figure(1)
imshow(h)
colormap jet
 xlabel('\fontsize{24} Eje X')
ylabel('\fontsize{24} Eje Y')
zlabel('\fontsize{24} Eje Z')
%title('\fontsize{24} Imagen de rango por rebanadas')
set(gca, 'fontsize', 20) 