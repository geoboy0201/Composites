clc;clear;

E1s=[140e9,140e9,140e9,140e9,140e9,140e9];
E2s=[10e9,10e9,10e9,10e9,10e9,10e9];
G12s=[7e9,7e9,7e9,7e9,7e9,7e9];
v12s=[0.3,0.3,0.3,0.3,0.3,0.3];
thicknesses=[0.0002,0.0002,0.0002,0.0002,0.0002,0.0002];
thetas=[0,30,-30,-30,30,0];

A=zeros(3);
    B=zeros(3);
    D=zeros(3);
    N=length(thicknesses);
    thickness=sum(thicknesses);
    distances=zeros(1,length(thicknesses)+1);
    distances(1)=-thickness/2;
    distances(end)=thickness/2;
    if mod(N,2)~=0
        midplane=(N/2)+1;
    else
        midplane=ceil(N/2);
    end
    for i=2:N
        distances(i)=distances(i-1)+thicknesses(i-1);
    end
    Qbars{1}=[];
    Sbars{1}=[];
    for k=1:N
        Qbar = transReducedStiffnessMatrix(E1s(k),E2s(k),G12s(k),v12s(k),thetas(k));
        Qbars{k}=Qbar;
    end
    
    for i=1:3
        for j=1:3
            for k=1:N
                A(i,j)=A(i,j)+(Qbars{k}(i,j)*(distances(k+1)-distances(k)));
                B(i,j)=B(i,j)+(Qbars{k}(i,j)*(1/2)*(distances(k+1)^2-distances(k)^2));
                D(i,j)=D(i,j)+(Qbars{k}(i,j)*(1/3)*(distances(k+1)^3-distances(k)^3));
            end
        end
    end
    ABDmatrix=[A,B;B,D];