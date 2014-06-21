%Simulating VG
%A T tulképp N
clear; clc
T=500;
dt=1/5000;
%sigma=0.127;
theta=0;
nu=.06;
sigma=0.03;
mu=0;
%nu=0.2873;
%theta=1.3*1e-3;
%mu=-1.7*1e-3;
S0=2;
params=[theta,nu,sigma,mu];
N=1;
S_VG=VG_simulation(T,N,dt,params,S0);
subplot(2,1,1);
plot(S_VG);
subplot(2,1,2);
data=S_VG;
NIG_MLE
N=10;
T=500;
VG_fitted=VG_simulation(T,N,dt,params,S0);
plot(VG_fitted)
%%
%Simulating GBM
S0=100;
T=500;
dt=0.1;
mu=0.05
N=1;
sigma=0.3;
S=GBM_simulation(N,T,dt,mu,sigma,S0);
plot(S)
params=[0 0.5]
[musigma]=GBM_calibration(S,dt,params)

%%
%Simulating NIG
theta=0.1;
kappa=5;
sigma=0.03;
ts=0.1:0.1:10;
J=10;
S=NIG(theta,kappa,sigma,ts,J);
plot(S')

%%Simulating Jump diffusion
