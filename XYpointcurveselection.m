function [points] = XYpointcurveselection(Y)

newvector = unique(Y);

nf = 2:12;
fib= fibonacci(nf);

valory=newvector(fib);

centroA=find(Y == 0); centroA = round(mean(centroA));
puntoA=find(Y == valory(7));  pAmin = min(puntoA); pAmax= max(puntoA);
puntoB=find(Y == valory(2));  pBmin = min(puntoB); pBmax= max(puntoB);
puntoC=find(Y == valory(3));  pCmin = min(puntoC); pCmax= max(puntoC);
puntoD=find(Y == valory(4));   pDmin = min(puntoD); pDmax= max(puntoD);
puntoE=find(Y == valory(5));  pEmin = min(puntoE); pEmax= max(puntoE);
puntoF=find(Y == valory(6));   pFmin = min(puntoF); pFmax= max(puntoF);
puntoG=find(Y == valory(8));  pGmin = min(puntoG); pGmax= max(puntoG);
puntoH=find(Y == valory(9)); pHmin = min(puntoH); pHmax= max(puntoH);
puntoI=find(Y == valory(10));  pImin = min(puntoI); pImax= max(puntoI);
puntoJ=find(Y == valory(end));  pJmin = min(puntoJ); pJmax= max(puntoJ);

points = [ centroA pImin pHmin pGmin  pAmin pBmin pCmin pDmin pEmin pFmin pImax pHmax pGmax  pFmax pEmax pDmax pCmax pBmax pAmax pJmin pJmax];


end
