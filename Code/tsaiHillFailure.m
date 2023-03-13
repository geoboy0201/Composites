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
        if sigma2>0
            transStrength=tranStrengthTen(i/2);
        else
            transStrength=tranStrengthCom(i/2);
        end
        A=(sigma1(i)/longStrength)^2+(sigma2(i)/transStrength)^2-((sigma1(i)*sigma2(i))/(longStrength)^2)+(tau12(i)/strengthLT);
        FS(i/2)=1/sqrt(A);
    end
end