#!/bin/bash

# Define variables for paths
SRC_DIR=~/Scripts/Cpp/Util
BUILD_DIR=build
INCLUDE_DIR=include
SRC_DIR_PATH=src

# Copy the CMakeLists.txt to the current directory
cp "$SRC_DIR/CMakeLists.txt" .

# Create necessary directories
mkdir -p "$BUILD_DIR" "$INCLUDE_DIR" "$SRC_DIR_PATH"

# Create the main.cpp file in the src directory
touch "$SRC_DIR_PATH/main.cpp"

# Change to the build directory and run cmake
cd "$BUILD_DIR" || {
	echo "Failed to change to $BUILD_DIR"
	exit 1
}
cmake ..

# Go back to the parent directory
cd ..

# Create a symbolic link to compile_commands.json
ln -s "$BUILD_DIR/compile_commands.json" .
