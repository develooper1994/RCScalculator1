function [ISAR_VVdB] = ISARVV(a,h,M,N)
%UNTÝTLED3 Summary of this function goes here
%   Detailed explanation goes here


Es_VV = a(:,4)+1i*a(:,5);
% E_VV = vec2mat(Es_VV,N);
E_VV = reshape(Es_VV,[],N).';
E_VV = E_VV.*h;

temp = [E_VV, zeros(M,3*N); zeros(3*M,4*N)];
% temp=zeros(4*M,4*N);
% temp(1:M,1:N) = E_VV;
% % E_VV(4*M,4*N)=0;
% % ISAR_VV = 16*abs(fftshift(ifft2(E_VV.')));

ISAR_VV = 16*abs(fftshift(ifft2(temp.')));
ISAR_VVdB = 20*log10(ISAR_VV);


end
