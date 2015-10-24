set(CMAKE_SYSTEM_NAME Windows)

set(CMAKE_AR "x86_64-w64-mingw32-ar" CACHE STRING "Use cross AR")
set(CMAKE_RANLIB "x86_64-w64-mingw32-ranlib" CACHE STRING "Use cross RANLIB")

find_program(CMAKE_CXX_COMPILER
	x86_64-w64-mingw32-g++-posix
	x86_64-w64-mingw32-g++-win32
	x86_64-w64-mingw32-g++)

find_program(CMAKE_C_COMPILER
	x86_64-w64-mingw32-gcc-posix
	x86_64-w64-mingw32-g++-win32
	x86_64-w64-mingw32-g++)

find_program(CMAKE_RC_COMPILER
	x86_64-w64-mingw32-windres-posix
	x86_64-w64-mingw32-windres-win32
	x86_64-w64-mingw32-windres)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
