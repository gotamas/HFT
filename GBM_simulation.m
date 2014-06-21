function S=GBM_simulation(N_Sim,T,dt,mu,sigma,S0)
mean=(mu-0.5*sigma^2)*dt;
S=S0*ones(N_Sim,T+1);
BM=sigma*sqrt(dt)*normrnd(0,1,N_Sim,T);
S(:,2:end)=S0*exp(cumsum(mean+BM,2));
end
