cmake_minimum_required(VERSION 3.9)

project(alglib)

#
# Version management
#
set (VERSION_MAJOR 3)
set (VERSION_MINOR 15)

# configure_file ("${PROJECT_SOURCE_DIR}/include/version.h.in" "${PROJECT_BINARY_DIR}/version.h")


#
# Compiler settings
#
enable_language(CXX)
# Check C++11 support and activate
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++14" COMPILER_SUPPORTS_CXX14)
if(COMPILER_SUPPORTS_CXX14)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
    set(CMAKE_CXX_STANDARD 14) # C++14...
    set(CMAKE_CXX_STANDARD_REQUIRED ON) #...is required...
    set(CMAKE_CXX_EXTENSIONS OFF) #...without compiler extensions like gnu++11
    message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has C++14 support.")
else()
    message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++14 support. Please use a different C++ compiler.")
endif()

set(CMAKE_CXX_FLAGS_DEBUG "-DDEBUG -g -pg -O0")
set(CMAKE_CXX_FLAGS_RELEASE "-DRELEASE -O3 -DNDEBUG -march=native")

#
# Settings for each platform
#
if(UNIX AND NOT APPLE)
    message("OS Detected: Linux")

    set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/install/linux)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DAE_DEBUG4POSIX")

    include_directories(/usr/include)
    link_directories(/usr/lib/x86_64-linux-gnu)
elseif(APPLE)
    message(STATUS "OS Detected: Mac")

    set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/install/mac)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DAE_DEBUG4POSIX")

    include_directories(/usr/local/include)

elseif(WIN32)
    message("OS Detected: Windows")

    # Use visual studio default settings
    unset(CMAKE_C_FLAGS)
    unset(CMAKE_C_FLAGS_DEBUG)
    unset(CMAKE_C_FLAGS_RELEASE)
    unset(CMAKE_CXX_FLAGS)
    unset(CMAKE_CXX_FLAGS_DEBUG)
    unset(CMAKE_CXX_FLAGS_RELEASE)
else()
    message(FATAL_ERROR "[BUILD] Invalid target")
endif()

# Create a variable that contains libraries to be used
set(alglib_lib "")

# My include files
include_directories(
        ${PROJECT_SOURCE_DIR}/src/alglib
)

file(GLOB alglib_include "${PROJECT_SOURCE_DIR}/src/alglib/*.h")
file(GLOB alglib_src "${PROJECT_SOURCE_DIR}/src/alglib/*.cpp")

#
# Build library
# https://qiita.com/osamu0329/items/134de918c0ffa7f0557b
#

## Add source directory and build directory to INTERFACE_INCLUDE_DIRECTORIES automatically
set(CMAKE_INCLUDE_CURRENT_DIR_IN_INTERFACE ON)

## Specify library build
add_library(alglib SHARED
        ${alglib_src}
        )

## Specify header files to be installed
set_target_properties(alglib
        PROPERTIES
        DEBUG_POSTFIX "d"
        VERSION "${VERSION_MAJOR}.${VERSION_MINOR}"
        SOVERSION "${VERSION_MAJOR}.${VERSION_MINOR}"
        PUBLIC_HEADER "${alglib_include}"
        )

target_link_libraries(alglib PRIVATE ${alglib_lib} )

target_include_directories(${PROJECT_NAME} INTERFACE
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/src>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
        )

install (TARGETS alglib
        EXPORT alglib-export
        LIBRARY DESTINATION lib
        INCLUDES DESTINATION include
        PUBLIC_HEADER DESTINATION include/alglib
        )

install(EXPORT alglib-export DESTINATION share/cmake/alglib/
        FILE alglib-config.cmake
        EXPORT_LINK_INTERFACE_LIBRARIES)

##
## Build main code
##
#add_executable(sample sample/main.cpp ${libRIPOC_include})
#target_link_libraries(sample ripoc ${libRIPOC_lib})
#set_target_properties(sample
#	PROPERTIES
#	OUTPUT_NAME "sample.${VERSION_MAJOR}.${VERSION_MINOR}"
#	)

# install (TARGETS sample DESTINATION bin)

add_subdirectory(tests)