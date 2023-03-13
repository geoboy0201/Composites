function [epsx,epsy,gammaxy] = strainLaminateStructural(epsx0,epsy0,gammaxy0,kx,ky,kxy,thicknesses)
    distances=laminateDistances(thicknesses);
    N=length(distances);
    epsx=zeros(1,N);
    epsy=zeros(1,N);
    gammaxy=zeros(1,N);
    for i=1:N
        epsx(i)=epsx0+(distances(i)*kx);
        epsy(i)=epsy0+(distances(i)*ky);
        gammaxy(i)=gammaxy0+(distances(i)*kxy);
    end
end