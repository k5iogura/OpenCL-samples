__kernel void gemm_nn(
    int i,
    const int k,
    const int ldc,
    const int ldb,
    global float *C,
    global const float *B,
    global const float *A,
    const int lda
){
    i = get_global_id(0);
    int j = get_global_id(1);
    C[i*ldc+j] +=A[i*lda+k] * B[k*ldb+j];
    //printf("ANS:%d-%d-%d %f += %f * %f\n",i,k,j, C[i*ldc+j],A[i*lda+k],B[k*ldb+j]);
}


