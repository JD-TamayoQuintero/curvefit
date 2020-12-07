/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: normalizar.c
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 06-Dec-2020 18:47:54
 */

/* Include Files */
#include "normalizar.h"
#include "normalizar_data.h"
#include "normalizar_emxutil.h"
#include "normalizar_initialize.h"
#include "rt_nonfinite.h"

/* Function Definitions */

/*
 * Arguments    : emxArray_real_T *b_I
 * Return Type  : void
 */
void normalizar(emxArray_real_T *b_I)
{
  emxArray_real_T *minval;
  int m;
  int n;
  int i;
  int idx;
  int b_i;
  double ex;
  double a;
  boolean_T exitg1;
  double b_tmp;
  double b_ex;
  if (isInitialized_normalizar == false) {
    normalizar_initialize();
  }

  emxInit_real_T(&minval, 2);
  m = b_I->size[0];
  n = b_I->size[1];
  i = minval->size[0] * minval->size[1];
  minval->size[0] = 1;
  minval->size[1] = b_I->size[1];
  emxEnsureCapacity_real_T(minval, i);
  if (b_I->size[1] >= 1) {
    for (idx = 0; idx < n; idx++) {
      minval->data[idx] = b_I->data[b_I->size[0] * idx];
      for (b_i = 2; b_i <= m; b_i++) {
        a = minval->data[idx];
        b_tmp = b_I->data[(b_i + b_I->size[0] * idx) - 1];
        if ((!rtIsNaN(b_tmp)) && (rtIsNaN(a) || (a > b_tmp))) {
          minval->data[idx] = b_tmp;
        }
      }
    }
  }

  n = minval->size[1];
  if (minval->size[1] <= 2) {
    if (minval->size[1] == 1) {
      ex = minval->data[0];
    } else if ((minval->data[0] > minval->data[1]) || (rtIsNaN(minval->data[0]) &&
                (!rtIsNaN(minval->data[1])))) {
      ex = minval->data[1];
    } else {
      ex = minval->data[0];
    }
  } else {
    if (!rtIsNaN(minval->data[0])) {
      idx = 1;
    } else {
      idx = 0;
      b_i = 2;
      exitg1 = false;
      while ((!exitg1) && (b_i <= minval->size[1])) {
        if (!rtIsNaN(minval->data[b_i - 1])) {
          idx = b_i;
          exitg1 = true;
        } else {
          b_i++;
        }
      }
    }

    if (idx == 0) {
      ex = minval->data[0];
    } else {
      ex = minval->data[idx - 1];
      i = idx + 1;
      for (b_i = i; b_i <= n; b_i++) {
        a = minval->data[b_i - 1];
        if (ex > a) {
          ex = a;
        }
      }
    }
  }

  m = b_I->size[0];
  n = b_I->size[1];
  i = minval->size[0] * minval->size[1];
  minval->size[0] = 1;
  minval->size[1] = b_I->size[1];
  emxEnsureCapacity_real_T(minval, i);
  if (b_I->size[1] >= 1) {
    for (idx = 0; idx < n; idx++) {
      minval->data[idx] = b_I->data[b_I->size[0] * idx];
      for (b_i = 2; b_i <= m; b_i++) {
        a = minval->data[idx];
        b_tmp = b_I->data[(b_i + b_I->size[0] * idx) - 1];
        if ((!rtIsNaN(b_tmp)) && (rtIsNaN(a) || (a < b_tmp))) {
          minval->data[idx] = b_tmp;
        }
      }
    }
  }

  n = minval->size[1];
  if (minval->size[1] <= 2) {
    if (minval->size[1] == 1) {
      b_ex = minval->data[0];
    } else if ((minval->data[0] < minval->data[1]) || (rtIsNaN(minval->data[0]) &&
                (!rtIsNaN(minval->data[1])))) {
      b_ex = minval->data[1];
    } else {
      b_ex = minval->data[0];
    }
  } else {
    if (!rtIsNaN(minval->data[0])) {
      idx = 1;
    } else {
      idx = 0;
      b_i = 2;
      exitg1 = false;
      while ((!exitg1) && (b_i <= minval->size[1])) {
        if (!rtIsNaN(minval->data[b_i - 1])) {
          idx = b_i;
          exitg1 = true;
        } else {
          b_i++;
        }
      }
    }

    if (idx == 0) {
      b_ex = minval->data[0];
    } else {
      b_ex = minval->data[idx - 1];
      i = idx + 1;
      for (b_i = i; b_i <= n; b_i++) {
        a = minval->data[b_i - 1];
        if (b_ex < a) {
          b_ex = a;
        }
      }
    }
  }

  m = b_I->size[0];
  n = b_I->size[1];
  i = minval->size[0] * minval->size[1];
  minval->size[0] = 1;
  minval->size[1] = b_I->size[1];
  emxEnsureCapacity_real_T(minval, i);
  if (b_I->size[1] >= 1) {
    for (idx = 0; idx < n; idx++) {
      minval->data[idx] = b_I->data[b_I->size[0] * idx];
      for (b_i = 2; b_i <= m; b_i++) {
        a = minval->data[idx];
        b_tmp = b_I->data[(b_i + b_I->size[0] * idx) - 1];
        if ((!rtIsNaN(b_tmp)) && (rtIsNaN(a) || (a > b_tmp))) {
          minval->data[idx] = b_tmp;
        }
      }
    }
  }

  n = minval->size[1];
  if (minval->size[1] <= 2) {
    if (minval->size[1] == 1) {
      b_tmp = minval->data[0];
    } else if ((minval->data[0] > minval->data[1]) || (rtIsNaN(minval->data[0]) &&
                (!rtIsNaN(minval->data[1])))) {
      b_tmp = minval->data[1];
    } else {
      b_tmp = minval->data[0];
    }
  } else {
    if (!rtIsNaN(minval->data[0])) {
      idx = 1;
    } else {
      idx = 0;
      b_i = 2;
      exitg1 = false;
      while ((!exitg1) && (b_i <= minval->size[1])) {
        if (!rtIsNaN(minval->data[b_i - 1])) {
          idx = b_i;
          exitg1 = true;
        } else {
          b_i++;
        }
      }
    }

    if (idx == 0) {
      b_tmp = minval->data[0];
    } else {
      b_tmp = minval->data[idx - 1];
      i = idx + 1;
      for (b_i = i; b_i <= n; b_i++) {
        a = minval->data[b_i - 1];
        if (b_tmp > a) {
          b_tmp = a;
        }
      }
    }
  }

  emxFree_real_T(&minval);
  a = b_ex - b_tmp;
  idx = b_I->size[1];
  for (i = 0; i < idx; i++) {
    b_i = b_I->size[0];
    for (m = 0; m < b_i; m++) {
      b_I->data[m + b_I->size[0] * i] = (b_I->data[m + b_I->size[0] * i] - ex) /
        a;
    }
  }
}

/*
 * File trailer for normalizar.c
 *
 * [EOF]
 */
