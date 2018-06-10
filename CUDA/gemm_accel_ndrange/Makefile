SRC:= work.c gemm.c
INC:= $(wildcard ../common/*.h)
KRL:= kernel.cl
CFLAGS := -std=c99 -I../common -I/usr/local/cuda-9.0/include/
LDFLAGS:= -L/usr/local/cuda-9.0/lib64/ -lOpenCL
work: Makefile $(SRC) $(KRL) $(INC)
	echo $(INC)
	gcc -std=c99 $(SRC) $(CFLAGS) $(LDFLAGS) -o $@

clean:
	rm -f work
