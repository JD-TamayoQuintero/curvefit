/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_XYpoints_api.h
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 04-Dec-2020 12:28:38
 */

#ifndef _CODER_XYPOINTS_API_H
#define _CODER_XYPOINTS_API_H

/* Include Files */
#include <stddef.h>
#include <stdlib.h>
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void XYpoints(real_T image, real_T value, real_T Xpoint_data[], int32_T
                     Xpoint_size[1], real_T Ypoint_data[], int32_T Ypoint_size[1]);
extern void XYpoints_api(const mxArray * const prhs[2], int32_T nlhs, const
  mxArray *plhs[2]);
extern void XYpoints_atexit(void);
extern void XYpoints_initialize(void);
extern void XYpoints_terminate(void);
extern void XYpoints_xil_shutdown(void);
extern void XYpoints_xil_terminate(void);

#endif

/*
 * File trailer for _coder_XYpoints_api.h
 *
 * [EOF]
 */
