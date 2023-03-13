clc;clear;close all;

laminate = [140e9,10e9,7e9,0.3,0.0002,0,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,90,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,90,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,0,0,0,0,0,0];
%Part a      
Nx=0;
Ny=3500;
Nxy=0;
Mx=0;
My=0;
Mxy=0;

forces2StressStrainLaminate(laminate,Nx,Ny,Nxy,Mx,My,Mxy);

%Part B

laminate = [140e9,10e9,7e9,0.3,0.0002,0,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,30,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,-30,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,-30,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,30,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,0,0,0,0,0,0];
        
        
Nx=5000;
Ny=0;
Nxy=0;
Mx=0;
My=0;
Mxy=0;

forces2StressStrainLaminate(laminate,Nx,Ny,Nxy,Mx,My,Mxy);

%Part C

Nx=0;
Ny=0;
Nxy=0;
Mx=3000;
My=0;
Mxy=0;

forces2StressStrainLaminate(laminate,Nx,Ny,Nxy,Mx,My,Mxy);