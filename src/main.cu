#include <stdio.h>
#include <cuda.h>

int main(void)
{
    int deviceCount = 0;
    cudaError_t error_id = cudaGetDeviceCount(&deviceCount);
    if (error_id != cudaSuccess) {
      printf("cudaGetDeviceCount returned %d (%s)\n", error_id, cudaGetErrorString(error_id));
      exit(EXIT_FAILURE);
    }
    printf("deviceCount: %d\n", deviceCount);

    int dev, driverVersion = 0, runtimeVersion = 0;
    for (dev= 0; dev < deviceCount; ++dev) {
      cudaSetDevice(dev);

      cudaDeviceProp deviceProp;
      cudaGetDeviceProperties(&deviceProp, dev);

      printf("\n");
      printf("device: %d\n", dev);
      printf("name: %s\n", deviceProp.name);

      error_id = cudaRuntimeGetVersion(&runtimeVersion);
      if (error_id != cudaSuccess) {
        printf("cudaRuntimeGetVersion returned %d (%s)\n", error_id, cudaGetErrorString(error_id));
      } else {
        printf("runtime version: %d\n", runtimeVersion);
      }

      error_id = cudaDriverGetVersion(&driverVersion);
      if (error_id != cudaSuccess) {
        printf("cudaDriverGetVersion returned %d (%s)\n", error_id, cudaGetErrorString(error_id));
      } else {
        printf("driver version: %d\n", driverVersion);
      }
    }
}
