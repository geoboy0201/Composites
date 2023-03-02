clc;clear;close all;

laminate = [140e9,10e9,7e9,0.3,0.0002,0;...
            140e9,10e9,7e9,0.3,0.0002,90;...
            140e9,10e9,7e9,0.3,0.0002,90;...
            140e9,10e9,7e9,0.3,0.0002,0];
%Part a      
epsx0=1500e-9;
epsy0=0;
gammaxy0=0;
kx=0;
ky=0;
kxy=0;

midplaneStrainCurvature2StressStrainLaminate(epsx0,epsy0,gammaxy0,kx,ky,kxy,laminate);

%Part B
Nx=0;
Ny=3500;
Nxy=0;
Mx=0;
My=0;
Mxy=0;

forces2StressStrainLaminate(laminate,Nx,Ny,Nxy,Mx,My,Mxy);

%Part C
laminate = [140e9,10e9,7e9,0.3,0.0002,0;...
            140e9,10e9,7e9,0.3,0.0002,30;...
            140e9,10e9,7e9,0.3,0.0002,-30;...
            140e9,10e9,7e9,0.3,0.0002,-30;...
            140e9,10e9,7e9,0.3,0.0002,30;...
            140e9,10e9,7e9,0.3,0.0002,0];

Nx=5000;
Ny=0;

forces2StressStrainLaminate(laminate,Nx,Ny,Nxy,Mx,My,Mxy);