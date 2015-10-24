set(CMAKE_SYSTEM_NAME Windows)

find_program(CMAKE_AR
	i686-w64-mingw32-ar-posix
	i686-w64-mingw32-ar-win32
	i686-w64-mingw32-ar
)

find_program(CMAKE_RANLIB
	i686-w64-mingw32-ranlib
)

find_program(CMAKE_CXX_COMPILER 
        i686-w64-mingw32-g++-posix 
        i686-w64-mingw32-g++-win32 
        i686-w64-mingw32-g++
)

find_program(CMAKE_C_COMPILER 
        i686-w64-mingw32-gcc-posix    
        i686-w64-mingw32-g++-win32 
        i686-w64-mingw32-g++
)

find_program(CMAKE_RC_COMPILER 
        i686-w64-mingw32-windres-posix
        i686-w64-mingw32-windres-win32
        i686-w64-mingw32-windres
)

set(CMAKE_CXX_FLAGS "-m32" CACHE STRING "Use libc++")
set(CMAKE_C_FLAGS "-m32" CACHE STRING "Use libc++")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
