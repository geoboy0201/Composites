function [ABDmatrixINV,distances,Qbars,Sbars] = laminateStiffnessMatrixINV(laminate)
    [ABDmatrix,distances,Qbars,Sbars] = laminateStiffnessMatrix(laminate);
    ABDmatrixINV=ABDmatrix^-1;
end