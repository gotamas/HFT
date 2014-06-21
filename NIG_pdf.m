function fx=NIG_pdf(x,s,k,b,th,t)

sz1=t*exp(t/k+th*(x-b*t)./s^2);
nev1=pi;

sz2=(x-b*t).^2+(t*s)^2/k;
nev2=th^2/(k*s^2)+1/k^2;

sz3=sqrt((x-b*t).^2+t^2*s^2/k)*sqrt(s^2/k+th^2);
nev3=s^2;
K=besselk(1,sz3./nev3);
display(['sigma kappa b theta= ' num2str([s k b th])])
fx=(sz1./nev1).*(sz2/nev2).^(-0.5).*K;
