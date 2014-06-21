clear all; close all
%Inital Vol (vt), Kappa, Theta, Vol of Volatility (sig), Correlation (rho)
x=[0.06976           10       0.3037            0.01      0.80786];

%Initial asset price
shes(1)=3.8;

%Strike Price,Interest rate,Time to Expiry,Time Steps,time interval, Num
%sims
K=2;r=.005;T=1 ;
M=5000; dt=T/M;
%Heston Initial volatility and parameters (start heston v(1)=sigma)
vhes(1)=x(1);  kappa=x(2); theta=x(3); vsigma=x(4);rho=x(5); simPath=0;
S=zeros(1,M+1);
for i=1:10
    shes=300*ones(1,M);
for j = 1:M  
%heston model
r1 = randn;
r2 = rho*r1+sqrt(1-rho^2)*randn;   
shes(j+1)=shes(j)*exp((r-0.5*vhes(j))*dt+sqrt(vhes(j))*sqrt(dt)*r1);
vhes(j+1)=vhes(j)*exp((kappa*(theta - vhes(j))-0.5*vsigma)*dt + vsigma*(1/sqrt(vhes(j)))*sqrt(dt)*r2);
end
S=[S; shes];
end
S=S(2:end,:);
