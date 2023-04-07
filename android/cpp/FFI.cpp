//
// Created by Admin on 2023/4/7.
//

#include "FFI.h"

void gaussianBlur() {
    // const char* inputPath, const char* outputPath
    Mat src = imread("/data/data/com.example.flutter_opencv_example/files/input.jpg");
    if (src.empty()) {
        return;
    }

    Mat dst;
    GaussianBlur(src, dst, Size(15, 15), 0);

    imwrite("/data/data/com.example.flutter_opencv_example/files/output.jpg", dst);
}

int getVersion() {
    return 2;
}