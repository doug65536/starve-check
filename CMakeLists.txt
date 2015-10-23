cmake_minimum_required(VERSION 2.8)

set(static_link TRUE CACHED "Use static link")

if(static_link)
    if(CMAKE_COMPILER_IS_GNUCXX)
	set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")
    else()
	message(WARNING "Don't know how to do static link on this compiler")
    endif()
endif()

if(CMAKE_COMPILER_IS_GNUCXX)
message(STATUS "Enabling C++11 and multithreading on G++")
# Enable C++11 and multithreading in g++
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -pthread")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -std=c++11 -pthread")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -std=c++11 -pthread")
set(CMAKE_STATIC_LINKER_FLAGS "${CMAKE_STATIC_LINKER_FLAGS} -std=c++11 -pthread")

elseif(MSVC)
# Do nothing

else()
message(WARNING "Don't know how to enable C++11 and multithreading on this compiler")

endif()

add_executable(starve-check main.cpp
    stress_instance.cpp
    stress_instance.h
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
