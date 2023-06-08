clc;clear;close all;
%%Exam 1
%%Problem 1
theta=0;
laminate = [138e9,9e9,6.9e9,0.3,0.00025,0,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.00025,45,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.00025,theta,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.00025,theta,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.00025,45,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.00025,0,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0];

thetas=[];
etas=[];
Exs=[];

for theta=0:0.01:180
    laminate = [138e9,9e9,6.9e9,0.3,0.00025,0,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
                138e9,9e9,6.9e9,0.3,0.00025,45,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
                138e9,9e9,6.9e9,0.3,0.00025,theta,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
                138e9,9e9,6.9e9,0.3,0.00025,theta,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
                138e9,9e9,6.9e9,0.3,0.00025,45,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
                138e9,9e9,6.9e9,0.3,0.00025,0,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0];
    [Ex,~,~,~,~,~,~,etax_xy,~]=laminateEngineeringConstants(laminate);
    thetas=[thetas,theta];
    etas=[etas,etax_xy];
    Exs=[Exs,Ex];
end

[maxEta,I]=max(abs(etas));
maxEtaTheta=thetas(I);
maxEtaEx=Exs(I);

fprintf('Problem 1:\n')
fprintf('Angle of max laminate shear coupling: theta = %g \n',maxEtaTheta)
fprintf('Max laminate shear coupling: etaxxy = %g \n',maxEta)
fprintf('Modulus at theta: Ex = %g \n',maxEtaEx)

%%Problem 2
clear;

laminate = [138e9,9e9,6.9e9,0.3,0.00025,0,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0];

%Max Stress
thetas=[];
sigmaxs=[];

for theta=0:90
    laminate = [138e9,9e9,6.9e9,0.3,0.00025,theta,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0];
    [PxMax]=compositePlateFailureMaxStress(laminate,1,1);
    [sigmax,sigmay,tauxy,sigma1,sigma2,tau12,epsx,epsy,gammaxy,eps1,eps2,gamma12]=forces2StressStrainLaminateNoPlot(laminate,PxMax,0,0,0,0,0);
    thetas=[thetas,theta];
    sigmaxs=[sigmaxs,sigmax(1)];
end
figure
plot(thetas,sigmaxs)
xlabel('Theta')
ylabel('sigmaX')
title('Max Stress Theory')

%Tsai-Hill
thetas=[];
sigmaxs=[];
pxHill=[];
L=1;
W=1;

for theta=0:90
    laminate = [138e9,9e9,6.9e9,0.3,0.00025,theta,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0];
    [PxMaxTsaiHill]=compositePlateFailureTsaiHill(laminate,L,W);
    [sigmax,sigmay,tauxy,sigma1,sigma2,tau12,epsx,epsy,gammaxy,eps1,eps2,gamma12]=forces2StressStrainLaminateNoPlot(laminate,PxMaxTsaiHill,0,0,0,0,0);
    thetas=[thetas,theta];
    sigmaxs=[sigmaxs,sigmax(1)];
    pxHill=[pxHill,PxMaxTsaiHill];
end
figure
plot(thetas,sigmaxs)
xlabel('Theta')
ylabel('sigmaX')
title('Tsai-Hill Theory')

%Tsai-Wu
thetas=[];
sigmaxs=[];
pxWu=[];
L=1;
W=1;

for theta=0:90
    laminate = [138e9,9e9,6.9e9,0.3,0.00025,theta,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0];
    [PxMaxTsaiWu]=compositePlateFailureTsaiWu(laminate,L,W);
    [sigmax,sigmay,tauxy,sigma1,sigma2,tau12,epsx,epsy,gammaxy,eps1,eps2,gamma12]=forces2StressStrainLaminateNoPlot(laminate,PxMaxTsaiWu,0,0,0,0,0);
    thetas=[thetas,theta];
    sigmaxs=[sigmaxs,sigmax(1)];
    pxWu=[pxWu,PxMaxTsaiWu];
end
figure
plot(thetas,sigmaxs)
xlabel('Theta')
ylabel('sigmaX')
title('Tsai-Wu Theory')

%%Problem 3
clear;
laminate = [138e9,9e9,6.9e9,0.3,0.00025,45,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.00025,90,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.00025,0,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.00025,0,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.00025,90,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.00025,45,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0];
L=1;
W=1;

[PxyMaxStress]=compositePlateFailureMaxStressNxy(laminate,L,W);
[PxyMaxTsaiHill]=compositePlateFailureTsaiHillNxy(laminate,L,W);
[PxyMaxTsaiWu]=compositePlateFailureTsaiWuNxy(laminate,L,W);

fprintf('\nProblem 3:\n')
fprintf('Max Nxy for Max Stress: Nxy = %g\n',PxyMaxStress)
fprintf('Max Nxy for Tsai-Hill: Nxy = %g\n',PxyMaxTsaiHill)
fprintf('Max Nxy for Tsai-Wu: Nxy = %g\n',PxyMaxTsaiWu)
fprintf('Tsai-Hill predicts the smallest force need for failure, while Tsai-Wu predicts that the force needed is actually higher.\n')

%%Problem 4
clear;

Kt=0.01;
v0=0.285;
v12=0.3;
E1=138e9;
E2=9e9;
v21=(v12/E1)*E2;

ErrorA=((Kt*(v21+v0))/(1-v0*Kt))*100;
ErrorT=((Kt*((v21)^-1+v0))/(1-v0*Kt))*100;

fprintf('\nProblem 4:\n')
fprintf('a) Between 3.5 V and 5.5 V\n')
fprintf('b) The error for axial strain is %g %% and error for transverse strain is %g%%\n',ErrorA,ErrorT)
fprintf('c) About 80%% of change in resistance is due to changes in geometry of a wire and 20%% is due to changes in material properties.\n')
fprintf('d) This method involves setting up a half bridge circuit with a dummy compensator. The specimen to be tested is mechanically loaded\n')
fprintf('   and a seperate specimen is set up with a strain gauge in the exact same way as the first specimen but is not mechanically loaded.\n')
fprintf('   Since the dummy specimen undergoes the same thermal expansions as the actual specimen, the strains measured on the dummy specimen\n')
fprintf('   cancel the thermal strains in the actual specimen, leaving only the strains due to mechanical loading.\n')

%%Problem 5
clear;

vf=0.65;
E2f=2e6;
Em=0.75e6;
E2=((vf/E2f)+((1-vf)/Em))^-1;

ksee=2;
eta=((E2f/Em)-1)/((E2f/Em)+ksee);
E2Halpin=Em*((1+ksee*eta*vf)/(1-eta*vf));

fprintf('\nProblem 5:\n')
fprintf('MOM derivation: E2 = %g\n',E2)
fprintf('Halpin-Tsai: E2 = %g\n',E2)

%%Problem 6
clear;

laminate = [138e9,9e9,6.9e9,0.3,0.00025,0,1448e6,1172e6,48.3e6,248e6,62.1e6,0.88e-6,31e-6,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.00025,45,1448e6,1172e6,48.3e6,248e6,62.1e6,0.88e-6,31e-6,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.00025,45,1448e6,1172e6,48.3e6,248e6,62.1e6,0.88e-6,31e-6,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.00025,0,1448e6,1172e6,48.3e6,248e6,62.1e6,0.88e-6,31e-6,0,0,0,0];
        
deltaT=-250;
[sigmax,sigmay,tauxy,sigma1,sigma2,tau12,epsx,epsy,gammaxy,eps1,eps2,gamma12,Nxt,Nyt,Nxyt] = focesTemperature2StressStrainLaminate(laminate,deltaT,0,0,0,0,0,0);

[ABDmatrixINV] = laminateStiffnessMatrixINV(laminate);

alphax=ABDmatrixINV(1,1)*Nxt+ABDmatrixINV(1,2)*Nyt+ABDmatrixINV(1,3)*Nxyt;

fprintf('\nProblem 6:\n')
fprintf('Effective alphax = %g\n',alphax)