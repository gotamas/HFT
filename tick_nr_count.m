day=min(RateDateTime):max(RateDateTime);
hours=0:23;
data=zeros(length(day),length(hours));
data_t=[];
for d=day
    for h=hours
        data(d+1-min(RateDateTime),h+1)=sum((RateDateTime==d)&(Hour==h));
        data_t=[data_t data(d+1-min(RateDateTime),h+1)];
    end
end

%%
plot([data_huf' data_usd']);
title('A tick-ek sz�ma �r�nk�nt k�l�nb�z� deviz�kra')
legend('EURHUF Ticks', 'EURUSD Ticks')
