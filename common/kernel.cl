kernel void get_id()
{
    printf("g0,g1=(%ld,%ld)\t",get_global_id(0),get_global_id(1));
    printf("l0,l1=(%ld,%ld)\n",get_local_id(0),get_local_id(1));
}

