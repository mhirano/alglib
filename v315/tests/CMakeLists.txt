cmake_minimum_required(VERSION 3.9)

project(text_x CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

#message(STATUS "${CMAKE_CURRENT_SOURCE_DIR} ")
if (UNIX AND NOT APPLE) #Ubuntu...
    set(ALGLIB_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../install/linux")
    #    include_directories(/opt/intel/mkl/include)
    #    link_directories(/opt/intel/mkl/lib/intel64)
else(APPLE)
    set(ALGLIB_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../install/mac")
endif()
find_package(ALGLIB REQUIRED HINTS ${ALGLIB_INSTALL_DIR})

add_executable(test_c test_c.cpp)
target_link_libraries(test_c alglib)

add_executable(test_i test_i.cpp)
target_link_libraries(test_i alglib)

add_executable(test_x test_x.cpp)
target_link_libraries(test_x alglib)
