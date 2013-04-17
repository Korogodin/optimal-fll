try 
    close(MW.handle); % Close old output form
end
try
    clear TrueValues 
    StratResults.delete();
    clear Erro FLLRes
end

close all
clear 
clc

globals;

rng('shuffle'); % Reinit for randn

addpath([pwd '/callback']); % Callbacks for Control Panel
addpath([pwd '/basic-interface']); % Functions for base interface
addpath([pwd '/interface']); % Functions for interface
addpath([pwd '/stratonovich']); % Class of integral solution of Stratonovich equation
addpath([pwd '/ckalman']); % Classes of Kalman filters
addpath([pwd '/stat']); % Statistic

MW = CMainWindow('Multiantennas receiver');
if MW.handle == 0
    clear MW;
    return;
end

interface;

