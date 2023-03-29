clc;clear;

laminate = [140e9,10e9,7e9,0.3,0.0002,45,1448e6,1172e6,48.3e6,248e6,62.1e6];

Nx=13000;
Ny=5000;
Nxy=0;
Mx=0;
My=0;
Mxy=0;


FS1 = maximumStressTheory(laminate,Nx,Ny,Nxy,Mx,My,Mxy);
FS2 = maximumStrainTheory(laminate,Nx,Ny,Nxy,Mx,My,Mxy);
FS3=tsaiHillFailure(laminate,Nx,Ny,Nxy,Mx,My,Mxy);
FS4=tsaiWuFailure(laminate,Nx,Ny,Nxy,Mx,My,Mxy);