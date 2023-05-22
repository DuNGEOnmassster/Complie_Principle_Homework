cmake_minimum_required(VERSION 3.5.1)

# project name
project(Myproject)

# creates the variable EXEC and sets it to hello
set(EXEC hello)

# Add the executable target
add_executable(main.cpp person.cpp)

# set the C++14 standard
set(CMAKE_CXX_STANDARD 14)

# I../includes
include_directories(../includes)

# puts all .cpp files inside src to the SOURCES variable
file(GLOB SOURCES *.cpp)

# compiles the files defined by SOURCES to generante the executable defined by EXEC
add_executable(${EXEC} ${SOURCES})