/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: XYpointcurveselection.c
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 06-Dec-2020 18:35:09
 */

/* Include Files */
#include "XYpointcurveselection.h"
#include "XYpointcurveselection_data.h"
#include "XYpointcurveselection_emxutil.h"
#include "XYpointcurveselection_initialize.h"
#include "find.h"
#include "mean.h"
#include "rt_nonfinite.h"
#include "unique.h"
#include <math.h>

/* Function Declarations */
static double rt_roundd_snf(double u);

/* Function Definitions */

/*
 * Arguments    : double u
 * Return Type  : double
 */
static double rt_roundd_snf(double u)
{
  double y;
  if (fabs(u) < 4.503599627370496E+15) {
    if (u >= 0.5) {
      y = floor(u + 0.5);
    } else if (u > -0.5) {
      y = u * 0.0;
    } else {
      y = ceil(u - 0.5);
    }
  } else {
    y = u;
  }

  return y;
}

/*
 * Arguments    : const emxArray_real_T *Y
 *                double points[21]
 * Return Type  : void
 */
void XYpointcurveselection(const emxArray_real_T *Y, double points[21])
{
  emxArray_real_T *newvector;
  emxArray_boolean_T *b_Y;
  int i;
  int n;
  emxArray_int32_T *puntoA;
  static const unsigned char fib[11] = { 1U, 2U, 3U, 5U, 8U, 13U, 21U, 34U, 55U,
    89U, 144U };

  int pAmin;
  int k;
  int pAmax;
  int pBmin;
  int pBmax;
  int pCmin;
  int pCmax;
  int pDmin;
  int pDmax;
  int pEmin;
  int pEmax;
  int pFmin;
  int pFmax;
  int pGmin;
  int pGmax;
  int pHmin;
  int pHmax;
  int pImin;
  int pImax;
  int pJmin;
  int pJmax;
  if (isInitialized_XYpointcurveselection == false) {
    XYpointcurveselection_initialize();
  }

  emxInit_real_T(&newvector, 1);
  emxInit_boolean_T(&b_Y, 1);
  unique_vector(Y, newvector);

  /*   */
  /*  nf = 2:12; */
  /*  fib= fibonacci(nf); */
  i = b_Y->size[0];
  b_Y->size[0] = Y->size[0];
  emxEnsureCapacity_boolean_T(b_Y, i);
  n = Y->size[0];
  for (i = 0; i < n; i++) {
    b_Y->data[i] = (Y->data[i] == newvector->data[fib[0] - 1]);
  }

  emxInit_int32_T(&puntoA, 1);
  eml_find(b_Y, puntoA);
  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pAmin = puntoA->data[0];
    } else if (puntoA->data[0] > puntoA->data[1]) {
      pAmin = puntoA->data[1];
    } else {
      pAmin = puntoA->data[0];
    }
  } else {
    pAmin = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pAmin > i) {
        pAmin = i;
      }
    }
  }

  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pAmax = puntoA->data[0];
    } else if (puntoA->data[0] < puntoA->data[1]) {
      pAmax = puntoA->data[1];
    } else {
      pAmax = puntoA->data[0];
    }
  } else {
    pAmax = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pAmax < i) {
        pAmax = i;
      }
    }
  }

  i = b_Y->size[0];
  b_Y->size[0] = Y->size[0];
  emxEnsureCapacity_boolean_T(b_Y, i);
  n = Y->size[0];
  for (i = 0; i < n; i++) {
    b_Y->data[i] = (Y->data[i] == newvector->data[fib[1] - 1]);
  }

  eml_find(b_Y, puntoA);
  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pBmin = puntoA->data[0];
    } else if (puntoA->data[0] > puntoA->data[1]) {
      pBmin = puntoA->data[1];
    } else {
      pBmin = puntoA->data[0];
    }
  } else {
    pBmin = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pBmin > i) {
        pBmin = i;
      }
    }
  }

  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pBmax = puntoA->data[0];
    } else if (puntoA->data[0] < puntoA->data[1]) {
      pBmax = puntoA->data[1];
    } else {
      pBmax = puntoA->data[0];
    }
  } else {
    pBmax = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pBmax < i) {
        pBmax = i;
      }
    }
  }

  i = b_Y->size[0];
  b_Y->size[0] = Y->size[0];
  emxEnsureCapacity_boolean_T(b_Y, i);
  n = Y->size[0];
  for (i = 0; i < n; i++) {
    b_Y->data[i] = (Y->data[i] == newvector->data[fib[2] - 1]);
  }

  eml_find(b_Y, puntoA);
  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pCmin = puntoA->data[0];
    } else if (puntoA->data[0] > puntoA->data[1]) {
      pCmin = puntoA->data[1];
    } else {
      pCmin = puntoA->data[0];
    }
  } else {
    pCmin = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pCmin > i) {
        pCmin = i;
      }
    }
  }

  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pCmax = puntoA->data[0];
    } else if (puntoA->data[0] < puntoA->data[1]) {
      pCmax = puntoA->data[1];
    } else {
      pCmax = puntoA->data[0];
    }
  } else {
    pCmax = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pCmax < i) {
        pCmax = i;
      }
    }
  }

  i = b_Y->size[0];
  b_Y->size[0] = Y->size[0];
  emxEnsureCapacity_boolean_T(b_Y, i);
  n = Y->size[0];
  for (i = 0; i < n; i++) {
    b_Y->data[i] = (Y->data[i] == newvector->data[fib[3] - 1]);
  }

  eml_find(b_Y, puntoA);
  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pDmin = puntoA->data[0];
    } else if (puntoA->data[0] > puntoA->data[1]) {
      pDmin = puntoA->data[1];
    } else {
      pDmin = puntoA->data[0];
    }
  } else {
    pDmin = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pDmin > i) {
        pDmin = i;
      }
    }
  }

  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pDmax = puntoA->data[0];
    } else if (puntoA->data[0] < puntoA->data[1]) {
      pDmax = puntoA->data[1];
    } else {
      pDmax = puntoA->data[0];
    }
  } else {
    pDmax = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pDmax < i) {
        pDmax = i;
      }
    }
  }

  i = b_Y->size[0];
  b_Y->size[0] = Y->size[0];
  emxEnsureCapacity_boolean_T(b_Y, i);
  n = Y->size[0];
  for (i = 0; i < n; i++) {
    b_Y->data[i] = (Y->data[i] == newvector->data[fib[4] - 1]);
  }

  eml_find(b_Y, puntoA);
  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pEmin = puntoA->data[0];
    } else if (puntoA->data[0] > puntoA->data[1]) {
      pEmin = puntoA->data[1];
    } else {
      pEmin = puntoA->data[0];
    }
  } else {
    pEmin = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pEmin > i) {
        pEmin = i;
      }
    }
  }

  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pEmax = puntoA->data[0];
    } else if (puntoA->data[0] < puntoA->data[1]) {
      pEmax = puntoA->data[1];
    } else {
      pEmax = puntoA->data[0];
    }
  } else {
    pEmax = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pEmax < i) {
        pEmax = i;
      }
    }
  }

  i = b_Y->size[0];
  b_Y->size[0] = Y->size[0];
  emxEnsureCapacity_boolean_T(b_Y, i);
  n = Y->size[0];
  for (i = 0; i < n; i++) {
    b_Y->data[i] = (Y->data[i] == newvector->data[fib[5] - 1]);
  }

  eml_find(b_Y, puntoA);
  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pFmin = puntoA->data[0];
    } else if (puntoA->data[0] > puntoA->data[1]) {
      pFmin = puntoA->data[1];
    } else {
      pFmin = puntoA->data[0];
    }
  } else {
    pFmin = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pFmin > i) {
        pFmin = i;
      }
    }
  }

  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pFmax = puntoA->data[0];
    } else if (puntoA->data[0] < puntoA->data[1]) {
      pFmax = puntoA->data[1];
    } else {
      pFmax = puntoA->data[0];
    }
  } else {
    pFmax = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pFmax < i) {
        pFmax = i;
      }
    }
  }

  i = b_Y->size[0];
  b_Y->size[0] = Y->size[0];
  emxEnsureCapacity_boolean_T(b_Y, i);
  n = Y->size[0];
  for (i = 0; i < n; i++) {
    b_Y->data[i] = (Y->data[i] == newvector->data[fib[6] - 1]);
  }

  eml_find(b_Y, puntoA);
  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pGmin = puntoA->data[0];
    } else if (puntoA->data[0] > puntoA->data[1]) {
      pGmin = puntoA->data[1];
    } else {
      pGmin = puntoA->data[0];
    }
  } else {
    pGmin = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pGmin > i) {
        pGmin = i;
      }
    }
  }

  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pGmax = puntoA->data[0];
    } else if (puntoA->data[0] < puntoA->data[1]) {
      pGmax = puntoA->data[1];
    } else {
      pGmax = puntoA->data[0];
    }
  } else {
    pGmax = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pGmax < i) {
        pGmax = i;
      }
    }
  }

  i = b_Y->size[0];
  b_Y->size[0] = Y->size[0];
  emxEnsureCapacity_boolean_T(b_Y, i);
  n = Y->size[0];
  for (i = 0; i < n; i++) {
    b_Y->data[i] = (Y->data[i] == newvector->data[fib[7] - 1]);
  }

  eml_find(b_Y, puntoA);
  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pHmin = puntoA->data[0];
    } else if (puntoA->data[0] > puntoA->data[1]) {
      pHmin = puntoA->data[1];
    } else {
      pHmin = puntoA->data[0];
    }
  } else {
    pHmin = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pHmin > i) {
        pHmin = i;
      }
    }
  }

  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pHmax = puntoA->data[0];
    } else if (puntoA->data[0] < puntoA->data[1]) {
      pHmax = puntoA->data[1];
    } else {
      pHmax = puntoA->data[0];
    }
  } else {
    pHmax = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pHmax < i) {
        pHmax = i;
      }
    }
  }

  i = b_Y->size[0];
  b_Y->size[0] = Y->size[0];
  emxEnsureCapacity_boolean_T(b_Y, i);
  n = Y->size[0];
  for (i = 0; i < n; i++) {
    b_Y->data[i] = (Y->data[i] == newvector->data[fib[8] - 1]);
  }

  eml_find(b_Y, puntoA);
  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pImin = puntoA->data[0];
    } else if (puntoA->data[0] > puntoA->data[1]) {
      pImin = puntoA->data[1];
    } else {
      pImin = puntoA->data[0];
    }
  } else {
    pImin = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pImin > i) {
        pImin = i;
      }
    }
  }

  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pImax = puntoA->data[0];
    } else if (puntoA->data[0] < puntoA->data[1]) {
      pImax = puntoA->data[1];
    } else {
      pImax = puntoA->data[0];
    }
  } else {
    pImax = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pImax < i) {
        pImax = i;
      }
    }
  }

  i = b_Y->size[0];
  b_Y->size[0] = Y->size[0];
  emxEnsureCapacity_boolean_T(b_Y, i);
  n = Y->size[0];
  for (i = 0; i < n; i++) {
    b_Y->data[i] = (Y->data[i] == newvector->data[fib[9] - 1]);
  }

  eml_find(b_Y, puntoA);
  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pJmin = puntoA->data[0];
    } else if (puntoA->data[0] > puntoA->data[1]) {
      pJmin = puntoA->data[1];
    } else {
      pJmin = puntoA->data[0];
    }
  } else {
    pJmin = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pJmin > i) {
        pJmin = i;
      }
    }
  }

  n = puntoA->size[0];
  if (puntoA->size[0] <= 2) {
    if (puntoA->size[0] == 1) {
      pJmax = puntoA->data[0];
    } else if (puntoA->data[0] < puntoA->data[1]) {
      pJmax = puntoA->data[1];
    } else {
      pJmax = puntoA->data[0];
    }
  } else {
    pJmax = puntoA->data[0];
    for (k = 2; k <= n; k++) {
      i = puntoA->data[k - 1];
      if (pJmax < i) {
        pJmax = i;
      }
    }
  }

  i = b_Y->size[0];
  b_Y->size[0] = Y->size[0];
  emxEnsureCapacity_boolean_T(b_Y, i);
  n = Y->size[0];
  for (i = 0; i < n; i++) {
    b_Y->data[i] = (Y->data[i] == 0.0);
  }

  eml_find(b_Y, puntoA);
  i = newvector->size[0];
  newvector->size[0] = puntoA->size[0];
  emxEnsureCapacity_real_T(newvector, i);
  n = puntoA->size[0];
  emxFree_boolean_T(&b_Y);
  for (i = 0; i < n; i++) {
    newvector->data[i] = puntoA->data[i];
  }

  emxFree_int32_T(&puntoA);
  points[0] = rt_roundd_snf(mean(newvector));
  points[1] = pImin;
  points[2] = pHmin;
  points[3] = pGmin;
  points[4] = pAmin;
  points[5] = pBmin;
  points[6] = pCmin;
  points[7] = pDmin;
  points[8] = pEmin;
  points[9] = pFmin;
  points[10] = pImax;
  points[11] = pHmax;
  points[12] = pGmax;
  points[13] = pFmax;
  points[14] = pEmax;
  points[15] = pDmax;
  points[16] = pCmax;
  points[17] = pBmax;
  points[18] = pAmax;
  points[19] = pJmin;
  points[20] = pJmax;
  emxFree_real_T(&newvector);
}

/*
 * File trailer for XYpointcurveselection.c
 *
 * [EOF]
 */
