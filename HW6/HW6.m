clc;clear;close all;
E1s=[140e9,140e9,140e9,140e9];
E2s=[10e9,10e9,10e9,10e9];
G12s=[7e9,7e9,7e9,7e9];
v12s=[0.3,0.3,0.3,0.3];
thicknesses=[0.0002,0.0002,0.0002,0.0002];
thetas=[0,90,90,0];
distances=laminateDistances(thicknesses);

[epsx0,epsy0,gammaxy0,kx,ky,kxy] = midPlaneStrainsCurvature(0,3500,0,0,0,0,thicknesses,thetas,E1s,E2s,G12s,v12s);
[epsx,epsy,gammaxy] = strainLaminateStructural(epsx0,epsy0,gammaxy0,kx,ky,kxy,thicknesses);
[eps1,eps2,gamma12] = strainLaminatePrincipal(epsx,epsy,gammaxy,thetas);
[sigmax,sigmay,tauxy]=strain2stressStructural(epsx,epsy,gammaxy,thetas,E1s,E2s,G12s,v12s);
[sigma1,sigma2,tau12]=stressLaminatePrincipal(sigmax,sigmay,tauxy,thetas);

figure
plot(epsx,distances,'k-o',epsy,distances,'b-^',gammaxy,distances,'r-square')
figure
plot(eps1,distances,'k-o',eps2,distances,'b-^',gamma12,distances,'r-square')
figure
plot(sigmax,distances,'k-o',sigmay,distances,'b-^',tauxy,distances,'r-square')
figure
plot(sigma1,distances,'k-o',sigma2,distances,'b-^',tau12,distances,'r-square')