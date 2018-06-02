#!/bin/bash
#gcc -o mat-add mat-add.c -lOpenCL -lm
gcc -std=c99 mat-add.c -I/usr/local/cuda-9.0/include/ -L/usr/local/cuda-9.0/lib64/ -lOpenCL -lm -o mat-add
