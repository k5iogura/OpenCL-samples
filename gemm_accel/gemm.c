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

void gemm_nn_accel(int M, int N, int K,
        float *A, int lda, 
        float *B, int ldb,
        float *C, int ldc)
{
    int i,j,k;
    cl_int ret=0;
    if(!FPGA_init){
        openCLCreate(&context, &queue, &device);
        openCLCreate_Stage2(context,device,"gemm.cl","gemm_nn",&kernel);
    }
    cl_mem Acl = clCreateBuffer(context,  CL_MEM_READ_ONLY, M*K*sizeof(float), NULL, &ret);
    cl_mem Bcl = clCreateBuffer(context,  CL_MEM_READ_ONLY, K*N*sizeof(float), NULL, &ret);
    cl_mem Ccl = clCreateBuffer(context,  CL_MEM_READ_WRITE, M*N*sizeof(float), NULL, &ret);
    ret|=clEnqueueWriteBuffer(queue, Acl, CL_TRUE, 0, M*K*sizeof(float), (void*)A, 0, NULL, NULL);
    ret|=clEnqueueWriteBuffer(queue, Bcl, CL_TRUE, 0, K*N*sizeof(float), (void*)B, 0, NULL, NULL);
    ret|=clEnqueueWriteBuffer(queue, Ccl, CL_TRUE, 0, M*N*sizeof(float), (void*)C, 0, NULL, NULL);
    clFinish(queue);
    for(i = 0; i < M; ++i){
        for(k = 0; k < K; ++k){
            float A_PART = A[i*lda+k];
            for(j = 0; j < N; ++j){
//                C[i*ldc+j] += A_PART*B[k*ldb+j];
                ret|=clSetKernelArg(kernel, 0, sizeof(cl_mem), (void*)&Ccl);
                ret|=clSetKernelArg(kernel, 1, sizeof(cl_mem), (void*)&Bcl);
                ret|=clSetKernelArg(kernel, 2, sizeof(cl_mem), (void*)&Acl);
                ret|=clEnqueueTask(queue,kernel,0,NULL,NULL);
                if(ret==CL_SUCCESS){
                    clFinish(queue);
                }else
                    printf("clSetKernelArg or any error\n");
            }
        }
    }
    for(i=0;i<8;i++)printf("B[%d]=%5.2f\t",i,B[i]);
    printf("\n");
    //clFinish(queue);
}

