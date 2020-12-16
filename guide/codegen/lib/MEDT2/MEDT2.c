/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: MEDT2.c
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 06-Dec-2020 17:47:07
 */

/* Include Files */
#include "MEDT2.h"
#include "MEDT2_data.h"
#include "MEDT2_emxutil.h"
#include "MEDT2_initialize.h"
#include "rt_nonfinite.h"

/* Function Definitions */

/*
 * Arguments    : const emxArray_real_T *image
 *                emxArray_real_T *newimage
 * Return Type  : void
 */
void MEDT2(const emxArray_real_T *image, emxArray_real_T *newimage)
{
  int i;
  int idx;
  emxArray_real_T *varargin_1;
  int b_i;
  int i1;
  int j;
  int i2;
  double ex;
  int k;
  boolean_T exitg1;
  double d;
  if (isInitialized_MEDT2 == false) {
    MEDT2_initialize();
  }

  i = newimage->size[0] * newimage->size[1];
  newimage->size[0] = image->size[0];
  newimage->size[1] = image->size[1];
  emxEnsureCapacity_real_T(newimage, i);
  idx = image->size[0] * image->size[1];
  for (i = 0; i < idx; i++) {
    newimage->data[i] = 0.0;
  }

  /*  numero de datos */
  i = image->size[0];
  emxInit_real_T(&varargin_1, 2);
  for (b_i = 0; b_i < i; b_i++) {
    i1 = image->size[1];
    for (j = 0; j < i1; j++) {
      idx = image->size[1];
      i2 = varargin_1->size[0] * varargin_1->size[1];
      varargin_1->size[0] = 1;
      varargin_1->size[1] = image->size[1];
      emxEnsureCapacity_real_T(varargin_1, i2);
      for (i2 = 0; i2 < idx; i2++) {
        varargin_1->data[i2] = image->data[b_i + image->size[0] * i2];
      }

      i2 = image->size[1];
      if (image->size[1] <= 2) {
        if (image->size[1] == 1) {
          ex = image->data[b_i];
        } else if ((image->data[b_i] < image->data[b_i + image->size[0]]) ||
                   (rtIsNaN(image->data[b_i]) && (!rtIsNaN(image->data[b_i +
                      image->size[0]])))) {
          ex = image->data[b_i + image->size[0]];
        } else {
          ex = image->data[b_i];
        }
      } else {
        if (!rtIsNaN(image->data[b_i])) {
          idx = 1;
        } else {
          idx = 0;
          k = 2;
          exitg1 = false;
          while ((!exitg1) && (k <= image->size[1])) {
            if (!rtIsNaN(varargin_1->data[k - 1])) {
              idx = k;
              exitg1 = true;
            } else {
              k++;
            }
          }
        }

        if (idx == 0) {
          ex = image->data[b_i];
        } else {
          ex = image->data[b_i + image->size[0] * (idx - 1)];
          idx++;
          for (k = idx; k <= i2; k++) {
            d = varargin_1->data[k - 1];
            if (ex < d) {
              ex = d;
            }
          }
        }
      }

      if (image->data[b_i + image->size[0] * j] == ex) {
        if (image->data[b_i + image->size[0] * j] > 0.0) {
          newimage->data[b_i + newimage->size[0] * j] = 255.0;
        } else {
          newimage->data[b_i + newimage->size[0] * j] = 0.0;
        }
      }
    }
  }

  emxFree_real_T(&varargin_1);
}

/*
 * File trailer for MEDT2.c
 *
 * [EOF]
 */
