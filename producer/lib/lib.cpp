#include "lib.h"
#include "libliba.h"
#include "liblibb.h"

int lib(){
    libliba();
    liblibb();
    printf("lib \n");
    //test null release well and debug crash
    unsigned char * pu8 = NULL;
    unsigned char c = *pu8; // not real cause, just because release optimizer delete this code
    // printf("test null release and debug pu8 = %d \n",pu8); release well and debug crash
    // printf("test null release and debug pu8 = %d c = %d \n",pu8,c); //both crash
    return 0;
}
