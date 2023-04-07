clc;clear;


laminate = [155e9,12.1e9,3.2e9,0.248,0.00015,0,0,0,0,0,0,-0.018,24.3e-6,24.3e-6,146e-6,4770e-6,4770e-6;...
            155e9,12.1e9,3.2e9,0.248,0.00015,90,0,0,0,0,0,-0.018,24.3e-6,24.3e-6,146e-6,4770e-6,4770e-6;...
            155e9,12.1e9,3.2e9,0.248,0.00015,90,0,0,0,0,0,-0.018,24.3e-6,24.3e-6,146e-6,4770e-6,4770e-6;...
            155e9,12.1e9,3.2e9,0.248,0.00015,0,0,0,0,0,0,-0.018,24.3e-6,24.3e-6,146e-6,4770e-6,4770e-6];
        
Nx=0;
Ny=0;
Nxy=0;
Mx=0;
My=0;
Mxy=0;

deltaT=-150;
        
[E1s,E2s,G12s,v12s,thicknesses,thetas,longStrengthTen,longStrengthCom,tranStrengthTen,tranStrengthCom,strengthLT,alphax,alphay,alphaxy,betax,betay,betaxy] = laminateReader(laminate);
zs = laminateDistances(thicknesses);
thickness=sum(thicknesses);
distances=zeros(1,length(thicknesses)+1);
distances(1)=-thickness/2;
distances(end)=thickness/2;
N=length(E1s);
for i=2:N
    distances(i)=distances(i-1)+thicknesses(i-1);
end
Nxt=0;
Nyt=0;
Nxyt=0;
Mxt=0;
Myt=0;
Mxyt=0;
for i=1:length(E1s)
    Qbar = transReducedStiffnessMatrix(E1s(i),E2s(i),G12s(i),v12s(i),thetas(i));
    Nxt=Nxt+(Qbar(1,1)*alphax(i)+Qbar(1,2)*alphay(i)+Qbar(1,3)*alphaxy(i))*(distances(i+1)-distances(i));
    Nyt=Nyt+(Qbar(1,2)*alphax(i)+Qbar(2,2)*alphay(i)+Qbar(2,3)*alphaxy(i))*(distances(i+1)-distances(i));
    Nxyt=Nxyt+(Qbar(1,3)*alphax(i)+Qbar(2,3)*alphay(i)+Qbar(3,3)*alphaxy(i))*(distances(i+1)-distances(i));
    Mxt=Mxt+(Qbar(1,1)*alphax(i)+Qbar(1,2)*alphay(i)+Qbar(1,3)*alphaxy(i))*(distances(i+1)^2-distances(i)^2);
    Myt=Myt+(Qbar(1,2)*alphax(i)+Qbar(2,2)*alphay(i)+Qbar(2,3)*alphaxy(i))*(distances(i+1)^2-distances(i)^2);
    Mxyt=Mxyt+(Qbar(1,3)*alphax(i)+Qbar(2,3)*alphay(i)+Qbar(3,3)*alphaxy(i))*(distances(i+1)^2-distances(i)^2);
end

Nx=Nx+Nxt*deltaT;
Ny=Ny+Nyt*deltaT;
Nxy=Nxy+Nxyt*deltaT;
Mx=Mx+Mxt*deltaT;
My=My+Myt*deltaT;
Mxy=Mxy+Mxyt*deltaT;

[epsx0,epsy0,gammaxy0,kx,ky,kxy] = midPlaneStrainsCurvature(Nx,Ny,Nxy,Mx,My,Mxy,laminate);
[epsx,epsy,gammaxy] = strainLaminateStructural(epsx0,epsy0,gammaxy0,kx,ky,kxy,thicknesses);
[eps1,eps2,gamma12] = strainLaminatePrincipal(epsx,epsy,gammaxy,thetas);
[sigmax,sigmay,tauxy]=strain2stressStructural(epsx,epsy,gammaxy,thetas,E1s,E2s,G12s,v12s);
[sigma1,sigma2,tau12]=stressLaminatePrincipal(sigmax,sigmay,tauxy,thetas);

figure
plots = tiledlayout(2,2);
nexttile
plot(sigma1,zs,'k-o',sigma2,zs,'b-^',tau12,zs,'r-square')
xlabel('Principal Material Stresses [Pa]')
ylabel('z [m]')
legend('\sigma_{1}','\sigma_{2}','\tau_{12}')
set(gca, 'YDir','reverse')
nexttile
plot(sigmax,zs,'k-o',sigmay,zs,'b-^',tauxy,zs,'r-square')
xlabel('Structural Stresses [Pa]')
ylabel('z [m]')
legend('\sigma_{x}','\sigma_{y}','\tau_{xy}')
set(gca, 'YDir','reverse')
nexttile
plot(eps1,zs,'k-o',eps2,zs,'b-^',gamma12,zs,'r-square')
xlabel('Principal Material Strains [\epsilon]')
ylabel('z [m]')
legend('\epsilon_{1}','\epsilon_{2}','\gamma{12}')
set(gca, 'YDir','reverse')
nexttile
plot(epsx,zs,'k-o',epsy,zs,'b-^',gammaxy,zs,'r-square')
xlabel('Structural Strains [\epsilon]')
ylabel('z [m]')
legend('\epsilon_{x}','\epsilon_{y}','\gamma_{xy}')
set(gca, 'YDir','reverse')
set(gcf,'position',[90,90,1000,800])

titleLine1=['N_{x} = ',num2str(Nx),', N_{y} = ',num2str(Ny),', N_{xy} = ',num2str(Nxy),', M_{x} = ',num2str(Mx),', M_{y} = ',num2str(My),', M_{xy} = ',num2str(Mxy)];
titleLine2=num2str(thetas(1));
for i=2:length(thetas)
    titleLine2=[titleLine2,'/',num2str(thetas(i))];
end
title(plots,{titleLine1,titleLine2})