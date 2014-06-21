function [musigma]=GBM_calibration(S,dt,params)
Ret=price2ret(S);
n=length(Ret);
options=optimset('MaxFunEvals',100000,'MaxIter',100000);
musigma=fminsearch(@normalLL,params,options);
    function mll=normalLL(params)
    mu=params(1);sigma=abs(params(2));
    ll=n*log(1/sqrt(2*pi*dt)/sigma)+sum(-(Ret-mu*dt).^2/2/(dt*sigma^2));
    mll=-ll;
end
end
