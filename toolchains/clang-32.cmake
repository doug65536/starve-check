set(CMAKE_SYSTEM_NAME Linux)

#set(CMAKE_AR "gcc-ar" CACHE STRING "Toolchain options")
#set(CMAKE_RANLIB "gcc-ranlib" CACHE STRING "Toolchain options")
set(CMAKE_CXX_FLAGS "-m32 -stdlib=libc++" CACHE STRING "Toolchain options")
set(CMAKE_C_FLAGS "-m32" CACHE STRING "Toolchain options")

find_program(CMAKE_CXX_COMPILER
    clang++-3.9
    clang++-3.8
    clang++-3.7
    clang++-3.6
    clang++-3.5
    clang++-3.4
    clang++
)
find_program(CMAKE_C_COMPILER
    clang-3.9
    clang-3.8
    clang-3.7
    clang-3.6
    clang-3.5
    clang-3.4
    clang
)
