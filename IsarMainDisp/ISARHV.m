function [ISAR_HVdB] = ISARHV(a,h,M,N)
%UNTÝTLED4 Summary of this function goes here
%   Detailed explanation goes here


Es_HV = a(:,8)+1i*a(:,9);
% E_HV = vec2mat(Es_HV,N);
E_HV = reshape(Es_HV,[],N).';
E_HV = E_HV.*h;
NewE_HV=[E_HV zeros(M,3*N); zeros(3*M,4*N)];
%E_HV(4*M,4*N)=0; %original
ISAR_HV = 16*abs(fftshift(ifft2(NewE_HV.')));
ISAR_HVdB = 20*log10(ISAR_HV);


end

