/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: XYpointscale.c
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 06-Dec-2020 18:04:47
 */

/* Include Files */
#include "XYpointscale.h"
#include "XYpointscale_data.h"
#include "XYpointscale_emxutil.h"
#include "XYpointscale_initialize.h"
#include "rt_nonfinite.h"

/* Function Definitions */

/*
 * Arguments    : emxArray_real_T *X
 *                emxArray_real_T *Y
 *                emxArray_real_T *Xscale
 *                emxArray_real_T *Yscale
 * Return Type  : void
 */
void XYpointscale(emxArray_real_T *X, emxArray_real_T *Y, emxArray_real_T
                  *Xscale, emxArray_real_T *Yscale)
{
  int n;
  int idx;
  double minX;
  int k;
  boolean_T exitg1;
  int i;
  double d;
  double minY;
  if (isInitialized_XYpointscale == false) {
    XYpointscale_initialize();
  }

  n = X->size[0];
  if (X->size[0] <= 2) {
    if (X->size[0] == 1) {
      minX = X->data[0];
    } else if ((X->data[0] > X->data[1]) || (rtIsNaN(X->data[0]) && (!rtIsNaN
                 (X->data[1])))) {
      minX = X->data[1];
    } else {
      minX = X->data[0];
    }
  } else {
    if (!rtIsNaN(X->data[0])) {
      idx = 1;
    } else {
      idx = 0;
      k = 2;
      exitg1 = false;
      while ((!exitg1) && (k <= X->size[0])) {
        if (!rtIsNaN(X->data[k - 1])) {
          idx = k;
          exitg1 = true;
        } else {
          k++;
        }
      }
    }

    if (idx == 0) {
      minX = X->data[0];
    } else {
      minX = X->data[idx - 1];
      i = idx + 1;
      for (k = i; k <= n; k++) {
        d = X->data[k - 1];
        if (minX > d) {
          minX = d;
        }
      }
    }
  }

  idx = X->size[0];
  for (i = 0; i < idx; i++) {
    X->data[i] -= minX;
  }

  /* corro al origen */
  n = X->size[0];
  if (X->size[0] <= 2) {
    if (X->size[0] == 1) {
      minX = X->data[0];
    } else if ((X->data[0] < X->data[1]) || (rtIsNaN(X->data[0]) && (!rtIsNaN
                 (X->data[1])))) {
      minX = X->data[1];
    } else {
      minX = X->data[0];
    }
  } else {
    if (!rtIsNaN(X->data[0])) {
      idx = 1;
    } else {
      idx = 0;
      k = 2;
      exitg1 = false;
      while ((!exitg1) && (k <= X->size[0])) {
        if (!rtIsNaN(X->data[k - 1])) {
          idx = k;
          exitg1 = true;
        } else {
          k++;
        }
      }
    }

    if (idx == 0) {
      minX = X->data[0];
    } else {
      minX = X->data[idx - 1];
      i = idx + 1;
      for (k = i; k <= n; k++) {
        d = X->data[k - 1];
        if (minX < d) {
          minX = d;
        }
      }
    }
  }

  i = Xscale->size[0];
  Xscale->size[0] = X->size[0];
  emxEnsureCapacity_real_T(Xscale, i);
  idx = X->size[0];
  for (i = 0; i < idx; i++) {
    Xscale->data[i] = X->data[i] / minX * 600.0;
  }

  /*  normalizo a 512 */
  n = Y->size[0];
  if (Y->size[0] <= 2) {
    if (Y->size[0] == 1) {
      minY = Y->data[0];
    } else if ((Y->data[0] > Y->data[1]) || (rtIsNaN(Y->data[0]) && (!rtIsNaN
                 (Y->data[1])))) {
      minY = Y->data[1];
    } else {
      minY = Y->data[0];
    }
  } else {
    if (!rtIsNaN(Y->data[0])) {
      idx = 1;
    } else {
      idx = 0;
      k = 2;
      exitg1 = false;
      while ((!exitg1) && (k <= Y->size[0])) {
        if (!rtIsNaN(Y->data[k - 1])) {
          idx = k;
          exitg1 = true;
        } else {
          k++;
        }
      }
    }

    if (idx == 0) {
      minY = Y->data[0];
    } else {
      minY = Y->data[idx - 1];
      i = idx + 1;
      for (k = i; k <= n; k++) {
        d = Y->data[k - 1];
        if (minY > d) {
          minY = d;
        }
      }
    }
  }

  idx = Y->size[0];
  for (i = 0; i < idx; i++) {
    Y->data[i] -= minY;
  }

  /* corro al origen */
  /*  maxMEDTY = max(MEDTY) */
  i = Yscale->size[0];
  Yscale->size[0] = Y->size[0];
  emxEnsureCapacity_real_T(Yscale, i);
  idx = Y->size[0];
  for (i = 0; i < idx; i++) {
    Yscale->data[i] = Y->data[i] / minX * 600.0;
  }

  /*  normalizo en funcion de x para manterner relacion de aspecto */
}

/*
 * File trailer for XYpointscale.c
 *
 * [EOF]
 */
