function fx=NIGdensity(x,theta,kappa,sigma,mu,T)

v1=2*exp((theta*(x-mu))/sigma^2)/((kappa^(T/kappa))*sqrt(2*pi)*sigma*gamma(T/kappa));

M2=(2*sigma^2)/kappa+theta^2;

v3=abs(x-mu)./sqrt(M2);

v4=v3.^(T/kappa-0.5);

v6=(abs(x-mu).*sqrt(M2))./sigma^2;

K=besselk(1,v6);
%display(['th kappa sig mu= ' kappam2str([theta kappa sigma mu])])
fx=v1.*v4.*K;
