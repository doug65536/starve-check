set(CMAKE_SYSTEM_NAME _system_)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --stdlib=libc++ -pthread -fuse-ld=gold")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread -fuse-ld=gold")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fuse-ld=gold")
set(CMAKE_SHARED_LINKER_FLAGS_FLAGS "${CMAKE_SHARED_LINKER_FLAGS_FLAGS} -fuse-ld=gold")
set(CMAKE_STATIC_LINKER_FLAGS "${CMAKE_STATIC_LINKER_FLAGS}  -fuse-ld=gold")

set(CMAKE_CXX_COMPILER _cxxcompiler_)
set(CMAKE_C_COMPILER _ccompiler_)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -pthread")
