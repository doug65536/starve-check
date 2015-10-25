set(CMAKE_SYSTEM_NAME Linux)

#set(CMAKE_AR "gcc-ar" CACHE STRING "Toolchain options")
#set(CMAKE_RANLIB "gcc-ranlib" CACHE STRING "Toolchain options")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --stdlib=libc++ -pthread -use-ld=gold")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread -use-ld=gold")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -use-ld=gold")
set(CMAKE_SHARED_LINKER_FLAGS_FLAGS "${CMAKE_SHARED_LINKER_FLAGS_FLAGS}  -use-ld=gold")
set(CMAKE_STATIC_LINKER_FLAGS "${CMAKE_STATIC_LINKER_FLAGS}  -use-ld=gold")

find_program(CMAKE_CXX_COMPILER NAMES
        clang++-4.9
        clang++-4.8
	clang++-4.7
	clang++-4.6
	clang++-4.5
	clang++-4.4
	clang++-4.3
	clang++-4.2
	clang++-4.1
	clang++-4.0
	clang++-3.9
	clang++-3.8
	clang++-3.7
	clang++-3.6
	clang++-3.5
	clang++-3.4
	clang++-3.3
	clang++-3.2
	clang++-3.1
	clang++-3.0
	clang++-2.9
	clang++-2.8
	clang++-2.7
	clang++-2.6
	clang++)

find_program(CMAKE_CXX_COMPILER NAMES
        clang-4.9
        clang-4.8
        clang-4.7
        clang-4.6
        clang-4.5
        clang-4.4
        clang-4.3
        clang-4.2
        clang-4.1
        clang-4.0
        clang-3.9
        clang-3.8
        clang-3.7
        clang-3.6 
        clang-3.5
        clang-3.4
        clang-3.3
        clang-3.2
        clang-3.1
        clang-3.0
        clang-2.9
        clang-2.8
        clang-2.7 
	clang)

