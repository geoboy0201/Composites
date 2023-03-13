function [sigmax,sigmay,tauxy]=strain2stressStructural(epsx,epsy,gammaxy,thetas,E1s,E2s,G12s,v12s)
    N=length(epsx);
    sigmax=zeros(1,N);
    sigmay=zeros(1,N);
    tauxy=zeros(1,N);
    for i=2:2:N
        Qbar = transReducedStiffnessMatrix(E1s(i/2),E2s(i/2),G12s(i/2),v12s(i/2),thetas(i/2));
        stress2=Qbar*[epsx(i);epsy(i);gammaxy(i)];
        stress1=Qbar*[epsx(i-1);epsy(i-1);gammaxy(i-1)];
        sigmax(i)=stress2(1);
        sigmax(i-1)=stress1(1);
        sigmay(i)=stress2(2);
        sigmay(i-1)=stress1(2);
        tauxy(i)=stress2(3);
        tauxy(i-1)=stress1(3);
    end
end