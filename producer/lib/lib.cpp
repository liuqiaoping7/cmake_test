#include "lib.h"
#include "libliba.h"
#include "liblibb.h"
#include<vector>
#include<string>

static std::vector<std::string> s_filter_vec = {
    "", "video_filter_normal.png", "video_filter_yinghong.png", "video_filter_yunshang.png", 
    "video_filter_chunzhen.png", "video_filter_bailan.png", "video_filter_chaotuo.png", "video_filter_xiangfen.png", 
    "video_filter_qingxin.png", "video_filter_weimei.png", "video_filter_fennen.png", "video_filter_huaijiu.png",  
    "video_filter_landiao.png", "video_filter_qingliang.png", "video_filter_rixi.png", "video_filter_yuanqi.png"};

int lib(){
    libliba();
    liblibb();
    printf("lib \n");
    //test null release well and debug crash
    // unsigned char * pu8 = NULL;
    // unsigned char c = *pu8; // not real cause, just because release optimizer delete this code
    // printf("test null release and debug pu8 = %d \n",pu8); release well and debug crash
    // printf("test null release and debug pu8 = %d c = %d \n",pu8,c); //both crash

    uint32_t index = 0, step = 0;
    std::string value = R"(D:\github\cmake_test\customer\video_filter_fennen.png)";
    for (std::vector<std::string>::iterator i = s_filter_vec.begin(); i != s_filter_vec.end(); ++i) {
        std::string filename = *i;
        if (value.find(filename) != std::string::npos) {
            index = step;
            break;
        }
        ++step;
    }
    printf("index = %d \n", index);    //因为有空字符串为首，字符串查找必中0！！！

    return 0;
}
