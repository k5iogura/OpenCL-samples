__kernel void gemm_nn(
    __global float *C,
    __global const float *B,
    __global const float *A_PART
){
    printf("IN- %f %f %f\n",C[8],A_PART[8],B[8]);
    (*C) +=(*A_PART)*(*B);
}


