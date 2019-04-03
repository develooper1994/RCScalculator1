function figure2(obj,XX,YY,rd,Th1,Ph1,ISAR_HVdB,ISAR_HHdB)
%UNTÝTLED8 Summary of this function goes here
%   Detailed explanation goes here


figure('units','normalized','outerposition',[0 0 1 1])
subplot(121);
imagesc(-XX,YY,ISAR_HVdB);
% set the "HV Polarization" properties
colorbar ;grid on; axis equal; axis tight
colormap(jet); caxis([max(max(ISAR_HVdB))-rd,(max(max(ISAR_HVdB)))]);
set(gca,'FontName', 'Arial', 'FontSize',12,'FontWeight', 'Bold');
xlabel('Range [m]'); ylabel('Cross - range [m]'); 
title('ISAR Image (HV Polarization)');
DisplayObject(obj,Th1,Ph1);

subplot(122);
imagesc(-XX,YY,ISAR_HHdB);
% set the "HH Polarization" properties
colorbar ;grid on; axis equal; axis tight
colormap(jet); caxis([max(max(ISAR_HHdB))-rd,(max(max(ISAR_HHdB)))]);
set(gca,'FontName', 'Arial', 'FontSize',12,'FontWeight', 'Bold');
xlabel('Range [m]'); ylabel('Cross - range [m]'); 
title('ISAR Image (HH Polarization)');
DisplayObject(obj,Th1,Ph1);

end

