function [PxMax]=compositePlateFailureMaxStress(laminate,length,width)

[~,~,~,~,~,~,longStrengthTen,longStrengthCom,tranStrengthTen,tranStrengthCom,strengthLT,~,~,~,~,~,~] = laminateReader(laminate);


Nx=1/width;
Ny=0;
Nxy=0;
Mx=0;
My=0;
Mxy=0;

[~,~,~,sigma1,sigma2,tau12,~,~,~,~,~,~]=forces2StressStrainLaminateNoPlot(laminate,Nx,Ny,Nxy,Mx,My,Mxy);

for i=1:length(sigma1)
    PxTen1(i)=longStrengthTen/sigma1(i);
    PxCom1(i)=longStrengthCom/sigma1(i);
    PxTen2(i)=tranStrengthTen/sigma2(i);
    PxCom2(i)=tranStrengthCom/sigma2(i);
    Px12(i)=strengthLT/tau12(i);
end

PxTen1Max=min(PxTen1);
PxCom1Max=min(PxCom1);
PxTen2Max=min(PxTen2);
PxCom2Max=min(PxCom2);
Px12Max=min(Px12);

PxMax=[PxTen1Max,PxCom1Max,PxTen2Max,PxCom2Max,Px12Max];
PxMax=min(PxMax);

end