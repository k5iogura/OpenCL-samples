#define __USE_MINGW_ANSI_STDIO 1
#include <time.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#ifdef __APPLE__
#include <OpenCL/opencl.h>
#else
#include <CL/cl.h>
#endif

#define MEM_SIZE (128)
#define MAX_SOURCE_SIZE (0x500000)

#define MAX_ENV (10)
static cl_device_id device_id[MAX_ENV];
//static cl_context context = NULL;
//static cl_command_queue command_queue = NULL;
//static cl_mem memobjA = NULL;
//static cl_mem memobjB = NULL;
//static cl_mem memobjC = NULL;
//static cl_program program = NULL;
//static cl_kernel kernel = NULL;
static cl_platform_id platform_id[MAX_ENV];

void checkErr(cl_int err,const char *name)
{
	if(err != CL_SUCCESS)
	{
		printf("Error: %s %d",name,err);
		switch(err)
		{
			case CL_DEVICE_NOT_FOUND :printf("(CL_DEVICE_NOT_FOUND)");break;
			case CL_DEVICE_NOT_AVAILABLE :printf("(CL_DEVICE_NOT_AVAILABLE)");break;
			case CL_COMPILER_NOT_AVAILABLE :printf("(CL_COMPILER_NOT_AVAILABLE)");break;
			case CL_MEM_OBJECT_ALLOCATION_FAILURE :printf("(CL_MEM_OBJECT_ALIOCATION_FAILURE)");break;
			case CL_OUT_OF_RESOURCES :printf("(CL_OUT_OF_RESOURCES)");break;
			case CL_OUT_OF_HOST_MEMORY :printf("(CL_OUT_OF_HOST_MEMORY)");break;
			case CL_MEM_COPY_OVERLAP :printf("(CL_MEM_COPY_OVERLAP)");break;
			case CL_BUILD_PROGRAM_FAILURE:printf("(CL_BUILD_PROGRAM_FAILURE)");break;
			case CL_INVALID_VALUE:printf("(CL_INVALID_VALUE)");break;
			case CL_INVALID_DEVICE_TYPE:printf("(CL_INVALID_DEVICE_TYPE)");break;
			case CL_INVALID_DEVICE:printf("(CL_INVALID_DEVICE)");break;
			case CL_INVALID_CONTEXT:printf("(CL_INVALID_CONTEXT)");break;
			case CL_INVALID_BINARY:printf("(CL_INVALID_BINARY)");break;
			case CL_INVALID_BUILD_OPTIONS:printf("(CL_INVALID_BUILD_OPTIONS)");break;
			case CL_INVALID_PROGRAM:printf("(CL_INVALID_PROGRAM)");break;
			case CL_INVALID_PROGRAM_EXECUTABLE:printf("(CL_INVALID_PROGRAM_EXECUTABLE)");break;
			case CL_INVALID_KERNEL_DEFINITION:printf("(CL_INVALID_KERNEL_DEFINITION)");break;
			case CL_INVALID_KERNEL:printf("(CL_INVALID_KERNEL)");break;
			case CL_INVALID_KERNEL_ARGS:printf("(CL_INVALID_KERNEL_ARGS)");break;
			case CL_INVALID_OPERATION:printf("(CL_INVALID_OPERATION)");break;
			case CL_INVALID_COMMAND_QUEUE:printf("(CL_INVALID_COMMAND_QUEUE)");break;
			case CL_INVALID_WORK_DIMENSION:printf("(CL_INVALID_WORK_DIMENSION)");break;
			case CL_INVALID_WORK_GROUP_SIZE:printf("(CL_INVALID_WORK_GROUP_SIZE)");break;
			case CL_INVALID_WORK_ITEM_SIZE:printf("(CL_INVALID_WORK_ITEM_SIZE)");break;
			case CL_INVALID_GLOBAL_WORK_SIZE:printf("(CL_INVALID_GLOBAL_WORK_SIZE)");break;
			case CL_INVALID_GLOBAL_OFFSET:printf("(CL_INVALID_GLOBAL_OFFSET)");break;
			case CL_INVALID_IMAGE_SIZE:printf("(CL_INVALID_IMAGE_SIZE)");break;
			case CL_INVALID_EVENT_WAIT_LIST:printf("(CL_INVALID_EVENT_WAIT_LIST)");break;
			case CL_MISALIGNED_SUB_BUFFER_OFFSET:printf("(CL_MISALIGNED_SUB_BUFFER_OFFSET)");break;

			default:
												 break;
		}
		printf("\n");
		exit(1);
	}
}

void ocl_init () {
  int i,j,k;
  cl_uint ret_num_devices;
  cl_uint ret_num_platforms;
  cl_int ret;
  cl_int ret1,ret2,ret3;

/* Load the source code containing the kernel*/

/* Get Platform */
  ret = clGetPlatformIDs (MAX_ENV, platform_id, &ret_num_platforms);
  checkErr(ret,"clGetPlatformIDs");
  printf("%d platforms\n",ret_num_platforms);

/* Get Device and info */
  cl_ulong local_mem;
  char platform_name[1024], device_name[1024];
  for(i=0;i<ret_num_platforms;i++){
    clGetPlatformInfo(platform_id[i],CL_PLATFORM_NAME,sizeof(platform_name),platform_name,NULL);
    printf("\tNo.%d-\"%s\"\n",i,platform_name);
    ret = clGetDeviceIDs (platform_id[i], CL_DEVICE_TYPE_DEFAULT, 1, device_id, &ret_num_devices);
    checkErr(ret,"clGetDeviceIds");
    printf("\t%d devices\n",ret_num_devices);
    for(j=0;j<ret_num_devices;j++){
      clGetDeviceInfo(device_id[j], CL_DEVICE_NAME,sizeof(device_name),device_name,NULL);
      clGetDeviceInfo(device_id[j], CL_DEVICE_LOCAL_MEM_SIZE, sizeof(cl_ulong),&local_mem,NULL);
      printf("\t\tNo.%d-\"%s\" : LOCAL_MEM_SIZE=%lu\n",j,device_name,local_mem);
    }
  }
}
void main(){
    ocl_init();
}
