clc;clear;close all;

%           Modulus          Poisson  Thickness   Theta   Strengths
laminate = [138e9,9e9,6.9e9,    0.3,   0.0002,       0,    1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,    0.3,   0.0002,      30,    1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,    0.3,   0.0002,     -30,    1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,    0.3,   0.0002,     -30,    1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,    0.3,   0.0002,      30,    1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,    0.3,   0.0002,       0,    1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0];
        
[Ex,Ey,Efx,Efy,Gxy,vxy,vyx,etax_xy,etaxy_y]=laminateEngineeringConstants(laminate);

Nx=3000;
Ny=3000;
Nxy=0;
Mx=30;
My=0;
Mxy=0;

forces2StressStrainLaminate(laminate,Nx,Ny,Nxy,Mx,My,Mxy);

W = 0.3;
L = 0.3;
[PxMax]=compositePlateFailureMaxStress(laminate,L,W);

[FS]=tsaiHillFailure(laminate,Nx,Ny,Nxy,Mx,My,Mxy);
