n_windows=length(windows);
NIG_PAR_MEANS=zeros(1,6);
VG_PAR_MEANS=zeros(1,6);

for i=1:n_windows
    for j=1:n_months
        index=(NIGMATRIX(:,1)==j)&(NIGMATRIX(:,2)==windows(i));
        seged=[j windows(i) mean(NIGMATRIX(index,3:end),1)];
        NIG_PAR_MEANS=[NIG_PAR_MEANS; seged];
        seged=[j windows(i) mean(VGMATRIX(index,3:end),1)];
        VG_PAR_MEANS=[VG_PAR_MEANS; seged];
    end
end

save('EURUSD_ATLAGOK','NIG_PAR_MEANS', 'VG_PAR_MEANS');