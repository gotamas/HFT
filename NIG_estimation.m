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
%subplot(2,1,1);
%plot(S_VG);
%subplot(2,1,2);
data=S_VG;
%N=10;
%T=500;
%VG_fitted=VG_simulation(T,N,dt,params,S0);
%plot(VG_fitted)

% Code 10 MAT LABr code of the MLE for variance gamma density function in (43).
% function params = VG_calibration( data,dt )
% computation of the initial parameters
% data = Close;
%hist(data)
dt = 1;
data = price2ret(data);
%data=Volume;
M = mean(data);
V = std(data);
S = skewness(data);
K = kurtosis(data);
sigma = sqrt(V/dt);
nu = (K/3-1)*dt ;
theta = (S* sigma *sqrt(dt))/(3*nu);
mu = (M/dt)-theta ;
% VG MLE
pdf_VG = @(data,sigma,kappa,b,theta) NIG_pdf(data,sigma,kappa,b,theta,dt);
%start = [theta,nu,sigma,mu]
start = [1,1,1,1]
lb = [0 0 -intmax -intmax];
ub = [intmax intmax intmax intmax];
%ub = [10000 10000 10000 10000];
options = statset('MaxIter',1000,'MaxFunEvals',3000);
params = mle(data,'pdf',pdf_VG,'start',start,'lower',lb,'upper',ub,'options',options);
