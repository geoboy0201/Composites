function [FS,Nxmax,Nymax,Nxymax,Mxmax,Mymax,Mxymax]=compositePlateFailureMaxStress(laminate,length,width,Px,Py,Pxy,Qx,Qy,Qxy)

Nx=Px/width;
Ny=Py/length;
Nxy=Pxy;
Mx=Qx/width;
My=Qy/length;
Mxy=Qxy;

FS=maximumStressTheory(laminate,Nx,Ny,Nxy,Mx,My,Mxy);

Nxmax=Nx/FS;
Nymax=Ny/FS;
Nxymax=Nxy/FS;
Mxmax=Mx/FS;
Mymax=My/FS;
Mxymax=Mxy/FS;

end