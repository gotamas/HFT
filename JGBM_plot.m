%%
subplot(2,1,1)
params=[0 0.1 1000 0.008 0.007];
S0=310;
N_Sim=6;
dt=1e-5;
T=1e3;
S=JGBM_simulation(N_Sim,T,dt,params,S0);
plot(S');
title('Geometriai Brown mozgás szimulációja Poisson ugrásokkal');
xlabel('t')
ylabel('S')


 subplot(2,1,2)
% params=[0.5 0.1 1000 0.008 0.007];
% N_Sim=1;
% dt=1e-5;
% T=1e5;
% S=JGBM_simulation(N_Sim,T,dt,params,S0);
% a=0.005;
plot(diff(S(1,:))./S(1,1:end-1));
% title('Az ugró GBM hozamainak eloszlása')
title('Geometriai Brown mozgás hozamainak szimulációja Poisson ugrásokkal');
xlabel('t')
ylabel('dS')