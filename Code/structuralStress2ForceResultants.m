function [Nx,Ny,Nxy,Mx,My,Mxy] = structuralStress2ForceResultants(laminate,sigmax,sigmay,tauxy)
    [~,~,~,~,thicknesses,~] = laminateReader(laminate);
    
    Nx=0;
    Ny=0;
    Nxy=0;
    Mx=0;
    My=0;
    Mxy=0;
    
    for i=2:2:length(sigmax)
        Nx=Nx+(((sigmax(i)+sigmax(i-1))/2)*thicknesses(i/2));
        Ny=Ny+(((sigmay(i)+sigmay(i-1))/2)*thicknesses(i/2));
        Nxy=Nxy+(((tauxy(i)+tauxy(i-1))/2)*thicknesses(i/2));
        Mx=Mx+(((sigmax(i)+sigmax(i-1))/2)*thicknesses(i/2)^2);
        My=My+(((sigmay(i)+sigmay(i-1))/2)*thicknesses(i/2)^2);
        Mxy=Mxy+(((tauxy(i)+tauxy(i-1))/2)*thicknesses(i/2)^2);
    end
end