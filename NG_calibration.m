function [ mu_ omega_ alpha_ beta_ gamma_ ]= NG_calibration( data , params )
returns = price2ret( data );
returnsLength=length( returns );
options = optimset ( 'MaxFunEvals', 100000 , 'MaxIter', 100000);
fminsearch( @NG_JGBM_LL , params , options );
function mll = NG_JGBM_LL( params )
mu_ = params (1); omega_ =abs( params (2)); alpha_ =abs( params (3));
beta_ =abs( params (4)); gamma_ = params (5);
denum = 1- alpha_ - beta_ *(1+ gamma_ ^2);
if denum < 0; mll = intmax ; return; end % Variance stationarity test
var_t = omega_ / denum ;
innov = returns (1) - mu_ ;
LogLikelihood = log(exp(- innov ^2/ var_t /2)/sqrt(pi*2* var_t ));
for time =2: returnsLength
var_t = omega_ + alpha_ * var_t + beta_ *( innov - gamma_ *sqrt( var_t ))^2;
if var_t <0; mll = intmax ; return; end;
innov = returns ( time )- mu_ ;
LogLikelihood = LogLikelihood + log(exp(- innov ^2/ var_t /2)/sqrt(pi*2* var_t ));
end
mll = - LogLikelihood;
end
end
