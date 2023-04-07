function [sigmax,sigmay,tauxy,sigma1,sigma2,tau12,epsx,epsy,gammaxy,eps1,eps2,gamma12,kx,ky,kxy] = midplaneStrainsCurvatureTemperature2StressStrainLaminate(laminate,deltaT,epsx0,epsy0,gammaxy0,kx,ky,kxy)

    [E1s,E2s,G12s,v12s,thicknesses,thetas,longStrengthTen,longStrengthCom,tranStrengthTen,tranStrengthCom,strengthLT,alphax,alphay,alphaxy,betax,betay,betaxy] = laminateReader(laminate);
    zs = laminateDistances(thicknesses);
    thickness=sum(thicknesses);
    distances=zeros(1,length(thicknesses)+1);
    distances(1)=-thickness/2;
    distances(end)=thickness/2;
    N=length(E1s);
    for i=2:N
        distances(i)=distances(i-1)+thicknesses(i-1);
    end
    Nxt=0;
    Nyt=0;
    Nxyt=0;
    Mxt=0;
    Myt=0;
    Mxyt=0;
    for i=1:length(E1s)
    Qbar = transReducedStiffnessMatrix(E1s(i),E2s(i),G12s(i),v12s(i),thetas(i));
    Nxt=Nxt+(Qbar(1,1)*alphax(i)+Qbar(1,2)*alphay(i)+Qbar(1,3)*alphaxy(i))*(distances(i+1)-distances(i));
    Nyt=Nyt+(Qbar(1,2)*alphax(i)+Qbar(2,2)*alphay(i)+Qbar(2,3)*alphaxy(i))*(distances(i+1)-distances(i));
    Nxyt=Nxyt+(Qbar(1,3)*alphax(i)+Qbar(2,3)*alphay(i)+Qbar(3,3)*alphaxy(i))*(distances(i+1)-distances(i));
    Mxt=Mxt+(Qbar(1,1)*alphax(i)+Qbar(1,2)*alphay(i)+Qbar(1,3)*alphaxy(i))*(distances(i+1)^2-distances(i)^2);
    Myt=Myt+(Qbar(1,2)*alphax(i)+Qbar(2,2)*alphay(i)+Qbar(2,3)*alphaxy(i))*(distances(i+1)^2-distances(i)^2);
    Mxyt=Mxyt+(Qbar(1,3)*alphax(i)+Qbar(2,3)*alphay(i)+Qbar(3,3)*alphaxy(i))*(distances(i+1)^2-distances(i)^2);
    end

    Nxt=Nxt*deltaT;
    Nyt=Nyt*deltaT;
    Nxyt=Nxyt*deltaT;
    Mxt=Mxt*deltaT;
    Myt=Myt*deltaT;
    Mxyt=Mxyt*deltaT;
    
    [epsx0t,epsy0t,gammaxy0t,kxt,kyt,kxyt] = midPlaneStrainsCurvature(Nxt,Nyt,Nxyt,Mxt,Myt,Mxyt,laminate);
    
    epsx0=epsx0+epsx0t;
    epsy0=epsy0+epsy0t;
    gammaxy0=gammaxy0+gammaxy0t;
    kx=kx+kxt;
    ky=ky+kyt;
    kxy=kxy+kxyt;
    
    [epsx,epsy,gammaxy] = strainLaminateStructural(epsx0,epsy0,gammaxy0,kx,ky,kxy,thicknesses);
    [eps1,eps2,gamma12] = strainLaminatePrincipal(epsx,epsy,gammaxy,thetas);
    [sigmax,sigmay,tauxy]=strain2stressStructural(epsx,epsy,gammaxy,thetas,E1s,E2s,G12s,v12s);
    [sigma1,sigma2,tau12]=stressLaminatePrincipal(sigmax,sigmay,tauxy,thetas);
    
    figure
    plots = tiledlayout(2,2);
    nexttile
    plot(sigma1,zs,'k-o',sigma2,zs,'b-^',tau12,zs,'r-square')
    xlabel('Principal Material Stresses [Pa]')
    ylabel('z [m]')
    legend('\sigma_{1}','\sigma_{2}','\tau_{12}')
    set(gca, 'YDir','reverse')
    nexttile
    plot(sigmax,zs,'k-o',sigmay,zs,'b-^',tauxy,zs,'r-square')
    xlabel('Structural Stresses [Pa]')
    ylabel('z [m]')
    legend('\sigma_{x}','\sigma_{y}','\tau_{xy}')
    set(gca, 'YDir','reverse')
    nexttile
    plot(eps1,zs,'k-o',eps2,zs,'b-^',gamma12,zs,'r-square')
    xlabel('Principal Material Strains [\epsilon]')
    ylabel('z [m]')
    legend('\epsilon_{1}','\epsilon_{2}','\gamma{12}')
    set(gca, 'YDir','reverse')
    nexttile
    plot(epsx,zs,'k-o',epsy,zs,'b-^',gammaxy,zs,'r-square')
    xlabel('Structural Strains [\epsilon]')
    ylabel('z [m]')
    legend('\epsilon_{x}','\epsilon_{y}','\gamma_{xy}')
    set(gca, 'YDir','reverse')
    set(gcf,'position',[90,90,1000,800])
    
end