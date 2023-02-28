clc;clear;
E1s=[140e9,140e9,140e9,140e9,140e9,140e9];
E2s=[10e9,10e9,10e9,10e9,10e9,10e9];
G12s=[7e9,7e9,7e9,7e9,7e9,7e9];
v12s=[0.3,0.3,0.3,0.3,0.3,0.3];
thicknesses=[0.0002,0.0002,0.0002,0.0002,0.0002,0.0002];
thetas=[0,30,-30,-30,30,0];

ABDmatrix1 = laminateStiffnessMatrix(thicknesses,thetas,E1s,E2s,G12s,v12s);
ABDmatrixINV1 = laminateStiffnessMatrixINV(thicknesses,thetas,E1s,E2s,G12s,v12s);

E1s=[140e9,140e9,140e9,140e9,140e9,140e9];
E2s=[10e9,10e9,10e9,10e9,10e9,10e9];
G12s=[7e9,7e9,7e9,7e9,7e9,7e9];
v12s=[0.3,0.3,0.3,0.3,0.3,0.3];
thicknesses=[0.0002,0.0002,0.0002,0.0002,0.0002,0.0002];
thetas=[30,-15,-75,20,-60,-30];

ABDmatrix2 = laminateStiffnessMatrix(thicknesses,thetas,E1s,E2s,G12s,v12s);
ABDmatrixINV2 = laminateStiffnessMatrixINV(thicknesses,thetas,E1s,E2s,G12s,v12s);