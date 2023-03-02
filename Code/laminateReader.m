function [E1s,E2s,G12s,v12s,thicknesses,thetas] = laminateReader(laminate)
    % Creates vectors of elastic properties of laminate where each row is a layer
    % and the laminate matrix is:
    %           E1    E2    G12    v12    thickness    theta
    % Layer 1   X     X      X      X         X          X
    % Layer 2   X     X      X      X         X          X
    %   .       X     X      X      X         X          X
    %   .       X     X      X      X         X          X
    %   .       X     X      X      X         X          X
    % Layer N   X     X      X      X         X          X
    
    E1s=laminate(:,1);
    E2s=laminate(:,2);
    G12s=laminate(:,3);
    v12s=laminate(:,4);
    thicknesses=laminate(:,5);
    thetas=laminate(:,6);
end