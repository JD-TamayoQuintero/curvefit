/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: normalizar_initialize.c
 *
 * MATLAB Coder version            : 4.3
 * C/C++ source code generated on  : 06-Dec-2020 18:47:54
 */

/* Include Files */
#include "normalizar_initialize.h"
#include "normalizar.h"
#include "normalizar_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : void
 */
void normalizar_initialize(void)
{
  rt_InitInfAndNaN();
  isInitialized_normalizar = true;
}

/*
 * File trailer for normalizar_initialize.c
 *
 * [EOF]
 */
