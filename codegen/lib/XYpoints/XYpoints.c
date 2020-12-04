/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: XYpoints.c
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 04-Dec-2020 12:28:38
 */

/* Include Files */
#include "XYpoints.h"

/* Function Definitions */

/*
 * Arguments    : double image
 *                double value
 *                double Xpoint_data[]
 *                int Xpoint_size[1]
 *                double Ypoint_data[]
 *                int Ypoint_size[1]
 * Return Type  : void
 */
void XYpoints(double image, double value, double Xpoint_data[], int Xpoint_size
              [1], double Ypoint_data[], int Ypoint_size[1])
{
  int num;
  int ii_size_idx_1;
  if (image == value) {
    num = 1;
    ii_size_idx_1 = 1;
  } else {
    num = 0;
    ii_size_idx_1 = 0;
  }

  num *= ii_size_idx_1;

  /*  numero de datos */
  Xpoint_size[0] = num;
  Ypoint_size[0] = num;
  if (0 <= num - 1) {
    Xpoint_data[0] = 0.0;
    Ypoint_data[0] = 0.0;
  }

  /*   */
  if (image == 0.0) {
    Xpoint_data[0] = 1.0;
    Ypoint_data[0] = 1.0;
  }
}

/*
 * File trailer for XYpoints.c
 *
 * [EOF]
 */
