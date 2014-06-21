function S=VG_simulation(N_Sim,T,dt,params,S0)
theta=params(1);nu=params(2);sigma=params(3);mu=params(4);

g=gamrnd(dt/nu,nu,N_Sim,T);
%S=S0*cumprod([ones(1,T);exp(mu*dt+theta*g+sigma*sqrt(g).*randn(N_Sim,T))]);

S=[ones(1,T); exp(mu*dt+theta*g+sigma*sqrt(g).*randn(N_Sim,T))];
S=S0*cumprod(S);