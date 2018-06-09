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

void init_fpga(char *kernel_file, char *kernel_name){
    if(!FPGA_init){
        openCLCreate(&context, &queue, &device);
        //openCLCreate_Stage2(context,device,"gemm.cl","gemm_nn",&kernel);
        openCLCreate_Stage2(context,device,kernel_file,kernel_name,&kernel);
        FPGA_init=1;
    }
}
void gemm_nn_accel(int M, int N, int K,
        float *A, int lda, 
        float *B, int ldb,
        float *C, int ldc)
{
    int i=0,j,k;
    size_t g_work_size[2]={M,N};
    size_t l_work_size[2]={M,N};
    cl_int ret=0;
    //if(!FPGA_init){
        //openCLCreate(&context, &queue, &device);
        //openCLCreate_Stage2(context,device,"gemm.cl","gemm_nn",&kernel);
    //}
    cl_mem Acl,Bcl,Ccl;
    Acl      = clCreateBuffer(context, CL_MEM_READ_ONLY |CL_MEM_USE_HOST_PTR, M*K*sizeof(float), A, &ret);
    Bcl      = clCreateBuffer(context, CL_MEM_READ_ONLY |CL_MEM_USE_HOST_PTR, K*N*sizeof(float), B, &ret);
    Ccl      = clCreateBuffer(context, CL_MEM_READ_WRITE|CL_MEM_USE_HOST_PTR, M*N*sizeof(float), C, &ret);
    ret|=clSetKernelArg(kernel, 2, sizeof(cl_int), &ldc);      checkErr(ret,"SetKernelArg-2");
    ret|=clSetKernelArg(kernel, 3, sizeof(cl_int), &ldb);      checkErr(ret,"SetKernelArg-3");
    ret|=clSetKernelArg(kernel, 4, sizeof(cl_mem), (void*)&Ccl); checkErr(ret,"SetKernelArg-4");
    ret|=clSetKernelArg(kernel, 5, sizeof(cl_mem), (void*)&Bcl); checkErr(ret,"SetKernelArg-5");
    ret|=clSetKernelArg(kernel, 6, sizeof(cl_mem), (void*)&Acl); checkErr(ret,"SetKernelArg-6");
    ret|=clSetKernelArg(kernel, 7, sizeof(cl_int), &lda);      checkErr(ret,"SetKernelArg-7");
    for(k = 0; k < K; ++k){
//        for(i = 0; i < M; ++i){
//            float A_PART = A[i*lda+k];
//            for(j = 0; j < N; ++j){
//                C[i*ldc+j] += A_PART*B[k*ldb+j];
                ret|=clSetKernelArg(kernel, 0, sizeof(cl_int), &i); checkErr(ret,"SetKernelArg-0");
                ret|=clSetKernelArg(kernel, 1, sizeof(cl_int), &k);        checkErr(ret,"SetKernelArg-1");
                //ret|=clEnqueueTask(queue,kernel,0,NULL,NULL);
                ret|=clEnqueueNDRangeKernel(queue,kernel,2,0,(void*)&g_work_size,NULL,0,NULL,NULL);
                checkErr(ret,"clEnqueueNDRangeKernel-0");
//            }
//        }
    }
    clFinish(queue);
    ret = clEnqueueReadBuffer(queue, Ccl, CL_TRUE, 0, M*N*sizeof(float), (void*)C, 0, NULL, NULL);
    checkErr(ret,"clEnqueueReadBuffer-0");
    clFinish(queue);
}

