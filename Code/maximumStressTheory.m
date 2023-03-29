function [FS]=maximumStressTheory(laminate,Nx,Ny,Nxy,Mx,My,Mxy)
    [~,~,~,~,~,~,longStrengthTen,longStrengthCom,tranStrengthTen,tranStrengthCom,strengthLT] = laminateReader(laminate);
    [~,~,~,sigma1,sigma2,tau12,~,~,~,~,~,~]=forces2StressStrainLaminateNoPlot(laminate,Nx,Ny,Nxy,Mx,My,Mxy);
    FS=zeros(length(sigma1),1);
    FSsigma1=zeros(length(sigma1),1);
    FSsigma2=zeros(length(sigma1),1);
    FStau12=zeros(length(sigma1),1);
    for i=2:2:length(sigma1)
        
        if sigma1(i)>0
            FSsigma1(i)=longStrengthTen(i/2)/sigma1(i);
        else
            FSsigma1(i)=-longStrengthCom(i/2)/sigma1(i);
        end
        
        if sigma1(i-1)>0
            FSsigma1(i-1)=longStrengthTen(i/2)/sigma1(i-1);
        else
            FSsigma1(i-1)=-longStrengthTen(i/2)/sigma1(i-1);
        end
        
        if sigma2(i)>0
            FSsigma2(i)=tranStrengthTen(i/2)/sigma2(i);
        else
            FSsigma2(i)=-tranStrengthCom(i/2)/sigma2(i);
        end
        
        if sigma2(i-1)>0
            FSsigma2(i-1)=tranStrengthTen(i/2)/sigma2(i-1);
        else
            FSsigma2(i-1)=-tranStrengthTen(i/2)/sigma2(i-1);
        end
        
        FStau12(i)=strengthLT(i/2)/abs(tau12(i));
        FStau12(i-1)=strengthLT(i/2)/abs(tau12(i-1));
        
        FS(i)=min([FSsigma1(i),FSsigma2(i),FStau12(i)]);
        FS(i-1)=min([FSsigma1(i-1),FSsigma2(i-1),FStau12(i-1)]);
    end
    FS=min(FS);
end