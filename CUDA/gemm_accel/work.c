#include <stdio.h>
#include "gemm.h"
#include <sys/time.h>
#include <CL/cl.h>

static int M = 32;
static int N = 16;
static int K = 16;
void makeD(
        float *A,
        float *B)
{
    int m,n,k;
    for(m=0;m<M*K;m++) A[m]=(float)m;
    for(n=0;n<K*N;n++) B[n]=(float)n;
}

time_t utime(){
    struct timeval  tv;
    gettimeofday(&tv,NULL);
    return(1000000*tv.tv_sec+tv.tv_usec);
}

void main(){
    int i;
    cl_context context;
    cl_command_queue queue;
    cl_device_id device;
    cl_kernel kernel;
    size_t global_work_size[2]={6,4};
    size_t local_work_size[2]={2,3};
    float *A=(float*)calloc(M*K,sizeof(float));
    float *B=(float*)calloc(K*N,sizeof(float));
    float *C=(float*)calloc(M*N,sizeof(float));
    makeD(A,B);
    time_t s = utime();
    if(1){
        init_fpga("gemm.cl","gemm_nn");
        s = utime();
        gemm_nn_accel(M,N,K,A,K,B,N,C,M);
    }else
        gemm_nn(M,N,K,A,K,B,N,C,M);
    printf("%fmsec\n",(utime()-s)/1000.);
    for(int i=0;i<8;i++){
        printf("%5.2f\t",A[i]);
    }
    printf("\n");
    for(i=0;i<8;i++)printf("B[%d]=%5.2f\t",i,B[i]);
    for(i=0;i<8;i++)printf("C[%d]=%5.2f\t",i,C[i]);
    printf("\n");
}
