load('/home/tamas/2014/01 January/EUR_USD_Week4.mat');
total=Second+(60*(Minute+60*(Hour+24*RateDateTime)));
ddt=diff(total);
t=(total-24*3600*RateDateTime)/(24*3600);



subplot(2,1,1)
plot(ddt);
title('Az EURUSD tick-ek kozott eltelt ido 2014.04.20 UTC-2014.04.25 UTC');
xlabel('t');
ylabel('\Delta t (sec)');


subplot(2,1,2);
hist(ddt(ddt<=10),20);
title('Az EURUSD tick-ek kozott eltelt ido hisztogramja 2014.04.20 UTC-2014.04.25 UTC');
xlabel('\Delta t (sec)');
ylabel('N');
