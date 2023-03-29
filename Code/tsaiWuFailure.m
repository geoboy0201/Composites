function [FS]=tsaiWuFailure(laminate,Nx,Ny,Nxy,Mx,My,Mxy)
    [~,~,~,~,~,~,longStrengthTen,longStrengthCom,tranStrengthTen,tranStrengthCom,strengthLT] = laminateReader(laminate);
    [~,~,~,sigma1,sigma2,tau12,~,~,~,~,~,~]=forces2StressStrainLaminateNoPlot(laminate,Nx,Ny,Nxy,Mx,My,Mxy);
    FS=zeros(length(longStrengthTen),1);
    
    F11=1/(longStrengthTen*longStrengthCom);
    F22=1/(tranStrengthTen*tranStrengthCom);
    F66=1/strengthLT^2;
    F12=-sqrt(F11*F22)/2;
    F1=(1/longStrengthTen)-(1/longStrengthCom);
    F2=(1/tranStrengthTen)-(1/tranStrengthCom);
    
    for i=1:length(sigma1)
        C1=(F11*sigma1(i)^2+F22*sigma2(i)^2+F66*tau12(i)^2+2*F12*sigma1(i)*sigma2(i));
        C2=F1*sigma1(i)+F2*sigma2(i);
        C3=-1;
        C=[C1,C2,C3];
        sol=roots(C);
        FS(i)=sol(sol>=0);
    end
    FS=min(FS);
end