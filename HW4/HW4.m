clc;clear;

%Problem 1
%p-100/ERL 1962
E1=468.9e9;
E2=6.2e9;
G12=5.58e9;
v12=0.31;
theta = [0 15 45 90];

for i=1:length(theta)
    fprintf('Theta = %g',theta(i))
    Sbar = transReducedComplianceMatrix(E1,E2,G12,v12,theta(i));
    display(Sbar)
end

%Problem 2
thetas=-90:90;

Ex=E1./(cosd(thetas).^4+(((E1/G12)-(2*v12)).*sind(thetas).^2.*cosd(thetas).^2)+(E1.*sind(thetas).^4/E2));
Gxy=G12./(sind(thetas).^4+cosd(thetas).^4+2*((2*G12/E1)*(1+2*v12)+(2*G12/E2)-1).*sind(thetas).^2.*cosd(thetas).^2);
vxy=(v12.*(sind(thetas).^4+cosd(thetas).^4)-(1+(E1/E2)-(E1/G12)).*sind(thetas).^2.*cosd(thetas).^2)./(cosd(thetas).^4+(((E1/G12)-(2*v12)).*sind(thetas).^2.*cosd(thetas).^2)+(E1.*sind(thetas).^4/E2));

figure
plot(thetas,Ex)
xlabel('Fiber Angle (deg)')
ylabel('Ex (GPa)')

figure
plot(thetas,Gxy)
xlabel('Fiber Angle (deg)')
ylabel('Gxy (GPa)')

figure
plot(thetas,vxy)
xlabel('Fiber Angle (deg)')
ylabel('vxy')

%Problem 3
vf=0:0.001:1;
E1f=32e6;
E2f=2E6;
G12f=1.3e6;
Em=0.32e6;
vm=0.43;
Gm=Em/(2*(1+vm));

E1=E1f*vf+Em*(1-vf);
E2=((vf./E2f)+((1-vf)./Em)).^-1;
G12=((vf./G12f)+((1-vf)./Gm)).^-1;

figure
plot(vf,E1)
xlabel('Fiber Volume Fraction')
ylabel('E1 (psi)')

figure
plot(vf,E2)
xlabel('Fiber Volume Fraction')
ylabel('E2 (psi)')

figure
plot(vf,G12)
xlabel('Fiber Volume Fraction')
ylabel('G12 (psi)')
