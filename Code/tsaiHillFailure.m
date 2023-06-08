function [FS]=tsaiHillFailure(laminate,Nx,Ny,Nxy,Mx,My,Mxy)
    [~,~,~,~,~,~,longStrengthTen,longStrengthCom,tranStrengthTen,tranStrengthCom,strengthLT] = laminateReader(laminate);
    [~,~,~,sigma1,sigma2,tau12,~,~,~,~,~,~]=forces2StressStrainLaminateNoPlot(laminate,Nx,Ny,Nxy,Mx,My,Mxy);
    FS=zeros(length(longStrengthTen),1);
    for i=2:2:length(sigma1)
        if sigma1(i)>0
            longStrength=longStrengthTen(i/2);
        else
            longStrength=longStrengthCom(i/2);
        end
        
        if sigma1(i-1)>0
            longStrength2=longStrengthTen(i/2);
        else
            longStrength2=longStrengthCom(i/2);
        end
        
        if sigma2(i)>0
            transStrength=tranStrengthTen(i/2);
        else
            transStrength=tranStrengthCom(i/2);
        end
        
        if sigma2(i-1)>0
            transStrength2=tranStrengthTen(i/2);
        else
            transStrength2=tranStrengthCom(i/2);
        end
        
        A=((sigma1(i)/longStrength)^2)+((sigma2(i)/transStrength)^2)-((sigma1(i)*sigma2(i))/(longStrength)^2)+(tau12(i)/strengthLT(i/2))^2;
        FS(i)=1/sqrt(A);
        
        A2=(sigma1(i-1)/longStrength2)^2+(sigma2(i-1)/transStrength2)^2-((sigma1(i-1)*sigma2(i-1))/(longStrength2)^2)+(tau12(i-1)/strengthLT(i/2))^2;
        FS(i-1)=1/sqrt(A2);
    end
    FS=min(FS);
end