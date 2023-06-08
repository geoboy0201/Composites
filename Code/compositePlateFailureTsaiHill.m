function [PxMaxTsaiHill]=compositePlateFailureTsaiHill(laminate,L,W)
[~,~,~,~,~,~,longStrengthTen,longStrengthCom,tranStrengthTen,tranStrengthCom,strengthLT,~,~,~,~,~,~] = laminateReader(laminate);


Nx=1/W;
Ny=0;
Nxy=0;
Mx=0;
My=0;
Mxy=0;

[~,~,~,sigma1,sigma2,tau12,~,~,~,~,~,~]=forces2StressStrainLaminateNoPlot(laminate,Nx,Ny,Nxy,Mx,My,Mxy);

for i=2:2:length(sigma1)
    
    A=(sigma1(i)/longStrengthTen(i/2))^2+(sigma2(i)/tranStrengthTen(i/2))^2+(tau12(i)/strengthLT(i/2))^2-((sigma1(i)*sigma2(i))/(longStrengthTen(i/2))^2);
    FS=1/sqrt(A);
    PxMax(i)=FS*Nx; %For Exam 3
%     PxMax(1,i)=sol(1);
%     PxMax(2,i)=sol(2);
    
    A=(sigma1(i-1)/longStrengthTen(i/2))^2+(sigma2(i-1)/tranStrengthTen(i/2))^2+(tau12(i-1)/strengthLT(i/2))^2-((sigma1(i-1)*sigma2(i-1))/(longStrengthTen(i/2))^2);
    FS=1/sqrt(A);
    PxMax(i-1)=FS*Nx; %For Exam 3
%     PxMax(1,i-1)=sol(1);
%     PxMax(2,i-1)=sol(2);
end

[PxMaxTsaiHill,I]=min(abs(PxMax),[],'all','linear');
PxMaxTsaiHill=PxMax(I);

end