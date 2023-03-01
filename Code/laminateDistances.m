function zs = laminateDistances(thicknesses)
    N=length(thicknesses)*2;
    thickness=sum(thicknesses);
    zs=zeros(1,length(thicknesses)*2);
    zs(1)=-thickness/2;
    zs(end)=thickness/2;
    for i=2:2:N-2
        zs(i)=zs(i-1)+thicknesses(i/2);
        zs(i+1)=zs(i);
    end
end