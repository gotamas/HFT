totalt=(24*3600*RateDateTime+3600*Hour+60*Minute+Second-min(RateDateTime)*24*3600);
dt=diff(totalt);
dr=log(Rate(2:end)./Rate(1:end-1));

scatter(dr,dt,'.');
xlim([-0.5*1e-3 0.5*1e-3])
ylim([0 250])
title('EURUSD �rfolyam megv�ltoz�sa az eltelt id� f�ggv�ny�ben');
xlabel('Hozam');
ylabel('\Delta t (m�sodperc)');