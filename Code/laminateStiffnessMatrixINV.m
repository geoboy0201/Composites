function [ABDmatrixINV,distances,Qbars,Sbars] = laminateStiffnessMatrixINV(thicknesses,thetas,E1s,E2s,G12s,v12s)
    [ABDmatrix,distances,Qbars,Sbars] = laminateStiffnessMatrix(thicknesses,thetas,E1s,E2s,G12s,v12s);
    ABDmatrixINV=ABDmatrix^-1;
end