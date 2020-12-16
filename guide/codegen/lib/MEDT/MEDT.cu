//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: MEDT.cu
//
// GPU Coder version                    : 1.4
// CUDA/C/C++ source code generated on  : 06-Dec-2020 18:02:22
//

// Include Files
#include "MEDT.h"
#include "MEDT_emxutil.h"
#include "MWCudaDimUtility.h"
#include "MWLaunchParametersUtilities.h"
#include <cstring>

// Function Declarations
static __global__ void MEDT_kernel1(const emxArray_boolean_T *image, int i,
  emxArray_real_T *newimage);
static void gpuEmxFree_boolean_T(emxArray_boolean_T *inter);
static void gpuEmxFree_real_T(emxArray_real_T *inter);
static void gpuEmxMemcpyCpuToGpu_boolean_T(const emxArray_boolean_T *cpu,
  emxArray_boolean_T *inter, emxArray_boolean_T *gpu);
static void gpuEmxMemcpyCpuToGpu_real_T(const emxArray_real_T *cpu,
  emxArray_real_T *inter, emxArray_real_T *gpu);
static void gpuEmxMemcpyGpuToCpu_real_T(emxArray_real_T *cpu, emxArray_real_T
  *inter);
static void gpuEmxReset_boolean_T(emxArray_boolean_T *inter);
static void gpuEmxReset_real_T(emxArray_real_T *inter);

// Function Definitions

//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                const emxArray_boolean_T *image
//                int i
//                emxArray_real_T *newimage
// Return Type  : void
//
static __global__ __launch_bounds__(1024, 1) void MEDT_kernel1(const
  emxArray_boolean_T *image, int i, emxArray_real_T *newimage)
{
  unsigned int threadId;
  unsigned int threadStride;
  unsigned int idx;
  int vlen;
  boolean_T maxval;
  int b_i;
  int c_i;
  int j;
  long long loopEnd;
  unsigned int tmpIndex;
  threadId = static_cast<unsigned int>(mwGetGlobalThreadIndex());
  threadStride = static_cast<unsigned int>(mwGetTotalThreadsLaunched());
  loopEnd = (static_cast<long long>((image->size[1] - 1)) + 1LL) * (static_cast<
    long long>((i - 1)) + 1LL) - 1LL;
  for (idx = threadId; idx <= static_cast<unsigned int>(loopEnd); idx +=
       threadStride) {
    j = static_cast<int>((idx % static_cast<unsigned int>(image->size[1])));
    tmpIndex = (idx - static_cast<unsigned int>(j)) / static_cast<unsigned int>
      (image->size[1]);
    b_i = static_cast<int>(tmpIndex);
    vlen = image->size[1];
    maxval = image->data[b_i];
    for (c_i = 0; c_i <= vlen - 2; c_i++) {
      if (static_cast<int>(maxval) < static_cast<int>(image->data[b_i +
           image->size[0] * (c_i + 1)])) {
        maxval = image->data[b_i + image->size[0] * (c_i + 1)];
      }
    }

    if (static_cast<int>(image->data[b_i + image->size[0] * j]) == static_cast<
        int>(maxval)) {
      newimage->data[b_i + newimage->size[0] * j] = 255.0;
    } else {
      newimage->data[b_i + newimage->size[0] * j] = 0.0;
    }
  }
}

//
// Arguments    : emxArray_boolean_T *inter
// Return Type  : void
//
static void gpuEmxFree_boolean_T(emxArray_boolean_T *inter)
{
  cudaFree(inter->data);
  cudaFree(inter->size);
}

//
// Arguments    : emxArray_real_T *inter
// Return Type  : void
//
static void gpuEmxFree_real_T(emxArray_real_T *inter)
{
  cudaFree(inter->data);
  cudaFree(inter->size);
}

//
// Arguments    : const emxArray_boolean_T *cpu
//                emxArray_boolean_T *inter
//                emxArray_boolean_T *gpu
// Return Type  : void
//
static void gpuEmxMemcpyCpuToGpu_boolean_T(const emxArray_boolean_T *cpu,
  emxArray_boolean_T *inter, emxArray_boolean_T *gpu)
{
  int actualSize;
  int i;
  int allocatingSize;
  if (inter->numDimensions < cpu->numDimensions) {
    inter->numDimensions = cpu->numDimensions;
    cudaFree(inter->size);
    cudaMalloc(&inter->size, inter->numDimensions * sizeof(int));
  } else {
    inter->numDimensions = cpu->numDimensions;
  }

  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (inter->allocatedSize < actualSize) {
    if (inter->canFreeData) {
      cudaFree(inter->data);
    }

    allocatingSize = cpu->allocatedSize;
    if (allocatingSize < actualSize) {
      allocatingSize = actualSize;
    }

    inter->allocatedSize = allocatingSize;
    inter->canFreeData = true;
    cudaMalloc(&inter->data, inter->allocatedSize * sizeof(boolean_T));
  }

  cudaMemcpy(inter->data, cpu->data, actualSize * sizeof(boolean_T),
             cudaMemcpyHostToDevice);
  cudaMemcpy(inter->size, cpu->size, cpu->numDimensions * sizeof(int),
             cudaMemcpyHostToDevice);
  cudaMemcpy(gpu, inter, 32ULL, cudaMemcpyHostToDevice);
}

//
// Arguments    : const emxArray_real_T *cpu
//                emxArray_real_T *inter
//                emxArray_real_T *gpu
// Return Type  : void
//
static void gpuEmxMemcpyCpuToGpu_real_T(const emxArray_real_T *cpu,
  emxArray_real_T *inter, emxArray_real_T *gpu)
{
  int actualSize;
  int i;
  int allocatingSize;
  if (inter->numDimensions < cpu->numDimensions) {
    inter->numDimensions = cpu->numDimensions;
    cudaFree(inter->size);
    cudaMalloc(&inter->size, inter->numDimensions * sizeof(int));
  } else {
    inter->numDimensions = cpu->numDimensions;
  }

  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (inter->allocatedSize < actualSize) {
    if (inter->canFreeData) {
      cudaFree(inter->data);
    }

    allocatingSize = cpu->allocatedSize;
    if (allocatingSize < actualSize) {
      allocatingSize = actualSize;
    }

    inter->allocatedSize = allocatingSize;
    inter->canFreeData = true;
    cudaMalloc(&inter->data, inter->allocatedSize * sizeof(double));
  }

  cudaMemcpy(inter->data, cpu->data, actualSize * sizeof(double),
             cudaMemcpyHostToDevice);
  cudaMemcpy(inter->size, cpu->size, cpu->numDimensions * sizeof(int),
             cudaMemcpyHostToDevice);
  cudaMemcpy(gpu, inter, 32ULL, cudaMemcpyHostToDevice);
}

//
// Arguments    : emxArray_real_T *cpu
//                emxArray_real_T *inter
// Return Type  : void
//
static void gpuEmxMemcpyGpuToCpu_real_T(emxArray_real_T *cpu, emxArray_real_T
  *inter)
{
  int actualSize;
  int i;
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  cudaMemcpy(cpu->data, inter->data, actualSize * sizeof(double),
             cudaMemcpyDeviceToHost);
  cudaMemcpy(cpu->size, inter->size, inter->numDimensions * sizeof(int),
             cudaMemcpyDeviceToHost);
}

//
// Arguments    : emxArray_boolean_T *inter
// Return Type  : void
//
static void gpuEmxReset_boolean_T(emxArray_boolean_T *inter)
{
  std::memset(inter, 0, sizeof(emxArray_boolean_T));
}

//
// Arguments    : emxArray_real_T *inter
// Return Type  : void
//
static void gpuEmxReset_real_T(emxArray_real_T *inter)
{
  std::memset(inter, 0, sizeof(emxArray_real_T));
}

//
// Arguments    : const emxArray_boolean_T *image
//                emxArray_real_T *newimage
// Return Type  : void
//
void MEDT(const emxArray_boolean_T *image, emxArray_real_T *newimage)
{
  int i;
  int i1;
  emxArray_boolean_T *gpu_image;
  dim3 grid;
  dim3 block;
  boolean_T validLaunchParams;
  emxArray_real_T *gpu_newimage;
  boolean_T newimage_dirtyOnGpu;
  emxArray_boolean_T inter_image;
  emxArray_real_T inter_newimage;
  cudaMalloc(&gpu_newimage, 32ULL);
  gpuEmxReset_real_T(&inter_newimage);
  cudaMalloc(&gpu_image, 32ULL);
  gpuEmxReset_boolean_T(&inter_image);
  newimage_dirtyOnGpu = false;

  //  numero de datos
  i = image->size[0];
  i1 = newimage->size[0] * newimage->size[1];
  newimage->size[0] = image->size[0];
  newimage->size[1] = image->size[1];
  emxEnsureCapacity_real_T(newimage, i1);
  validLaunchParams = mwGetLaunchParameters(static_cast<double>((((image->size[1]
    - 1) + 1LL) * ((i - 1) + 1LL))), &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    gpuEmxMemcpyCpuToGpu_boolean_T(image, &inter_image, gpu_image);
    gpuEmxMemcpyCpuToGpu_real_T(newimage, &inter_newimage, gpu_newimage);
    MEDT_kernel1<<<grid, block>>>(gpu_image, i, gpu_newimage);
    newimage_dirtyOnGpu = true;
  }

  if (newimage_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_real_T(newimage, &inter_newimage);
  }

  gpuEmxFree_boolean_T(&inter_image);
  cudaFree(gpu_image);
  gpuEmxFree_real_T(&inter_newimage);
  cudaFree(gpu_newimage);
}

//
// File trailer for MEDT.cu
//
// [EOF]
//
