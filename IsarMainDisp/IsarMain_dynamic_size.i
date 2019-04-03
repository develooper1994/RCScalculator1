%module IsarMain_dynamic_size
%include "carrays.i"
%array_class(double, doubleArray);
%array_class(int, intArray);

/* Generate includes for required headers */
// C:/Users/selcu/Desktop/tez2/codegen/dll/IsarMain/
%{
#include "codegen/dll/IsarMain/IsarMain_types.h"
#include "codegen/dll/IsarMain/IsarMain.h"
#include "codegen/dll/IsarMain/IsarMain_emxAPI.h"
#include "codegen/dll/IsarMain/IsarMain_initialize.h"
#include "codegen/dll/IsarMain/IsarMain_terminate.h"
// #include "codegen/dll/IsarMain/examples/main.h"
%}

/* Tell SWIG about allocators */
%newobject emxCreate_real_T;
%newobject emxCreateWrapper_real_T;
%newobject emxCreateND_real_T;
%newobject emxCreateWrapperND_real_T;

/* Parse necessary headers */
%include codegen/dll/IsarMain/IsarMain_types.h
%include codegen/dll/IsarMain/IsarMain.h
%include codegen/dll/IsarMain/IsarMain_emxAPI.h
%include codegen/dll/IsarMain/IsarMain_initialize.h
%include codegen/dll/IsarMain/IsarMain_terminate.h
// %include codegen/dll/IsarMain/examples/main.h

/* Destructor for emxArray_real_T  */
%extend emxArray_real_T {
    ~emxArray_real_T() {
        emxDestroyArray_real_T($self);
    }
}
