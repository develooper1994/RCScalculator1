function [XX,YY,h,M,N,Theta,Phi] = ISARXY(rkafile)
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here
%
%   rkafile: 'rka.out' filename; rkafile=load('kepce.rka.out2');

%% ISAR(x,y)
% rkafile=load('kepce.rka.out2');
c=.3; % speed of light

%     aa = diff(rkafile(:,1));
%     b = find(aa);
%     N = b(1);           % # of phi frequencies
%     L = length(rkafile);
%     M = L/N;            % # of frequencies
%     Freq = rkafile(1:N:L,1);  % organize Freq
%     Phi = rkafile(1:N,3);     % organize Phi
FreqVec=rkafile(:,1); Freq = unique(FreqVec); M = length(Freq);
ThetaVec=rkafile(:,2); Theta =unique(ThetaVec); %P = length(Theta);
PhiVec=rkafile(:,3); Phi = unique(PhiVec);  N = length(Phi);

% organize axes
df = Freq(2)-Freq(1);
BWf = M*df;
dx = c/2/BWf;
%X = -M/2*dx:dx:dx*(M/2-1);
XX = -M/2*dx:dx/4:dx/4*(2*M-1);

dphi = pi*(Phi(2)-Phi(1))/180; % in radians
BWphi = N*dphi;
fc = Freq(M/2+1); % center freq
dy = c/2/BWphi/fc;
%Y = -N/2*dy:dy:dy*(N/2-1);
YY = -N/2*dy:dy/4:dy/4*(2*N-1);

%   h=hanning(M)*hanning(N).'; % eski
h=hann(M)*hann(N).';
end

