%% Import data from text file.
% Script for importing data from the following text file:
%
%    E:\download\EURHUF\EUR_HUF_Week1.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2014/04/27 23:58:41
%clear
%% Initialize variables.
%filename = 'EUR_USD_Week1.csv';
function out=ratedate_tickimport(filename)
delimiter = {',',';',':',' '};
startRow = 2;

%% Format string for each line of text:
%   column4: date strings (%s)
%	column5: double (%f)
%   column6: double (%f)
%	column7: double (%f)
%   column8: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*s%*s%*s%s%f%f%f%f%*s%[^\n\r]';

%% Open the text file.
fileID = fopen([filename '.csv'],'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Convert the contents of column with dates to serial date numbers using date format string (datenum).
dataArray{1} = datenum(dataArray{1}, 'yyyy-mm-dd');

%% Allocate imported array to column variable names
RateDateTime = dataArray{:, 1};
Hour = dataArray{:, 2};
Minute = dataArray{:, 3};
Second = dataArray{:, 4};
Rate = dataArray{:, 5};
clearvars delimiter startRow formatSpec fileID dataArray ans;
save([filename '.mat'],'RateDateTime','Hour','Minute','Second','Rate')
out=1;
end
%% Clear temporary variables