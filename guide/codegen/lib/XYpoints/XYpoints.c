/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: XYpoints.c
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 06-Dec-2020 18:12:50
 */

/* Include Files */
#include "XYpoints.h"
#include "XYpoints_emxutil.h"

/* Function Definitions */

/*
 * Arguments    : const emxArray_real_T *image
 *                double value
 *                emxArray_real_T *Xpoint
 *                emxArray_real_T *Ypoint
 * Return Type  : void
 */
void XYpoints(const emxArray_real_T *image, double value, emxArray_real_T
              *Xpoint, emxArray_real_T *Ypoint)
{
  emxArray_boolean_T *x;
  int i;
  int loop_ub;
  emxArray_int32_T *ii;
  int nx;
  int idx;
  boolean_T exitg1;
  unsigned int K;
  int Xpoint_tmp;
  emxInit_boolean_T(&x, 2);
  i = x->size[0] * x->size[1];
  x->size[0] = image->size[0];
  x->size[1] = image->size[1];
  emxEnsureCapacity_boolean_T(x, i);
  loop_ub = image->size[0] * image->size[1];
  for (i = 0; i < loop_ub; i++) {
    x->data[i] = (image->data[i] == value);
  }

  emxInit_int32_T(&ii, 1);
  nx = x->size[0] * x->size[1];
  idx = 0;
  i = ii->size[0];
  ii->size[0] = nx;
  emxEnsureCapacity_int32_T(ii, i);
  loop_ub = 0;
  exitg1 = false;
  while ((!exitg1) && (loop_ub <= nx - 1)) {
    if (x->data[loop_ub]) {
      idx++;
      ii->data[idx - 1] = loop_ub + 1;
      if (idx >= nx) {
        exitg1 = true;
      } else {
        loop_ub++;
      }
    } else {
      loop_ub++;
    }
  }

  emxFree_boolean_T(&x);
  if (nx == 1) {
    if (idx == 0) {
      ii->size[0] = 0;
    }
  } else {
    i = ii->size[0];
    if (1 > idx) {
      ii->size[0] = 0;
    } else {
      ii->size[0] = idx;
    }

    emxEnsureCapacity_int32_T(ii, i);
  }

  /*  numero de datos */
  i = Xpoint->size[0];
  Xpoint->size[0] = ii->size[0];
  emxEnsureCapacity_real_T(Xpoint, i);
  loop_ub = ii->size[0];
  for (i = 0; i < loop_ub; i++) {
    Xpoint->data[i] = 0.0;
  }

  i = Ypoint->size[0];
  Ypoint->size[0] = ii->size[0];
  emxEnsureCapacity_real_T(Ypoint, i);
  loop_ub = ii->size[0];
  emxFree_int32_T(&ii);
  for (i = 0; i < loop_ub; i++) {
    Ypoint->data[i] = 0.0;
  }

  K = 1U;

  /*   */
  i = image->size[0];
  for (loop_ub = 0; loop_ub < i; loop_ub++) {
    nx = image->size[1];
    for (idx = 0; idx < nx; idx++) {
      if (image->data[loop_ub + image->size[0] * idx] == value) {
        Xpoint_tmp = (int)K - 1;
        Xpoint->data[Xpoint_tmp] = (double)loop_ub + 1.0;
        Ypoint->data[Xpoint_tmp] = (double)idx + 1.0;
        K++;
      }
    }
  }
}

/*
 * File trailer for XYpoints.c
 *
 * [EOF]
 */
