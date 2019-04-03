import numpy as np
import matplotlib
import matplotlib.pyplot as plt

def figure(obj,XX,YY,rd,Th1,Ph1,ISAR_VVdB,ISAR_VHdB,ISAR_HVdB, ISAR_HHdB):
# ISAR_VVdB, ISAR_VHdB
    # --- ISAR_VVdB ---
    z_min, z_max = -np.abs(ISAR_VVdB).max(), np.abs(ISAR_VVdB).max()
    plt.subplot(2, 2, 1)
    plt.imshow(ISAR_VVdB, cmap='RdBu', vmin=z_min, vmax=z_max,
           extent=[XX.min(), XX.max(), YY.min(), YY.max()],
           interpolation='nearest', origin='lower')
    plt.title('ISAR_VVdB')
    plt.colorbar()
#DisplayObject(obj,Th1,Ph1);

    # --- ISAR_VHdB ---
    z_min, z_max = -np.abs(ISAR_VHdB).max(), np.abs(ISAR_VHdB).max()
    plt.subplot(2, 2, 2)
    plt.imshow(ISAR_VHdB, cmap='RdBu', vmin=z_min, vmax=z_max,
               extent=[XX.min(), XX.max(), YY.min(), YY.max()],
               interpolation='nearest', origin='lower')
    plt.title('ISAR_VHdB')
    plt.colorbar()
#DisplayObject(obj,Th1,Ph1);


    # ISAR_HVdB, ISAR_HHdB
    # --- ISAR_HVdB ---
    z_min, z_max = -np.abs(ISAR_HVdB).max(), np.abs(ISAR_HVdB).max()
    plt.subplot(2, 2, 3)
    plt.imshow(ISAR_HVdB, cmap='RdBu', vmin=z_min, vmax=z_max,
               extent=[XX.min(), XX.max(), YY.min(), YY.max()],
               interpolation='nearest', origin='lower')
    plt.title('ISAR_HVdB')
    plt.colorbar()
#DisplayObject(obj,Th1,Ph1);

    # --- ISAR_HHdB ---
    z_min, z_max = -np.abs(ISAR_HHdB).max(), np.abs(ISAR_HHdB).max()
    plt.subplot(2, 2, 4)
    plt.imshow(ISAR_HHdB, cmap='RdBu', vmin=z_min, vmax=z_max,
               extent=[XX.min(), XX.max(), YY.min(), YY.max()],
               interpolation='nearest', origin='lower')
    plt.title('ISAR_HHdB')
    plt.colorbar()
#DisplayObject(obj,Th1,Ph1);

    # show all of them
    plt.subplots_adjust(wspace=0.5, hspace=0.5)
    plt.show()