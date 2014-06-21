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
title('A tick-ek száma óránként különbözõ devizákra')
legend('EURHUF Ticks', 'EURUSD Ticks')
