# OpenCL-Samples
Learn OpenCL step by step as below.

## 1. OpenCL Common Headers
### In common/CLutil.h
int openCLCreate(  
cl_context* context, cl_command_queue* queue, cl_device_id *device  
)  
int openCLCreate_Stage2(  
cl_context context, cl_device_id Device, char *inputfile, char* kernel_name, cl_kernel* kernel  
)  

### See global_id/work.h and global_id/kernel.cl
print out get_global_id() for global_work_size={6,3}  

