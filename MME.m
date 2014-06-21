%NIG MME

%data ts is given in X, log returns
%clc;
load([filename '.mat']);
X=price2ret(interpRates);
%clearvars -except X
%window=3600;
dt=window/(24*3600);
%dt=;
skewhat=skewness(X);
krthat=kurtosis(X);
varhat=var(X);
m=mean(X);
cmom3=mean((X-m).^3);


%%
%VG
sol=3*skewhat^2/krthat;
feps=@(x) (x*(3+2*x)^2 / ((1+4*x+2*x^2)*(1+x))-sol);
epsilon=fsolve(feps,0.5);
sigma2=(1+epsilon)^(-1)*varhat/dt;
kappa=dt*krthat/3*((1+epsilon)^2/(1+4*epsilon+2*epsilon^2));
theta=cmom3/(dt*sigma2*kappa)*(3+2*epsilon)^(-1);
b=m/dt-theta;
sigma=sqrt(sigma2);
VG_params=[sigma kappa b theta];
%VG_MME(month,asset,week,window)=num2cell([window VG_params]);

%%
%NIG
epsilon=skewhat^2/(3*krthat-5*skewhat^2);
%feps=@(x) (9*x/(5*x+1)-sol);

sigma2=(1+epsilon)^(-1)*varhat/dt;
kappa=dt*krthat/3*((1+epsilon)/(1+5*epsilon));
theta=cmom3/(dt*sigma2*kappa)*(3+3*epsilon)^(-1);
b=m/dt-theta;
sigma=sqrt(sigma2);
NIG_params=[sigma kappa b theta];
%%
%save to matrix
NIGMATRIX=[NIGMATRIX; [month windows(window) NIG_params]];
VGMATRIX=[VGMATRIX; [month windows(window) VG_params]];
%NIG_MME(month,asset,week,window)=[window VG_params];

% %%
% ts=1:0.1:50;
% J=10;
% NIGsim=NIG(theta,kappa,sigma,ts,1);
% plot(NIGsim'+b*[0 ts]')