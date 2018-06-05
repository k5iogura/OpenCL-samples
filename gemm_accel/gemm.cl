__kernel void gemm_nn(
    __global int *p_i,
    __global int *p_k,
    __global int *p_ldc,
    __global int *p_ldb,
    __global float *C,
    __global const float *B,
    __global const float *A
){
    int j = get_global_id(0);
    int i = *p_i;
    int k = *p_k;
    int ldc = *p_ldc;
    int ldb = *p_ldb;
    float A_PART=*A;
    C[i*ldc+j] +=A_PART * B[k*ldb+j];
    printf("C- %d-%d-%d %f \n",i,k,j, C[i*ldc+j]);
    printf("B- %d-%d-%d %f \n",i,k,j, B[k*ldb+j]);
}


