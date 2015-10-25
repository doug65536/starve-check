cmake_minimum_required(VERSION 2.8)

set(static_link FALSE CACHED "Use static link")

if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
	set(clang_compatible 1)
endif()

message(STATUS "CMAKE_CXX_COMPILER_ID=${CMAKE_CXX_COMPILER_ID}")

if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR
        CMAKE_CXX_COMPILER_ID MATCHES "GNU")
	set(gxx_compatible 1)
endif()

try_compile(
    detect_cxx11_flag_00_result
    ${CMAKE_CURRENT_BINARY_DIR}/configuretemp
    "${CMAKE_CURRENT_SOURCE_DIR}/configuresrc/detectcxx11-thread.cpp"
    COMPILE_DEFINITIONS "-std=c++11 -pthread"
    OUTPUT_VARIABLE detect_cxx11_flag_00_output)
message(STATUS "detect_cxx11_flag_00_exitcode ${detect_cxx11_flag_00_exitcode}")
message(STATUS "detect_cxx11_flag_00_result ${detect_cxx11_flag_00_result}")
message(STATUS "detect_cxx11_flag_00_output ${detect_cxx11_flag_00_output}")

#if(gxx_compatible)
message(STATUS "Enabling C++11 and multithreading on G++")
# Enable C++11 and multithreading in g++
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -std=c++11")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -std=c++11")
set(CMAKE_STATIC_LINKER_FLAGS "${CMAKE_STATIC_LINKER_FLAGS} -std=c++11")

if(NOT CMAKE_SYSTEM_NAME MATCHES "Windows")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -pthread")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -pthread")
set(CMAKE_STATIC_LINKER_FLAGS "${CMAKE_STATIC_LINKER_FLAGS} -pthread")
endif()

#elseif(MSVC)
# Do nothing

#else()
#message(WARNING "Don't know how to enable C++11 and multithreading on this compiler")

#endif()

add_executable(starve-check main.cpp
    stress_instance.cpp
    stress_instance.h
    toolchains/clang-32.cmake
    toolchains/clang-64.cmake
    toolchains/gcc-32.cmake
    toolchains/gcc-64.cmake
    toolchains/mingw32-32.cmake
    toolchains/mingw32-64.cmake

    .travis.yml

    scripts/setcompiler
    installdeps
    detect_toolchains
    buildall
    toolchain-template.cmake

    README.md
)

# Install target
install(TARGETS starve-check
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

# Packages

# Set defaults
set(CPACK_GENERATOR "DEB")
set(CPACK_PACKAGE_NAME "starve-check")
set(CPACK_PACKAGE_VENDOR "Doug Gale")
set(CPACK_PACKAGE_VERSION_MAJOR 1)
set(CPACK_PACKAGE_VERSION_MINOR 0)
set(CPACK_PACKAGE_VERSION_PATCH 0)
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Detect CPU starvation")
set(CPACK_PACKAGE_DESCRIPTION "See how much cpu time you are actually getting")
set(CPACK_DEBIAN_PACKAGE_HOMEPAGE "https://github.com/doug65536/starve-check")
#set(CPACK_

########
# Debian
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libstdc++6:amd64")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "doug16k@gmail.com")

# Mandaory
########

include(CPack)
