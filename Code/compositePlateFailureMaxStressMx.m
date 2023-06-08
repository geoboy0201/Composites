function [MxMax]=compositePlateFailureMaxStressMx(laminate,L,W)

[~,~,~,~,~,~,longStrengthTen,longStrengthCom,tranStrengthTen,tranStrengthCom,strengthLT,~,~,~,~,~,~] = laminateReader(laminate);


Nx=0;
Ny=0;
Nxy=0;
Mx=1/W;
My=0;
Mxy=0;

[~,~,~,sigma1,sigma2,tau12,~,~,~,~,~,~]=forces2StressStrainLaminateNoPlot(laminate,Nx,Ny,Nxy,Mx,My,Mxy);

for i=2:2:length(sigma1)
    PxTen1(i)=longStrengthTen(i/2)/sigma1(i);
    PxCom1(i)=longStrengthCom(i/2)/sigma1(i);
    PxTen2(i)=tranStrengthTen(i/2)/sigma2(i);
    PxCom2(i)=tranStrengthCom(i/2)/sigma2(i);
    Px12(i)=strengthLT(i/2)/tau12(i);
    PxTen1(i-1)=longStrengthTen(i/2)/sigma1(i-1);
    PxCom1(i-1)=longStrengthCom(i/2)/sigma1(i-1);
    PxTen2(i-1)=tranStrengthTen(i/2)/sigma2(i-1);
    PxCom2(i-1)=tranStrengthCom(i/2)/sigma2(i-1);
    Px12(i-1)=strengthLT(i/2)/tau12(i-1);
end

PxTen1Max=min(PxTen1);
PxCom1Max=min(abs(PxCom1));
PxTen2Max=min(PxTen2);
PxCom2Max=min(abs(PxCom2));
Px12Max=min(abs(Px12));

MxMax=[PxTen1Max,PxCom1Max,PxTen2Max,PxCom2Max,Px12Max];
MxMax=min(abs(MxMax));

end