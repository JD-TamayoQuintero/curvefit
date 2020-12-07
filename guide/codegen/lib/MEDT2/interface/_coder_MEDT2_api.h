/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_MEDT2_api.h
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 06-Dec-2020 17:47:07
 */

#ifndef _CODER_MEDT2_API_H
#define _CODER_MEDT2_API_H

/* Include Files */
#include <stddef.h>
#include <stdlib.h>
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"

/* Type Definitions */
#ifndef struct_emxArray_real_T
#define struct_emxArray_real_T

struct emxArray_real_T
{
  real_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                 /*struct_emxArray_real_T*/

#ifndef typedef_emxArray_real_T
#define typedef_emxArray_real_T

typedef struct emxArray_real_T emxArray_real_T;

#endif                                 /*typedef_emxArray_real_T*/

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void MEDT2(emxArray_real_T *image, emxArray_real_T *newimage);
extern void MEDT2_api(const mxArray * const prhs[1], int32_T nlhs, const mxArray
                      *plhs[1]);
extern void MEDT2_atexit(void);
extern void MEDT2_initialize(void);
extern void MEDT2_terminate(void);
extern void MEDT2_xil_shutdown(void);
extern void MEDT2_xil_terminate(void);

#endif

/*
 * File trailer for _coder_MEDT2_api.h
 *
 * [EOF]
 */
