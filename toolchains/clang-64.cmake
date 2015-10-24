set(CMAKE_SYSTEM_NAME Linux)

#set(CMAKE_AR "gcc-ar" CACHE STRING "Use gcc AR")
#set(CMAKE_RANLIB "gcc-ranlib" CACHE STRING "Use gcc RANLIB")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --stdlib=libc++ -fPIE -pthread" CACHE STRING "Toolchain CXX flags")
set(CMAKE_CXX_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -pie -pthread" CACHE STRING "Toolchain CXX flags")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread" CACHE STRING "Toolchain C Flags")

set(CMAKE_CXX_COMPILER clang++-3.5)
set(CMAKE_C_COMPILER clang-3.5)
