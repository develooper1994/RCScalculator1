function [ISAR_VHdB] = ISARVH(a,h,M,N)
%UNTÝTLED3 Summary of this function goes here
%   Detailed explanation goes here


Es_VH = a(:,6)+1i*a(:,7);
% E_VH = vec2mat(Es_VH,N);
E_VH = reshape(Es_VH,[],N).';
E_VH = E_VH.*h;
NewE_VH=[E_VH zeros(M,3*N); zeros(3*M,4*N)];
%E_VH(4*M,4*N)=0; %original
ISAR_VH= 16*abs(fftshift(ifft2(NewE_VH.')));
ISAR_VHdB = 20*log10(ISAR_VH);


end

