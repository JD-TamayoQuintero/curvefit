/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: XYpointscale_initialize.c
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 06-Dec-2020 18:04:47
 */

/* Include Files */
#include "XYpointscale_initialize.h"
#include "XYpointscale.h"
#include "XYpointscale_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : void
 */
void XYpointscale_initialize(void)
{
  rt_InitInfAndNaN();
  isInitialized_XYpointscale = true;
}

/*
 * File trailer for XYpointscale_initialize.c
 *
 * [EOF]
 */
