kernel void global_id()
{
    printf("g0,g1=(%ld,%ld)\n",get_global_id(0),get_global_id(1));
}

