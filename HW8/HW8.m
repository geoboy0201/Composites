clc;clear;


laminate = [38.6e9,8.27e9,4.14e9,0.26,0.0002,30,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,-30,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,0,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,0,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,-30,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,30,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29];
deltaT=0;
epsx0=1000e-6;
epsy0=0;
gammaxy0=0;
kx=0;
ky=0;
kxy=0;

[sigmax,sigmay,tauxy,sigma1,sigma2,tau12,epsx,epsy,gammaxy,eps1,eps2,gamma12] = midplaneStrainsCurvatureTemperature2StressStrainLaminate(laminate,deltaT,epsx0,epsy0,gammaxy0,kx,ky,kxy);

deltaT=-150;
epsx0=1000e-6;
epsy0=0;
gammaxy0=0;
kx=0;
ky=0;
kxy=0;

[sigmax,sigmay,tauxy,sigma1,sigma2,tau12,epsx,epsy,gammaxy,eps1,eps2,gamma12] = midplaneStrainsCurvatureTemperature2StressStrainLaminate(laminate,deltaT,epsx0,epsy0,gammaxy0,kx,ky,kxy);

clear;
laminate = [38.6e9,8.27e9,4.14e9,0.26,0.0002,0,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,-60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,0,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,-60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,-60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,0,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,-60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,0,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29];

deltaT=-150;
epsx0=0;
epsy0=0;
gammaxy0=0;
kx=0;
ky=0;
kxy=0;

[sigmax,sigmay,tauxy,sigma1,sigma2,tau12,epsx,epsy,gammaxy,eps1,eps2,gamma12,kx,ky,kxy] = midplaneStrainsCurvatureTemperature2StressStrainLaminate(laminate,deltaT,epsx0,epsy0,gammaxy0,kx,ky,kxy);

fprintf('kx = %g, ky =%g, kxy = %g\n',kx,ky,kxy)

clear;
laminate = [38.6e9,8.27e9,4.14e9,0.26,0.0002,0,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,-60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,0,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,-60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,-60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,0,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,-60,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29;...
            38.6e9,8.27e9,4.14e9,0.26,0.0002,0,0,0,0,0,0,6.3e-6,20e-6,20e-6,0.014,0.29,0.29];

deltaT=-150;
epsx0=0;
epsy0=0;
gammaxy0=0;
kx=0;
ky=0;
kxy=0;

[sigmax,sigmay,tauxy,sigma1,sigma2,tau12,epsx,epsy,gammaxy,eps1,eps2,gamma12,kx,ky,kxy] = midplaneStrainsCurvatureTemperature2StressStrainLaminate(laminate,deltaT,epsx0,epsy0,gammaxy0,kx,ky,kxy);


fprintf('kx = %g, ky =%g, kxy = %g',kx,ky,kxy)