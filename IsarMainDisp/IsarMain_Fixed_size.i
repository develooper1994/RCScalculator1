%module IsarMain_Fixed_size
%include "carrays.i"
%array_class(double, doubleArray);
%array_class(int, intArray);

/* Generate includes for required headers */
%{
#include "codegen/dll/IsarMain/IsarMain_types.h"
#include "codegen/dll/IsarMain/IsarMain.h"
#include "codegen/dll/IsarMain/IsarMain_initialize.h"
#include "codegen/dll/IsarMain/IsarMain_terminate.h"
%}

/* Parse necessary headers */
%include codegen/dll/IsarMain/IsarMain_types.h
%include codegen/dll/IsarMain/IsarMain.h
%include codegen/dll/IsarMain/IsarMain_initialize.h
%include codegen/dll/IsarMain/IsarMain_terminate.h
