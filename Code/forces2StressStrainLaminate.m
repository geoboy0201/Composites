function [sigmax,sigmay,tauxy,sigma1,sigma2,tau12,epsx,epsy,gammaxy,eps1,eps2,gamma12]=forces2StressStrainLaminate(laminate,Nx,Ny,Nxy,Mx,My,Mxy)
    [E1s,E2s,G12s,v12s,thicknesses,thetas] = laminateReader(laminate);
    [epsx0,epsy0,gammaxy0,kx,ky,kxy] = midPlaneStrainsCurvature(Nx,Ny,Nxy,Mx,My,Mxy,laminate);
    [epsx,epsy,gammaxy] = strainLaminateStructural(epsx0,epsy0,gammaxy0,kx,ky,kxy,thicknesses);
    [eps1,eps2,gamma12] = strainLaminatePrincipal(epsx,epsy,gammaxy,thetas);
    [sigmax,sigmay,tauxy]=strain2stressStructural(epsx,epsy,gammaxy,thetas,E1s,E2s,G12s,v12s);
    [sigma1,sigma2,tau12]=stressLaminatePrincipal(sigmax,sigmay,tauxy,thetas);
    
    
    distances=laminateDistances(thicknesses);
    figure
    plots = tiledlayout(2,2);
    nexttile
    plot(sigma1,distances,'k-o',sigma2,distances,'b-^',tau12,distances,'r-square')
    xlabel('Principal Material Stresses [Pa]')
    ylabel('z [m]')
    legend('\sigma_{1}','\sigma_{2}','\tau_{12}')
    nexttile
    plot(sigmax,distances,'k-o',sigmay,distances,'b-^',tauxy,distances,'r-square')
    xlabel('Structural Stresses [Pa]')
    ylabel('z [m]')
    legend('\sigma_{x}','\sigma_{y}','\tau_{xy}')
    nexttile
    plot(eps1,distances,'k-o',eps2,distances,'b-^',gamma12,distances,'r-square')
    xlabel('Principal Material Strains [\epsilon]')
    ylabel('z [m]')
    legend('\epsilon_{1}','\epsilon_{2}','\gamma{12}')
    nexttile
    plot(epsx,distances,'k-o',epsy,distances,'b-^',gammaxy,distances,'r-square')
    xlabel('Structural Strains [\epsilon]')
    ylabel('z [m]')
    legend('\epsilon_{x}','\epsilon_{y}','\gamma_{xy}')
    set(gcf,'position',[90,90,1000,800])
    
    titleLine1=['N_{x} = ',num2str(Nx),', N_{y} = ',num2str(Ny),', N_{xy} = ',num2str(Nxy),', M_{x} = ',num2str(Mx),', M_{y} = ',num2str(My),', M_{xy} = ',num2str(Mxy)];
    titleLine2=num2str(thetas(1));
    for i=2:length(thetas)
        titleLine2=[titleLine2,'/',num2str(thetas(i))];
    end
    title(plots,{titleLine1,titleLine2})
end