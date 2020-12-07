  model = uigetfile('*.ply;*.pcd;');
       
        A=pcread(model);
       
        
        xi=A.Location(:,1);
        yi=A.Location(:,2);
        zi=A.Location(:,3);
        
        minzi=min(zi); zi= minzi-zi;
        maxzi=max(zi); zi= maxzi-zi;
        
        Image = range3Dto2D( xi,yi,zi, 0.5);
        Image=im2double(Image); Imagenor = normalizar(Image);
%         imshow(Imagenor);
%         colormap('jet')
        
         
        level=0.7;
        
        BW = im2bw(Imagenor,level); %#ok<IM2BW>
%       BW = imrotate(BW,-90);
%         imshow(BW);
      
       [DT]= bwdist((BW));
        DTnor=normalizar(DT);
        imshow(DT);
%         colormap('jet')
       
        tempDT = MEDT2(DT);
        [m, n]=size(DT);
        EDT=zeros(m,n);
        EDT(10:m-10, 10:n/2)=  tempDT(10:m-10,10:n/2);
   
        
        
        [Xli, Yli]=XYpoints(EDT,255)
        

        b1 = Yli\Xli
          b3 = Xli\Yli


            if b1<0.0
            angulo = atan(b1)*180 + 90
            else
            angulo = atan(b1)*180 - 90 
            end
        