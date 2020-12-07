/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: XYpointcurveselection_initialize.c
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 06-Dec-2020 18:35:09
 */

/* Include Files */
#include "XYpointcurveselection_initialize.h"
#include "XYpointcurveselection.h"
#include "XYpointcurveselection_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : void
 */
void XYpointcurveselection_initialize(void)
{
  rt_InitInfAndNaN();
  isInitialized_XYpointcurveselection = true;
}

/*
 * File trailer for XYpointcurveselection_initialize.c
 *
 * [EOF]
 */
