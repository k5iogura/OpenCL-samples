HOST_INTEL  :=1
CUDA_DEVICE :=1

ifeq ($(HOST_INTEL),1)
HOST_ARM:=0
else
HOST_ARM:=1
endif


ifeq ($(HOST_ARM),1)
CC = arm-linux-gnueabihf-g++
CFLAG := $(shell aocl compile-config --arm)
LFLAG := $(shell aocl link-config    --arm)

else

CC = g++
ifeq ($(CUDA_DEVICE),1)
CFLAG = -I /usr/local/cuda/include
LFLAG = -L /usr/local/cuda/lib64

else
CFLAG := $(shell aocl compile-config)
LFLAG := $(shell aocl link-config   )
endif

endif

TGT = ls_ocl

SRC := $(windcard *.c)
OBJ = $(TGT).o

$(TGT):$(OBJ)
	$(CC) -o $@ $(OBJ) $(LFLAG) -lOpenCL

%.o:%.c
	$(CC) -c -o $@ $^ $(CFLAG)

clean:
	rm -f $(OBJ) $(TGT)
