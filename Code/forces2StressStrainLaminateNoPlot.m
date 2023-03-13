function [sigmax,sigmay,tauxy,sigma1,sigma2,tau12,epsx,epsy,gammaxy,eps1,eps2,gamma12]=forces2StressStrainLaminateNoPlot(laminate,Nx,Ny,Nxy,Mx,My,Mxy)
    [E1s,E2s,G12s,v12s,thicknesses,thetas] = laminateReader(laminate);
    [epsx0,epsy0,gammaxy0,kx,ky,kxy] = midPlaneStrainsCurvature(Nx,Ny,Nxy,Mx,My,Mxy,laminate);
    [epsx,epsy,gammaxy] = strainLaminateStructural(epsx0,epsy0,gammaxy0,kx,ky,kxy,thicknesses);
    [eps1,eps2,gamma12] = strainLaminatePrincipal(epsx,epsy,gammaxy,thetas);
    [sigmax,sigmay,tauxy]=strain2stressStructural(epsx,epsy,gammaxy,thetas,E1s,E2s,G12s,v12s);
    [sigma1,sigma2,tau12]=stressLaminatePrincipal(sigmax,sigmay,tauxy,thetas);
end