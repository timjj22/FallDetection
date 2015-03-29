%%fall detection rate-> correct classification
files = {'csvs/11M.csv'; 'csvs/21M.csv'; 'csvs/31M.csv'; ...
    'csvs/42M.csv'; 'csvs/52M.csv'; 'csvs/62M.csv'; 'csvs/73M.csv'; ...
    'csvs/83M.csv'; 'csvs/93M.csv'; 'csvs/101R.csv'; 'csvs/111R.csv'; ...
    'csvs/121R.csv'; 'csvs/132R.csv'; 'csvs/142R.csv'; 'csvs/152R.csv'; ...
    'csvs/163R.csv'; 'csvs/173R.csv'; 'csvs/183R.csv'; 'csvs/191T.csv'; ...
    'csvs/201T.csv'; 'csvs/211T.csv'; 'csvs/222T.csv'; 'csvs/232T.csv'; ...
    'csvs/242T.csv'; 'csvs/253T.csv'; 'csvs/263T.csv'; 'csvs/273T.csv'};
len = length(files);
fall = zeros(len,1);
for i=1:1:len
    M = load(files{i});
    fall(i, :) = get_if_fall(M);
end

per_fall_detected = (sum(fall)/len)*100;

%%false positives
adl_files = {'csvs/abruptStop.csv'; 'csvs/anotherBump.csv'; 'csvs/bum1.csv';...
    'csvs/bum2.csv'; 'csvs/down1.csv'; 'csvs/down2.csv'; 'csvs/drivingStraight.csv'; ...
    'csvs/leftTurn.csv'; 'csvs/rightTurn.csv'; 'csvs/scariestSpeedBumpEver.csv'; ...
    'csvs/sitting1.csv'; 'csvs/sitting2.csv'; 'csvs/sitting3.csv'; 'csvs/uie.csv'; ...
    'csvs/up1.csv'; 'csvs/up2.csv'};
l = length(adl_files);
f_pos = zeros(l,1);
for i=1:1:l
    M = load(adl_files{i});
    f_pos(i, :) = get_if_fall(M);
end
false_pos = (sum(f_pos)/l)*100;