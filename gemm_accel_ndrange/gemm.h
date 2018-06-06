#ifndef GEMM_H
#define GEMM_H

void gemm_nn(int M, int N, int K,
        float *A, int lda, 
        float *B, int ldb,
        float *C, int ldc) ;
void gemm_nn_accel(int M, int N, int K,
        float *A, int lda, 
        float *B, int ldb,
        float *C, int ldc) ;
void init_fpga(char *kernel_file, char *kernel_name);
#endif
