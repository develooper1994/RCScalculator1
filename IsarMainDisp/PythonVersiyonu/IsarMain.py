# Module prototype
import numpy as np
from numpy import mean, reshape, hanning
from numpy.core.multiarray import ndarray


def ISARXY(rkafile):
    rkafile = np.array(rkafile)
    c = .3 # speed of light

    # may not behave like matlab
    Freq = np.unique(rkafile[:,0]); M = Freq.size
    Theta = np.unique(rkafile[:,1]); P = Theta.size
    Phi = np.unique(rkafile[:,2]);  N = Phi.size

    # organize axes
    df = Freq[1]-Freq[0]
    BWf = M*df
    dx = c/2/BWf
    #X = -M/2*dx:dx:dx*(M/2-1);
    XX = np.arange(start=-M/2*dx ,stop=dx/4*(2*M-1) ,step= dx/4);

    dphi: ndarray = np.pi*(Phi[1]-Phi[0])/180 # in radians
    BWphi = N*dphi
    fc = Freq[int(M/2+1)] # center freq
    dy = c/2/BWphi/fc
    #Y = -N/2*dy:dy:dy*(N/2-1);
    YY = np.arange(start=-N/2*dy ,stop=dy/4*(2*N-1) ,step= dy/4);
    filtered = np.matmul(np.hanning(M), np.hanning(N));
    filtered = filtered.T; # if filtered is a np.array
    # convert matlab operation
    # h=(hanning(M)*hanning(N)).T# h=hann(M)*hann(N).'
    return(XX,YY,filtered,M,N,Theta,Phi)

def ISARVV(a,h,M,N):
    a = np.array(a);
    h = np.array(h); # h numpy.array olabilir.

    Es_VV = a[:,3]+1j*a[:,4];
# may transpoze not work. CHECK IT!
    E_VV = reshape(Es_VV,(-1,N)).T # E_VV = reshape(Es_VV,[],N).'; # matlab version
    E_VV = E_VV*h; # for numpy this is dot-product
    E_VV = np.pad(E_VV, ((0,3*M),(0,3*N)), mode='constant', constant_values=0) # E_VV( 4*M,4*N ) = 0 # matlab version
    ISAR_VV = 16*abs(np.fft.fftshift(np.fft.ifft2(E_VV.T)))
    ISAR_VVdB = 20*np.log10(ISAR_VV)
    return ISAR_VVdB

def ISARVH(a,h,M,N):
    a = np.array(a);
    h = np.array(h); # h numpy.array olabilir.

    Es_VH = a[:,5]+1j*a[:,6];
# may transpoze not work. CHECK IT!
    E_VH = reshape(Es_VH,(-1,N)).T # E_VV = reshape(Es_VV,[],N).'; # matlab version
    E_VH = E_VH*h;
    E_VH = np.pad(E_VH, ((0,3*M),(0,3*N)), mode='constant', constant_values=0) # E_VV( 4*M,4*N ) = 0 # matlab version
    E_VH = 16*abs(np.fft.fftshift(np.fft.ifft2(E_VH.T)))
    ISARVHdb = 20*np.log10(E_VH)
    return ISARVHdb

def ISARHV(a,h,M,N):
    a = np.array(a);
    h = np.array(h); # h numpy.array olabilir.

    Es_HV = a[:,7]+1j*a[:,8];
# may transpoze not work. CHECK IT!
    E_HV = reshape(Es_HV,(-1,N)).T # E_VV = reshape(Es_VV,[],N).'; # matlab version
    E_HV = E_HV*h;
    E_HV = np.pad(E_HV, ((0,3*M),(0,3*N)), mode='constant', constant_values=0) # E_VV( 4*M,4*N ) = 0 # matlab version
    ISAR_HV = 16*abs(np.fft.fftshift(np.fft.ifft2(E_HV.T)))
    ISAR_HVdB = 20*np.log10(ISAR_HV)
    return ISAR_HVdB

def ISARHH(a,h,M,N):
    a = np.array(a);
    h = np.array(h); # h numpy.array olabilir.

    Es_HH = a[:,9]+1j*a[:,10];
# may transpoze not work. CHECK IT!
    E_HH = reshape(Es_HH,(-1,N)).T # E_VV = reshape(Es_VV,[],N).'; # matlab version
    E_HH = E_HH*h;
    E_HH = np.pad(E_HH, ((0,3*M),(0,3*N)), mode='constant', constant_values=0) # E_VV( 4*M,4*N ) = 0 # matlab version
    ISAR_HH = 16*abs(np.fft.fftshift(np.fft.ifft2(E_HH.T)))
    ISAR_HHdB = 20*np.log10(ISAR_HH)
    return ISAR_HHdB

def IsarMain(rkafile):
# input: a: rka.out2, exp:'kepce.rka.out2'
# output: XX,YY,Th1,Ph1,ISAR_VVdB,ISAR_VHdB,ISAR_HVdB,ISAR_HHdB
    XX,YY,h,M,N, Theta,Phi=ISARXY(rkafile)
# -------------- ISARVV -----------------
    ISAR_VVdB = ISARVV(rkafile,h,M,N)
# -------------- ISARVH -----------------
    ISAR_VHdB = ISARVH(rkafile,h,M,N)
# -------------- ISARHV -----------------
    ISAR_HVdB = ISARHV(rkafile,h,M,N);
# -------------- ISARHH -----------------
    ISAR_HHdB = ISARHH(rkafile,h,M,N);

    # mean may not behave like matlab
    Th1 = mean(Theta);
    Ph1 = mean(Phi);

    return XX,YY,Th1,Ph1,ISAR_VVdB,ISAR_VHdB,ISAR_HVdB,ISAR_HHdB
