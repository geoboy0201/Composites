function [eps1,eps2,gamma12] = strainLaminatePrincipal(epsx,epsy,gammaxy,thetas)
    N=length(epsx);
    eps1=zeros(1,N);
    eps2=zeros(1,N);
    gamma12=zeros(1,N);
    for i=2:2:N
        strainTrans=strainTransformationMatrix(thetas(i/2));
        principleStrains1=strainTrans*[epsx(i-1);epsy(i-1);gammaxy(i-1)];
        principleStrains2=strainTrans*[epsx(i);epsy(i);gammaxy(i)];
        eps1(i)=principleStrains2(1);
        eps1(i-1)=principleStrains1(1);
        eps2(i)=principleStrains2(2);
        eps2(i-1)=principleStrains1(2);
        gamma12(i)=principleStrains2(3);
        gamma12(i-1)=principleStrains1(3);
    end
end