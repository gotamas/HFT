clear; clc;
%diary('MME.txt')

%diary on;
startdir=pwd;
addpath(pwd);
%cd to the data folder
%cd('/home/tamas/ratedata.gaincapital.com/2014');
cd('e:\2014\');
%fileid=fopen('MME_dt_1.txt','a');
%months={'01 January','02 February', '03 March', '04 April','05 May', '06 June', '07 July', '08 August'...
%   '09 September','10 October', '11 November', '12 December' };

NIGMATRIX=[]; %month, window sigma, kappa, b, theta
VGMATRIX=[]; %month, window sigma, kappa, b, theta
windows=[5,10,20,60,300,600,1200,3600];
%windows=[60,300,600,1200,3600];
months={'01 January','02 February', '03 March', '04 April'};
%assets={'EUR_USD','EUR_HUF'};
assets={'EUR_USD'};
n_months=length(months);
n_assets=length(assets);
n_windows=length(windows);


VG_MME=cell(n_months,n_assets,5, n_windows);
NIG_MME=cell(n_months,n_assets,5, n_windows);
for month=1:n_months
   cd(cell2mat(months(month))); 
   for asset=1:n_assets
       for week=1:5
           filename=[cell2mat(assets(asset)) '_Week' num2str(week)];
           if exist([filename '.mat'],'file')
               %procedure here             
               %ratedate_tickimport(filename);
               for window=1:n_windows
                   filename=[ cell2mat(assets(asset)) '_Week' num2str(week) '_interp_' num2str(windows(window))];
                   MME;
                   %fprintf(fileid,'%s %f %f %f %f %f\n',[cell2mat(months(month)) filename], sigma, kappa, b ,theta, dt);
                   display(['File: ' cell2mat(months(month)) filename ' OK']);
               end

           else
               display(['File: ' cell2mat(months(month)) filename ' MISSING']);
           end
       end
   end
   cd ..;
    
end

cd(pwd);