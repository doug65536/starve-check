set(CMAKE_SYSTEM_NAME Linux)

#set(CMAKE_AR "gcc-ar" CACHE STRING "Use gcc AR")
#set(CMAKE_RANLIB "gcc-ranlib" CACHE STRING "Use gcc RANLIB")
set(CMAKE_CXX_FLAGS "-m32 --stdlib=libc++" CACHE STRING "C++ flags")
set(CMAKE_C_FLAGS "-m32" CACHE STRING "C flags")

set(CMAKE_CXX_COMPILER clang++)
set(CMAKE_C_COMPILER clang)
