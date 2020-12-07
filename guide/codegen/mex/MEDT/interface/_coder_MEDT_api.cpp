/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_MEDT_api.cpp
 *
 * Code generation for function '_coder_MEDT_api'
 *
 */

/* Include files */
#include "_coder_MEDT_api.h"
#include "MEDT.h"
#include "MEDT_data.h"
#include "MEDT_emxutil.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static emlrtRTEInfo f_emlrtRTEI = { 1, /* lineNo */
  1,                                   /* colNo */
  "_coder_MEDT_api",                   /* fName */
  ""                                   /* pName */
};

/* Function Declarations */
static void b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, emxArray_boolean_T *y);
static void c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, emxArray_boolean_T *ret);
static void emlrt_marshallIn(const emlrtStack *sp, const mxArray *image, const
  char_T *identifier, emxArray_boolean_T *y);
static const mxArray *emlrt_marshallOut(const emxArray_real_T *u);

/* Function Definitions */
static void b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, emxArray_boolean_T *y)
{
  c_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, emxArray_boolean_T *ret)
{
  static const int32_T dims[2] = { -1, -1 };

  const boolean_T bv[2] = { true, true };

  int32_T iv[2];
  int32_T i;
  emlrtCheckVsBuiltInR2012b(sp, msgId, src, "logical", false, 2U, dims, &bv[0],
    iv);
  ret->allocatedSize = iv[0] * iv[1];
  i = ret->size[0] * ret->size[1];
  ret->size[0] = iv[0];
  ret->size[1] = iv[1];
  emxEnsureCapacity_boolean_T(sp, ret, i, (emlrtRTEInfo *)NULL);
  ret->data = (boolean_T *)emlrtMxGetData(src);
  ret->canFreeData = false;
  emlrtDestroyArray(&src);
}

static void emlrt_marshallIn(const emlrtStack *sp, const mxArray *image, const
  char_T *identifier, emxArray_boolean_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = const_cast<const char *>(identifier);
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  b_emlrt_marshallIn(sp, emlrtAlias(image), &thisId, y);
  emlrtDestroyArray(&image);
}

static const mxArray *emlrt_marshallOut(const emxArray_real_T *u)
{
  const mxArray *y;
  const mxArray *m;
  static const int32_T iv[2] = { 0, 0 };

  y = NULL;
  m = emlrtCreateNumericArray(2, iv, mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, &u->data[0]);
  emlrtSetDimensions((mxArray *)m, u->size, 2);
  emlrtAssign(&y, m);
  return y;
}

void MEDT_api(const mxArray * const prhs[1], int32_T, const mxArray *plhs[1])
{
  emxArray_boolean_T *image;
  emxArray_real_T *newimage;
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;
  emlrtHeapReferenceStackEnterFcnR2012b(&st);
  emxInit_boolean_T(&st, &image, 2, &f_emlrtRTEI, true);
  emxInit_real_T(&st, &newimage, 2, &f_emlrtRTEI, true);

  /* Marshall function inputs */
  image->canFreeData = false;
  emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "image", image);

  /* Invoke the target function */
  MEDT(&st, image, newimage);

  /* Marshall function outputs */
  newimage->canFreeData = false;
  plhs[0] = emlrt_marshallOut(newimage);
  emxFree_real_T(&newimage);
  emxFree_boolean_T(&image);
  emlrtHeapReferenceStackLeaveFcnR2012b(&st);
}

/* End of code generation (_coder_MEDT_api.cpp) */
