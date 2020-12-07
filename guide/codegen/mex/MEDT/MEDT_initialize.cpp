/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * MEDT_initialize.cpp
 *
 * Code generation for function 'MEDT_initialize'
 *
 */

/* Include files */
#include "MEDT_initialize.h"
#include "MEDT.h"
#include "MEDT_data.h"
#include "_coder_MEDT_mex.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void MEDT_initialize()
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  mex_InitInfAndNan();
  mexFunctionCreateRootTLS();
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2012b();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, 0);
  emlrtEnterRtStackR2012b(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (MEDT_initialize.cpp) */
