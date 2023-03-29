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

fprintf(2,'Problem 1: \n\n')
fprintf('Part a: \n')
disp(array2table(ABDmatrix));
fprintf('\n')
fprintf('Part b: \n')
disp(array2table(ABDmatrixINV));
fprintf('Part c: \n')
fprintf('Ex = %g, Ey = %g, Gxy = %g, vxy = %g, etax,xy = %g\n\n',Ex,Ey,Gxy,vxy,etax_xy)

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

fprintf(2,'Problem 2: \n\n')

%% Problem 3
clear;

laminate = [140e9,10e9,7e9,0.3,0.0002,30,1448e6,1172e6,48.3e6,248e6,62.1e6];

Nx=15000;
Ny=7500;
Nxy=0;
Mx=0;
My=0;
Mxy=0;

FS1=maximumStressTheory(laminate,Nx,Ny,Nxy,Mx,My,Mxy);
FS2 = maximumStrainTheory(laminate,Nx,Ny,Nxy,Mx,My,Mxy);
FS3=tsaiHillFailure(laminate,Nx,Ny,Nxy,Mx,My,Mxy);
FS4=tsaiWuFailure(laminate,Nx,Ny,Nxy,Mx,My,Mxy);

fprintf(2,'\nProblem 3: \n\n')
fprintf('Maximum Stress Theory FoS = %g Lamina Does Not Fail\n',FS1)
fprintf('Maximum Strain Theory FoS = %g Lamina Does Not Fail\n',FS2)
fprintf('Tsai-Hill FoS = %g Lamina Fails\n',FS3)
fprintf('Tsai-Wu FoS = %g Lamina Fails\n',FS4)

%% Problem 4
clear;

laminate = [140e9,10e9,7e9,0.3,0.0002,0,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,90,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,90,0,0,0,0,0;...
            140e9,10e9,7e9,0.3,0.0002,0,0,0,0,0,0];
        
sigmax=[140.9e6,140.9e6,10.1e6,10.1e6,10.1e6,10.1e6,140.9e6,140.9e6];
sigmay=[3e6,3e6,3e6,3e6,3e6,3e6,3e6,3e6];
tauxy=[0,0,0,0,0,0,0,0];

[Nx,Ny,Nxy,Mx,My,Mxy] = structuralStress2ForceResultants(laminate,sigmax,sigmay,tauxy);
[epsx0,~,~,~,~,~] = midPlaneStrainsCurvature(Nx,Ny,Nxy,Mx,My,Mxy,laminate);

fprintf(2,'\nProblem 4: \n\n')
fprintf('Part a: \n')
fprintf('Nx = %g, Ny = %g, Nxy = %g, Mx = %g, My = %g, Mxy = %g\n',Nx,Ny,Nxy,Mx,My,Mxy)
fprintf('\n')
fprintf('Part b: \n')
fprintf('\x03b5x0 = %g\n',epsx0)

%% Problem 5
clear;

vf=0.7;
Sf=2400e6;
Sm=170e6;
ef=0.015;
em=0.035;

SL=Sf*vf;

fprintf(2,'\nProblem 5: \n\n')
fprintf('Lamina longitudinal tensile failure strength, SL+ = %g MPa\n',SL/10^6)
fprintf('Lamina longitudinal tensile strain to failure is equal to tensile fiber strain to failure, ef = %g \n',ef)