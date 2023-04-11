#include "Cxx.h"

Cxx *Cxx::m_self = nullptr;

Cxx *Cxx::getInstance() {
  if (m_self == nullptr) {
    m_self = new Cxx();
  }
  return m_self;
}

Cxx::Cxx() {
  m_name = "su";
  m_age = 23;
  m_weight = 54;
  m_height = 166;
}

Cxx::~Cxx() {}

void Cxx::setName(std::string name) { m_name = name; }

std::string *Cxx::getName() { return &m_name; }

void Cxx::setAge(int age) { m_age = age; }

int Cxx::getAge() { return m_age; }

void Cxx::setWeight(double weight) { m_weight = weight; }

double Cxx::getWeight() { return m_weight; }

void Cxx::setHeight(double height) { m_height = height; }

double Cxx::getHeight() { return m_height; }
