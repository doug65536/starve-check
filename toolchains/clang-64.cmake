set(CMAKE_SYSTEM_NAME Linux)

#set(CMAKE_AR "gcc-ar" CACHE STRING "Use gcc AR")
#set(CMAKE_RANLIB "gcc-ranlib" CACHE STRING "Use gcc RANLIB")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --stdlib=libc++ -pthread")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread")

set(CMAKE_CXX_COMPILER clang++-3.6)
set(CMAKE_C_COMPILER clang-3.6)
