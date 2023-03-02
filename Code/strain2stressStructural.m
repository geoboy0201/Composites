function [sigmax,sigmay,tauxy]=strain2stressStructural(epsx,epsy,gammaxy,thetas,E1s,E2s,G12s,v12s)
    N=length(epsx);
    sigmax=zeros(1,N);
    sigmay=zeros(1,N);
    tauxy=zeros(1,N);
    for i=2:2:N
        Qbar = transReducedStiffnessMatrix(E1s(i/2),E2s(i/2),G12s(i/2),v12s(i/2),thetas(i/2));
        stress=Qbar*[epsx(i);epsy(i);gammaxy(i)];
        sigmax(i)=stress(1);
        sigmax(i-1)=stress(1);
        sigmay(i)=stress(2);
        sigmay(i-1)=stress(2);
        tauxy(i)=stress(3);
        tauxy(i-1)=stress(3);
    end
end