%----------------------------------------------------------------
% This code for producing ISAR in predics
%----------------------------------------------------------------
clear ; close all; clc
%% ISAR(x,y)
% a=load('kepce.rka.out2');
% fname='kepce.obj';
% [XX,YY,Th1,Ph1,ISAR_VVdB,ISAR_VHdB,ISAR_HVdB,ISAR_HHdB] = IsarMain(a);
Isar;
%% Parse the object
obj = ParseObj(fname); % sadece altýna nesnenin resmini yerleþtiriyor.
% obj = ParseObjCodeGen(fname); % sadece altýna nesnenin resmini yerleþtiriyor.
%% figure Bu kýsým hesaplamasý çok uzun sürüyor.
% figure1
rd = 40;
figure1(obj,XX,YY,rd,Th1,Ph1,ISAR_VVdB,ISAR_VHdB);

% figure2
figure2(obj,XX,YY,rd,Th1,Ph1,ISAR_HVdB,ISAR_HHdB);
