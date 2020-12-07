//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: MEDT_emxutil.cu
//
// GPU Coder version                    : 1.4
// CUDA/C/C++ source code generated on  : 06-Dec-2020 18:02:22
//

// Include Files
#include "MEDT_emxutil.h"
#include "MEDT.h"
#include <cstdlib>
#include <cstring>

// Function Definitions

//
// Arguments    : emxArray_real_T *emxArray
//                int oldNumel
// Return Type  : void
//
void emxEnsureCapacity_real_T(emxArray_real_T *emxArray, int oldNumel)
{
  int newNumel;
  int i;
  void *newData;
  if (oldNumel < 0) {
    oldNumel = 0;
  }

  newNumel = 1;
  for (i = 0; i < emxArray->numDimensions; i++) {
    newNumel *= emxArray->size[i];
  }

  if (newNumel > emxArray->allocatedSize) {
    i = emxArray->allocatedSize;
    if (i < 16) {
      i = 16;
    }

    while (i < newNumel) {
      if (i > 1073741823) {
        i = MAX_int32_T;
      } else {
        i <<= 1;
      }
    }

    newData = std::calloc(static_cast<unsigned int>(i), sizeof(double));
    if (emxArray->data != NULL) {
      std::memcpy(newData, emxArray->data, sizeof(double) * oldNumel);
      if (emxArray->canFreeData) {
        std::free(emxArray->data);
      }
    }

    emxArray->data = (double *)newData;
    emxArray->allocatedSize = i;
    emxArray->canFreeData = true;
  }
}

//
// Arguments    : emxArray_boolean_T **pEmxArray
// Return Type  : void
//
void emxFree_boolean_T(emxArray_boolean_T **pEmxArray)
{
  if (*pEmxArray != (emxArray_boolean_T *)NULL) {
    if (((*pEmxArray)->data != (boolean_T *)NULL) && (*pEmxArray)->canFreeData)
    {
      std::free((*pEmxArray)->data);
    }

    std::free((*pEmxArray)->size);
    std::free(*pEmxArray);
    *pEmxArray = (emxArray_boolean_T *)NULL;
  }
}

//
// Arguments    : emxArray_real_T **pEmxArray
// Return Type  : void
//
void emxFree_real_T(emxArray_real_T **pEmxArray)
{
  if (*pEmxArray != (emxArray_real_T *)NULL) {
    if (((*pEmxArray)->data != (double *)NULL) && (*pEmxArray)->canFreeData) {
      std::free((*pEmxArray)->data);
    }

    std::free((*pEmxArray)->size);
    std::free(*pEmxArray);
    *pEmxArray = (emxArray_real_T *)NULL;
  }
}

//
// Arguments    : emxArray_boolean_T **pEmxArray
//                int numDimensions
// Return Type  : void
//
void emxInit_boolean_T(emxArray_boolean_T **pEmxArray, int numDimensions)
{
  emxArray_boolean_T *emxArray;
  int i;
  *pEmxArray = (emxArray_boolean_T *)std::malloc(sizeof(emxArray_boolean_T));
  emxArray = *pEmxArray;
  emxArray->data = (boolean_T *)NULL;
  emxArray->numDimensions = numDimensions;
  emxArray->size = (int *)std::malloc(sizeof(int) * numDimensions);
  emxArray->allocatedSize = 0;
  emxArray->canFreeData = true;
  for (i = 0; i < numDimensions; i++) {
    emxArray->size[i] = 0;
  }
}

//
// Arguments    : emxArray_real_T **pEmxArray
//                int numDimensions
// Return Type  : void
//
void emxInit_real_T(emxArray_real_T **pEmxArray, int numDimensions)
{
  emxArray_real_T *emxArray;
  int i;
  *pEmxArray = (emxArray_real_T *)std::malloc(sizeof(emxArray_real_T));
  emxArray = *pEmxArray;
  emxArray->data = (double *)NULL;
  emxArray->numDimensions = numDimensions;
  emxArray->size = (int *)std::malloc(sizeof(int) * numDimensions);
  emxArray->allocatedSize = 0;
  emxArray->canFreeData = true;
  for (i = 0; i < numDimensions; i++) {
    emxArray->size[i] = 0;
  }
}

//
// File trailer for MEDT_emxutil.cu
//
// [EOF]
//
