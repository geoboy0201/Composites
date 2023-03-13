function [FS]=maximumStrainTheory(laminate,Nx,Ny,Nxy,Mx,My,Mxy)
    [E1s,E2s,~,v12s,~,~,longStrengthTen,longStrengthCom,tranStrengthTen,tranStrengthCom,strengthLT] = laminateReader(laminate);
    [~,~,~,sigma1,sigma2,tau12,~,~,~,~,~,~]=forces2StressStrainLaminateNoPlot(laminate,Nx,Ny,Nxy,Mx,My,Mxy);
    FS=zeros(length(longStrengthTen),1);
    for i=2:2:length(sigma1)
        if sigma1(i)>0
            F1=longStrengthTen(i/2)/(sigma1(i)-v12s(i/2)*sigma2(i));
        else
            F1=-longStrengthCom(i/2)/(sigma1(i)-v12s(i/2)*sigma2(i));
        end
        v21=(v12s(i/2)/E1s(i/2))*E2s(i/2);
        if sigma2>0
            F2=tranStrengthTen(i/2)/(sigma2(i)-v21*sigma1(i));
        else
            F2=-tranStrengthCom(i/2)/(sigma2(i)-v21*sigma1(i));
        end
        F3=strengthLT(i/2)/abs(tau12(i));
        FS(i/2)=min([F1,F2,F3]);
    end
end