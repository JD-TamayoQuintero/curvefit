function [points] = XYpointcurveselection2(Y)

% newvector = unique(Y);
% 
% [h k]=size(newvector);
% 
% h/9=f;
% 
% %  nf = 1:11;
% % fib= fibonacci(nf);
% 
% fib=[1,2,3,5,8,13,32,35,34,40]

newvector = unique(Y);
[h k]=size(newvector);
f=(h-5)/9;
f=round (f);

k=1;
fib=zeros(1,9);
for i=1:f:h
    fib(:,k)=i;
    k=k+1;
end
    


valory=newvector(fib);

centroA=find(Y == 0); centroA = round(mean(centroA));
puntoA=find(Y == valory(1));  pAmin = min(puntoA); pAmax= max(puntoA);
puntoB=find(Y == valory(3));  pBmin = min(puntoB); pBmax= max(puntoB);
puntoC=find(Y == valory(5));  pCmin = min(puntoC); pCmax= max(puntoC);
puntoD=find(Y == valory(4));   pDmin = min(puntoD); pDmax= max(puntoD);
puntoE=find(Y == valory(5));  pEmin = min(puntoE); pEmax= max(puntoE);
puntoF=find(Y == newvector(14));   pFmin = min(puntoF); pFmax= max(puntoF);
puntoG=find(Y == valory(7));  pGmin = min(puntoG); pGmax= max(puntoG);
puntoH=find(Y == newvector(21)); pHmin = min(puntoH); pHmax= max(puntoH);
puntoI=find(Y == valory(9));  pImin = min(puntoI); pImax= max(puntoI);
% puntoJ=find(Y == valory(10));  pJmin = min(puntoJ); pJmax= max(puntoJ);

points = [ centroA pImin pHmin pGmin  pAmin pBmin pCmin pDmin pEmin pFmin pImax pHmax pGmax  pFmax pEmax pDmax pCmax pBmax pAmax];


end
