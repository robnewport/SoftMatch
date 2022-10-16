T = readtable('RandomScanpaths.txt');

s10 = [
    sum( T(T.Noise == 0.1, :).SoftMatch )/1200 
    sum( T(T.Noise == 0.1, :).ScanMatch )/1200    
    sum( T(T.Noise == 0.1, :).MultiMatch_Vector )/1200 
    sum( T(T.Noise == 0.1, :).MultiMatch_Direction )/1200 
    sum( T(T.Noise == 0.1, :).MultiMatch_Length )/1200 
    sum( T(T.Noise == 0.1, :).MultiMatch_Position )/1200 
    sum( T(T.Noise == 0.1, :).MultiMatch_Duration )/1200 ];

s30 = [
    sum( T(T.Noise == 0.3, :).SoftMatch )/1200 
    sum( T(T.Noise == 0.3, :).ScanMatch )/1200
    sum( T(T.Noise == 0.3, :).MultiMatch_Vector )/1200 
    sum( T(T.Noise == 0.3, :).MultiMatch_Direction )/1200 
    sum( T(T.Noise == 0.3, :).MultiMatch_Length )/1200 
    sum( T(T.Noise == 0.3, :).MultiMatch_Position )/1200 
    sum( T(T.Noise == 0.3, :).MultiMatch_Duration )/1200 ];

s50 = [
    sum( T(T.Noise == 0.5, :).SoftMatch )/1200 
    sum( T(T.Noise == 0.5, :).ScanMatch )/1200
    sum( T(T.Noise == 0.5, :).MultiMatch_Vector )/1200 
    sum( T(T.Noise == 0.5, :).MultiMatch_Direction )/1200 
    sum( T(T.Noise == 0.5, :).MultiMatch_Length )/1200 
    sum( T(T.Noise == 0.5, :).MultiMatch_Position )/1200 
    sum( T(T.Noise == 0.5, :).MultiMatch_Duration )/1200 ];

s70 = [
    sum( T(T.Noise == 0.7, :).SoftMatch )/1200 
    sum( T(T.Noise == 0.7, :).ScanMatch )/1200
    sum( T(T.Noise == 0.7, :).MultiMatch_Vector )/1200 
    sum( T(T.Noise == 0.7, :).MultiMatch_Direction )/1200 
    sum( T(T.Noise == 0.7, :).MultiMatch_Length )/1200 
    sum( T(T.Noise == 0.7, :).MultiMatch_Position )/1200 
    sum( T(T.Noise == 0.7, :).MultiMatch_Duration )/1200 ];

s90 = [
    sum( T(T.Noise == 0.9, :).SoftMatch )/1200 
    sum( T(T.Noise == 0.9, :).ScanMatch )/1200
    sum( T(T.Noise == 0.9, :).MultiMatch_Vector )/1200 
    sum( T(T.Noise == 0.9, :).MultiMatch_Direction )/1200 
    sum( T(T.Noise == 0.9, :).MultiMatch_Length )/1200 
    sum( T(T.Noise == 0.9, :).MultiMatch_Position )/1200 
    sum( T(T.Noise == 0.9, :).MultiMatch_Duration )/1200 ];

X = categorical({'0.1','0.3','0.5','0.7','0.9'});
Y = [s10'; s30'; s50'; s70'; s90'];
bh = bar(X, Y, 'grouped');
ylabel('Proportion Correct');
xlabel('sigma');
legend('SoftMatch', 'ScanMatch','MultiMatch Vector', 'MultiMatch Direction', 'MultiMatch Length', 'MultiMatch Position', 'MultiMatch Duration');
ylim([0 1.1]);
title('Classification Results');

set(bh, 'FaceColor', 'Flat');
bh(1).CData = [0.05 0.05 0.05];  
bh(2).CData = [0.25 0.25 0.25];
bh(3).CData = [0.40 0.40 0.40];  
bh(4).CData = [0.60 0.60 0.60];  
bh(5).CData = [0.70 0.70 0.70];  
bh(6).CData = [0.80 0.80 0.80];  
bh(7).CData = [0.95 0.95 0.95];

set(gcf,'position',[0,0,800,720])