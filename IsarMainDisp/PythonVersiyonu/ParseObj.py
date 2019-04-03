import trimesh
import numpy
import numpy as np

def ParseObj(filename: str):
    obj = trimesh.load_mesh(filename)
    #edges = np.array(obj.edges)
    #vertices = np.array(obj.vertices)

    #faces = np.array(obj.faces)
    #faces.
    
    return obj