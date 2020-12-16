//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: MEDT_types.h
//
// GPU Coder version                    : 1.4
// CUDA/C/C++ source code generated on  : 06-Dec-2020 18:02:22
//
#ifndef MEDT_TYPES_H
#define MEDT_TYPES_H

// Include Files
#include "rtwtypes.h"

// Type Definitions
struct emxArray_boolean_T
{
  boolean_T *data;
  int *size;
  int allocatedSize;
  int numDimensions;
  boolean_T canFreeData;
};

struct emxArray_real_T
{
  double *data;
  int *size;
  int allocatedSize;
  int numDimensions;
  boolean_T canFreeData;
};

#endif

//
// File trailer for MEDT_types.h
//
// [EOF]
//
