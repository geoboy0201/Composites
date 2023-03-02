function [eps1,eps2,gamma12] = strainLaminatePrincipal(epsx,epsy,gammaxy,thetas)
    N=length(epsx);
    eps1=zeros(1,N);
    eps2=zeros(1,N);
    gamma12=zeros(1,N);
    for i=2:2:N
        strainTrans=strainTransformationMatrix(thetas(i/2));
        principleStrains=strainTrans*[epsx(i);epsy(i);gammaxy(i)];
        eps1(i)=principleStrains(1);
        eps1(i-1)=eps1(i);
        eps2(i)=principleStrains(2);
        eps2(i-1)=eps2(i);
        gamma12(i)=principleStrains(3);
        gamma12(i-1)=gamma12(i);
    end
end