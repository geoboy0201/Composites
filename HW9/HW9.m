clc;clear;

L=0.254;
W=0.254;

laminate = [138e9,9e9,6.9e9,0.3,0.0002,0,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.0002,30,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.0002,-30,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.0002,-30,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.0002,30,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0;...
            138e9,9e9,6.9e9,0.3,0.0002,0,1448e6,1172e6,48.3e6,248e6,62.1e6,0,0,0,0,0,0];


[PxMaxStress]=compositePlateFailureMaxStress(laminate,L,W);

[PxMaxTsaiWu]=compositePlateFailureTsaiWu(laminate,L,W);

fprintf('Max load is Px = %g N using max stress\n',PxMaxStress)
fprintf('Max load is Px = %g N using Tsai Wu\n',PxMaxTsaiWu)

[MxMaxStress]=compositePlateFailureMaxStressMx(laminate,L,W);

[MxMaxTsaiWu]=compositePlateFailureTsaiWuMx(laminate,L,W);

fprintf('Max load is Mx = %g Nm using max stress\n',MxMaxStress)
fprintf('Max load is Mx = %g Nm using Tsai Wu\n',MxMaxTsaiWu)
