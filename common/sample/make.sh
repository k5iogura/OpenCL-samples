#!/bin/bash

#gcc hello.c -lOpenCL -o hello
gcc -std=c99 hello.c -I/usr/local/cuda-9.0/include/ -L/usr/local/cuda-9.0/lib64/ -lOpenCL -o hello
