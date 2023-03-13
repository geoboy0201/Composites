clc;clear;close all;

laminate = [140e9,10e9,7e9,0.3,0.0002,0,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,45,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,-45,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,-45,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,45,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,0,0,0,0,0,0];
        
[Ex,Ey,Efx,Efy,Gxy,vxy,vyx]=laminateEngineeringConstants(laminate);

fprintf('Ex = %g, Ey = %g, Efx = %g\n',Ex,Ey,Efx)

laminate = [140e9,10e9,7e9,0.3,0.0002,30,1448e6,1172e6,48.3e6,248e6,62.1e6];

Nx=275000;
Ny=0;
Nxy=0;
Mx=0;
My=0;
Mxy=0;

[FSstress]=maximumStressTheory(laminate,Nx,Ny,Nxy,Mx,My,Mxy);
[FSstrain]=maximumStrainTheory(laminate,Nx,Ny,Nxy,Mx,My,Mxy);
[[0.104300950448511]]=tsaiHillFailure(laminate,Nx,Ny,Nxy,Mx,My,Mxy);