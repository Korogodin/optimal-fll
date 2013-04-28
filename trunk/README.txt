%%%%%%%%%%%%%%%%%%
Install
%%%%%%%%%%%%%%%%%%
Checkout projects to this folder (relevant revision):
https://code.google.com/p/stratonovich/
https://code.google.com/p/basic-interface/
https://code.google.com/p/ckalman

%%%%%%%%%%%%%%%%%%
Main settings:
%%%%%%%%%%%%%%%%%%
start.m:
qcno_dB - SNR array
Sksi - former noise SPD 
DoStrat - 1/0 - calc optimal solution
DoFLL - 1|0 - calc quasi-optimal solution (EKF)

process.m:
K - duration of one experiment (in T)

initial_PD.m:
dX - grid step
HX1, HX2 - range of initial PD

CStrat.m:
pest = SF.separatePD_ln(ln_pest, 15); - there 15 nP is threshold of PD cutting (see article)
This value should be selected on the basis of SNR and sigma_a

%%%%%%%%%%%%%%%%%%
Service scripts
%%%%%%%%%%%%%%%%%%
Model saves statistic in Stat.mat file. Open and parse this file by means of load_statistic.m

gen_new_statfile.m generates new Stat.mat =)

/stat - is a folder for results and other stuff
