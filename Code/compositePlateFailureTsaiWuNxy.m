function [PxyMaxTsaiWu]=compositePlateFailureTsaiWuNxy(laminate,L,W)
[~,~,~,~,~,~,longStrengthTen,longStrengthCom,tranStrengthTen,tranStrengthCom,strengthLT,~,~,~,~,~,~] = laminateReader(laminate);


Nx=0;
Ny=0;
Nxy=1/W;
Mx=0;
My=0;
Mxy=0;

[~,~,~,sigma1,sigma2,tau12,~,~,~,~,~,~]=forces2StressStrainLaminateNoPlot(laminate,Nx,Ny,Nxy,Mx,My,Mxy);

for i=2:2:length(sigma1)
    
    F11=1/(longStrengthTen(i/2)*longStrengthCom(i/2));
    F22=1/(tranStrengthTen(i/2)*tranStrengthCom(i/2));
    F66=1/strengthLT(i/2)^2;
    F12=-sqrt(F11*F22)/2;
    F1=(1/longStrengthTen(i/2))-(1/longStrengthCom(i/2));
    F2=(1/tranStrengthTen(i/2))-(1/tranStrengthCom(i/2));
    
    C1=(F11*sigma1(i)^2+F22*sigma2(i)^2+F66*tau12(i)^2+2*F12*sigma1(i)*sigma2(i));
    C2=F1*sigma1(i)+F2*sigma2(i);
    C3=-1;
    C=[C1,C2,C3];
    sol=roots(C);
    PxyMax(i)=sol(sol>0); %For Exam 3
%     PxMax(1,i)=sol(1);
%     PxMax(2,i)=sol(2);
    
    C1=(F11*sigma1(i-1)^2+F22*sigma2(i-1)^2+F66*tau12(i-1)^2+2*F12*sigma1(i-1)*sigma2(i-1));
    C2=F1*sigma1(i-1)+F2*sigma2(i-1);
    C3=-1;
    C=[C1,C2,C3];
    sol=roots(C);
    PxyMax(i-1)=sol(sol>0); %For Exam 3
%     PxMax(1,i-1)=sol(1);
%     PxMax(2,i-1)=sol(2);
end

[PxyMaxTsaiWu,I]=min(abs(PxyMax),[],'all','linear');
PxyMaxTsaiWu=PxyMax(I);

end