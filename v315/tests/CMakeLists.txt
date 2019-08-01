cmake_minimum_required(VERSION 3.9)

project(text_x CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_executable(test_c test_c.cpp)
target_link_libraries(test_c alglib)

add_executable(test_i test_i.cpp)
target_link_libraries(test_i alglib)

add_executable(test_x test_x.cpp)
target_link_libraries(test_x alglib)
