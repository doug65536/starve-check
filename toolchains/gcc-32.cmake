set(CMAKE_SYSTEM_NAME Linux)

set(CMAKE_AR "gcc-ar" CACHE STRING "Toolchain options")
set(CMAKE_RANLIB "gcc-ranlib" CACHE STRING "Toolchain options")

set(CMAKE_CXX_FLAGS "-m32" CACHE STRING "Toolchain options")
set(CMAKE_C_FLAGS "-m32" CACHE STRING "Toolchain options")
set(CMAKE_EXE_LINKER_FLAGS "-m32" CACHE STRING "Toolchain options")
set(CMAKE_SHARED_LINKER_FLAGS "-m32" CACHE STRING "Toolchain options")
set(CMAKE_STATIC_LINKER_FLAGS "-m32" CACHE STRING "Toolchain options")

find_program(CMAKE_CXX_COMPILER
    g++-5
    g++-4.9
    g++-4.8
    g++-4.7
    g++-4.6
    g++-4.5
    g++-4.4
    g++-4.3
    g++
)
find_program(CMAKE_C_COMPILER
    gcc-5
    gcc-4.9
    gcc-4.8
    gcc-4.7
    gcc-4.6
    gcc-4.5
    gcc-4.4
    gcc-4.3
    gcc
)
