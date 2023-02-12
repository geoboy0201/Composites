function Sbar = transReducedComplianceMatrix(E1,E2,G12,v12,theta)

Qbar = transReducedStiffnessMatrix(E1,E2,G12,v12,theta);
Sbar = Qbar^-1;

end