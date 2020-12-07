/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_XYpointscale_api.c
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 06-Dec-2020 18:04:47
 */

/* Include Files */
#include "_coder_XYpointscale_api.h"
#include "_coder_XYpointscale_mex.h"

/* Variable Definitions */
emlrtCTX emlrtRootTLSGlobal = NULL;
emlrtContext emlrtContextGlobal = { true,/* bFirstTime */
  false,                               /* bInitialized */
  131483U,                             /* fVersionInfo */
  NULL,                                /* fErrorFunction */
  "XYpointscale",                      /* fFunctionName */
  NULL,                                /* fRTCallStack */
  false,                               /* bDebugMode */
  { 2045744189U, 2170104910U, 2743257031U, 4284093946U },/* fSigWrd */
  NULL                                 /* fSigMem */
};

/* Function Declarations */
static void b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, emxArray_real_T *y);
static void c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, emxArray_real_T *ret);
static void emlrt_marshallIn(const emlrtStack *sp, const mxArray *X, const
  char_T *identifier, emxArray_real_T *y);
static const mxArray *emlrt_marshallOut(const emxArray_real_T *u);
static void emxEnsureCapacity_real_T(emxArray_real_T *emxArray, int32_T oldNumel);
static void emxFree_real_T(emxArray_real_T **pEmxArray);
static void emxInit_real_T(const emlrtStack *sp, emxArray_real_T **pEmxArray,
  int32_T numDimensions, boolean_T doPush);

/* Function Definitions */

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *u
 *                const emlrtMsgIdentifier *parentId
 *                emxArray_real_T *y
 * Return Type  : void
 */
static void b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, emxArray_real_T *y)
{
  c_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *src
 *                const emlrtMsgIdentifier *msgId
 *                emxArray_real_T *ret
 * Return Type  : void
 */
static void c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, emxArray_real_T *ret)
{
  static const int32_T dims[1] = { -1 };

  const boolean_T bv[1] = { true };

  int32_T iv[1];
  int32_T i;
  emlrtCheckVsBuiltInR2012b(sp, msgId, src, "double", false, 1U, dims, &bv[0],
    iv);
  ret->allocatedSize = iv[0];
  i = ret->size[0];
  ret->size[0] = iv[0];
  emxEnsureCapacity_real_T(ret, i);
  ret->data = (real_T *)emlrtMxGetData(src);
  ret->canFreeData = false;
  emlrtDestroyArray(&src);
}

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *X
 *                const char_T *identifier
 *                emxArray_real_T *y
 * Return Type  : void
 */
static void emlrt_marshallIn(const emlrtStack *sp, const mxArray *X, const
  char_T *identifier, emxArray_real_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  b_emlrt_marshallIn(sp, emlrtAlias(X), &thisId, y);
  emlrtDestroyArray(&X);
}

/*
 * Arguments    : const emxArray_real_T *u
 * Return Type  : const mxArray *
 */
static const mxArray *emlrt_marshallOut(const emxArray_real_T *u)
{
  const mxArray *y;
  const mxArray *m;
  static const int32_T iv[1] = { 0 };

  y = NULL;
  m = emlrtCreateNumericArray(1, iv, mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, &u->data[0]);
  emlrtSetDimensions((mxArray *)m, u->size, 1);
  emlrtAssign(&y, m);
  return y;
}

/*
 * Arguments    : emxArray_real_T *emxArray
 *                int32_T oldNumel
 * Return Type  : void
 */
static void emxEnsureCapacity_real_T(emxArray_real_T *emxArray, int32_T oldNumel)
{
  int32_T newNumel;
  int32_T i;
  void *newData;
  if (oldNumel < 0) {
    oldNumel = 0;
  }

  newNumel = 1;
  for (i = 0; i < emxArray->numDimensions; i++) {
    newNumel *= emxArray->size[i];
  }

  if (newNumel > emxArray->allocatedSize) {
    i = emxArray->allocatedSize;
    if (i < 16) {
      i = 16;
    }

    while (i < newNumel) {
      if (i > 1073741823) {
        i = MAX_int32_T;
      } else {
        i *= 2;
      }
    }

    newData = emlrtCallocMex((uint32_T)i, sizeof(real_T));
    if (emxArray->data != NULL) {
      memcpy(newData, emxArray->data, sizeof(real_T) * oldNumel);
      if (emxArray->canFreeData) {
        emlrtFreeMex(emxArray->data);
      }
    }

    emxArray->data = (real_T *)newData;
    emxArray->allocatedSize = i;
    emxArray->canFreeData = true;
  }
}

/*
 * Arguments    : emxArray_real_T **pEmxArray
 * Return Type  : void
 */
static void emxFree_real_T(emxArray_real_T **pEmxArray)
{
  if (*pEmxArray != (emxArray_real_T *)NULL) {
    if (((*pEmxArray)->data != (real_T *)NULL) && (*pEmxArray)->canFreeData) {
      emlrtFreeMex((*pEmxArray)->data);
    }

    emlrtFreeMex((*pEmxArray)->size);
    emlrtFreeMex(*pEmxArray);
    *pEmxArray = (emxArray_real_T *)NULL;
  }
}

/*
 * Arguments    : const emlrtStack *sp
 *                emxArray_real_T **pEmxArray
 *                int32_T numDimensions
 *                boolean_T doPush
 * Return Type  : void
 */
static void emxInit_real_T(const emlrtStack *sp, emxArray_real_T **pEmxArray,
  int32_T numDimensions, boolean_T doPush)
{
  emxArray_real_T *emxArray;
  int32_T i;
  *pEmxArray = (emxArray_real_T *)emlrtMallocMex(sizeof(emxArray_real_T));
  if (doPush) {
    emlrtPushHeapReferenceStackR2012b(sp, (void *)pEmxArray, (void (*)(void *))
      emxFree_real_T);
  }

  emxArray = *pEmxArray;
  emxArray->data = (real_T *)NULL;
  emxArray->numDimensions = numDimensions;
  emxArray->size = (int32_T *)emlrtMallocMex(sizeof(int32_T) * numDimensions);
  emxArray->allocatedSize = 0;
  emxArray->canFreeData = true;
  for (i = 0; i < numDimensions; i++) {
    emxArray->size[i] = 0;
  }
}

/*
 * Arguments    : const mxArray * const prhs[2]
 *                int32_T nlhs
 *                const mxArray *plhs[2]
 * Return Type  : void
 */
void XYpointscale_api(const mxArray * const prhs[2], int32_T nlhs, const mxArray
                      *plhs[2])
{
  emxArray_real_T *X;
  emxArray_real_T *Y;
  emxArray_real_T *Xscale;
  emxArray_real_T *Yscale;
  const mxArray *prhs_copy_idx_0;
  const mxArray *prhs_copy_idx_1;
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;
  emlrtHeapReferenceStackEnterFcnR2012b(&st);
  emxInit_real_T(&st, &X, 1, true);
  emxInit_real_T(&st, &Y, 1, true);
  emxInit_real_T(&st, &Xscale, 1, true);
  emxInit_real_T(&st, &Yscale, 1, true);
  prhs_copy_idx_0 = emlrtProtectR2012b(prhs[0], 0, false, -1);
  prhs_copy_idx_1 = emlrtProtectR2012b(prhs[1], 1, false, -1);

  /* Marshall function inputs */
  X->canFreeData = false;
  emlrt_marshallIn(&st, emlrtAlias(prhs_copy_idx_0), "X", X);
  Y->canFreeData = false;
  emlrt_marshallIn(&st, emlrtAlias(prhs_copy_idx_1), "Y", Y);

  /* Invoke the target function */
  XYpointscale(X, Y, Xscale, Yscale);

  /* Marshall function outputs */
  Xscale->canFreeData = false;
  plhs[0] = emlrt_marshallOut(Xscale);
  emxFree_real_T(&Xscale);
  emxFree_real_T(&Y);
  emxFree_real_T(&X);
  if (nlhs > 1) {
    Yscale->canFreeData = false;
    plhs[1] = emlrt_marshallOut(Yscale);
  }

  emxFree_real_T(&Yscale);
  emlrtHeapReferenceStackLeaveFcnR2012b(&st);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void XYpointscale_atexit(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtEnterRtStackR2012b(&st);
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  XYpointscale_xil_terminate();
  XYpointscale_xil_shutdown();
  emlrtExitTimeCleanup(&emlrtContextGlobal);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void XYpointscale_initialize(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, 0);
  emlrtEnterRtStackR2012b(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void XYpointscale_terminate(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/*
 * File trailer for _coder_XYpointscale_api.c
 *
 * [EOF]
 */
