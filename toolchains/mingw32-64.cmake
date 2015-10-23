set(CMAKE_SYSTEM_NAME Windows)

set(CMAKE_AR "x86_64-w64-mingw32-ar" CACHE STRING "Use cross AR")
set(CMAKE_RANLIB "x86_64-w64-mingw32-ranlib" CACHE STRING "Use cross RANLIB")

set(CMAKE_CXX_COMPILER x86_64-w64-mingw32-g++)
set(CMAKE_C_COMPILER x86_64-w64-mingw32-gcc)
set(CMAKE_RC_COMPILER x86_64-w64-mingw32-windres)
