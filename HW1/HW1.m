clc;clear;
length1=0.01;
dia1=0.01;
volume=(pi*(dia1/2)^2)*length1;
SA1=(pi*dia1*length1)+(2*pi*(dia1/2)^2);
SAVratio=SA1/volume;
diameters=logspace(-9,0);
ARs=[];
SAVratios=[];
for i=1:length(diameters)
    len=volume/(pi*(diameters(i)/2)^2);
    ARs(i)=len/diameters(1);
    SA=(pi*diameters(1)*len)+(2*pi*(diameters(1)/2)^2);
    SAVratios(i)=SA/volume;
end
semilogx(ARs,SAVratios)
xlabel('Aspect Ratio (L/D)')
ylabel('Surface Area to Volume Ratio (SA/V)')
