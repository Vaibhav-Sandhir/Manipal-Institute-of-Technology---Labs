#include <stdio.h>
#define CL_TARGET_OPENCL_VERSION 120
#include <CL/cl.h>
#include <stdlib.h>

#define MAX_SOURCE_SIZE (0x100000)

int main(void){
	// STEP 1 - DATA INITIALISATION
	int LIST_SIZE;
	printf("\nEnter how many elements: ");
	scanf("%d", &LIST_SIZE);
	int* vec1 = (int*)malloc(sizeof(int) * LIST_SIZE);
	int* vec2 = (int*)malloc(sizeof(int) * LIST_SIZE);
	for(int i = 0; i < LIST_SIZE; i++){
		vec1[i] = i;
		vec2[i] = i + 10;
	}
	
	// STEP 2 - LOAD THE KERNEL SOURCE CODE INTO A BUFFER
	FILE* fp = fopen("vectorCLKernel.cl", "r");
	if(fp == NULL){
		printf("\nFailed to load kernel");
		exit(1);
	}
	char* source_str = (char*)malloc(MAX_SOURCE_SIZE);
	size_t source_size = fread(source_str, 1, MAX_SOURCE_SIZE, fp);
	fclose(fp);
	
	// STEP 3 - PLATFORM AND DEVICE INFORMATION
	cl_platform_id platform_id;
	cl_device_id device_id;
	cl_uint ret_num_devices;
	cl_uint ret_num_platforms;
	cl_int ret;
	ret = clGetPlatformIDs(1, &platform_id, &ret_num_platforms);
	// 1 is num_entries specifying put only 1 entry in platform_id
	ret = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_GPU, 1, &device_id, &ret_num_devices); 
	// same 1 here also
	
	// STEP 4 - CREATE AN OpenCL CONTEXT
	cl_context context = clCreateContext(NULL, 1, &device_id, NULL, NULL, &ret); 
	// First NULL tells use the default platform, 1 is again number of devices in the array, Second and Third NULL tells no error_handling mentioned and no data pointer for the error callback
	// &device_id is used because although we are using only one device_id OpenCL expects an array of devices
	
	// STEP 5 - CREATE A COMMAND QUEUE
	cl_command_queue command_queue = clCreateCommandQueueWithProperties(context, device_id, NULL, &ret);

	// NULL is for using default properties of the command queue
	
	
	// STEP 6 - CREATE MEMORY BUFFERS ON THE DEVICE FOR ALL
	// Memory is different for host device(CPU) and GPU so we create memory objects on the host which get transferred to the GPU by the command queue
	cl_mem vec1_mem_obj = clCreateBuffer(context, CL_MEM_READ_ONLY, LIST_SIZE * sizeof(int), NULL, &ret); 
	cl_mem vec2_mem_obj = clCreateBuffer(context, CL_MEM_READ_ONLY, LIST_SIZE * sizeof(int), NULL, &ret);
	cl_mem vec3_mem_obj = clCreateBuffer(context, CL_MEM_READ_ONLY, LIST_SIZE * sizeof(int), NULL, &ret);
	
	// STEP -7 COPY VECTORS TO THESE BUFFERS AND SEND TO GPU
	ret = clEnqueueWriteBuffer(command_queue, vec1_mem_obj, CL_TRUE, 0, LIST_SIZE * sizeof(int), vec1, 0, NULL, NULL);
	ret = clEnqueueWriteBuffer(command_queue, vec2_mem_obj, CL_TRUE, 0, LIST_SIZE * sizeof(int), vec2, 0, NULL, NULL);
	// CL_TRUE makes it synchronous make it wait, when operation gets completed then only returns
	// 0 offset because we are copying from beginning of the buffer
	// NULL no event wait list
	// NULL no events to wait for
	
	// STEP - 8 CREATE AND BUILD PROGRAM FROM KERNEL SOURCE
	cl_program program = clCreateProgramWithSource(context, 1, (const char**)&source_str, (const size_t*)&source_size, &ret);
	ret = clBuildProgram(program, 1, &device_id, NULL, NULL, NULL);
	// 1 is again number of devices
	// All thre NULLS are for some extra options or callbacks
	
	// STEP 9 - CREATE THE KERNEL OBJECT
	cl_kernel kernel = clCreateKernel(program, "vector_add", &ret);
	// vector_add is the name of the function in the kernel
	
	// STEP 10 - SET ARGUMENTS OF THE KERNEL
	ret = clSetKernelArg(kernel, 0, sizeof(cl_mem), (void*)&vec1_mem_obj);
	ret = clSetKernelArg(kernel, 1, sizeof(cl_mem), (void*)&vec2_mem_obj);
	ret = clSetKernelArg(kernel, 2, sizeof(cl_mem), (void*)&vec3_mem_obj);
	
	size_t global_item_size = LIST_SIZE;  // Total number of work items that will be executed
	size_t local_item_size = 1; // Specifies the number of work-items in each work-group
	
	// STEP - 11 EXECUTE THE KERNEL ON THE DEVICE
	cl_event event;
	ret = clEnqueueNDRangeKernel(command_queue, kernel, 1, NULL, &global_item_size, &local_item_size, 0, NULL, NULL);
	ret = clFinish(command_queue);
	
	// STEP - 12 READ THE MEMORY BUFFER C FROM GPU BACK TO CPUT
	int *vec3 = (int*)malloc(sizeof(int) * LIST_SIZE);
	ret = clEnqueueReadBuffer(command_queue, vec3_mem_obj, CL_TRUE, 0, LIST_SIZE * sizeof(int), vec3, 0, NULL, NULL);
	
	for(int i = 0; i < LIST_SIZE; i++){
		printf("%d + %d = %d\n", vec1[i], vec2[i], vec3[i]);
	}
	
	ret = clFlush(command_queue);
	ret = clReleaseKernel(kernel);
	ret = clReleaseProgram(program);
	ret = clReleaseMemObject(vec1_mem_obj);
	ret = clReleaseMemObject(vec2_mem_obj);
	ret = clReleaseMemObject(vec3_mem_obj);
	ret = clReleaseCommandQueue(command_queue);
	ret = clReleaseContext(context);
	
	free(vec1);
	free(vec2);
	free(vec3);
	return 0;		
}
