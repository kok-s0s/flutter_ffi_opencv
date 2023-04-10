//
// Created by Admin on 2023/4/7.
//

#include "FFI.h"

#include <string>

Cxx *cxx = Cxx::getInstance(); // Singleton

void gaussianBlur() {
  // const char* inputPath, const char* outputPath
  Mat src =
      imread("/data/data/com.example.flutter_opencv_example/files/input.jpg");
  if (src.empty()) {
    return;
  }

  Mat dst;
  GaussianBlur(src, dst, Size(15, 15), 0);

  imwrite("/data/data/com.example.flutter_opencv_example/files/output.jpg",
          dst);
}

int getVersion() { return 3; }

void setPersonName(char *name) {
  std::string tempName = name;
  cxx->setName(tempName);
}

char *getPersonName() {
  std::string *tempName = cxx->getName();
  return (char *)tempName->c_str();
}

void setPersonAge(int age) { cxx->setAge(age); }

int getPersonAge() { return cxx->getAge(); }

void setPersonWeight(double weight) { cxx->setWeight(weight); }

double getPersonWeight() { return cxx->getWeight(); }

void setPersonHeight(double height) { cxx->setHeight(height); }

double getPersonHeight() { return cxx->getHeight(); }
