clc;clear;
%AS/3501 graphite/epoxy
E1=138e9;
E2=9e9;
G12=6.9e9;
v12=0.3;
theta = [0 90 30 45 -45];

for i=1:length(theta)
    Qbar = transReducedStiffnessMatrix(E1,E2,G12,v12,theta(i));
    display(Qbar)
end