
%clc; clear;
%file='EUR_USD_Week2';
function out=ratedate_sec_interp(filename,window)
load([filename '.mat'])
totalTime=24*3600*RateDateTime+3600*Hour+60*Minute+Second;
clear Hour Minute Second
startTime=ceil(totalTime(1));
endTime=floor(totalTime(end));
t=startTime:window:endTime;
interpRates=interp1(totalTime,Rate,t,'nearest');
interpDate=floor(t/(24*3600));
interpDaySecs=t-interpDate*24*3600;
%save([filename '_interp_' num2str(window) '.mat'],'interpRates','t','interpDate','interpDaySecs');
out=interpRates;
end