function [eps1,eps2,gamma12] = strainLaminatePrincipal(epsx,epsy,gammaxy,thetas)
    N=length(epsx);
    eps1=zeros(1,N);
    eps2=zeros(1,N);
    gamma12=zeros(1,N);
    for i=2:2:N
        strainTrans=strainTransformationMatrix(thetas(N/2));
        principleStrains=strainTrans*[epsx(N);epsy(N);gammaxy(N)];
        eps1(N)=principleStrains(1);
        eps1(N-1)=eps1(N);
        eps2(N)=principleStrains(2);
        eps2(N-1)=eps2(N);
        gamma12(N)=principleStrains(3);
        gamma12(N-1)=gamma12(N);
    end
end