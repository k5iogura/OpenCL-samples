#include <stdio.h>
#include "CLutil.h"

void main(){
    cl_context context;
    cl_command_queue queue;
    cl_device_id device;
    cl_kernel kernel;
    size_t global_work_size[2]={6,3};
    size_t local_work_size[2]={2,3};
    printf("global space=(%ld,%ld)\n",global_work_size[0],global_work_size[1]);
    openCLCreate(&context, &queue, &device);
    openCLCreate_Stage2(context,device,"kernel.cl","get_id",&kernel);

    clEnqueueNDRangeKernel(
    queue,
    kernel,
    2,
    NULL,
    global_work_size,
    local_work_size,
    0,
    NULL,
    NULL
    );

    clFinish(queue);
}
