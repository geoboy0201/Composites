function [sigma1,sigma2,tau12]=stressLaminatePrincipal(sigmax,sigmay,tauxy,thetas)
    N=length(sigmax);
    sigma1=zeros(1,N);
    sigma2=zeros(1,N);
    tau12=zeros(1,N);
    for i=2:2:N
        stressTrans = stressTransformationMatrix(thetas(i/2));
        principalStresses1 = stressTrans*[sigmax(i-1);sigmay(i-1);tauxy(i-1)];
        principalStresses2 = stressTrans*[sigmax(i);sigmay(i);tauxy(i)];
        sigma1(i)=principalStresses2(1);
        sigma1(i-1)=principalStresses1(1);
        sigma2(i)=principalStresses2(2);
        sigma2(i-1)=principalStresses1(2);
        tau12(i)=principalStresses2(3);
        tau12(i-1)=principalStresses1(3);
    end
end