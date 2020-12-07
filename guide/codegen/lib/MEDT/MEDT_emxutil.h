//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: MEDT_emxutil.h
//
// GPU Coder version                    : 1.4
// CUDA/C/C++ source code generated on  : 06-Dec-2020 18:02:22
//
#ifndef MEDT_EMXUTIL_H
#define MEDT_EMXUTIL_H

// Include Files
#include <cstddef>
#include <cstdlib>
#include "rtwtypes.h"
#include "MEDT_types.h"

// Function Declarations
extern void emxEnsureCapacity_real_T(emxArray_real_T *emxArray, int oldNumel);
extern void emxFree_boolean_T(emxArray_boolean_T **pEmxArray);
extern void emxFree_real_T(emxArray_real_T **pEmxArray);
extern void emxInit_boolean_T(emxArray_boolean_T **pEmxArray, int numDimensions);
extern void emxInit_real_T(emxArray_real_T **pEmxArray, int numDimensions);

#endif

//
// File trailer for MEDT_emxutil.h
//
// [EOF]
//
