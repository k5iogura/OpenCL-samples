#include <stdio.h>
//#include "CLutil.h"
#include "gemm.h"
#include <sys/time.h>
#include <CL/cl.h>

//#define M (1024)
//#define N (1024)
//#define K (1024)
static int M = 8;
static int N = 8;
static int K = 8;
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
    time_t s = gtime();
    gemm_nn_accel(M,N,K,A,K,B,N,C,M);
    for(int i=0;i<8;i++){
        printf("%5.2f\t",A[i]);
    }
    printf("\n");
    printf("%ldusec\n",gtime()-s);
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
