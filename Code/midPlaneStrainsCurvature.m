function [epsx0,epsy0,gammaxy0,kx,ky,kxy] = midPlaneStrainsCurvature(Nx,Ny,Nxy,Mx,My,Mxy,laminate)
    ABDmatrixINV = laminateStiffnessMatrixINV(laminate);
    epsk=ABDmatrixINV*[Nx;Ny;Nxy;Mx;My;Mxy];
    epsx0=epsk(1);
    epsy0=epsk(2);
    gammaxy0=epsk(3);
    kx=epsk(4);
    ky=epsk(5);
    kxy=epsk(6);
end