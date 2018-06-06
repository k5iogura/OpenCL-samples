#include <stdlib.h>
#include <stdio.h>
#include "gemm.h"
#include <math.h>
#include "CLutil.h"

void gemm_nn(int M, int N, int K,
        float *A, int lda, 
        float *B, int ldb,
        float *C, int ldc)
{
    int i,j,k;
    for(i = 0; i < M; ++i){
        for(k = 0; k < K; ++k){
            float A_PART = A[i*lda+k];
            for(j = 0; j < N; ++j){
                C[i*ldc+j] += A_PART*B[k*ldb+j];
            }
        }
    }
}

static int FPGA_init=0;
static cl_context context=NULL;
static cl_command_queue queue=NULL;
static cl_kernel kernel=NULL;
static cl_device_id device=NULL;

void init_fpga(char*kernel_file, char*kernel_name){
    if(!FPGA_init){
        openCLCreate(&context, &queue, &device);
        openCLCreate_Stage2(context,device,kernel_file,kernel_name,&kernel);
        FPGA_init=1;
    }
}
void gemm_nn_accel(int M, int N, int K,
        float *A, int lda, 
        float *B, int ldb,
        float *C, int ldc)
{
    int i,j,k;
    size_t g_work_size;
    size_t l_work_size;
    cl_int ret=0;
    cl_mem Bcl,Ccl;
    Bcl      = clCreateBuffer(context,  CL_MEM_READ_ONLY | CL_MEM_USE_HOST_PTR, K*N*sizeof(float), B, &ret);
    Ccl      = clCreateBuffer(context,  CL_MEM_READ_WRITE| CL_MEM_USE_HOST_PTR, M*N*sizeof(float), C, &ret);
    ret|=clSetKernelArg(kernel, 3, sizeof(cl_int), &ldc);        checkErr(ret,"SetKernelArg-3");
    ret|=clSetKernelArg(kernel, 4, sizeof(cl_int), &ldb);        checkErr(ret,"SetKernelArg-4");
    ret|=clSetKernelArg(kernel, 5, sizeof(cl_mem), (void*)&Ccl); checkErr(ret,"SetKernelArg-5");
    ret|=clSetKernelArg(kernel, 6, sizeof(cl_mem), (void*)&Bcl); checkErr(ret,"SetKernelArg-6");
    for(i = 0; i < M; ++i){
        for(k = 0; k < K; ++k){
            float A_PART = A[i*lda+k];
            for(j = 0; j < N; ++j){
                ret|=clSetKernelArg(kernel, 0, sizeof(cl_int), &i);        checkErr(ret,"SetKernelArg-0");
                ret|=clSetKernelArg(kernel, 1, sizeof(cl_int), &k);        checkErr(ret,"SetKernelArg-1");
                ret|=clSetKernelArg(kernel, 2, sizeof(cl_int), &j);        checkErr(ret,"SetKernelArg-2");
                ret|=clSetKernelArg(kernel, 7, sizeof(cl_float), &A_PART); checkErr(ret,"SetKernelArg-7");
                if(1){
                    ret|=clEnqueueTask(queue,kernel,0,NULL,NULL);
                    checkErr(ret,"clEnqueueNDRangeKernel-0");
                }else{
                    g_work_size = 1;
                    ret|=clEnqueueNDRangeKernel(queue,kernel,1,0,&g_work_size,NULL,0,NULL,NULL);
                    checkErr(ret,"clEnqueueTask-0");
                }
                clFinish(queue);
            }
        }
    }
    ret = clEnqueueReadBuffer(queue, Ccl, CL_TRUE, 0, M*N*sizeof(float), (void*)C, 0, NULL, NULL);
    checkErr(ret,"clEnqueueReadBuffer-0");
    for(i=0;i<8;i++)printf("B[%d]=%5.2f\t",i,B[i]);
    for(i=0;i<8;i++)printf("C[%d]=%5.2f\t",i,C[i]);
    printf("\n");
    //clFinish(queue);
}

