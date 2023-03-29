function [FS]=maximumStrainTheory(laminate,Nx,Ny,Nxy,Mx,My,Mxy)
    [E1s,E2s,~,v12s,~,~,longStrengthTen,longStrengthCom,tranStrengthTen,tranStrengthCom,strengthLT] = laminateReader(laminate);
    [~,~,~,sigma1,sigma2,tau12,~,~,~,~,~,~]=forces2StressStrainLaminateNoPlot(laminate,Nx,Ny,Nxy,Mx,My,Mxy);
    FS=zeros(length(longStrengthTen),1);
    FSeps1=zeros(length(longStrengthTen),1);
    FSeps2=zeros(length(longStrengthTen),1);
    FSgamma12=zeros(length(longStrengthTen),1);
    for i=2:2:length(sigma1)
        
        if sigma1(i)>0
            FSeps1(i)=longStrengthTen(i/2)/(sigma1(i)-v12s(i/2)*sigma2(i));
        else
            FSeps1(i)=-longStrengthCom(i/2)/(sigma1(i)-v12s(i/2)*sigma2(i));
        end
        
        if sigma1(i-1)>0
            FSeps1(i-1)=longStrengthTen(i/2)/(sigma1(i-1)-v12s(i/2)*sigma2(i-1));
        else
            FSeps1(i-1)=-longStrengthCom(i/2)/(sigma1(i-1)-v12s(i/2)*sigma2(i-1));
        end
        
        v21=(v12s(i/2)/E1s(i/2))*E2s(i/2);
        if sigma2(i)>0
            FSeps2(i)=tranStrengthTen(i/2)/(sigma2(i)-v21*sigma1(i));
        else
            FSeps2(i)=-tranStrengthCom(i/2)/(sigma2(i)-v21*sigma1(i));
        end
        
        if sigma2(i-1)>0
            FSeps2(i-1)=tranStrengthTen(i/2)/(sigma2(i-1)-v21*sigma1(i-1));
        else
            FSeps2(i-1)=-tranStrengthCom(i/2)/(sigma2(i-1)-v21*sigma1(i-1));
        end
        
        FSgamma12(i)=strengthLT(i/2)/abs(tau12(i));
        FSgamma12(i-1)=strengthLT(i/2)/abs(tau12(i-1));
        
        FS(i)=min([FSeps1(i),FSeps2(i),FSgamma12(i)]);
        FS(i-1)=min([FSeps1(i-1),FSeps2(i-1),FSgamma12(i-1)]);
    end
    FS=min(FS);
end