/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: mean.c
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 06-Dec-2020 18:35:09
 */

/* Include Files */
#include "mean.h"
#include "XYpointcurveselection.h"
#include "rt_nonfinite.h"

/* Function Definitions */

/*
 * Arguments    : const emxArray_real_T *x
 * Return Type  : double
 */
double mean(const emxArray_real_T *x)
{
  double y;
  int vlen;
  int k;
  vlen = x->size[0];
  if (x->size[0] == 0) {
    y = 0.0;
  } else {
    y = x->data[0];
    for (k = 2; k <= vlen; k++) {
      y += x->data[k - 1];
    }
  }

  y /= (double)x->size[0];
  return y;
}

/*
 * File trailer for mean.c
 *
 * [EOF]
 */
