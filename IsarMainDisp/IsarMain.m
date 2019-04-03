function [XX,YY,Th1,Ph1,ISAR_VVdB,ISAR_VHdB,ISAR_HVdB,ISAR_HHdB] = IsarMain(rkafile)
%UNTÝTLED6 Summary of this function goes here
%   Detailed explanation goes here
%
%   rkafile: 'rka.out' filename; rkafile=load('kepce.rka.out2');

[XX,YY,h,M,N,Theta,Phi]=ISARXY(rkafile);

% -------------- ISARVV -----------------
[ISAR_VVdB] = ISARVV(rkafile,h,M,N);

% -------------- ISARVH -----------------
[ISAR_VHdB] = ISARVH(rkafile,h,M,N);

% -------------- ISARHV -----------------
[ISAR_HVdB] = ISARHV(rkafile,h,M,N);

% -------------- ISARHH -----------------
[ISAR_HHdB] = ISARHH(rkafile,h,M,N);

Th1 = mean(Theta);
Ph1 = mean(Phi);


end

