clc; close all;

%% Importing data
Time = round(out.tout, 2);
%RotCylEx = out.CylPre.RotCylEx;
%RotCylRe = out.CylPre.RotCylRe;
BoomCylEx = round(out.BucCylEx.signals.values);
BoomCylRe = round(out.BucCylRe.signals.values);
ArmCylEx = round(out.ArmCylEx.signals.values);
ArmCylRe = round(out.ArmCylRe.signals.values);
BucCylEx = round(out.BucCylEx.signals.values);
BucCylRe = round(out.BucCylRe.signals.values);


%% Table for max pressure
%RotCylExMax = max(RotCylEx);
%RotCylReMax = max(RotCylRe);
BoomCylExMax = max(BoomCylEx);
BoomCylReMax = max(BoomCylRe);
ArmCylExMax = max(ArmCylEx);
ArmCylReMax = max(ArmCylRe);
BucCylExMax = max(BucCylEx);
BucCylReMax = max(BucCylRe);

Max_Pressure_Extending = ["RotCylExMax"; BoomCylExMax; ArmCylExMax; BucCylExMax];
Cylinder = ["Rotational"; "Boom"; "Arm"; "Bucket"];
Max_Pressure_Retracting = ["RotCylReMax"; BoomCylReMax; ArmCylReMax; BucCylReMax];
AvgBoomEx = sum(BoomCylEx)/length(BoomCylEx);
AvgBoomRe = sum(BoomCylRe)/length(BoomCylRe);
AvgArmEx = sum(ArmCylEx)/length(ArmCylEx);
AvgArmRe = sum(ArmCylRe)/length(ArmCylRe);
AvgBucEx = sum(BucCylEx)/length(BucCylEx);
AvgBucRe = sum(BucCylRe)/length(BucCylRe);


Avg_Pressure_Extending = ["AvgrotEx"; AvgBoomEx; AvgArmEx; AvgBucEx];
Avg_Pressure_Retracting = ["AvgrotRe"; AvgBoomRe; AvgArmRe; AvgBucRe];
AveragePressure = table(Cylinder, Avg_Pressure_Extending,Avg_Pressure_Retracting)
PressureValues = table(Cylinder, Max_Pressure_Extending, Max_Pressure_Retracting)



%% Plotting pressure



plot(Time, BoomCylEx, linewidth=1)
hold on
plot(Time, BoomCylRe, linewidth=1);
hold on
plot(Time, ArmCylEx, linewidth=1)
hold on
plot(Time, ArmCylRe, linewidth=1);
hold on
plot(Time, BucCylEx, linewidth=1)
hold on
plot(Time, BucCylRe, linewidth=1);
ylim([0 500]);
grid on
legend("Boom Extending", "Boom Retracting","Arm Extending", "Arm Retracting", "Bucket Extending", "Bucket Retracting", fontsize = 10)