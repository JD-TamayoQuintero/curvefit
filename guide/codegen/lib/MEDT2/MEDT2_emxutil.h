/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: MEDT2_emxutil.h
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 06-Dec-2020 17:47:07
 */

#ifndef MEDT2_EMXUTIL_H
#define MEDT2_EMXUTIL_H

/* Include Files */
#include <stddef.h>
#include <stdlib.h>
#include "rtwtypes.h"
#include "MEDT2_types.h"

/* Function Declarations */
extern void emxEnsureCapacity_real_T(emxArray_real_T *emxArray, int oldNumel);
extern void emxFree_real_T(emxArray_real_T **pEmxArray);
extern void emxInit_real_T(emxArray_real_T **pEmxArray, int numDimensions);

#endif

/*
 * File trailer for MEDT2_emxutil.h
 *
 * [EOF]
 */
