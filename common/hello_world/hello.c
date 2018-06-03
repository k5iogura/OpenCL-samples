#include <stdio.h>
#include "CLutil.h"

void main(){
    cl_context context;
    cl_command_queue queue;
    cl_device_id device;
    openCLCreate(&context, &queue, &device);
    openCLCreate_Stage2(context,device,"hello.cl");
}
