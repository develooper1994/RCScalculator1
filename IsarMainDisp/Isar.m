a=load('kepce.rka.out2');
fname='kepce.obj';
[XX,YY,Th1,Ph1,ISAR_VVdB,ISAR_VHdB,ISAR_HVdB,ISAR_HHdB] = IsarMain(a);
% [XX,YY,Th1,Ph1,ISAR_VVdB,ISAR_VHdB,ISAR_HVdB,ISAR_HHdB] = IsarMain_mex(a);