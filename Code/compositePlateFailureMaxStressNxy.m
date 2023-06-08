function [PxyMax]=compositePlateFailureMaxStressNxy(laminate,L,W)

[~,~,~,~,~,~,longStrengthTen,longStrengthCom,tranStrengthTen,tranStrengthCom,strengthLT,~,~,~,~,~,~] = laminateReader(laminate);


Nx=0;
Ny=0;
Nxy=1/W;
Mx=0;
My=0;
Mxy=0;

[~,~,~,sigma1,sigma2,tau12,~,~,~,~,~,~]=forces2StressStrainLaminateNoPlot(laminate,Nx,Ny,Nxy,Mx,My,Mxy);

for i=2:2:length(sigma1)
    Px12(i)=strengthLT(i/2)/tau12(i);
    Px12(i-1)=strengthLT(i/2)/tau12(i-1);
end

PxyMax=min(abs(Px12));
PxyMax=min(abs(PxyMax));

end