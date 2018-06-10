kernel void gemm_nn(
    int i,
    int k,
    int j,
    int ldc,
    int ldb,
    global float *C,
    global const float *B,
    const float A_PART
){
    C[i*ldc+j] +=A_PART * B[k*ldb+j];
    //printf("ANS:%d-%d-%d %f += %f * %f\n",i,k,j, C[i*ldc+j],A_PART,B[k*ldb+j]);
}


