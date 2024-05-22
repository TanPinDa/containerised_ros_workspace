project(sample)
cmake_minimum_required(VERSION 3.2)

if(COMMAND cmake_policy)
    cmake_policy(SET CMP0003 NEW)
endif(COMMAND cmake_policy)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Ceres REQUIRED)

add_executable(sample src/main.cpp)
target_link_libraries(sample Ceres::ceres)