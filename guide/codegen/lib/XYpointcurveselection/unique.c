/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: unique.c
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 06-Dec-2020 18:35:09
 */

/* Include Files */
#include "unique.h"
#include "XYpointcurveselection.h"
#include "XYpointcurveselection_emxutil.h"
#include "rt_nonfinite.h"
#include <math.h>

/* Function Definitions */

/*
 * Arguments    : const emxArray_real_T *a
 *                emxArray_real_T *b
 * Return Type  : void
 */
void unique_vector(const emxArray_real_T *a, emxArray_real_T *b)
{
  emxArray_int32_T *idx;
  int na;
  int n;
  int i;
  int b_i;
  emxArray_int32_T *iwork;
  int k;
  int i2;
  int j;
  int pEnd;
  boolean_T exitg1;
  int p;
  double absx;
  int q;
  int qEnd;
  int kEnd;
  double x;
  int exitg2;
  int exponent;
  emxInit_int32_T(&idx, 1);
  na = a->size[0];
  n = a->size[0] + 1;
  i = idx->size[0];
  idx->size[0] = a->size[0];
  emxEnsureCapacity_int32_T(idx, i);
  b_i = a->size[0];
  for (i = 0; i < b_i; i++) {
    idx->data[i] = 0;
  }

  if (a->size[0] != 0) {
    emxInit_int32_T(&iwork, 1);
    i = iwork->size[0];
    iwork->size[0] = a->size[0];
    emxEnsureCapacity_int32_T(iwork, i);
    i = a->size[0] - 1;
    for (k = 1; k <= i; k += 2) {
      if ((a->data[k - 1] <= a->data[k]) || rtIsNaN(a->data[k])) {
        idx->data[k - 1] = k;
        idx->data[k] = k + 1;
      } else {
        idx->data[k - 1] = k + 1;
        idx->data[k] = k;
      }
    }

    if ((a->size[0] & 1) != 0) {
      idx->data[a->size[0] - 1] = a->size[0];
    }

    b_i = 2;
    while (b_i < n - 1) {
      i2 = b_i << 1;
      j = 1;
      for (pEnd = b_i + 1; pEnd < n; pEnd = qEnd + b_i) {
        p = j;
        q = pEnd - 1;
        qEnd = j + i2;
        if (qEnd > n) {
          qEnd = n;
        }

        k = 0;
        kEnd = qEnd - j;
        while (k + 1 <= kEnd) {
          absx = a->data[idx->data[q] - 1];
          i = idx->data[p - 1];
          if ((a->data[i - 1] <= absx) || rtIsNaN(absx)) {
            iwork->data[k] = i;
            p++;
            if (p == pEnd) {
              while (q + 1 < qEnd) {
                k++;
                iwork->data[k] = idx->data[q];
                q++;
              }
            }
          } else {
            iwork->data[k] = idx->data[q];
            q++;
            if (q + 1 == qEnd) {
              while (p < pEnd) {
                k++;
                iwork->data[k] = idx->data[p - 1];
                p++;
              }
            }
          }

          k++;
        }

        for (k = 0; k < kEnd; k++) {
          idx->data[(j + k) - 1] = iwork->data[k];
        }

        j = qEnd;
      }

      b_i = i2;
    }

    emxFree_int32_T(&iwork);
  }

  i = b->size[0];
  b->size[0] = a->size[0];
  emxEnsureCapacity_real_T(b, i);
  for (k = 0; k < na; k++) {
    b->data[k] = a->data[idx->data[k] - 1];
  }

  emxFree_int32_T(&idx);
  k = 0;
  while ((k + 1 <= na) && rtIsInf(b->data[k]) && (b->data[k] < 0.0)) {
    k++;
  }

  i2 = k;
  k = a->size[0];
  while ((k >= 1) && rtIsNaN(b->data[k - 1])) {
    k--;
  }

  pEnd = a->size[0] - k;
  exitg1 = false;
  while ((!exitg1) && (k >= 1)) {
    absx = b->data[k - 1];
    if (rtIsInf(absx) && (absx > 0.0)) {
      k--;
    } else {
      exitg1 = true;
    }
  }

  b_i = (a->size[0] - k) - pEnd;
  p = -1;
  if (i2 > 0) {
    p = 0;
  }

  while (i2 + 1 <= k) {
    x = b->data[i2];
    do {
      exitg2 = 0;
      i2++;
      if (i2 + 1 > k) {
        exitg2 = 1;
      } else {
        absx = fabs(x / 2.0);
        if ((!rtIsInf(absx)) && (!rtIsNaN(absx))) {
          if (absx <= 2.2250738585072014E-308) {
            absx = 4.94065645841247E-324;
          } else {
            frexp(absx, &exponent);
            absx = ldexp(1.0, exponent - 53);
          }
        } else {
          absx = rtNaN;
        }

        if ((!(fabs(x - b->data[i2]) < absx)) && ((!rtIsInf(b->data[i2])) ||
             (!rtIsInf(x)) || ((b->data[i2] > 0.0) != (x > 0.0)))) {
          exitg2 = 1;
        }
      }
    } while (exitg2 == 0);

    p++;
    b->data[p] = x;
  }

  if (b_i > 0) {
    p++;
    b->data[p] = b->data[k];
  }

  i2 = k + b_i;
  for (j = 0; j < pEnd; j++) {
    p++;
    b->data[p] = b->data[i2 + j];
  }

  i = b->size[0];
  if (1 > p + 1) {
    b->size[0] = 0;
  } else {
    b->size[0] = p + 1;
  }

  emxEnsureCapacity_real_T(b, i);
}

/*
 * File trailer for unique.c
 *
 * [EOF]
 */
