S0=310;
N_Sim=6;
att_params=[0 6 0.03 0];
S=VG_simulation(T,N_Sim,1,att_params,S0);
plot(S)
title('VG folyamat szimulációja')
xlabel('t')
ylabel('S')
title('Variance Gamma folyamat szimulációja')