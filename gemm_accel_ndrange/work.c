#include <stdio.h>
//#include "CLutil.h"
#include "gemm.h"
#include <sys/time.h>
#include <CL/cl.h>

static int M = 4096;
static int N = 4096;
static int K = 32;
void makeD(
        float *A,
        float *B,
        float *C)
{
    int m,n,k;
    for(m=0;m<M*K;m++) A[m]=(float)m;
    for(n=0;n<K*N;n++) B[n]=(float)n;
    //for(k=0;k<M*N;k++) A[k]=(float)k;
}

time_t gtime(){
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
    makeD(A,B,C);
    time_t s=0;
    if(1){
        init_fpga("gemm.cl","gemm_nn");
        s = gtime();
        gemm_nn_accel(M,N,K,A,K,B,N,C,M);
    }else{
        s = gtime();
        gemm_nn(M,N,K,A,K,B,N,C,M);
    }
    printf("%fmsec\n",(gtime()-s)/1000.);
    for(i=0;i<8;i++)printf("B[%d]=%5.2f\t",i,B[i]);
    for(i=0;i<8;i++)printf("C[%d]=%5.2f\t",i,C[i]);
    printf("\n");
/*
    printf("global space=(%ld,%ld)\n",global_work_size[0],global_work_size[1]);
    openCLCreate(&context, &queue, &device);
    openCLCreate_Stage2(context,device,"kernel.cl","global_id",&kernel);

    clEnqueueNDRangeKernel(
    queue,
    kernel,
    2,
    NULL,
    global_work_size,
    NULL,
    //local_work_size,
    0,
    NULL,
    NULL
    );

    clFinish(queue);
*/
}
