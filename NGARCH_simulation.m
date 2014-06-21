function S= NGARCH_simulation( N_Sim ,T , params , S0 )
mu_= params (1); omega_ = params (2); alpha_ = params (3); beta_ = params (4); gamma_ = params (5);
S= S0 * ones ( N_Sim ,T );
v0 = omega_ /(1 - alpha_ - beta_ );
v= v0 * ones ( N_Sim ,1);
BM = normrnd (0 ,1 ,N_Sim ,T );
for i =2: T
sigma_ =sqrt(v );
mean=( mu_ -0.5* sigma_ .^2);
S (: , i )= S(: ,i -1).*exp(mean+ sigma_ .* BM (: ,i ));
v = omega_ + alpha_ *v+ beta_ *(sqrt(v ).* BM (: ,i)- gamma_ *sqrt(v )).^2;
end
end
