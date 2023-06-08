function [PxyMaxTsaiHill]=compositePlateFailureTsaiHillNxy(laminate,L,W)
[~,~,~,~,~,~,longStrengthTen,longStrengthCom,tranStrengthTen,tranStrengthCom,strengthLT,~,~,~,~,~,~] = laminateReader(laminate);


Nx=0;
Ny=0;
Nxy=1/W;
Mx=0;
My=0;
Mxy=0;

[~,~,~,sigma1,sigma2,tau12,~,~,~,~,~,~]=forces2StressStrainLaminateNoPlot(laminate,Nx,Ny,Nxy,Mx,My,Mxy);

for i=2:2:length(sigma1)
    
    A=(sigma1(i)/longStrengthTen(i/2))^2+(sigma2(i)/tranStrengthTen(i/2))^2+(tau12(i)/strengthLT(i/2))^2-((sigma1(i)*sigma2(i))/(longStrengthTen(i/2))^2);
    FS=1/sqrt(A);
    PxyMax(i)=FS*Nxy;

    
    A=(sigma1(i-1)/longStrengthTen(i/2))^2+(sigma2(i-1)/tranStrengthTen(i/2))^2+(tau12(i-1)/strengthLT(i/2))^2-((sigma1(i-1)*sigma2(i-1))/(longStrengthTen(i/2))^2);
    FS=1/sqrt(A);
    PxyMax(i-1)=FS*Nxy;

end

[PxyMaxTsaiHill,I]=min(abs(PxyMax),[],'all','linear');
PxyMaxTsaiHill=PxyMax(I);

end