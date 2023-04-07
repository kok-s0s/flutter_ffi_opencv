cmake_minimum_required(VERSION 3.19.0)
project(cvPlugin VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 20)

include_directories(${CMAKE_SOURCE_DIR}/cpp/include)

add_library(libopencv_java4 SHARED IMPORTED)
set_target_properties(libopencv_java4 PROPERTIES IMPORTED_LOCATION
    ${CMAKE_SOURCE_DIR}/jniLibs/libs/${ANDROID_ABI}/libopencv_java4.so)

add_library(${PROJECT_NAME}
    SHARED
    cpp/FFI.cpp
)

find_library(
    log-lib
    log
)

target_link_libraries(${PROJECT_NAME}
    libopencv_java4
    android
    ${log-lib}
)