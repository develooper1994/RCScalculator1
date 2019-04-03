function [ISAR_HHdB] = ISARHH(a,h,M,N)
%UNTÝTLED5 Summary of this function goes here
%   Detailed explanation goes here


Es_HH = a(:,10)+1i*a(:,11);
% E_HH = vec2mat(Es_HH,N);
E_HH = reshape(Es_HH,[],N).';
E_HH = E_HH.*h;
NewE_HH=[E_HH zeros(M,3*N); zeros(3*M,4*N)];
%E_HH(4*M,4*N)=0; %original
ISAR_HH = 16*abs(fftshift(ifft2(NewE_HH.')));
ISAR_HHdB = 20*log10(ISAR_HH);


end

