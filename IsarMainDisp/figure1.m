function figure1(obj,XX,YY,rd,Th1,Ph1,ISAR_VVdB,ISAR_VHdB)
%UNTÝTLED7 Summary of this function goes here
%   Detailed explanation goes here


figure('units','normalized','outerposition',[0 0 1 1])
subplot(121);
imagesc(-XX,YY,ISAR_VVdB);
% set the "VV Polarization" properties
colorbar; grid on; axis equal; axis tight
colormap(jet); caxis([max(max(ISAR_VVdB))-rd,(max(max(ISAR_VVdB)))]);
set(gca,'FontName', 'Arial', 'FontSize',12,'FontWeight', 'Bold');
xlabel('Range [m]'); ylabel('Cross - range [m]');
title('ISAR Image (VV Polarization)');
DisplayObject(obj,Th1,Ph1);

subplot(122);
imagesc(-XX,YY,ISAR_VHdB);
% set the "VH Polarization" properties
colorbar; grid on; axis equal; axis tight
colormap(jet);  caxis([max(max(ISAR_VHdB))-rd,(max(max(ISAR_VHdB)))]);
set(gca,'FontName', 'Arial', 'FontSize',12,'FontWeight', 'Bold');
xlabel('Range [m]'); ylabel('Cross - range [m]');
title('ISAR Image (VH Polarization)');

% Bir daha parse iþlemiyle uðraþmamak üzere önceden yüklenen(ParseObj)
% objeyi sadece görüntülüyor.
DisplayObject(obj,Th1,Ph1);

end

