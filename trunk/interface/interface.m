% Controls
MW.CG.addControl('pushbutton', 'start(MW)', 'Start');
global h_timer
h_timer = MW.CG.addControl2('text', '', 'Timer');
set(h_timer, 'BackgroundColor', get(gcf, 'Color'));

% Panels and Axes 

% Panel of Stratonovich eq
p1 = MW.newPG('Stratonovich', 'Stratonovich', 2, 2);
ArrPlace = zeros(2,2); ArrPlace(1, 1) = 1; MW.PG{p1}.newAxes(ArrPlace, 'plot_Strut_Initial');
ArrPlace = zeros(2,2); ArrPlace(1, 2) = 1; MW.PG{p1}.newAxes(ArrPlace, 'plot_Strut_Pextr');
ArrPlace = zeros(2,2); ArrPlace(2, 1) = 1; MW.PG{p1}.newAxes(ArrPlace, 'plot_Strut_Likehood');
ArrPlace = zeros(2,2); ArrPlace(2, 2) = 1; MW.PG{p1}.newAxes(ArrPlace, 'plot_Strut_Pest');

% Panel of Results
p2 = MW.newPG('All Results', 'Results', 2, 2);
ArrPlace = zeros(2,2); ArrPlace(1, 1) = 1; MW.PG{p2}.newAxes(ArrPlace, 'plot_Res_Freq');
ArrPlace = zeros(2,2); ArrPlace(2, 1) = 1; MW.PG{p2}.newAxes(ArrPlace, 'plot_Res_FreqRate');
ArrPlace = zeros(2,2); ArrPlace(1, 2) = 1; MW.PG{p2}.newAxes(ArrPlace, 'plot_Res_ErrorFreq');
ArrPlace = zeros(2,2); ArrPlace(2, 2) = 1; MW.PG{p2}.newAxes(ArrPlace, 'plot_Res_ErrorFreqRate');

% Panel of Statistic
p3 = MW.newPG('Statistic', 'Statistic', 1, 1);
ArrPlace = zeros(1,1); ArrPlace(1, 1) = 1; MW.PG{p3}.newAxes(ArrPlace, 'plot_Stat');

MW.setActivePG(p1);
