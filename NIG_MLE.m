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
pdf_VG = @(data,theta,nu,sigma,mu) NIG_pdf(data,theta,nu,sigma,mu,dt);
%start = [theta,nu,sigma,mu]
start = [theta,nu,sigma,mu]
lb = [-intmax 0 0 -intmax];
ub = [intmax intmax intmax intmax];
%ub = [10000 10000 10000 10000];
options = statset('MaxIter',100,'MaxFunEvals',1000);
params = mle(data,'pdf',pdf_VG,'start',start,'lower',lb,'upper',ub,'options',options);
