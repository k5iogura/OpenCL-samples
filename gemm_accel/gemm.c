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
    size_t g_work_size;
    size_t l_work_size;
    cl_int ret=0;
    if(!FPGA_init){
        openCLCreate(&context, &queue, &device);
        openCLCreate_Stage2(context,device,"gemm.cl","gemm_nn",&kernel);
    }
    cl_mem icl,kcl,ldccl,ldbcl,A_PARTcl,Bcl,Ccl;
    for(i = 0; i < M; ++i){
        for(k = 0; k < K; ++k){
            float A_PART = A[i*lda+k];
//            for(j = 0; j < N; ++j){
//                C[i*ldc+j] += A_PART*B[k*ldb+j];
                icl      = clCreateBuffer(context,  CL_MEM_READ_ONLY, sizeof(int), NULL, &ret);
                kcl      = clCreateBuffer(context,  CL_MEM_READ_ONLY, sizeof(int), NULL, &ret);
                ldccl    = clCreateBuffer(context,  CL_MEM_READ_ONLY, sizeof(int), NULL, &ret);
                ldbcl    = clCreateBuffer(context,  CL_MEM_READ_ONLY, sizeof(int), NULL, &ret);
                A_PARTcl = clCreateBuffer(context,  CL_MEM_READ_ONLY, sizeof(float), NULL, &ret);
                Bcl      = clCreateBuffer(context,  CL_MEM_READ_ONLY, K*N*sizeof(float), NULL, &ret);
                Ccl      = clCreateBuffer(context,  CL_MEM_READ_WRITE, M*N*sizeof(float), NULL, &ret);
                ret|=clEnqueueWriteBuffer(queue, icl, CL_TRUE, 0, sizeof(int), (void*)&i, 0, NULL, NULL);
                checkErr(ret,"clEnqueueWriteBuffer-0");
                ret|=clEnqueueWriteBuffer(queue, kcl, CL_TRUE, 0, sizeof(int), (void*)&k, 0, NULL, NULL);
                checkErr(ret,"clEnqueueWriteBuffer-1");
                ret|=clEnqueueWriteBuffer(queue, ldccl, CL_TRUE, 0, sizeof(int), (void*)&ldc, 0, NULL, NULL);
                checkErr(ret,"clEnqueueWriteBuffer-2");
                ret|=clEnqueueWriteBuffer(queue, ldbcl, CL_TRUE, 0, sizeof(int), (void*)&ldb, 0, NULL, NULL);
                checkErr(ret,"clEnqueueWriteBuffer-3");
                ret|=clEnqueueWriteBuffer(queue, Ccl, CL_TRUE, 0, M*N*sizeof(float), (void*)C, 0, NULL, NULL);
                checkErr(ret,"clEnqueueWriteBuffer-4");
                ret|=clEnqueueWriteBuffer(queue, Bcl, CL_TRUE, 0, K*N*sizeof(float), (void*)B, 0, NULL, NULL);
                checkErr(ret,"clEnqueueWriteBuffer-5");
                ret|=clEnqueueWriteBuffer(queue, A_PARTcl, CL_TRUE, 0, sizeof(float), (void*)&A_PART, 0, NULL, NULL);
                checkErr(ret,"clEnqueueWriteBuffer-4");
                ret|=clSetKernelArg(kernel, 0, sizeof(cl_mem), (void*)&icl); checkErr(ret,"SetKernelArg-0");
                ret|=clSetKernelArg(kernel, 1, sizeof(cl_mem), &kcl);        checkErr(ret,"SetKernelArg-1");
                ret|=clSetKernelArg(kernel, 2, sizeof(cl_mem), &ldccl);      checkErr(ret,"SetKernelArg-2");
                ret|=clSetKernelArg(kernel, 3, sizeof(cl_mem), &ldbcl);      checkErr(ret,"SetKernelArg-3");
                ret|=clSetKernelArg(kernel, 4, sizeof(cl_mem), (void*)&Ccl); checkErr(ret,"SetKernelArg-4");
                ret|=clSetKernelArg(kernel, 5, sizeof(cl_mem), (void*)&Bcl); checkErr(ret,"SetKernelArg-5");
                ret|=clSetKernelArg(kernel, 6, sizeof(cl_mem), (void*)&A_PARTcl); checkErr(ret,"SetKernelArg-6");
                //ret|=clEnqueueTask(queue,kernel,0,NULL,NULL);
                g_work_size = l_work_size = N;
                ret|=clEnqueueNDRangeKernel(queue,kernel,1,0,&g_work_size,&l_work_size,0,NULL,NULL);
                checkErr(ret,"clEnqueueNDRangeKernel-0");
                if(ret==CL_SUCCESS){
                    clFinish(queue);
                }else
                    printf("clSetKernelArg or any error\n");
                ret = clEnqueueReadBuffer(queue, Ccl, CL_TRUE, 0, M*N*sizeof(float), (void*)C, 0, NULL, NULL);
                checkErr(ret,"clEnqueueReadBuffer-0");
//            }
        }
    }
    for(i=0;i<8;i++)printf("B[%d]=%5.2f\t",i,B[i]);
    for(i=0;i<8;i++)printf("C[%d]=%5.2f\t",i,C[i]);
    printf("\n");
    //clFinish(queue);
}

