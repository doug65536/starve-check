set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -pthread")
add_executable(starve-check main.cpp
    stress_instance.cpp
    stress_instance.h
)
