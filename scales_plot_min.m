%load('E:\2014\04 April\EUR_HUF_Week3.mat')
subplot(4,1,1);
tstart=13042014;
start=datestr(max(RateDateTime));
totalt=(24*3600*RateDateTime+3600*Hour+60*Minute+Second-min(RateDateTime)*24*3600)/(24*3600);
plot(totalt,Rate);
title('EURUSD árfolyam 2014.04.20-2014.04.25 UTC');
legend('EURUSD árfolyam')


subplot(4,1,2);
index=(RateDateTime==735712);
plot(totalt(index),Rate(index));
title('EURUSD árfolyam 2014.04.23 UTC');
legend('EURUSD árfolyam')

subplot(4,1,3);
index2=(Hour==9);
index=index&index2;
stairs(totalt(index),Rate(index));
title('EURUSD árfolyam 2014.04.23 9:00 UTC-2014.04.23 10:00 UTC');
legend('EURUSD árfolyam')



subplot(4,1,4);
index3=(0<=Minute)&(Minute<21);
index=index&index3;
stairs(totalt(index),Rate(index));
title('EURUSD árfolyam 2014.04.23 9:00 UTC-2014.04.23 9:20 UTC');
legend('EURUSD árfolyam')