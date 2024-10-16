cmake_minimum_required(VERSION 3.5)  # Specify the minimum version of CMake required

project(project)                        # Set the project name to "project"

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)  # Enable exporting of compile commands for tools like clang-tidy

# Set compiler flags: Enable all warnings, treat warnings as errors, and set the C++ standard to C++11
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror -std=c++11")

# Specify the source directory where the .cpp files are located
set(source_dir "${PROJECT_SOURCE_DIR}/src/")

# Use GLOB_RECURSE to find all .cpp files in the source directory and its subdirectories
# The variable 'source_files' will contain a list of all found .cpp files
file(GLOB_RECURSE source_files "${source_dir}/*.cpp")

# Create the executable named "Leet" using the list of source files found
# This will compile all the .cpp files included in the 'source_files' variable into the executable
add_executable(project ${source_files})

# Optionally specify the include directory if you have header files
# This allows the compiler to find header files in the include directory when compiling
include_directories("${PROJECT_SOURCE_DIR}/include")
