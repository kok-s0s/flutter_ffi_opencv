//
// Created by Admin on 2023/4/7.
//

#ifndef FLUTTER_OPENCV_FFI_H
#define FLUTTER_OPENCV_FFI_H

#include "Cxx.h"

#include <opencv2/opencv.hpp>

using namespace cv;

extern "C" void gaussianBlur();

extern "C" int getVersion();

extern "C" void setPersonName(char *name);

extern "C" char *getPersonName();

extern "C" void setPersonAge(int age);

extern "C" int getPersonAge();

extern "C" void setPersonWeight(double weight);

extern "C" double getPersonWeight();

extern "C" void setPersonHeight(double height);

extern "C" double getPersonHeight();

#endif // FLUTTER_OPENCV_FFI_H
