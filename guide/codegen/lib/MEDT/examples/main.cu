//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: main.cu
//
// GPU Coder version                    : 1.4
// CUDA/C/C++ source code generated on  : 06-Dec-2020 18:02:22
//

//***********************************************************************
// This automatically generated example CUDA main file shows how to call
// entry-point functions that MATLAB Coder generated. You must customize
// this file for your application. Do not modify this file directly.
// Instead, make a copy of this file, modify it, and integrate it into
// your development environment.
//
// This file initializes entry-point function arguments to a default
// size and value before calling the entry-point functions. It does
// not store or use any values returned from the entry-point functions.
// If necessary, it does pre-allocate memory for returned values.
// You can use this file as a starting point for a main function that
// you can deploy in your application.
//
// After you copy the file, and before you deploy it, you must make the
// following changes:
// * For variable-size function arguments, change the example sizes to
// the sizes that your application requires.
// * Change the example values of function arguments to the values that
// your application requires.
// * If the entry-point functions return values, store these values or
// otherwise use them as required by your application.
//
//***********************************************************************

// Include Files
#include "main.h"
#include "MEDT.h"
#include "MEDT_emxAPI.h"
#include "MEDT_terminate.h"

// Function Declarations
static boolean_T argInit_boolean_T();
static emxArray_boolean_T *c_argInit_UnboundedxUnbounded_b();
static void main_MEDT();

// Function Definitions

//
// Arguments    : void
// Return Type  : boolean_T
//
static boolean_T argInit_boolean_T()
{
  return false;
}

//
// Arguments    : void
// Return Type  : emxArray_boolean_T *
//
static emxArray_boolean_T *c_argInit_UnboundedxUnbounded_b()
{
  emxArray_boolean_T *result;
  int loopUpperBound;
  int idx0;
  int b_loopUpperBound;
  int idx1;

  // Set the size of the array.
  // Change this size to the value that the application requires.
  result = emxCreate_boolean_T(2, 2);

  // Loop over the array to initialize each element.
  loopUpperBound = result->size[0U];
  for (idx0 = 0; idx0 < loopUpperBound; idx0++) {
    b_loopUpperBound = result->size[1U];
    for (idx1 = 0; idx1 < b_loopUpperBound; idx1++) {
      // Set the value of the array element.
      // Change this value to the value that the application requires.
      result->data[idx0 + result->size[0] * idx1] = argInit_boolean_T();
    }
  }

  return result;
}

//
// Arguments    : void
// Return Type  : void
//
static void main_MEDT()
{
  emxArray_real_T *newimage;
  emxArray_boolean_T *image;
  emxInitArray_real_T(&newimage, 2);

  // Initialize function 'MEDT' input arguments.
  // Initialize function input argument 'image'.
  image = c_argInit_UnboundedxUnbounded_b();

  // Call the entry-point 'MEDT'.
  MEDT(image, newimage);
  emxDestroyArray_real_T(newimage);
  emxDestroyArray_boolean_T(image);
}

//
// Arguments    : int argc
//                const char * const argv[]
// Return Type  : int
//
int main(int, const char * const [])
{
  // The initialize function is being called automatically from your entry-point function. So, a call to initialize is not included here. 
  // Invoke the entry-point functions.
  // You can call entry-point functions multiple times.
  main_MEDT();

  // Terminate the application.
  // You do not need to do this more than one time.
  MEDT_terminate();
  return 0;
}

//
// File trailer for main.cu
//
// [EOF]
//
