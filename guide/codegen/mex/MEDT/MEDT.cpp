/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * MEDT.cpp
 *
 * Code generation for function 'MEDT'
 *
 */

/* Include files */
#include "MEDT.h"
#include "MEDT_data.h"
#include "MEDT_emxutil.h"
#include "eml_int_forloop_overflow_check.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = { 11,    /* lineNo */
  "MEDT",                              /* fcnName */
  "D:\\Documentos\\Desktop\\curvefit\\branches\\V.0.02\\guide\\MEDT.m"/* pathName */
};

static emlrtRSInfo b_emlrtRSI = { 14,  /* lineNo */
  "max",                               /* fcnName */
  "C:\\Program Files\\MATLAB\\R2019b\\toolbox\\eml\\lib\\matlab\\datafun\\max.m"/* pathName */
};

static emlrtRSInfo c_emlrtRSI = { 20,  /* lineNo */
  "minOrMax",                          /* fcnName */
  "C:\\Program Files\\MATLAB\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\minOrMax.m"/* pathName */
};

static emlrtRSInfo d_emlrtRSI = { 45,  /* lineNo */
  "unaryOrBinaryDispatch",             /* fcnName */
  "C:\\Program Files\\MATLAB\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\minOrMax.m"/* pathName */
};

static emlrtRSInfo e_emlrtRSI = { 167, /* lineNo */
  "unaryMinOrMax",                     /* fcnName */
  "C:\\Program Files\\MATLAB\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\unaryMinOrMax.m"/* pathName */
};

static emlrtRSInfo f_emlrtRSI = { 320, /* lineNo */
  "unaryMinOrMaxDispatch",             /* fcnName */
  "C:\\Program Files\\MATLAB\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\unaryMinOrMax.m"/* pathName */
};

static emlrtRSInfo g_emlrtRSI = { 361, /* lineNo */
  "minOrMax1D",                        /* fcnName */
  "C:\\Program Files\\MATLAB\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\unaryMinOrMax.m"/* pathName */
};

static emlrtRSInfo h_emlrtRSI = { 21,  /* lineNo */
  "eml_int_forloop_overflow_check",    /* fcnName */
  "C:\\Program Files\\MATLAB\\R2019b\\toolbox\\eml\\lib\\matlab\\eml\\eml_int_forloop_overflow_check.m"/* pathName */
};

static emlrtBCInfo emlrtBCI = { -1,    /* iFirst */
  -1,                                  /* iLast */
  11,                                  /* lineNo */
  39,                                  /* colNo */
  "image",                             /* aName */
  "MEDT",                              /* fName */
  "D:\\Documentos\\Desktop\\curvefit\\branches\\V.0.02\\guide\\MEDT.m",/* pName */
  0                                    /* checkKind */
};

static emlrtRTEInfo emlrtRTEI = { 26,  /* lineNo */
  27,                                  /* colNo */
  "unaryMinOrMax",                     /* fName */
  "C:\\Program Files\\MATLAB\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\unaryMinOrMax.m"/* pName */
};

static emlrtRTEInfo b_emlrtRTEI = { 95,/* lineNo */
  27,                                  /* colNo */
  "unaryMinOrMax",                     /* fName */
  "C:\\Program Files\\MATLAB\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\unaryMinOrMax.m"/* pName */
};

static emlrtBCInfo b_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  11,                                  /* lineNo */
  16,                                  /* colNo */
  "image",                             /* aName */
  "MEDT",                              /* fName */
  "D:\\Documentos\\Desktop\\curvefit\\branches\\V.0.02\\guide\\MEDT.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo c_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  14,                                  /* lineNo */
  17,                                  /* colNo */
  "newimage",                          /* aName */
  "MEDT",                              /* fName */
  "D:\\Documentos\\Desktop\\curvefit\\branches\\V.0.02\\guide\\MEDT.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo d_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  12,                                  /* lineNo */
  17,                                  /* colNo */
  "newimage",                          /* aName */
  "MEDT",                              /* fName */
  "D:\\Documentos\\Desktop\\curvefit\\branches\\V.0.02\\guide\\MEDT.m",/* pName */
  0                                    /* checkKind */
};

static emlrtRTEInfo d_emlrtRTEI = { 5, /* lineNo */
  12,                                  /* colNo */
  "MEDT",                              /* fName */
  "D:\\Documentos\\Desktop\\curvefit\\branches\\V.0.02\\guide\\MEDT.m"/* pName */
};

static emlrtRTEInfo e_emlrtRTEI = { 11,/* lineNo */
  33,                                  /* colNo */
  "MEDT",                              /* fName */
  "D:\\Documentos\\Desktop\\curvefit\\branches\\V.0.02\\guide\\MEDT.m"/* pName */
};

/* Function Definitions */
void MEDT(const emlrtStack *sp, const emxArray_boolean_T *image, emxArray_real_T
          *newimage)
{
  int32_T i;
  int32_T i1;
  emxArray_boolean_T *varargin_1;
  int32_T b_i;
  int32_T i2;
  int32_T loop_ub;
  int32_T j;
  boolean_T b;
  int32_T k;
  int32_T i3;
  int32_T istop;
  boolean_T overflow;
  boolean_T maxval;
  boolean_T b1;
  int32_T i4;
  emlrtStack st;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack g_st;
  emlrtStack h_st;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  e_st.prev = &d_st;
  e_st.tls = d_st.tls;
  f_st.prev = &e_st;
  f_st.tls = e_st.tls;
  g_st.prev = &f_st;
  g_st.tls = f_st.tls;
  h_st.prev = &g_st;
  h_st.tls = g_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b(sp);
  i = newimage->size[0] * newimage->size[1];
  newimage->size[0] = image->size[0];
  newimage->size[1] = image->size[1];
  emxEnsureCapacity_real_T(sp, newimage, i, &d_emlrtRTEI);

  /*  numero de datos */
  i = image->size[0];
  if (0 <= image->size[0] - 1) {
    i1 = image->size[1];
    if (0 <= image->size[1] - 1) {
      i2 = image->size[1];
      loop_ub = image->size[1];
      b = true;
      i3 = image->size[1];
      istop = image->size[1];
      overflow = ((2 <= image->size[1]) && (image->size[1] > 2147483646));
    }
  }

  emxInit_boolean_T(sp, &varargin_1, 2, &e_emlrtRTEI, true);
  for (b_i = 0; b_i < i; b_i++) {
    for (j = 0; j < i1; j++) {
      st.site = &emlrtRSI;
      k = b_i + 1;
      if ((k < 1) || (k > image->size[0])) {
        emlrtDynamicBoundsCheckR2012b(k, 1, image->size[0], &emlrtBCI, &st);
      }

      k = varargin_1->size[0] * varargin_1->size[1];
      varargin_1->size[0] = 1;
      varargin_1->size[1] = i2;
      emxEnsureCapacity_boolean_T(&st, varargin_1, k, &e_emlrtRTEI);
      for (k = 0; k < loop_ub; k++) {
        varargin_1->data[k] = image->data[b_i + image->size[0] * k];
      }

      b_st.site = &b_emlrtRSI;
      c_st.site = &c_emlrtRSI;
      d_st.site = &d_emlrtRSI;
      if (!b) {
        emlrtErrorWithMessageIdR2018a(&d_st, &emlrtRTEI,
          "Coder:toolbox:autoDimIncompatibility",
          "Coder:toolbox:autoDimIncompatibility", 0);
      }

      if (i3 < 1) {
        emlrtErrorWithMessageIdR2018a(&d_st, &b_emlrtRTEI,
          "Coder:toolbox:eml_min_or_max_varDimZero",
          "Coder:toolbox:eml_min_or_max_varDimZero", 0);
      }

      e_st.site = &e_emlrtRSI;
      f_st.site = &f_emlrtRSI;
      maxval = image->data[b_i];
      g_st.site = &g_emlrtRSI;
      if (overflow) {
        h_st.site = &h_emlrtRSI;
        check_forloop_overflow_error(&h_st);
      }

      for (k = 2; k <= istop; k++) {
        b1 = varargin_1->data[k - 1];
        maxval = ((static_cast<int32_T>(maxval) < static_cast<int32_T>(b1)) ||
                  maxval);
      }

      k = b_i + 1;
      if ((k < 1) || (k > image->size[0])) {
        emlrtDynamicBoundsCheckR2012b(k, 1, image->size[0], &b_emlrtBCI, sp);
      }

      i4 = j + 1;
      if ((i4 < 1) || (i4 > image->size[1])) {
        emlrtDynamicBoundsCheckR2012b(i4, 1, image->size[1], &b_emlrtBCI, sp);
      }

      if (image->data[(k + image->size[0] * (i4 - 1)) - 1] == maxval) {
        k = b_i + 1;
        if ((k < 1) || (k > newimage->size[0])) {
          emlrtDynamicBoundsCheckR2012b(k, 1, newimage->size[0], &d_emlrtBCI, sp);
        }

        i4 = j + 1;
        if ((i4 < 1) || (i4 > newimage->size[1])) {
          emlrtDynamicBoundsCheckR2012b(i4, 1, newimage->size[1], &d_emlrtBCI,
            sp);
        }

        newimage->data[(k + newimage->size[0] * (i4 - 1)) - 1] = 255.0;
      } else {
        k = b_i + 1;
        if ((k < 1) || (k > newimage->size[0])) {
          emlrtDynamicBoundsCheckR2012b(k, 1, newimage->size[0], &c_emlrtBCI, sp);
        }

        i4 = j + 1;
        if ((i4 < 1) || (i4 > newimage->size[1])) {
          emlrtDynamicBoundsCheckR2012b(i4, 1, newimage->size[1], &c_emlrtBCI,
            sp);
        }

        newimage->data[(k + newimage->size[0] * (i4 - 1)) - 1] = 0.0;
      }

      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b(sp);
      }
    }

    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  emxFree_boolean_T(&varargin_1);
  emlrtHeapReferenceStackLeaveFcnR2012b(sp);
}

/* End of code generation (MEDT.cpp) */
