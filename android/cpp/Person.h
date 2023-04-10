#include <string>

class Person {
private:
  std::string m_name;
  int m_age;
  double m_weight;
  double m_height;

public:
  Person();
  ~Person();
  void setName(std::string name);
  std::string *getName();
  void setAge(int age);
  int getAge();
  void setWeight(double weight);
  double getWeight();
  void setHeight(double height);
  double getHeight();
};