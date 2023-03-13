function [Ex,Ey,Efx,Efy,Gxy,vxy,vyx]=laminateEngineeringConstants(laminate)
    [~,~,~,~,thicknesses,~] = laminateReader(laminate);
    t=sum(thicknesses);
    ABDmatrixINV = laminateStiffnessMatrixINV(laminate);
    Ex=1/(t*ABDmatrixINV(1,1));
    Ey=1/(t*ABDmatrixINV(2,2));
    Efx=12/(t^3*ABDmatrixINV(4,4));
    Efy=12/(t^3*ABDmatrixINV(5,5));
    Gxy=1/(t*ABDmatrixINV(3,3));
    vxy=-ABDmatrixINV(1,2)/ABDmatrixINV(1,1);
    vyx=-ABDmatrixINV(1,2)/ABDmatrixINV(2,2);
end