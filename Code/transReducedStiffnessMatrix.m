function Qbar = transReducedStiffnessMatrix(E1,E2,G12,v12,theta)
%This function finds the transformed reduced stiffness matrix at angle theta
    v21=(v12/E1)*E2;
    Q11=E1/(1-v12*v21);
    Q12=(v12*E2)/(1-v12*v21);
    Q21=Q12;
    Q22=E2/(1-v12*v21);
    Q66=G12;
    Q=[Q11 Q12 0; Q21 Q22 0; 0 0 Q66];
    
    stressTrans=[cosd(theta)^2 sind(theta)^2 2*cosd(theta)*sind(theta);...
                sind(theta)^2 cosd(theta)^2 -2*cosd(theta)*sind(theta);...
                -cosd(theta)*sind(theta) cosd(theta)*sind(theta) (cosd(theta)^2)-(sind(theta)^2)];

    strainTrans=[cosd(theta)^2 sind(theta)^2 cosd(theta)*sind(theta);...
                sind(theta)^2 cosd(theta)^2 -cosd(theta)*sind(theta);...
                -2*cosd(theta)*sind(theta) 2*cosd(theta)*sind(theta) (cosd(theta)^2)-(sind(theta)^2)];
            
    Qbar = (stressTrans)\Q*strainTrans;
end