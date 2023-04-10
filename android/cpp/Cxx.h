#include "Person.h"
#include <string>

class Cxx {
private:
  static Cxx *m_self; // 单例模式
  Cxx(const Cxx &) = delete;
  Cxx &operator=(const Cxx &) = delete;
  Cxx();
  Person *m_person;

public:
  static Cxx *getInstance();
  ~Cxx();

  void setName(std::string name);
  std::string *getName();
  void setAge(int age);
  int getAge();
  void setWeight(double weight);
  double getWeight();
  void setHeight(double height);
  double getHeight();
};