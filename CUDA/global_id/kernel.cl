kernel void global_id(int x)
{
    printf("x=%d g0,g1=(%ld,%ld)\n",x,get_global_id(0),get_global_id(1));
}

