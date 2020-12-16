/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_MEDT_mex.cpp
 *
 * Code generation for function '_coder_MEDT_mex'
 *
 */

/* Include files */
#include "_coder_MEDT_mex.h"
#include "MEDT.h"
#include "MEDT_data.h"
#include "MEDT_initialize.h"
#include "MEDT_terminate.h"
#include "_coder_MEDT_api.h"

/* Function Declarations */
MEXFUNCTION_LINKAGE void MEDT_mexFunction(int32_T nlhs, mxArray *plhs[1],
  int32_T nrhs, const mxArray *prhs[1]);

/* Function Definitions */
void MEDT_mexFunction(int32_T nlhs, mxArray *plhs[1], int32_T nrhs, const
                      mxArray *prhs[1])
{
  const mxArray *outputs[1];
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;

  /* Check for proper number of arguments. */
  if (nrhs != 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 1, 4, 4,
                        "MEDT");
  }

  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 4,
                        "MEDT");
  }

  /* Call the function. */
  MEDT_api(prhs, nlhs, outputs);

  /* Copy over outputs to the caller. */
  emlrtReturnArrays(1, plhs, outputs);
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  mexAtExit(MEDT_atexit);

  /* Module initialization. */
  MEDT_initialize();

  /* Dispatch the entry-point. */
  MEDT_mexFunction(nlhs, plhs, nrhs, prhs);

  /* Module termination. */
  MEDT_terminate();
}

emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_MEDT_mex.cpp) */
