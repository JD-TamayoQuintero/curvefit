/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: MEDT2_initialize.c
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 06-Dec-2020 17:47:07
 */

/* Include Files */
#include "MEDT2_initialize.h"
#include "MEDT2.h"
#include "MEDT2_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : void
 */
void MEDT2_initialize(void)
{
  rt_InitInfAndNaN();
  isInitialized_MEDT2 = true;
}

/*
 * File trailer for MEDT2_initialize.c
 *
 * [EOF]
 */
