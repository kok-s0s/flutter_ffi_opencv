//
// Created by Admin on 2023/4/7.
//

#ifndef FLUTTER_OPENCV_FFI_H
#define FLUTTER_OPENCV_FFI_H

#include <opencv2/opencv.hpp>

using namespace cv;

extern "C" void gaussianBlur();

extern "C" int getVersion();

#endif // FLUTTER_OPENCV_FFI_H
