from IsarMain import IsarMain
from ParseObj import ParseObj
import figure
# from figure import figure1,figure2

# load rka file
import scipy.io as sio  # MATLAB 5.0 MAT-file

rkafile = sio.loadmat("rkafile.mat")
rkaArr = rkafile['a']

# rkafile = 0 # this is a 10000x11 array
# IsarMain
XX, YY, Th1, Ph1, ISAR_VVdB, ISAR_VHdB, ISAR_HVdB, ISAR_HHdB = IsarMain(rkaArr)

# wavefront object read
obj = ParseObj("../kepce.obj")

# plot 1)graph and 2)object from top(do later)
rd: int = 40
figure.figure(obj, XX, YY, rd, Th1, Ph1,
              ISAR_VVdB, ISAR_VHdB,ISAR_HVdB, ISAR_HHdB)

