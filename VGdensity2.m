function fx=VGdensity2(x,theta,nu,sigma,mu,T)

v1=2*exp((theta*(x-mu))/sigma^2)/((nu^(T/nu))*sqrt(2*pi)*sigma*gamma(T/nu));

M2=(2*sigma^2)/nu+theta^2;

v3=abs(x-mu)./sqrt(M2);

v4=v3.^(T/nu-0.5);

v6=(abs(x-mu).*sqrt(M2))./sigma^2;

K=besselk(T/nu-0.5,v6);
%display(['th nu sig mu= ' num2str([theta nu sigma mu])])
fx=v1.*v4.*K;
