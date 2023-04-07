cmake_minimum_required(VERSION 3.19.0)
project(cvPlugin VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 20)

add_library(${PROJECT_NAME}
    SHARED
    cpp/FFI.cpp
)