TGT := ls_ocl

SRC := $(windcard *.c)
OBJ := $(TGT).o

CFLAG = -I /usr/local/include
LFLAG = -L /usr/local/cuda/lib64

$(TGT):$(OBJ)
	gcc -o $@ $(OBJ) $(CFLAG) $(LFLAG) -lOpenCL

%.o:%.c
	gcc -c -o $@ $^ $(CFLAG)

clean:
	rm -f $(OBJ) $(TGT)
