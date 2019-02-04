%Using Big File with all data in one table
C = unique(Measure);
A = Measure==C(17);
B = Measure==C(18);
indexmental = find(A);
indexleisure = find(B);
CityNameM = CityName(indexmental(1:end));
Data_ValueM = Data_Value(indexmental(1:end));
DataValueTypeIDM = DataValueTypeID(indexmental(1:end));
GeographicalLevelM = GeographicalLevel(indexmental(1:end));
PopulationCountM = PopulationCount(indexmental(1:end));
StateDescM = StateDesc(indexmental(1:end));
TractFIPSM = TractFIPS(indexmental(1:end));
CityNameL = CityName(indexmental(1:end));
Data_ValueL = Data_Value(indexmental(1:end));
DataValueTypeIDL = DataValueTypeID(indexmental(1:end));
GeographicalLevelL = GeographicalLevel(indexmental(1:end));
PopulationCountL = PopulationCount(indexmental(1:end));
StateDescL = StateDesc(indexmental(1:end));
TractFIPSL = TractFIPS(indexmental(1:end));

%Using separated out files for Mental and Leisure
X = [ones(size(x1)) x1 x2];
b = regress(y,X);
yexp = b(1)+b(2)*x1+b(3)*x2;
scatter(x1,x2,y,'filled','b')
scatter3(x1,x2,y,'filled','b')
hold on
scatter3(x1,x2,yexp,'filled','r')
[~,~,~,~,stats] = regress(y,X);


%Making the figure I came up with
T = 9;
DataHealth = [Arthritis BingeDrinking Cancer Cholesterolscreening ChronicKidney ChronicObstructivePulmonary CoronaryHeartDisease CurrentAsthma CurrentSmoking Diabetes HighBloodPressure HighCholesterol MentalHealthPoor NoLeisureTime Obesity PhysicalHealthPoor Sleepinglessthan7 Stroke TakingHBPmedicine VisitstoDentist VisitstoDoctor];
Names = ["Arthritis", "BingeDrinking", "Cancer", string('Cholesterolscreening'), string('ChronicKidney'), string('ChronicObstructivePulmonary'), string('CoronaryHeartDisease'), string('CurrentAsthma'), string('CurrentSmoking'), string('Diabetes'), string('HighBloodPressure'), string('HighCholesterol'), string('MentalHealthPoor'), string('NoLeisureTime'), string('Obesity'), string('PhysicalHealthPoor'), string('Sleepinglessthan7'), string('Stroke'), string('TakingHBPmedicine'), string('VisitstoDentist'), string('VisitstoDoctor')];
Rsquaredlist = zeros(21,1);
Rsquaredlistadj = zeros(21,1);
y = DataHealth(:,T);
for i=1:21
    x = DataHealth(:,i);
    mdl = fitlm(x,y);
    Rsquaredlist(i) = mdl.Rsquared.Ordinary;
    Rsquaredlistadj(i) = mdl.Rsquared.Adjusted;
end
[A,B] = maxk(Rsquaredlistadj,6);
A(1) = [];
B(1) = [];
c = "r2adj = ";
txtall = Rsquaredlistadj(B(1:end));
txtall = num2str(txtall);
subplot(2,3,1);
x = DataHealth(:,B(1));
scatter(x,y,7,'filled')
title(Names(B(1)))
xl = xlim;
yl = ylim;
txt = convertCharsToStrings(txtall(1,:));
txt = strcat(c,txt);
text(xl(2),yl(1),txt,'HorizontalAlignment','right','VerticalAlignment','bottom')
xlabel("%pop Poor Mental Health")
subplot(2,3,2);
x = DataHealth(:,B(2));
scatter(x,y,7,'filled')
title(Names(B(2)))
xl = xlim;
yl = ylim;
txt = convertCharsToStrings(txtall(2,:));
txt = strcat(c,txt);
text(xl(2),yl(1),txt,'HorizontalAlignment','right','VerticalAlignment','bottom')
xlabel("%pop Obese")
subplot(2,3,3);
x = DataHealth(:,B(3));
scatter(x,y,7,'filled')
title(Names(B(3)))
xl = xlim;
yl = ylim;
txt = convertCharsToStrings(txtall(3,:));
txt = strcat(c,txt);
text(xl(2),yl(1),txt,'HorizontalAlignment','right','VerticalAlignment','bottom')
xlabel("%pop Chronic Obstructive Pulmonary Disease")
subplot(2,3,4);
x = DataHealth(:,B(4));
scatter(x,y,7,'filled')
title(Names(B(4)))
xl = xlim;
yl = ylim;
txt = convertCharsToStrings(txtall(4,:));
txt = strcat(c,txt);
text(xl(2),yl(1),txt,'HorizontalAlignment','right','VerticalAlignment','bottom')
xlabel("%pop Poor Physical Health")
subplot(2,3,5);
x = DataHealth(:,B(5));
scatter(x,y,7,'filled')
title(Names(B(5)))
xl = xlim;
yl = ylim;
txt = convertCharsToStrings(txtall(5,:));
txt = strcat(c,txt);
text(xl(2),yl(1),txt,'HorizontalAlignment','right','VerticalAlignment','bottom')
xlabel("%pop Visit Dentist")
subplot(2,3,6);
x1 = DataHealth(:,B(1));
x2 = DataHealth(:,B(2));
X = [ones(size(x1)) x1 x2];
d = regress(y,X);
yexp = b(1)+b(2)*x1+b(3)*x2;
scatter3(x1,x2,y,4,'filled','b')
hold on
scatter3(x1,x2,yexp,4,'filled','r')
[~,~,~,~,stats] = regress(y,X);
multi = num2str(stats(1));
multitxt = convertCharsToStrings(multi);
multitxt = strcat(c,multitxt);
xl = xlim;
yl = ylim;
text(xl(2),yl(1),multitxt,'VerticalAlignment','bottom')
title("Poor Mental Health: Modeled vs. Measured")
legend('Measured','Modeled','Location','northwest')
xlabel("%pop Poor Mental Health")
ylabel("%pop Obese")
sgtitle('Exploring Smoking Rates: Top 5 Linear Regression Public Health Metrics')