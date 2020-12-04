imagen=pcread('encia.pcd');
imgnormal=pcread('normal.pcd');
newimage= imagen.Location;
newimage(:,4)=imgnormal.Intensity;

I = curv3Dto2D(newimage(:,1),newimage(:,2),newimage(:,3),newimage(:,4),0.05);

I = normalizar(I);
%figure(1)
%imshow(I)

bw2=imbinarize(I,0.05);
 figure(1)
imshow(bw2)
%colormap(jet);
imwrite(I, 'imagen.jpg') ;
h = curv3Dto2D(newimage(:,1),newimage(:,2),newimage(:,3),newimage(:,3),0.05);
h = normalizar(h);
imcb=h;
imca=h;
imcb(h<=0.85)= 0;
imca(h>=0.95)= 0;
imnew=sqrt(imcb.*imca);
% bw2h=imbinarize(h,0.9);
figure(2)
imshow(h)






























% 
% h=1; k=1;
% imnew1= zeros(1,4); imnew2= zeros(1,4); 
% tic
% % Sección de Código a medir
% N=imagen.Count;
% 
% 
% %  for i=1:N
% %  if imagen.Color(i,1) ==  imagen.Color(1,1)
% %      imnew1(h,:) = newimage(i,:);
% %      h=h+1;
% %  else
% %      imnew2(k,:) = newimage(i,:);
% %      k=k+1;
% %  end
% %  end
%  toc



