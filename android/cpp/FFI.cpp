//
// Created by Admin on 2023/4/7.
//

#include "FFI.h"

#include <string>

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

Cxx *cxx = Cxx::getInstance(); // Singleton
auto *person = (Person *) new Person;

Person *init()
{
  std::string* tempName = cxx->getName();
  person->name = (char*)tempName->c_str();
  person->age = cxx->getAge();
  person->weight = cxx->getWeight();
  person->height = cxx->getHeight();
  return person;
}

void setPersonName(char *name) {
  person->name = name;
  std::string tempName = name;
  cxx->setName(tempName);
}

char *getPersonName() {
  std::string *tempName = cxx->getName();
  return (char *)tempName->c_str();
}

void setPersonAge(int age) {
  person->age = age;
  cxx->setAge(age);
}

int getPersonAge() { return cxx->getAge(); }

void setPersonWeight(double weight) {
  person->weight = weight;
  cxx->setWeight(weight);
}

double getPersonWeight() { return cxx->getWeight(); }

void setPersonHeight(double height) {
  person->height = height;
  cxx->setHeight(height);
}

double getPersonHeight() { return cxx->getHeight(); }
