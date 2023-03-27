%% Exam 2
clc;clear;close all;

%% Problem 1

laminate = [140e9,10e9,7e9,0.3,0.0002,0,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,45,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,-45,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,90,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,90,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,-45,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,45,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,0,0,0,0,0,0];
        
ABDmatrix = laminateStiffnessMatrix(laminate);
ABDmatrixINV = laminateStiffnessMatrixINV(laminate);
[Ex,Ey,~,~,Gxy,vxy,~,etax_xy,~]=laminateEngineeringConstants(laminate);

fprintf('Problem 1: \n\n')
fprintf('Part a: \n')
disp(array2table(ABDmatrix));
fprintf('\n')
fprintf('Part b: \n')
disp(array2table(ABDmatrixINV));
fprintf('Part c: \n')
fprintf('Ex = %g, Ey = %g, Gxy = %g, vxy = %g, etax,xy = %g\n',Ex,Ey,Gxy,vxy,etax_xy)

%% Problem 2
clear;
laminate = [140e9,10e9,7e9,0.3,0.0002,0,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,-30,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,30,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,30,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,-30,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,0,0,0,0,0,0];
        
Nx=50000;
Ny=0;
Nxy=0;
Mx=90;
My=0;
Mxy=0;

forces2StressStrainLaminate(laminate,Nx,Ny,Nxy,Mx,My,Mxy);

%% Problem 3
clear;

laminate = [140e9,10e9,7e9,0.3,0.0002,30,1448e6,1172e6,48.3e6,248e6,62.1e6];

Nx=15000;
Ny=7500;
Nxy=0;
Mx=90;
My=0;
Mxy=0;

